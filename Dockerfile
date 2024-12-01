# Use the official Dart image from Docker Hub
FROM dart:stable

# Set the working directory inside the container
WORKDIR /app

# Copy pubspec files and fetch dependencies
COPY pubspec.* ./
RUN dart pub get

# Copy all project files into the container
COPY . .

# Install Python (for HTTP server)
RUN apt-get update && apt-get install -y python3

# Compile Dart code to JavaScript for the web
RUN dart compile js web/main.dart -o /app/web/main.dart.js

# Expose port 8080 for the web server
EXPOSE 8080

# Use Python's built-in HTTP server to serve the app
CMD ["python3", "-m", "http.server", "8080", "--directory", "/app/web"]