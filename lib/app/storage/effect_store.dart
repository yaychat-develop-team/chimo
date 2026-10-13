import 'dart:async';

import 'app_storage.dart';

/// 对齐 forya `CacheUtilAction.needShowPersonalEffectCard`：
/// 同一用户 20 小时内只播一次个人主页打开特效。
///
/// 冷却时间戳落在 `cache` box：进程内 Map 会让「杀进程重进」重播一次。
abstract final class EffectStore {
  static const _cooldownMs = 20 * 3600 * 1000;
  static const _prefix = 'effect_';

  /// 是否应播放并在返回 true 时立即写入冷却（不依赖 PAG 回调）。
  ///
  /// 保持同步：调用点在 build / 手势回调里。写盘 fire-and-forget，
  /// Hive 的内存值在 Future 完成前就已更新，所以紧接着的读不会漏。
  static bool requestShow(String userId) {
    final uid = userId.trim();
    if (uid.isEmpty) return false;
    final now = DateTime.now().millisecondsSinceEpoch;
    final last = _lastShownMs(uid);
    if (last > 0 && now - last < _cooldownMs) return false;
    unawaited(AppStorage.cache?.put('$_prefix$uid', now) ?? Future.value());
    return true;
  }

  /// 调试 / 失败回退：清除冷却，便于再次播放。
  static void clear(String userId) {
    final uid = userId.trim();
    if (uid.isEmpty) return;
    unawaited(AppStorage.cache?.delete('$_prefix$uid') ?? Future.value());
  }

  static int _lastShownMs(String uid) {
    final value = AppStorage.cache?.get('$_prefix$uid');
    if (value is int) return value;
    if (value is num) return value.toInt();
    return 0;
  }
}
