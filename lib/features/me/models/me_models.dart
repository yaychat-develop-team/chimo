import '../../../core/constants/app_assets.dart';

/// 「我的」页用户资料模型。
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
    this.cardDynamicResource = '',
  });

  /// `/user/info` 返回前的空壳。
  static const MeProfile empty = MeProfile(
    displayName: '',
    userId: '',
    avatarAsset: AppAssets.avatarPlace,
    friends: 0,
    fans: 0,
    follows: 0,
    visitors: 0,
  );

  /// 展示昵称。
  final String displayName;

  /// 用户 ID（用于复制）。
  final String userId;

  /// 已绑定登录邮箱；未绑定时为空。
  final String email;

  /// 本地头像资源路径（回退）。
  final String avatarAsset;

  /// 接口返回的远程头像 URL（若有）。
  final String? avatarUrl;

  /// 好友数。
  final int friends;

  /// 粉丝数。
  final int fans;

  /// 关注数。
  final int follows;

  /// 访客数。
  final int visitors;

  final String gender;
  final String birthday;
  final int? height;
  final int? weight;
  final String signature;
  final List<String> tags;
  final int? voiceSeconds;
  /// 远程 CDN URL（或保存前的待定本地路径）。
  final String? voiceUrl;

  /// 服务端等级徽章（`icons.smallIcon`）；空 → 像 forya UserLevWidget 一样隐藏。
  final String? vipIconUrl;
  final bool nicknameChangedOnce;
  /// 平台财富等级（API 中的 `vipLevel`）。从 0 起——不是付费贵族。
  final int vipLevel;
  /// 下一级所需总经验（forya `experience`）。
  final int experience;
  /// 距下一级还需的经验（forya `moreExpForNextLevel`）。
  final int moreExpForNextLevel;
  /// 满级时的终身经验（forya `totalExperience`）。
  final int totalExperience;
  final List<String> momentUrls;

  /// 打开个人主页时的 PAG 特效 URL。
  final String cardDynamicResource;

  bool get isMale => gender == 'Male';

  /// Forya `User.levelIndex` — 选择卡片/徽章色阶。
  int get levelIndex {
    if (vipLevel <= 5) return 0;
    if (vipLevel <= 10) return 1;
    if (vipLevel <= 20) return 2;
    if (vipLevel <= 30) return 3;
    if (vipLevel <= 40) return 4;
    return 5;
  }

  bool get isMaxLevel => vipLevel >= 60;

  /// 进度文案下方展示的点数（forya `experienceText` 分子）。
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
    String? cardDynamicResource,
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
      cardDynamicResource:
          cardDynamicResource ?? this.cardDynamicResource,
    );
  }
}

/// 快捷入口菜单项。
class QuickAccessItem {
  const QuickAccessItem({
    required this.id,
    required this.label,
    required this.iconAsset,
  });

  final String id;
  final String label;

  /// 图标资源路径（webp）。
  final String iconAsset;
}

/// 统计行项（好友 / 粉丝等）。
class MeStatItem {
  const MeStatItem({required this.label, required this.value});

  final String label;
  final String value;
}
