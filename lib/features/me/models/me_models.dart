import '../../../core/constants/app_assets.dart';

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
    this.email = '',
    this.gender = 'Male',
    this.birthday = '1995-01-01',
    this.height,
    this.weight,
    this.signature = '',
    this.tags = const [],
    this.voiceSeconds,
    this.voiceUrl,
    this.vipIconUrl,
    this.nicknameChangedOnce = false,
    this.vipLevel = 0,
    this.experience = 0,
    this.moreExpForNextLevel = 0,
    this.totalExperience = 0,
    this.momentUrls = const [],
  });

  /// Empty shell before `/user/info` returns.
  static const MeProfile empty = MeProfile(
    displayName: '',
    userId: '',
    avatarAsset: AppAssets.avatarPlace,
    friends: 0,
    fans: 0,
    follows: 0,
    visitors: 0,
  );

  /// Display nickname.
  final String displayName;

  /// User ID (for copy).
  final String userId;

  /// Bound login email; empty when not bound.
  final String email;

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
  /// Remote CDN URL (or pending local path before save).
  final String? voiceUrl;

  /// Server Level badge (`icons.smallIcon`); empty → hide like forya UserLevWidget.
  final String? vipIconUrl;
  final bool nicknameChangedOnce;
  /// Platform wealth level (`vipLevel` in API). Starts at 0 — not paid noble.
  final int vipLevel;
  /// Next-level total XP requirement (forya `experience`).
  final int experience;
  /// XP still needed for next level (forya `moreExpForNextLevel`).
  final int moreExpForNextLevel;
  /// Lifetime XP when at max level (forya `totalExperience`).
  final int totalExperience;
  final List<String> momentUrls;

  bool get isMale => gender == 'Male';

  /// Forya `User.levelIndex` — picks card/badge color tier.
  int get levelIndex {
    if (vipLevel <= 5) return 0;
    if (vipLevel <= 10) return 1;
    if (vipLevel <= 20) return 2;
    if (vipLevel <= 30) return 3;
    if (vipLevel <= 40) return 4;
    return 5;
  }

  bool get isMaxLevel => vipLevel >= 60;

  /// Points shown under the progress label (forya `experienceText` numerator).
  int get displayedExperience {
    if (isMaxLevel) return totalExperience;
    final v = experience - moreExpForNextLevel;
    return v < 0 ? 0 : v;
  }

  MeProfile copyWith({
    String? displayName,
    String? userId,
    String? avatarAsset,
    String? avatarUrl,
    String? email,
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
    String? voiceUrl,
    String? vipIconUrl,
    bool clearVoice = false,
    bool? nicknameChangedOnce,
    int? vipLevel,
    int? experience,
    int? moreExpForNextLevel,
    int? totalExperience,
    List<String>? momentUrls,
  }) {
    return MeProfile(
      displayName: displayName ?? this.displayName,
      userId: userId ?? this.userId,
      avatarAsset: avatarAsset ?? this.avatarAsset,
      avatarUrl: avatarUrl ?? this.avatarUrl,
      email: email ?? this.email,
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
      voiceUrl: clearVoice ? null : (voiceUrl ?? this.voiceUrl),
      vipIconUrl: vipIconUrl ?? this.vipIconUrl,
      nicknameChangedOnce: nicknameChangedOnce ?? this.nicknameChangedOnce,
      vipLevel: vipLevel ?? this.vipLevel,
      experience: experience ?? this.experience,
      moreExpForNextLevel: moreExpForNextLevel ?? this.moreExpForNextLevel,
      totalExperience: totalExperience ?? this.totalExperience,
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
