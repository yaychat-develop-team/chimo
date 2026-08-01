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
    this.voiceSeconds,
    this.giftUnlocked = 12,
    this.giftTotal = 58,
    this.momentAssets = const [],
  });

  final String id;
  final String nickname;
  final String userId;
  final String avatarAsset;
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
      userId: '47571${member.id.padLeft(5, '0')}',
      avatarAsset: member.avatarAsset,
      isMale: member.isMale,
      age: member.isMale ? 24 : 22,
      zodiac: member.isMale ? 'Leo' : 'Capricornus',
      level: 16,
      bio:
          'I love listening to songs and playing gaes. Hope to find a good friend.',
      voiceSeconds: 12,
      momentAssets: demoMomentAssets,
    );
  }
}
