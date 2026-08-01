import 'package:flutter/material.dart';

/// Badge type beside conversation title.
enum ChatBadgeType {
  /// No badge
  none,

  /// Official verified check
  verified,

  /// Green Group badge
  group,

  /// Pink Soulmate script badge
  soulmate,
}

/// Single conversation row in the list.
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

  /// Green online dot on avatar bottom-right.
  final bool isOnline;

  /// Whether pinned.
  final bool isPinned;

  /// Optional title color (e.g. official green name).
  final Color? titleColor;

  /// Peer gender (DM app bar).
  final bool isMale;

  /// Peer signature; default placeholder if empty.
  final String signature;

  /// Peer zodiac label.
  final String zodiac;

  /// Whether following (DM app bar Follow).
  final bool isFollowing;

  /// Profile Moments images for DM header preview.
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
