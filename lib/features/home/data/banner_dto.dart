/// 首页轮播横幅一项，来自 `/home_page/main` 或 `/banner/list`。
class HomeBannerItem {
  const HomeBannerItem({
    required this.imageUrl,
    this.link = '',
  });

  final String imageUrl;
  final String link;
}

/// 解析首页接口的横幅载荷。
abstract final class BannerDto {
  static List<HomeBannerItem> parseHomeMain(Object? data) {
    if (data is! Map) return const [];
    // 对齐 D:\forya home_controller：轮播仅使用 `image` 横幅。
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
