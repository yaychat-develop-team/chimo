import '../../../core/constants/app_assets.dart';
import '../../../core/network/api_client.dart';
import '../../../shared/models/group_member.dart';

/// 将 `/chat/group/searchUsers/$gid` JSON 映射为 [GroupMember]。
abstract final class GroupMemberDto {
  static List<GroupMember> parseList(ApiResponse response) {
    if (!response.success) return const [];
    final data = response.data;
    // 响应包络：{ userList: [...] } 或裸列表。
    if (data is List) {
      return [
        for (final item in data)
          if (item is Map) fromUserMap(Map<String, dynamic>.from(item)),
      ];
    }
    if (data is! Map) return const [];
    final list = data['userList'] ??
        data['list'] ??
        data['users'] ??
        data['memberList'] ??
        data['members'];
    if (list is! List) return const [];
    return [
      for (final item in list)
        if (item is Map) fromUserMap(Map<String, dynamic>.from(item)),
    ];
  }

  static GroupMember fromUserMap(Map<String, dynamic> json) {
    final id = '${json['id'] ?? ''}';
    final avatar = '${json['avatar'] ?? ''}'.trim();
    final genderRaw = '${json['gender'] ?? ''}'.trim().toLowerCase();
    final isMale = switch (genderRaw) {
      'female' || 'f' || '2' => false,
      'male' || 'm' || '1' => true,
      _ => true,
    };
    final hasGender = switch (genderRaw) {
      'female' || 'f' || '2' || 'male' || 'm' || '1' => true,
      _ => false,
    };
    return GroupMember(
      id: id,
      nickname: '${json['nickname'] ?? json['nickName'] ?? ''}',
      avatarAsset: AppAssets.avatarPlace,
      avatarUrl: avatar.isEmpty ? null : avatar,
      isMale: isMale,
      hasGender: hasGender,
    );
  }
}
