/// 「我的群组」列表项数据。
class MyGroupItem {
  const MyGroupItem({
    required this.id,
    required this.name,
    required this.avatarAsset,
    this.avatarUrl,
  });

  /// 唯一标识。
  final String id;

  /// 群组名称。
  final String name;

  /// 圆形头像的本地资源路径（回退）。
  final String avatarAsset;

  /// 接口返回的远程头像 URL（若有）。
  final String? avatarUrl;
}

/// 热门群组列表项数据。
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
    this.avatarUrl,
    this.isJoined = false,
  });

  /// 唯一标识。
  final String id;

  /// 群组名称。
  final String name;

  /// 分类标签文案。
  final String category;

  /// 简短描述。
  final String description;

  /// 圆角方形头像的本地资源路径（回退）。
  final String avatarAsset;

  /// 接口返回的远程头像 URL（若有）。
  final String? avatarUrl;

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
    String? avatarUrl,
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
      avatarUrl: avatarUrl ?? this.avatarUrl,
      memberCount: memberCount ?? this.memberCount,
      postCount: postCount ?? this.postCount,
      level: level ?? this.level,
      isJoined: isJoined ?? this.isJoined,
    );
  }

  /// 横向「我的群组」卡片数据。
  MyGroupItem toMyGroupItem() => MyGroupItem(
        id: id,
        name: name,
        avatarAsset: avatarAsset,
        avatarUrl: avatarUrl,
      );
}
