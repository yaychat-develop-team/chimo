import '../../core/constants/app_assets.dart';
import 'group_member.dart';

/// 聊天中对方用户资料（头像浮层 / 资料页）。
class ChatUserProfile {
  const ChatUserProfile({
    required this.id,
    required this.nickname,
    required this.userId,
    required this.avatarAsset,
    required this.isMale,
    required this.age,
    required this.zodiac,
    required this.level,
    required this.bio,
    this.avatarUrl,
    this.heightInches = 0,
    this.weightLb = 0,
    this.voiceSeconds,
    this.voiceUrl,
    this.vipIconUrl,
    this.giftUnlocked = 0,
    this.giftTotal = 0,
    this.momentAssets = const [],
    this.momentUrls = const [],
    this.tags = const [],
    this.isFollowing = false,
    this.inPartyName,
    this.isOnline = false,
    this.emUsername = '',
    this.cardDynamicResource = '',
    this.hasGender = true,
  });

  final String id;
  final String nickname;
  final String userId;
  final String avatarAsset;
  final String? avatarUrl;
  final bool isMale;
  final int age;
  final String zodiac;
  final int level;
  final String bio;

  /// 身高（英寸）；0 表示未设置 / 隐藏标签。
  final int heightInches;

  /// 体重（LB）；0 表示未设置 / 隐藏标签。
  final int weightLb;

  /// 语音签名时长（秒）；无则 null。
  final int? voiceSeconds;

  /// 远程语音 URL，用于播放。
  final String? voiceUrl;

  /// 服务端 Level 徽章 URL（`icons.smallIcon`）；空则隐藏。
  final String? vipIconUrl;
  final int giftUnlocked;
  final int giftTotal;
  final List<String> momentAssets;
  final List<String> momentUrls;
  final List<String> tags;
  final bool isFollowing;
  final String? inPartyName;

  /// 在线状态，来自 `/user/info`（`onlineStatus == 1` 且未隐藏）。
  final bool isOnline;

  /// EaseMob 聊天 id（优先的私聊会话目标）。
  final String emUsername;

  /// 打开个人主页时的 PAG 特效 URL（`cardDynamicResource`）。
  final String cardDynamicResource;

  /// 是否已设置性别；未设置时资料页不展示性别 / 年龄芯片。
  final bool hasGender;

  static ChatUserProfile placeholder({
    String id = '',
    String nickname = 'User',
    String? avatarUrl,
  }) {
    return ChatUserProfile(
      id: id,
      nickname: nickname,
      userId: id,
      avatarAsset: AppAssets.avatarPlace,
      avatarUrl: avatarUrl,
      isMale: true,
      age: 0,
      zodiac: '',
      level: 1,
      bio: '',
      hasGender: false,
    );
  }

  static ChatUserProfile fromMember(GroupMember member) {
    return ChatUserProfile(
      id: member.id,
      nickname: member.nickname,
      userId: member.id,
      avatarAsset: member.avatarAsset,
      avatarUrl: member.avatarUrl,
      isMale: member.isMale,
      age: 0,
      zodiac: '',
      level: 1,
      bio: '',
      hasGender: true,
    );
  }

  ChatUserProfile copyWith({
    String? id,
    String? nickname,
    String? userId,
    String? avatarAsset,
    String? avatarUrl,
    bool? isMale,
    int? age,
    String? zodiac,
    int? level,
    String? bio,
    int? heightInches,
    int? weightLb,
    int? voiceSeconds,
    String? voiceUrl,
    String? vipIconUrl,
    bool clearVoice = false,
    int? giftUnlocked,
    int? giftTotal,
    List<String>? momentAssets,
    List<String>? momentUrls,
    List<String>? tags,
    bool? isFollowing,
    String? inPartyName,
    bool clearInParty = false,
    bool? isOnline,
    String? emUsername,
    String? cardDynamicResource,
    bool? hasGender,
  }) {
    return ChatUserProfile(
      id: id ?? this.id,
      nickname: nickname ?? this.nickname,
      userId: userId ?? this.userId,
      avatarAsset: avatarAsset ?? this.avatarAsset,
      avatarUrl: avatarUrl ?? this.avatarUrl,
      isMale: isMale ?? this.isMale,
      age: age ?? this.age,
      zodiac: zodiac ?? this.zodiac,
      level: level ?? this.level,
      bio: bio ?? this.bio,
      heightInches: heightInches ?? this.heightInches,
      weightLb: weightLb ?? this.weightLb,
      voiceSeconds: clearVoice ? null : (voiceSeconds ?? this.voiceSeconds),
      voiceUrl: clearVoice ? null : (voiceUrl ?? this.voiceUrl),
      vipIconUrl: vipIconUrl ?? this.vipIconUrl,
      giftUnlocked: giftUnlocked ?? this.giftUnlocked,
      giftTotal: giftTotal ?? this.giftTotal,
      momentAssets: momentAssets ?? this.momentAssets,
      momentUrls: momentUrls ?? this.momentUrls,
      tags: tags ?? this.tags,
      isFollowing: isFollowing ?? this.isFollowing,
      inPartyName: clearInParty ? null : (inPartyName ?? this.inPartyName),
      isOnline: isOnline ?? this.isOnline,
      emUsername: emUsername ?? this.emUsername,
      cardDynamicResource:
          cardDynamicResource ?? this.cardDynamicResource,
      hasGender: hasGender ?? this.hasGender,
    );
  }
}
