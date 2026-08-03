/// One home carousel banner from `/home_page/main` or `/banner/list`.
class HomeBannerItem {
  const HomeBannerItem({
    required this.imageUrl,
    this.link = '',
  });

  final String imageUrl;
  final String link;
}

/// Parses banner payloads from home APIs.
abstract final class BannerDto {
  static List<HomeBannerItem> parseHomeMain(Object? data) {
    if (data is! Map) return const [];
    // Same as D:\forya home_controller: carousel only uses `image` banners.
    // `gift` / `game` entries belong to other home widgets.
    return parseList(data['banners'], imageOnly: true);
  }

  static List<HomeBannerItem> parseList(
    Object? raw, {
    bool imageOnly = false,
  }) {
    if (raw is! List) return const [];
    final items = <HomeBannerItem>[];
    for (final item in raw) {
      if (item is! Map) continue;
      final map = Map<String, dynamic>.from(item);
      final type = '${map['type'] ?? ''}'.toLowerCase().trim();
      if (imageOnly && type.isNotEmpty && type != 'image' && type != '1') {
        continue;
      }
      final url =
          '${map['img1'] ?? map['img'] ?? map['image'] ?? map['url'] ?? ''}'
              .trim();
      if (url.isEmpty) continue;
      items.add(
        HomeBannerItem(
          imageUrl: url,
          link: '${map['link'] ?? map['jumpUrl'] ?? ''}',
        ),
      );
    }
    return items;
  }
}
