import '../models/group_item.dart';
import '../../../core/constants/app_assets.dart';

/// 首页临时 Mock 数据（头像暂用占位图，后续接接口）。
abstract final class HomeMockData {
  /// 「热门小组」纵向列表。
  static const List<PopularGroupItem> popularGroups = [
    PopularGroupItem(
      id: 'teachers',
      name: "Teachers' Lounge",
      category: 'Educators & Teachers',
      description: 'Share lesson plans, classroom tips, and support.',
      avatarAsset: AppAssets.avatarPlace,
      memberCount: 2536,
      postCount: 543,
      level: 6,
    ),
    PopularGroupItem(
      id: 'clinical',
      name: 'Clinical Corner',
      category: 'Physicians & Specialists',
      description: 'Complex cases, research, clinical tips, and peer support.',
      avatarAsset: AppAssets.avatarPlace,
      memberCount: 1874,
      postCount: 812,
      level: 6,
    ),
    PopularGroupItem(
      id: 'book',
      name: 'Bookworms Club',
      category: 'Books & Literature',
      description: 'Discuss novels, share reviews, and swap titles.',
      avatarAsset: AppAssets.avatarPlace,
      memberCount: 3201,
      postCount: 1204,
      level: 7,
    ),
  ];

  /// 「已加入群组」完整列表（My Groups → More）。
  static const List<PopularGroupItem> joinedGroups = [
    PopularGroupItem(
      id: 'green',
      name: 'Green Life',
      category: 'Embracing eco-consciousness',
      description:
          'Join a space where sustainability meets everyday life. Share practical tips, discover eco-friendly swaps, and grow together in a supportive community.',
      avatarAsset: AppAssets.avatarPlace,
      memberCount: 2536,
      postCount: 543,
      level: 6,
      isJoined: true,
    ),
    PopularGroupItem(
      id: 'foodie_full',
      name: 'Foodie Hub',
      category: 'Home bakers',
      description: 'Recipes, kitchen tips, and foodie meetups.',
      avatarAsset: AppAssets.avatarPlace,
      memberCount: 2536,
      postCount: 543,
      level: 2,
      isJoined: true,
    ),
    PopularGroupItem(
      id: 'player_full',
      name: 'Player One',
      category: 'Gamers & streamers',
      description: 'Find teammates, share clips, and talk games.',
      avatarAsset: AppAssets.avatarPlace,
      memberCount: 2536,
      postCount: 543,
      level: 3,
      isJoined: true,
    ),
    PopularGroupItem(
      id: 'globe_full',
      name: 'Globe Trotters',
      category: 'Travel lovers',
      description: 'Itineraries, tips, and travel buddy matching.',
      avatarAsset: AppAssets.avatarPlace,
      memberCount: 2536,
      postCount: 543,
      level: 4,
      isJoined: true,
    ),
    PopularGroupItem(
      id: 'pet',
      name: 'Pet Paradise',
      category: 'Pet parents',
      description: 'Cute pets, care advice, and local playdates.',
      avatarAsset: AppAssets.avatarPlace,
      memberCount: 2536,
      postCount: 543,
      level: 5,
      isJoined: true,
    ),
    PopularGroupItem(
      id: 'fitness',
      name: 'Fit Squad',
      category: 'Fitness & wellness',
      description: 'Workouts, nutrition, and accountability partners.',
      avatarAsset: AppAssets.avatarPlace,
      memberCount: 2536,
      postCount: 543,
      level: 6,
      isJoined: true,
    ),
  ];

  /// 根据 id / 名称解析详情页所需的完整小组数据。
  static PopularGroupItem resolveGroup({String? id, String? name}) {
    for (final group in [...joinedGroups, ...popularGroups]) {
      if (id != null && group.id == id) return group;
      if (name != null && group.name == name) return group;
    }
    return PopularGroupItem(
      id: id ?? 'unknown',
      name: name ?? 'Group',
      category: 'Community',
      description:
          'Join a space where sustainability meets everyday life. Share practical tips, discover eco-friendly swaps, and grow together in a supportive community.',
      avatarAsset: AppAssets.avatarPlace,
      memberCount: 0,
      postCount: 0,
      level: 1,
    );
  }
}
