/// Data for a My Groups list item.
class MyGroupItem {
  const MyGroupItem({
    required this.id,
    required this.name,
    required this.avatarAsset,
  });

  /// Unique identifier.
  final String id;

  /// Group name.
  final String name;

  /// Local asset path for the circular avatar.
  final String avatarAsset;
}

/// Data for a popular group list item.
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

  /// Unique identifier.
  final String id;

  /// Group name.
  final String name;

  /// Category tag label.
  final String category;

  /// Short description.
  final String description;

  /// Local asset path for the rounded-square avatar.
  final String avatarAsset;

  /// Member count.
  final int memberCount;

  /// Post / image count.
  final int postCount;

  /// Level (shown as Vn).
  final int level;

  /// Whether joined; affects top-right button style.
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

  /// Data for a horizontal My Groups card.
  MyGroupItem toMyGroupItem() => MyGroupItem(
        id: id,
        name: name,
        avatarAsset: avatarAsset,
      );
}
