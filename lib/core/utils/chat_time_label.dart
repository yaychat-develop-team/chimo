/// 会话列表 / 消息时间文案（forya TimeAgo.timeForMsg 风格）。
abstract final class ChatTimeLabel {
  /// 列表行时间，取消息服务端时间（毫秒）。[ms] ≤ 0 时返回空串。
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

  /// 本地刚发送 / 刚接收。
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
