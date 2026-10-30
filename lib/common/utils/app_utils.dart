final Map<String, DateTime> _lastRun = {};

/// 通用工具。
abstract class AppUtils {
  /// 按 [tag] 节流执行 [action]，同一间隔内只执行第一次。
  static void throttle(
    void Function() action, {
    String tag = 'default',
    Duration duration = const Duration(milliseconds: 300),
  }) {
    final now = DateTime.now();
    final last = _lastRun[tag];
    if (last != null && now.difference(last) < duration) return;
    _lastRun[tag] = now;
    action();
  }
}
