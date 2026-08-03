/// Friend relation user.
enum FriendRelation {
  /// Mutual follow → Friends tab; also appears in Follow + Followers.
  mutual,

  /// I follow them, they do not follow back → Follow tab only.
  following,

  /// They follow me, I do not follow back → Followers tab only.
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
