/// Me page user profile model.
class MeProfile {
  const MeProfile({
    required this.displayName,
    required this.userId,
    required this.avatarAsset,
    required this.friends,
    required this.fans,
    required this.follows,
    required this.visitors,
    this.avatarUrl,
    this.gender = 'Male',
    this.birthday = '1995-01-01',
    this.height,
    this.weight,
    this.signature = '',
    this.tags = const [],
    this.voiceSeconds,
    this.nicknameChangedOnce = false,
    this.vipLevel = 1,
    this.momentUrls = const [],
  });

  /// Display nickname.
  final String displayName;

  /// User ID (for copy).
  final String userId;

  /// Local avatar asset path (fallback).
  final String avatarAsset;

  /// Remote avatar URL from API when available.
  final String? avatarUrl;

  /// Friend count.
  final int friends;

  /// Fan count.
  final int fans;

  /// Following count.
  final int follows;

  /// Visitor count.
  final int visitors;

  final String gender;
  final String birthday;
  final int? height;
  final int? weight;
  final String signature;
  final List<String> tags;
  final int? voiceSeconds;
  final bool nicknameChangedOnce;
  final int vipLevel;
  final List<String> momentUrls;

  bool get isMale => gender == 'Male';

  MeProfile copyWith({
    String? displayName,
    String? userId,
    String? avatarAsset,
    String? avatarUrl,
    int? friends,
    int? fans,
    int? follows,
    int? visitors,
    String? gender,
    String? birthday,
    int? height,
    int? weight,
    bool clearHeight = false,
    bool clearWeight = false,
    String? signature,
    List<String>? tags,
    int? voiceSeconds,
    bool clearVoice = false,
    bool? nicknameChangedOnce,
    int? vipLevel,
    List<String>? momentUrls,
  }) {
    return MeProfile(
      displayName: displayName ?? this.displayName,
      userId: userId ?? this.userId,
      avatarAsset: avatarAsset ?? this.avatarAsset,
      avatarUrl: avatarUrl ?? this.avatarUrl,
      friends: friends ?? this.friends,
      fans: fans ?? this.fans,
      follows: follows ?? this.follows,
      visitors: visitors ?? this.visitors,
      gender: gender ?? this.gender,
      birthday: birthday ?? this.birthday,
      height: clearHeight ? null : (height ?? this.height),
      weight: clearWeight ? null : (weight ?? this.weight),
      signature: signature ?? this.signature,
      tags: tags ?? this.tags,
      voiceSeconds: clearVoice ? null : (voiceSeconds ?? this.voiceSeconds),
      nicknameChangedOnce: nicknameChangedOnce ?? this.nicknameChangedOnce,
      vipLevel: vipLevel ?? this.vipLevel,
      momentUrls: momentUrls ?? this.momentUrls,
    );
  }
}

/// Quick access menu item.
class QuickAccessItem {
  const QuickAccessItem({
    required this.id,
    required this.label,
    required this.iconAsset,
  });

  final String id;
  final String label;

  /// Icon asset path (webp).
  final String iconAsset;
}

/// Stats row item (Friends / Fans, etc.).
class MeStatItem {
  const MeStatItem({required this.label, required this.value});

  final String label;
  final String value;
}
