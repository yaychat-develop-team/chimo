import 'api_client.dart';

/// 群相册按时间段分组的照片桶。
class GroupPhotoSection {
  const GroupPhotoSection({
    required this.periodName,
    required this.urls,
  });

  final String periodName;
  final List<String> urls;
}

abstract final class GroupPhotoDto {
  /// Forya `GroupPhotoListRsp.groupPhotoList`：periodName + photoList。
  static List<GroupPhotoSection> parseSections(ApiResponse response) {
    if (!response.success) return const [];
    return parseData(response.data);
  }

  static List<GroupPhotoSection> parseData(Object? data) {
    if (data is! Map) return const [];
    final list = data['groupPhotoList'] ?? data['photoList'] ?? data['list'];
    if (list is! List) return const [];
    final out = <GroupPhotoSection>[];
    for (final item in list) {
      if (item is String) {
        final s = item.trim();
        if (s.isNotEmpty) {
          out.add(GroupPhotoSection(periodName: '', urls: [s]));
        }
        continue;
      }
      if (item is! Map) continue;
      final map = Map<String, dynamic>.from(item);
      final period =
          '${map['periodName'] ?? map['period'] ?? map['name'] ?? ''}'.trim();
      final nested = map['photoList'] ?? map['photos'] ?? map['list'];
      final urls = <String>[];
      if (nested is List) {
        for (final p in nested) {
          if (p is String) {
            final s = p.trim();
            if (s.isNotEmpty) urls.add(s);
            continue;
          }
          if (p is Map) {
            final u =
                '${p['url'] ?? p['photo'] ?? p['img'] ?? p['image'] ?? ''}'
                    .trim();
            if (u.isNotEmpty) urls.add(u);
          }
        }
      } else {
        final url =
            '${map['url'] ?? map['photo'] ?? map['img'] ?? map['image'] ?? ''}'
                .trim();
        if (url.isNotEmpty) urls.add(url);
      }
      if (urls.isEmpty) continue;
      out.add(GroupPhotoSection(periodName: period, urls: urls));
    }
    return out;
  }
}
