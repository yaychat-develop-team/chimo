/// Conversation-list / message time labels (forya TimeAgo.timeForMsg style).
abstract final class ChatTimeLabel {
  /// List row time from message server time (ms). Empty if [ms] ≤ 0.
  static String forList(int ms) {
    if (ms <= 0) return '';
    final now = DateTime.now();
    final time = DateTime.fromMillisecondsSinceEpoch(ms);
    final elapsed = now.difference(time);

    if (now.year != time.year) {
      return '${_monthAbbr(time.month)} ${time.day}, ${time.year}';
    }
    if (elapsed.inDays >= 1) {
      return '${_monthAbbr(time.month)} ${time.day}';
    }
    if (now.day != time.day || now.month != time.month) {
      return 'yesterday ${_clock(time)}';
    }
    return _clock(time);
  }

  /// Fresh local send / receive.
  static String get justNow => forList(DateTime.now().millisecondsSinceEpoch);

  static String _clock(DateTime dt) {
    final h24 = dt.hour;
    final m = dt.minute.toString().padLeft(2, '0');
    final period = h24 >= 12 ? 'PM' : 'AM';
    final h12 = h24 % 12 == 0 ? 12 : h24 % 12;
    return '$h12:$m $period';
  }

  static const _months = [
    'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun',
    'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec',
  ];

  static String _monthAbbr(int month) =>
      _months[(month - 1).clamp(0, 11)];
}
