/// 贴纸包 Tab，来自 `/emote/emoticons-list`。
class EmotePack {
  const EmotePack({
    required this.id,
    required this.name,
    required this.cover,
    this.type = '',
  });

  final String id;
  final String name;
  final String cover;
  final String type;

  factory EmotePack.fromJson(Map<String, dynamic> json) {
    return EmotePack(
      id: '${json['id'] ?? ''}'.trim(),
      name: '${json['name'] ?? ''}'.trim(),
      cover: '${json['cover'] ?? ''}'.trim(),
      type: '${json['type'] ?? ''}'.trim(),
    );
  }
}

/// 贴纸包中的单个贴纸，来自 `/emote/item-list`。
class EmoteSticker {
  const EmoteSticker({
    required this.id,
    required this.name,
    required this.url,
    this.showUrl = '',
  });

  final String id;
  final String name;
  final String url;
  final String showUrl;

  /// 网格优先缩略图；发送时用完整 [url]。
  String get gridUrl {
    final s = showUrl.trim();
    if (s.isNotEmpty) return s;
    return url.trim();
  }

  factory EmoteSticker.fromJson(Map<String, dynamic> json) {
    return EmoteSticker(
      id: '${json['id'] ?? ''}'.trim(),
      name: '${json['name'] ?? ''}'.trim(),
      url: '${json['url'] ?? ''}'.trim(),
      showUrl: '${json['showUrl'] ?? json['show_url'] ?? ''}'.trim(),
    );
  }
}

/// 将表情接口 JSON 包络解析为模型。
abstract final class EmoteDto {
  static List<EmotePack> parsePacks(Object? data) {
    final list = _extractList(data, const ['list', 'emoticons', 'items']);
    return [
      for (final item in list)
        if (item is Map)
          EmotePack.fromJson(Map<String, dynamic>.from(item)),
    ].where((p) => p.id.isNotEmpty).toList();
  }

  static List<EmoteSticker> parseStickers(Object? data) {
    final list = _extractList(data, const ['items', 'list', 'emotes']);
    return [
      for (final item in list)
        if (item is Map)
          EmoteSticker.fromJson(Map<String, dynamic>.from(item)),
    ].where((s) => s.url.isNotEmpty || s.showUrl.isNotEmpty).toList();
  }

  static List<dynamic> _extractList(Object? data, List<String> keys) {
    if (data is List) return data;
    if (data is! Map) return const [];
    final map = Map<String, dynamic>.from(data);
    for (final key in keys) {
      final v = map[key];
      if (v is List) return v;
    }
    return const [];
  }
}
