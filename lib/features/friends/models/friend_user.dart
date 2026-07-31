/// Friend relation user.
enum FriendRelation {
  /// Mutual follow → Friends tab.
  mutual,

  /// I follow them (not mutual) → Follow tab.
  following,

  /// They follow me (not mutual) → Followers tab.
  follower,
}

class FriendUser {
  const FriendUser({
    required this.id,
    required this.nickname,
    required this.userId,
    required this.avatarAsset,
    required this.isMale,
    required this.age,
    required this.relation,
    this.zodiac = 'Capricornus',
    this.bio = 'I love listening to songs and playing games.',
    this.momentAssets = const [],
  });

  final String id;
  final String nickname;
  final String userId;
  final String avatarAsset;
  final bool isMale;
  final int age;
  final FriendRelation relation;
  final String zodiac;
  final String bio;
  final List<String> momentAssets;
}
