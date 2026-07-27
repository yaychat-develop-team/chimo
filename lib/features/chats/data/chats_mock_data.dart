import 'package:flutter/material.dart';

import '../../../core/constants/app_assets.dart';
import '../models/chat_conversation.dart';

/// 消息列表 Mock 数据（头像暂用占位 / Logo）。
abstract final class ChatsMockData {
  static const List<ChatConversation> conversations = [
    ChatConversation(
      id: 'product',
      title: 'Product Name',
      avatarAsset: AppAssets.iconLogo,
      lastMessage: 'Synthesis Game 3.0 is here! ...',
      timeLabel: 'Just',
      unreadCount: 120,
      badge: ChatBadgeType.verified,
      titleColor: Color(0xFF24B572),
    ),
    ChatConversation(
      id: 'system',
      title: 'System Message',
      avatarAsset: AppAssets.logo,
      lastMessage: 'Mike just followed you',
      timeLabel: 'Just',
      unreadCount: 1,
    ),
    ChatConversation(
      id: 'cat',
      title: 'Cat Club',
      avatarAsset: AppAssets.avatarPlace,
      lastMessage: "My kitty's gotten so fussy about food...",
      timeLabel: 'Just',
      badge: ChatBadgeType.group,
    ),
    ChatConversation(
      id: 'seraphina',
      title: 'Seraphina',
      avatarAsset: AppAssets.emptyAvatar,
      lastMessage: 'Oksy! Thanks',
      timeLabel: '5 min ago',
      unreadCount: 1,
      badge: ChatBadgeType.soulmate,
      isOnline: true,
    ),
    ChatConversation(
      id: 'davidson',
      title: 'Davidson',
      avatarAsset: AppAssets.avatarPlace,
      lastMessage: "You're so much fun",
      timeLabel: '5 min ago',
    ),
    ChatConversation(
      id: 'food',
      title: 'Food Hub',
      avatarAsset: AppAssets.avatarPlace,
      lastMessage: 'Thank you for your hospitality',
      timeLabel: '5 min ago',
      badge: ChatBadgeType.group,
    ),
    ChatConversation(
      id: 'amara',
      title: 'Amara',
      avatarAsset: AppAssets.emptyAvatar,
      lastMessage: "I've been into K-POP lately - have...",
      timeLabel: '5 min ago',
      isOnline: true,
    ),
  ];
}
