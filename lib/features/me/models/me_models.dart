/// 个人中心用户资料数据模型。
class MeProfile {
  const MeProfile({
    required this.displayName,
    required this.userId,
    required this.avatarAsset,
    required this.friends,
    required this.fans,
    required this.follows,
    required this.visitors,
    this.gender = 'Male',
    this.birthday = '1995-01-01',
    this.height,
    this.weight,
    this.signature = '',
    this.tags = const [],
    this.voiceSeconds,
    this.nicknameChangedOnce = false,
  });

  /// 展示昵称。
  final String displayName;

  /// 用户 ID（用于复制）。
  final String userId;

  /// 头像本地资源路径。
  final String avatarAsset;

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
  final bool nicknameChangedOnce;

  bool get isMale => gender == 'Male';

  MeProfile copyWith({
    String? displayName,
    String? userId,
    String? avatarAsset,
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
  }) {
    return MeProfile(
      displayName: displayName ?? this.displayName,
      userId: userId ?? this.userId,
      avatarAsset: avatarAsset ?? this.avatarAsset,
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
    );
  }
}

/// 快捷入口单项。
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

/// 统计条单项（Friends / Fans 等）。
class MeStatItem {
  const MeStatItem({required this.label, required this.value});

  final String label;
  final String value;
}
