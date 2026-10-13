/// 首页搜索命中用户与自己的关系。
enum SearchRelation { self, notFollowing, following }

/// 首页搜索命中的用户（`GET /search?no=`，对齐 forya）。
///
/// 私有类跨不了文件。
class SearchUser {
  const SearchUser({
    required this.id,
    required this.nickname,
    required this.userId,
    required this.avatarAsset,
    required this.isMale,
    required this.age,
    this.avatarUrl,
    this.momentAssets = const [],
    this.relation = SearchRelation.notFollowing,
    this.emUsername = '',
    this.zodiac = '',
    this.bio = '',
    this.hasGender = true,
  });

  final String id;
  final String nickname;
  final String userId;
  final String avatarAsset;
  final String? avatarUrl;
  final bool isMale;
  final int age;
  final List<String> momentAssets;
  final SearchRelation relation;
  final String emUsername;
  final String zodiac;
  final String bio;
  final bool hasGender;

  SearchUser copyWith({SearchRelation? relation}) {
    return SearchUser(
      id: id,
      nickname: nickname,
      userId: userId,
      avatarAsset: avatarAsset,
      avatarUrl: avatarUrl,
      isMale: isMale,
      age: age,
      momentAssets: momentAssets,
      relation: relation ?? this.relation,
      emUsername: emUsername,
      zodiac: zodiac,
      bio: bio,
      hasGender: hasGender,
    );
  }
}
