import '../../../core/constants/app_assets.dart';
import '../models/friend_user.dart';

/// Friends / following / followers mock.
///
/// - [FriendRelation.mutual]: both follow → Friends; also listed in Follow & Followers
/// - [FriendRelation.following]: I follow only → Follow tab
/// - [FriendRelation.follower]: they follow only → Followers tab
abstract final class FriendsMockData {
  static const List<String> _moments = [
    AppAssets.launchBg,
    AppAssets.homeRoomBg,
  ];

  static const List<FriendUser> all = [
    // —— Mutual follows ——
    FriendUser(
      id: 'mutual_priya',
      nickname: 'Priya',
      userId: '1002031',
      avatarAsset: AppAssets.avatarPlace,
      isMale: true,
      age: 24,
      relation: FriendRelation.mutual,
      zodiac: 'Capricornus',
      momentAssets: _moments,
    ),
    FriendUser(
      id: 'mutual_elita',
      nickname: 'Elita',
      userId: '1002048',
      avatarAsset: AppAssets.genderFemaleImg,
      isMale: false,
      age: 22,
      relation: FriendRelation.mutual,
      zodiac: 'Capricornus',
      momentAssets: _moments,
    ),
    FriendUser(
      id: 'mutual_leo',
      nickname: 'Leo',
      userId: '1002099',
      avatarAsset: AppAssets.genderMaleImg,
      isMale: true,
      age: 26,
      relation: FriendRelation.mutual,
      zodiac: 'Leo',
      momentAssets: _moments,
    ),
    FriendUser(
      id: 'mutual_maya',
      nickname: 'Maya',
      userId: '1002112',
      avatarAsset: AppAssets.emptyAvatar,
      isMale: false,
      age: 21,
      relation: FriendRelation.mutual,
      momentAssets: _moments,
    ),
    FriendUser(
      id: 'mutual_kai',
      nickname: 'Kai',
      userId: '1002155',
      avatarAsset: AppAssets.avatarPlace,
      isMale: true,
      age: 23,
      relation: FriendRelation.mutual,
      momentAssets: _moments,
    ),
    // —— Following (not mutual) ——
    FriendUser(
      id: 'follow_snake',
      nickname: 'snake',
      userId: '1002201',
      avatarAsset: AppAssets.genderMaleImg,
      isMale: true,
      age: 25,
      relation: FriendRelation.following,
      momentAssets: _moments,
    ),
    FriendUser(
      id: 'follow_nova',
      nickname: 'Nova',
      userId: '1002208',
      avatarAsset: AppAssets.genderFemaleImg,
      isMale: false,
      age: 20,
      relation: FriendRelation.following,
      momentAssets: _moments,
    ),
    // —— Followers (not mutual) ——
    FriendUser(
      id: 'fan_l7',
      nickname: 'L7',
      userId: '1002301',
      avatarAsset: AppAssets.avatarPlace,
      isMale: true,
      age: 27,
      relation: FriendRelation.follower,
      momentAssets: _moments,
    ),
    FriendUser(
      id: 'fan_xiaoge',
      nickname: 'xiaoge',
      userId: '1002315',
      avatarAsset: AppAssets.genderFemaleImg,
      isMale: false,
      age: 19,
      relation: FriendRelation.follower,
      momentAssets: _moments,
    ),
    FriendUser(
      id: 'fan_rina',
      nickname: 'Rina',
      userId: '1002322',
      avatarAsset: AppAssets.emptyAvatar,
      isMale: false,
      age: 22,
      relation: FriendRelation.follower,
      momentAssets: _moments,
    ),
  ];

  static List<FriendUser> byRelation(FriendRelation relation) =>
      all.where((u) => u.relation == relation).toList(growable: false);
}
