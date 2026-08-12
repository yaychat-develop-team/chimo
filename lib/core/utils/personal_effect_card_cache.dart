/// 对齐 forya `CacheUtilAction.needShowPersonalEffectCard`：
/// 同一用户 20 小时内只播一次个人主页打开特效（进程内缓存，非持久化）。
abstract final class PersonalEffectCardCache {
  static const _cooldownMs = 20 * 3600 * 1000;
  static final Map<String, int> _lastShownMs = {};

  /// 是否应播放。仅在真正开始展示时调用 [markShown]。
  static bool shouldShow(String userId) {
    final uid = userId.trim();
    if (uid.isEmpty) return false;
    final now = DateTime.now().millisecondsSinceEpoch;
    final last = _lastShownMs[uid] ?? 0;
    if (last > 0 && now - last < _cooldownMs) return false;
    return true;
  }

  static void markShown(String userId) {
    final uid = userId.trim();
    if (uid.isEmpty) return;
    _lastShownMs[uid] = DateTime.now().millisecondsSinceEpoch;
  }

  /// 调试 / 失败回退：清除冷却，便于再次播放。
  static void clear(String userId) {
    _lastShownMs.remove(userId.trim());
  }
}
