import 'package:flutter/foundation.dart' show kReleaseMode;

import 'app_log.dart';

/// 接口 JSON 取值的唯一入口。
///
/// 三个问题：
/// 1. **`'${null}'` 是字符串 `'null'`，不是空串** —— 只要哪一处漏了 `?? ''`，
/// 页面上就会显示 `null`。这里统一把字面量 `'null'` 当空处理；
/// 2. 多 key 兜底看不出**哪条是真实的服务端差异、哪条是当年不确定就都写上了**；
/// 3. 类型不匹配（服务端把 int 发成 String）各处写法不一。
///
/// 所以 [fallbacks] 是**显式参数**，并且：
/// **每条 fallback 必须在调用点写明来源**（哪个接口 / 哪个环境返回过）；
/// 写不出来源的，删到只剩主 key（与后端确认一次比留三个 key 省事）；
/// debug 下命中 fallback 会打一行 `field fallback hit:`。
abstract final class JsonRead {
  /// 字符串。`null` / 字面量 `'null'` / 缺失都返回 [orElse]。
  static String str(
    Map<dynamic, dynamic> json,
    String key, {
    List<String> fallbacks = const [],
    String orElse = '',
  }) {
    final raw = _pick(json, key, fallbacks);
    if (raw == null) return orElse;
    final text = '$raw'.trim();
    if (text.isEmpty || text == 'null') return orElse;
    return text;
  }

  /// 整数。服务端把数字发成字符串（`"12"`）也认。
  static int intOf(
    Map<dynamic, dynamic> json,
    String key, {
    List<String> fallbacks = const [],
    int orElse = 0,
  }) => intOrNull(json, key, fallbacks: fallbacks) ?? orElse;

  /// 整数；缺失 / 解析不出返回 `null`（用于「没设置过」与「设置成 0」要区分的字段）。
  static int? intOrNull(
    Map<dynamic, dynamic> json,
    String key, {
    List<String> fallbacks = const [],
  }) {
    final raw = _pick(json, key, fallbacks);
    if (raw == null) return null;
    if (raw is int) return raw;
    if (raw is num) return raw.toInt();
    return int.tryParse('$raw'.trim());
  }

  /// 布尔。认 `true` / `'true'` / `1` / `'1'`。
  static bool boolOf(
    Map<dynamic, dynamic> json,
    String key, {
    List<String> fallbacks = const [],
    bool orElse = false,
  }) {
    final raw = _pick(json, key, fallbacks);
    if (raw == null) return orElse;
    if (raw is bool) return raw;
    if (raw is num) return raw != 0;
    final text = '$raw'.trim().toLowerCase();
    if (text == 'true' || text == '1') return true;
    if (text == 'false' || text == '0') return false;
    return orElse;
  }

  /// 列表。不是列表就返回空列表（而不是抛）。
  static List<dynamic> listOf(
    Map<dynamic, dynamic> json,
    String key, {
    List<String> fallbacks = const [],
  }) {
    final raw = _pick(json, key, fallbacks);
    return raw is List ? raw : const [];
  }

  /// 嵌套对象。不是 Map 就返回 `null`。
  static Map<String, dynamic>? mapOf(
    Map<dynamic, dynamic> json,
    String key, {
    List<String> fallbacks = const [],
  }) {
    final raw = _pick(json, key, fallbacks);
    return raw is Map ? Map<String, dynamic>.from(raw) : null;
  }

  /// 主 key 取不到时按顺序试 [fallbacks]，命中就在 debug 下留痕。
  static Object? _pick(
    Map<dynamic, dynamic> json,
    String key,
    List<String> fallbacks,
  ) {
    final primary = json[key];
    if (!_isBlank(primary)) return primary;
    for (final alt in fallbacks) {
      final value = json[alt];
      if (_isBlank(value)) continue;
      if (!kReleaseMode) {
        // 这一行就是本步的产出：跑一个版本，看哪些 fallback 真的被命中过。
        AppLog.w('field fallback hit: $key -> $alt');
      }
      return value;
    }
    return primary;
  }

  /// `null` 与空串都算「没给」—— 服务端常用空串表示未设置。
  static bool _isBlank(Object? value) {
    if (value == null) return true;
    if (value is String) {
      final t = value.trim();
      return t.isEmpty || t == 'null';
    }
    return false;
  }
}
