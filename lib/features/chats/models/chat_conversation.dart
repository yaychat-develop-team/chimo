import 'package:flutter/material.dart';

/// 会话标题旁的标签类型。
enum ChatBadgeType {
  /// 无标签
  none,

  /// 官方认证勾
  verified,

  /// 绿色 Group 标签
  group,

  /// 粉色 Soulmate 花体标签
  soulmate,
}

/// 会话列表单项数据。
class ChatConversation {
  const ChatConversation({
    required this.id,
    required this.title,
    required this.avatarAsset,
    required this.lastMessage,
    required this.timeLabel,
    this.unreadCount = 0,
    this.badge = ChatBadgeType.none,
    this.isOnline = false,
    this.isPinned = false,
    this.titleColor,
    this.isMale = true,
    this.signature = '',
    this.zodiac = 'Capricorn',
    this.isFollowing = false,
    this.momentAssets = const [],
  });

  final String id;
  final String title;
  final String avatarAsset;
  final String lastMessage;
  final String timeLabel;
  final int unreadCount;
  final ChatBadgeType badge;

  /// 头像右下角在线绿点。
  final bool isOnline;

  /// 是否已置顶。
  final bool isPinned;

  /// 可选标题颜色（如官方账号绿色名）。
  final Color? titleColor;

  /// 对端性别（私聊顶栏）。
  final bool isMale;

  /// 对端签名；空则展示默认占位文案。
  final String signature;

  /// 对端星座文案。
  final String zodiac;

  /// 是否已关注（私聊顶栏 Follow）。
  final bool isFollowing;

  /// 资料页 Moments 图片，用于私聊顶部预览。
  final List<String> momentAssets;

  String get signatureDisplay {
    if (signature.trim().isNotEmpty) return signature.trim();
    return isMale
        ? "He doesn't have a signature yet."
        : "She doesn't have a signature yet.";
  }

  ChatConversation copyWith({
    String? id,
    String? title,
    String? avatarAsset,
    String? lastMessage,
    String? timeLabel,
    int? unreadCount,
    ChatBadgeType? badge,
    bool? isOnline,
    bool? isPinned,
    Color? titleColor,
    bool? isMale,
    String? signature,
    String? zodiac,
    bool? isFollowing,
    List<String>? momentAssets,
  }) {
    return ChatConversation(
      id: id ?? this.id,
      title: title ?? this.title,
      avatarAsset: avatarAsset ?? this.avatarAsset,
      lastMessage: lastMessage ?? this.lastMessage,
      timeLabel: timeLabel ?? this.timeLabel,
      unreadCount: unreadCount ?? this.unreadCount,
      badge: badge ?? this.badge,
      isOnline: isOnline ?? this.isOnline,
      isPinned: isPinned ?? this.isPinned,
      titleColor: titleColor ?? this.titleColor,
      isMale: isMale ?? this.isMale,
      signature: signature ?? this.signature,
      zodiac: zodiac ?? this.zodiac,
      isFollowing: isFollowing ?? this.isFollowing,
      momentAssets: momentAssets ?? this.momentAssets,
    );
  }
}
