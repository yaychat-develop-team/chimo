/// Data for a My Groups list item.
class MyGroupItem {
  const MyGroupItem({
    required this.id,
    required this.name,
    required this.avatarAsset,
    this.avatarUrl,
  });

  /// Unique identifier.
  final String id;

  /// Group name.
  final String name;

  /// Local asset path for the circular avatar (fallback).
  final String avatarAsset;

  /// Remote avatar URL from API when available.
  final String? avatarUrl;
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
    this.avatarUrl,
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

  /// Local asset path for the rounded-square avatar (fallback).
  final String avatarAsset;

  /// Remote avatar URL from API when available.
  final String? avatarUrl;

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

  /// Data for a horizontal My Groups card.
  MyGroupItem toMyGroupItem() => MyGroupItem(
        id: id,
        name: name,
        avatarAsset: avatarAsset,
        avatarUrl: avatarUrl,
      );
}
