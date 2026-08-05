/// Sticker pack tab from `/emote/emoticons-list`.
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

/// One sticker in a pack from `/emote/item-list`.
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

  /// Prefer thumbnail for grid; full [url] when sending.
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

/// Parses emote API JSON envelopes into models.
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
