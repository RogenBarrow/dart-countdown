import 'dart:html';
import 'dart:async';

void main() {
  // Christmas Countdown
  final christmasElement = querySelector('#christmas-countdown');
  startCountdown(christmasElement, DateTime(DateTime.now().year, 12, 25), 'Merry Christmas! 🎄');

  // New Year Countdown
  final newYearElement = querySelector('#new-year-countdown');
  startCountdown(newYearElement, DateTime(DateTime.now().year + 1, 1, 1), '🎉 Happy New Year! 🎆');
}

void startCountdown(Element? element, DateTime targetDate, String finalMessage) {
  Timer.periodic(Duration(seconds: 1), (timer) {
    final now = DateTime.now();

    // If the target date has passed, stop the timer
    if (now.isAfter(targetDate)) {
      element?.text = finalMessage;
      timer.cancel();
      return;
    }

    final difference = targetDate.difference(now);
    final days = difference.inDays;
    final hours = difference.inHours % 24;
    final minutes = difference.inMinutes % 60;
    final seconds = difference.inSeconds % 60;

    element?.text = '$days Days, $hours Hours, $minutes Minutes, $seconds Seconds';
  });
}