import '../../../core/constants/app_assets.dart';
import '../../../core/theme/app_colors.dart';
import '../models/chat_conversation.dart';

/// Chats list mock: includes official / system / DM samples; group chats added on join.
abstract final class ChatsMockData {
  static const List<ChatConversation> conversations = [
    ChatConversation(
      id: 'official_product',
      title: 'Product Name',
      avatarAsset: AppAssets.sysIcon,
      lastMessage: 'Synthesis Game 3.0 is here! ...',
      timeLabel: 'Just',
      unreadCount: 100,
      badge: ChatBadgeType.verified,
      titleColor: AppColors.accentLime,
    ),
    ChatConversation(
      id: 'system_message',
      title: 'System Message',
      avatarAsset: AppAssets.sysIcon,
      lastMessage: 'Mike just followed you',
      timeLabel: 'Just',
      unreadCount: 1,
    ),
    ChatConversation(
      id: 'dm_priya',
      title: 'Priya',
      avatarAsset: AppAssets.avatarPlace,
      lastMessage: 'I love taking sunset shots 🌅',
      timeLabel: 'Just',
      unreadCount: 0,
      isMale: true,
      signature: '',
      zodiac: 'Capricorn',
      isOnline: true,
      momentAssets: [AppAssets.launchBg, AppAssets.homeRoomBg],
    ),
    ChatConversation(
      id: 'dm_elita',
      title: 'Elita',
      avatarAsset: AppAssets.genderFemaleImg,
      lastMessage: 'Oksy! Thanks',
      timeLabel: '5 min ago',
      unreadCount: 1,
      isMale: false,
      signature: '✨ Strive to shine, and be your moon.',
      zodiac: 'Capricornus',
      badge: ChatBadgeType.soulmate,
      isOnline: true,
      momentAssets: [
        AppAssets.homeRoomBg,
        AppAssets.mineBgTop,
        AppAssets.launchBg,
        AppAssets.genderFemaleImg,
        AppAssets.personalBg,
      ],
    ),
    ChatConversation(
      id: 'dm_leo',
      title: 'Leo',
      avatarAsset: AppAssets.genderMaleImg,
      lastMessage: 'Are you free this weekend?',
      timeLabel: '5 min ago',
      isMale: true,
      zodiac: 'Leo',
      isOnline: true,
      momentAssets: [AppAssets.mineBgTop, AppAssets.launchBg],
    ),
  ];
}
