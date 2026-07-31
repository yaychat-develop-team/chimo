import '../../../core/constants/app_assets.dart';
import '../models/chat_conversation.dart';

/// Chats list mock: includes DM samples; group chats added on join.
abstract final class ChatsMockData {
  static const List<ChatConversation> conversations = [
    ChatConversation(
      id: 'dm_priya',
      title: 'Priya',
      avatarAsset: AppAssets.avatarPlace,
      lastMessage: 'I love taking sunset shots 🌅',
      timeLabel: '2m',
      unreadCount: 2,
      isMale: true,
      signature: '',
      zodiac: 'Capricorn',
      isOnline: true,
      momentAssets: [AppAssets.launchBg, AppAssets.homeRoomBg],
    ),
    ChatConversation(
      id: 'dm_elita',
      title: 'Elita 💃',
      avatarAsset: AppAssets.genderFemaleImg,
      lastMessage: 'Nice to meet you too!',
      timeLabel: '1h',
      isMale: false,
      signature: 'I love listening to songs and playing games.',
      zodiac: 'Capricorn',
      badge: ChatBadgeType.soulmate,
      momentAssets: [AppAssets.homeRoomBg, AppAssets.mineBgTop],
    ),
    ChatConversation(
      id: 'dm_leo',
      title: 'Leo',
      avatarAsset: AppAssets.genderMaleImg,
      lastMessage: 'Are you free this weekend?',
      timeLabel: 'Yesterday',
      isMale: true,
      zodiac: 'Leo',
      isOnline: true,
      momentAssets: [AppAssets.mineBgTop, AppAssets.launchBg],
    ),
  ];
}
