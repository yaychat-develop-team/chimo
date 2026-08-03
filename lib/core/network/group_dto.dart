import '../../core/constants/app_assets.dart';
import '../../core/network/api_client.dart';
import '../../shared/models/group_item.dart';

/// Maps D:\forya group JSON (proto3) into UI models.
abstract final class GroupDto {
  static List<PopularGroupItem> parseList(ApiResponse response) {
    if (!response.success) return const [];
    final data = response.data;
    if (data is! Map) return const [];
    final list = data['groupList'];
    if (list is! List) return const [];
    return [
      for (final item in list)
        if (item is Map) fromMap(Map<String, dynamic>.from(item)),
    ];
  }

  static PopularGroupItem fromMap(Map<String, dynamic> json) {
    final emId = '${json['emGroupId'] ?? ''}';
    final id = emId.isNotEmpty ? emId : '${json['id'] ?? ''}';
    final avatar = '${json['avatar'] ?? ''}';
    return PopularGroupItem(
      id: id,
      name: '${json['name'] ?? ''}',
      category: '${json['type'] ?? ''}',
      description: '${json['desc'] ?? ''}',
      avatarAsset: AppAssets.avatarPlace,
      avatarUrl: avatar.isEmpty ? null : avatar,
      memberCount: _asInt(json['memberCount']),
      postCount: _asInt(json['picCount']),
      level: _asInt(json['level'], fallback: 1),
      isJoined: json['isJoin'] == true,
    );
  }

  static int _asInt(Object? value, {int fallback = 0}) {
    if (value is int) return value;
    return int.tryParse('$value') ?? fallback;
  }
}
