/// A group member entry.
class GroupMember {
  const GroupMember({
    required this.id,
    required this.nickname,
    required this.avatarAsset,
    required this.isMale,
  });

  final String id;
  final String nickname;
  final String avatarAsset;
  final bool isMale;
}
