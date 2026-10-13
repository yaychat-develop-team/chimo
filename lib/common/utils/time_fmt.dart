/// 全项目唯一的「时间 → 展示串」出口。
///
/// （'yesterday' 还是 'Yesterday'、带不带秒、跨年要不要年份），改一处不会同步另一处。
///
/// **每个跟「今天/昨天」有关的方法都接一个可选的 [now]**：不注入的话跨天、跨年
/// 那几条分支永远测不到。业务计时用的 `DateTime.now`
/// 不在本类范围内，不要顺手改。
abstract final class TimeFmt {
  static const _months = [
    'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', //
    'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec',
  ];

  static String monthAbbr(int month) => _months[(month - 1).clamp(0, 11)];

  /// 12 小时制时钟：`3:04 PM`；[withSeconds] 时 `3:04:05 PM`。
  static String clock(DateTime dt, {bool withSeconds = false}) {
    final h24 = dt.hour;
    final h12 = h24 % 12 == 0 ? 12 : h24 % 12;
    final m = dt.minute.toString().padLeft(2, '0');
    final period = h24 >= 12 ? 'PM' : 'AM';
    if (!withSeconds) return '$h12:$m $period';
    final s = dt.second.toString().padLeft(2, '0');
    return '$h12:$m:$s $period';
  }

  /// `Sep 3`
  static String monthDay(DateTime dt) => '${monthAbbr(dt.month)} ${dt.day}';

  /// 会话列表右侧（原 `ChatTimeLabel.forList`，forya `TimeAgo.timeForMsg`）。
  static String chatListPreview(int ms, {DateTime? now}) {
    if (ms <= 0) return '';
    final at = now ?? DateTime.now();
    final time = DateTime.fromMillisecondsSinceEpoch(ms);
    final elapsed = at.difference(time);

    if (at.year != time.year) return '${monthDay(time)}, ${time.year}';
    if (elapsed.inDays >= 1) return monthDay(time);
    if (at.day != time.day || at.month != time.month) {
      return 'yesterday ${clock(time)}';
    }
    return clock(time);
  }

  /// 「刚刚」发出 / 收到的一行。
  static String justNow({DateTime? now}) {
    final at = now ?? DateTime.now();
    return chatListPreview(at.millisecondsSinceEpoch, now: at);
  }

  /// 聊天气泡上方的时间分隔（原群聊 `_formatOutgoingTimestamp`）。
  /// 「Yesterday」大写，同样是保持原样。
  static String chatBubble(DateTime time, {DateTime? now}) {
    final at = now ?? DateTime.now();
    final local = time.toLocal();
    final text = clock(local);
    final today = DateTime(at.year, at.month, at.day);
    final day = DateTime(local.year, local.month, local.day);
    final diffDays = today.difference(day).inDays;

    if (diffDays == 0) return text;
    if (diffDays == 1) return 'Yesterday $text';
    return '${monthDay(local)} $text';
  }

  /// 私聊消息流里的时间分隔：同一天只给时钟，跨天 / 跨年在日期后**再带时钟**
  /// （与 [chatListPreview] 的区别就在这个时钟，别混用）。
  static String chatSeparator(int ms, {DateTime? now}) {
    if (ms <= 0) return '';
    final at = now ?? DateTime.now();
    final time = DateTime.fromMillisecondsSinceEpoch(ms);
    final text = clock(time);

    if (at.year != time.year) {
      return '${monthDay(time)}, ${time.year} $text';
    }
    if (at.difference(time).inDays >= 1) return '${monthDay(time)} $text';
    if (at.day != time.day || at.month != time.month) {
      return 'yesterday $text';
    }
    return text;
  }

  /// `2026 / 09 / 03`（引导流程里的生日展示）。
  static String spacedDate(DateTime dt) {
    final y = dt.year.toString().padLeft(4, '0');
    final m = dt.month.toString().padLeft(2, '0');
    final d = dt.day.toString().padLeft(2, '0');
    return '$y / $m / $d';
  }

  /// 钱包流水 / 明细（**秒级**时间戳，带秒，原 `TimeAgo.timeForJMS`）。
  static String dateTimeSeconds(int sec, {DateTime? now}) {
    if (sec <= 0) return '';
    final at = now ?? DateTime.now();
    final time = DateTime.fromMillisecondsSinceEpoch(sec * 1000);
    final diff = at.difference(time);
    final text = clock(time, withSeconds: true);

    if (at.year != time.year) {
      return '${monthDay(time)}, ${time.year} $text';
    }
    if (diff.inDays >= 1) return '${monthDay(time)} $text';
    if (at.day != time.day || at.month != time.month) {
      return 'yesterday $text';
    }
    return text;
  }

  /// `2026-09-03`（接口用的日期，如生日）。
  static String isoDate(DateTime dt) {
    final y = dt.year.toString().padLeft(4, '0');
    final m = dt.month.toString().padLeft(2, '0');
    final d = dt.day.toString().padLeft(2, '0');
    return '$y-$m-$d';
  }

  /// `09/03/2026`（展示用的生日）。
  static String slashDate(DateTime dt) {
    final y = dt.year.toString().padLeft(4, '0');
    final m = dt.month.toString().padLeft(2, '0');
    final d = dt.day.toString().padLeft(2, '0');
    return '$m/$d/$y';
  }

  /// `2026-09-03 15:04`（相册项的拍摄时间，24 小时制）。
  static String isoDateTimeMinute(DateTime dt) {
    final h = dt.hour.toString().padLeft(2, '0');
    final min = dt.minute.toString().padLeft(2, '0');
    return '${isoDate(dt)} $h:$min';
  }

  /// 群聊时间分隔：毫秒时间戳版 [chatBubble]，方便作为 `String Function(int)` 使用。
  static String chatBubbleMs(int ms) => chatBubble(DateTime.fromMillisecondsSinceEpoch(ms));

  /// 短相对时间：`Recently` / `a few seconds` / `12 seconds` / `3 min` / `2 hours` / `4 days`。
  ///
  /// 正数且小于 100000000000 时按秒，否则按毫秒。
  static String recentAgo(int timestamp, {DateTime? now}) {
    if (timestamp <= 0) return 'Recently';
    final tsMs = timestamp < 100000000000 ? timestamp * 1000 : timestamp;
    final at = now ?? DateTime.now();
    final seconds = ((at.millisecondsSinceEpoch - tsMs) / 1000).floor();
    if (seconds < 5) return 'a few seconds';
    if (seconds < 60) return '$seconds seconds';
    if (seconds < 60 * 60) return '${seconds ~/ 60} min';
    if (seconds < 60 * 60 * 24) return '${seconds ~/ (60 * 60)} hours';
    return '${seconds ~/ (60 * 60 * 24)} days';
  }

  /// 语音时长 / 倒计时 `mm:ss`。负数按 0 处理。
  static String duration(int seconds) {
    final total = seconds < 0 ? 0 : seconds;
    final m = (total ~/ 60).toString().padLeft(2, '0');
    final s = (total % 60).toString().padLeft(2, '0');
    return '$m:$s';
  }
}
