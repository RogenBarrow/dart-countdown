import 'dart:html';
import 'dart:async';

void main() {
  final countdownElement = querySelector('#countdown');

  Timer.periodic(Duration(seconds: 1), (timer) {
    final now = DateTime.now();
    final christmas = DateTime(now.year, 12, 25);

    final targetDate = now.isAfter(christmas)
        ? DateTime(now.year + 1, 12, 25)
        : christmas;

    final difference = targetDate.difference(now);

    final days = difference.inDays;
    final hours = difference.inHours % 24;
    final minutes = difference.inMinutes % 60;
    final seconds = difference.inSeconds % 60;

    countdownElement?.text =
        '🎄 $days Days, $hours Hours, $minutes Minutes, $seconds Seconds until Christmas! 🎅';

    if (difference.inSeconds <= 0) {
      countdownElement?.text = '🎉 Merry Christmas! 🎄';
      timer.cancel();
    }
  });
}