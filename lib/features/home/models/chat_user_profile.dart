import '../../../core/constants/app_assets.dart';
import '../data/group_members_mock_data.dart';

/// 聊天场景中对方用户资料（头像弹窗）。
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

  /// 语音签名秒数（与编辑资料 Voice Note 同源）；无录音则为 null。
  final int? voiceSeconds;
  final int giftUnlocked;
  final int giftTotal;
  final List<String> momentAssets;

  static const List<String> demoMomentAssets = [
    AppAssets.launchBg,
    AppAssets.homeRoomBg,
  ];

  /// 设计稿示例用户。
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
