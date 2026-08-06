import '../../core/constants/app_assets.dart';
import 'group_member.dart';

/// Other user's profile in chat (avatar sheet / profile page).
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

  /// Height in inches; 0 means not set / hide tag.
  final int heightInches;

  /// Weight in LB; 0 means not set / hide tag.
  final int weightLb;

  /// Voice note duration in seconds; null if none.
  final int? voiceSeconds;

  /// Remote voice URL for playback.
  final String? voiceUrl;

  /// Server Level badge URL (`icons.smallIcon`); empty → hide.
  final String? vipIconUrl;
  final int giftUnlocked;
  final int giftTotal;
  final List<String> momentAssets;
  final List<String> momentUrls;
  final List<String> tags;
  final bool isFollowing;
  final String? inPartyName;

  /// Presence from `/user/info` (`onlineStatus == 1` and not hidden).
  final bool isOnline;

  /// EaseMob chat id (preferred peer conversation target).
  final String emUsername;

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
    );
  }
}
