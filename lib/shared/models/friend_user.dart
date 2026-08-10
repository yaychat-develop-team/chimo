/// 好友关系用户。
enum FriendRelation {
  /// 互相关注 → 好友页；同时出现在关注与粉丝。
  mutual,

  /// 我关注对方、对方未回关 → 仅关注页。
  following,

  /// 对方关注我、我未回关 → 仅粉丝页。
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
    this.avatarUrl,
    this.zodiac = 'Capricornus',
    this.bio = 'I love listening to songs and playing games.',
    this.momentAssets = const [],
  });

  final String id;
  final String nickname;
  final String userId;
  final String avatarAsset;
  final String? avatarUrl;
  final bool isMale;
  final int age;
  final FriendRelation relation;
  final String zodiac;
  final String bio;
  final List<String> momentAssets;

  FriendUser copyWith({
    String? id,
    String? nickname,
    String? userId,
    String? avatarAsset,
    String? avatarUrl,
    bool? isMale,
    int? age,
    FriendRelation? relation,
    String? zodiac,
    String? bio,
    List<String>? momentAssets,
  }) {
    return FriendUser(
      id: id ?? this.id,
      nickname: nickname ?? this.nickname,
      userId: userId ?? this.userId,
      avatarAsset: avatarAsset ?? this.avatarAsset,
      avatarUrl: avatarUrl ?? this.avatarUrl,
      isMale: isMale ?? this.isMale,
      age: age ?? this.age,
      relation: relation ?? this.relation,
      zodiac: zodiac ?? this.zodiac,
      bio: bio ?? this.bio,
      momentAssets: momentAssets ?? this.momentAssets,
    );
  }
}
