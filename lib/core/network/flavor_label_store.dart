import 'app_apis.dart';

/// 交友标签：`/user/info` 常返回 `@YayChat@tb_make_friends_label_name_19`，
/// 需用 `/user/make-friend-label-list` 的 id → 展示名。
abstract final class FlavorLabelStore {
  static final Map<int, String> _byId = {};
  static Future<void>? _loading;

  static Future<void> ensureLoaded() {
    return _loading ??= _load();
  }

  static Future<void> _load() async {
    try {
      final res = await AppApis.user.makeFriendLabelList();
      final list = res.data;
      if (!res.ok || list == null) return;
      for (final item in list) {
        final name = item.name.trim();
        if (name.isEmpty) continue;
        _byId[item.id] = name;
      }
    } catch (_) {}
  }

  static String display(String raw) {
    final text = raw.trim();
    if (text.isEmpty) return '';
    if (!_looksLikeKey(text)) return text;
    final id = int.tryParse(
      RegExp(r'(\d+)$').firstMatch(text)?.group(1) ?? '',
    );
    if (id == null) return '';
    final mapped = _byId[id]?.trim() ?? '';
    if (mapped.isEmpty || _looksLikeKey(mapped)) return '';
    return mapped;
  }

  static bool _looksLikeKey(String text) {
    return text.contains('YayChat@') ||
        text.contains('tb_make_friends_label_name');
  }
}
