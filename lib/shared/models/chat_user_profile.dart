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
    this.voiceSeconds,
    this.giftUnlocked = 0,
    this.giftTotal = 0,
    this.momentAssets = const [],
    this.momentUrls = const [],
    this.tags = const [],
    this.isFollowing = false,
    this.inPartyName,
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

  /// Voice note duration in seconds; null if none.
  final int? voiceSeconds;
  final int giftUnlocked;
  final int giftTotal;
  final List<String> momentAssets;
  final List<String> momentUrls;
  final List<String> tags;
  final bool isFollowing;
  final String? inPartyName;

  static const List<String> demoMomentAssets = [
    AppAssets.launchBg,
    AppAssets.homeRoomBg,
  ];

  /// Sample user from the design spec.
  static const ChatUserProfile elita = ChatUserProfile(
    id: 'elita',
    nickname: 'Elita 💃',
    userId: '4757119063',
    avatarAsset: AppAssets.avatarPlace,
    isMale: false,
    age: 22,
    zodiac: 'Capricornus',
    level: 16,
    bio:
        'I love listening to songs and playing gaes. Hope to find a good friend.',
    voiceSeconds: 12,
    momentAssets: demoMomentAssets,
  );

  static ChatUserProfile fromMember(GroupMember member) {
    return ChatUserProfile(
      id: member.id,
      nickname: member.nickname,
      userId: member.id,
      avatarAsset: member.avatarAsset,
      avatarUrl: member.avatarUrl,
      isMale: member.isMale,
      age: member.isMale ? 24 : 22,
      zodiac: member.isMale ? 'Leo' : 'Capricornus',
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
    int? voiceSeconds,
    bool clearVoice = false,
    int? giftUnlocked,
    int? giftTotal,
    List<String>? momentAssets,
    List<String>? momentUrls,
    List<String>? tags,
    bool? isFollowing,
    String? inPartyName,
    bool clearInParty = false,
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
      voiceSeconds: clearVoice ? null : (voiceSeconds ?? this.voiceSeconds),
      giftUnlocked: giftUnlocked ?? this.giftUnlocked,
      giftTotal: giftTotal ?? this.giftTotal,
      momentAssets: momentAssets ?? this.momentAssets,
      momentUrls: momentUrls ?? this.momentUrls,
      tags: tags ?? this.tags,
      isFollowing: isFollowing ?? this.isFollowing,
      inPartyName: clearInParty ? null : (inPartyName ?? this.inPartyName),
    );
  }
}
