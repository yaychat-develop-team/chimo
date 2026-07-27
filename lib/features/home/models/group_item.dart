/// 「我的小组」列表项数据。
class MyGroupItem {
  const MyGroupItem({
    required this.id,
    required this.name,
    required this.avatarAsset,
  });

  /// 唯一标识。
  final String id;

  /// 小组名称。
  final String name;

  /// 圆形头像本地资源路径。
  final String avatarAsset;
}

/// 「热门小组」列表项数据。
class PopularGroupItem {
  const PopularGroupItem({
    required this.id,
    required this.name,
    required this.category,
    required this.description,
    required this.avatarAsset,
    required this.memberCount,
    required this.postCount,
    required this.level,
    this.isJoined = false,
  });

  /// 唯一标识。
  final String id;

  /// 小组名称。
  final String name;

  /// 分类标签文案。
  final String category;

  /// 简介描述。
  final String description;

  /// 圆角方形头像本地资源路径。
  final String avatarAsset;

  /// 成员数。
  final int memberCount;

  /// 帖子 / 图片数。
  final int postCount;

  /// 等级（展示为 Vn）。
  final int level;

  /// 是否已加入；影响右上角按钮样式。
  final bool isJoined;

  PopularGroupItem copyWith({
    String? id,
    String? name,
    String? category,
    String? description,
    String? avatarAsset,
    int? memberCount,
    int? postCount,
    int? level,
    bool? isJoined,
  }) {
    return PopularGroupItem(
      id: id ?? this.id,
      name: name ?? this.name,
      category: category ?? this.category,
      description: description ?? this.description,
      avatarAsset: avatarAsset ?? this.avatarAsset,
      memberCount: memberCount ?? this.memberCount,
      postCount: postCount ?? this.postCount,
      level: level ?? this.level,
      isJoined: isJoined ?? this.isJoined,
    );
  }

  /// 横向「我的小组」卡片数据。
  MyGroupItem toMyGroupItem() => MyGroupItem(
        id: id,
        name: name,
        avatarAsset: avatarAsset,
      );
}
