/// 群成员条目。
class GroupMember {
  const GroupMember({
    required this.id,
    required this.nickname,
    required this.avatarAsset,
    required this.isMale,
    this.avatarUrl,
    this.hasGender = false,
  });

  final String id;
  final String nickname;
  final String avatarAsset;
  final String? avatarUrl;
  final bool isMale;

  /// 是否已设置性别；未设置时列表不展示性别图标。
  final bool hasGender;
}
