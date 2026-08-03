import '../../../core/constants/app_assets.dart';
import '../../../core/network/api_client.dart';
import '../../../shared/models/group_member.dart';

/// Maps `/chat/group/searchUsers/$gid` JSON into [GroupMember].
abstract final class GroupMemberDto {
  static List<GroupMember> parseList(ApiResponse response) {
    if (!response.success) return const [];
    final data = response.data;
    if (data is! Map) return const [];
    final list = data['userList'] ?? data['list'] ?? data['users'];
    if (list is! List) return const [];
    return [
      for (final item in list)
        if (item is Map) fromUserMap(Map<String, dynamic>.from(item)),
    ];
  }

  static GroupMember fromUserMap(Map<String, dynamic> json) {
    final id = '${json['id'] ?? ''}';
    final avatar = '${json['avatar'] ?? ''}'.trim();
    final genderRaw = '${json['gender'] ?? ''}'.toLowerCase();
    final isMale = switch (genderRaw) {
      'female' || 'f' || '2' => false,
      _ => true,
    };
    return GroupMember(
      id: id,
      nickname: '${json['nickname'] ?? json['nickName'] ?? ''}',
      avatarAsset: AppAssets.avatarPlace,
      avatarUrl: avatar.isEmpty ? null : avatar,
      isMale: isMale,
    );
  }
}
