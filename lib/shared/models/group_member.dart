/// 群成员条目。
class GroupMember {
  const GroupMember({
    required this.id,
    required this.nickname,
    required this.avatarAsset,
    required this.isMale,
    this.avatarUrl,
  });

  final String id;
  final String nickname;
  final String avatarAsset;
  final String? avatarUrl;
  final bool isMale;
}
