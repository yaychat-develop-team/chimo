import '../../core/constants/app_assets.dart';
import '../../core/network/api_client.dart';
import '../../shared/models/group_item.dart';

/// 将 D:\forya 群组 JSON（proto3）映射为 UI 模型。
abstract final class GroupDto {
  static List<PopularGroupItem> parseList(ApiResponse response) {
    if (!response.success) return const [];
    return parseData(response.data);
  }

  /// `/chat/group/getTypeList` → 行业 / 兴趣标签。
  static List<String> parseTypeList(ApiResponse response) {
    if (!response.success) return const [];
    final data = response.data;
    if (data is List) {
      return [
        for (final item in data)
          if ('$item'.trim().isNotEmpty) '$item'.trim(),
      ];
    }
    if (data is! Map) return const [];
    final list = data['typeList'] ?? data['list'] ?? data['types'];
    if (list is! List) return const [];
    return [
      for (final item in list)
        if ('$item'.trim().isNotEmpty) '$item'.trim(),
    ];
  }

  static List<PopularGroupItem> parseData(Object? data) {
    if (data is List) {
      return [
        for (final item in data)
          if (item is Map) fromMap(Map<String, dynamic>.from(item)),
      ];
    }
    if (data is! Map) return const [];
    final list = data['groupList'] ?? data['myGroups'] ?? data['list'];
    if (list is! List) return const [];
    return [
      for (final item in list)
        if (item is Map) fromMap(Map<String, dynamic>.from(item)),
    ];
  }

  static PopularGroupItem fromMap(Map<String, dynamic> json) {
    final emId = '${json['emGroupId'] ?? ''}'.trim();
    final id = emId.isNotEmpty ? emId : '${json['id'] ?? ''}'.trim();
    final avatar = '${json['avatar'] ?? ''}';

    // 兼容不同接口字段名：线上环境有时返回 `groupName/group_name/title` 等。
    final name = (json['name'] ??
            json['groupName'] ??
            json['group_name'] ??
            json['title'] ??
            '')
        .toString();

    final category = (json['type'] ??
            json['category'] ??
            json['tag'] ??
            '')
        .toString();

    final desc = (json['desc'] ??
            json['description'] ??
            json['groupDescription'] ??
            json['bio'] ??
            '')
        .toString();
    return PopularGroupItem(
      id: id,
      name: name,
      category: category,
      description: desc,
      avatarAsset: AppAssets.avatarPlace,
      avatarUrl: avatar.isEmpty ? null : avatar,
      memberCount: _asInt(json['memberCount']),
      postCount: _asInt(json['picCount']),
      level: _asInt(json['level'], fallback: 1),
      isJoined: json['isJoin'] == true || json['isJoin'] == 'true',
    );
  }

  static int _asInt(Object? value, {int fallback = 0}) {
    if (value is int) return value;
    return int.tryParse('$value') ?? fallback;
  }
}
