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
    this.avatarUrl,
    this.unreadCount = 0,
    this.badge = ChatBadgeType.none,
    this.isOnline = false,
    this.isPinned = false,
    this.titleColor,
    this.isMale = true,
    this.signature = '',
    this.zodiac = 'Capricorn',
    this.heightInches = 0,
    this.weightLb = 0,
    this.isFollowing = false,
    this.momentAssets = const [],
    this.momentUrls = const [],
    this.groupDescription = '',
    this.category = '',
    this.memberCount = 0,
    this.postCount = 0,
    this.level = 1,
    this.emUserName = '',
    this.lastMsgAtMs = 0,
    this.isSystem = false,
  });

  final String id;
  final String title;
  final String avatarAsset;
  final String? avatarUrl;

  /// Last chat preview. Empty until IM / local send provides one.
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

  /// Peer height in inches (0 = hidden).
  final int heightInches;

  /// Peer weight in LB (0 = hidden).
  final int weightLb;

  /// Whether following (DM app bar Follow).
  final bool isFollowing;

  /// Profile Moments local assets for DM header preview.
  final List<String> momentAssets;

  /// Profile Moments remote URLs for DM header preview.
  final List<String> momentUrls;

  /// Group profile fields from `/chat/group/*` (not last message).
  final String groupDescription;
  final String category;
  final int memberCount;
  final int postCount;
  final int level;

  /// Peer EaseMob username for 1v1 (empty for groups).
  final String emUserName;

  /// Latest message server time (ms) for sort / relative labels.
  final int lastMsgAtMs;

  /// Official / system conversation (New Friends, etc.).
  final bool isSystem;

  String get signatureDisplay {
    if (signature.trim().isNotEmpty) return signature.trim();
    return isMale
        ? "He doesn't have a signature yet."
        : "She doesn't have a signature yet.";
  }

  /// Subtitle under the title for list rows.
  String get listSubtitle {
    if (lastMessage.trim().isNotEmpty) return lastMessage.trim();
    if (badge == ChatBadgeType.group) {
      if (memberCount > 0) return '$memberCount members';
      if (groupDescription.trim().isNotEmpty) return groupDescription.trim();
      return 'Group chat';
    }
    return 'Say hi~';
  }

  ChatConversation copyWith({
    String? id,
    String? title,
    String? avatarAsset,
    String? avatarUrl,
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
    int? heightInches,
    int? weightLb,
    bool? isFollowing,
    List<String>? momentAssets,
    List<String>? momentUrls,
    String? groupDescription,
    String? category,
    int? memberCount,
    int? postCount,
    int? level,
    String? emUserName,
    int? lastMsgAtMs,
    bool? isSystem,
  }) {
    return ChatConversation(
      id: id ?? this.id,
      title: title ?? this.title,
      avatarAsset: avatarAsset ?? this.avatarAsset,
      avatarUrl: avatarUrl ?? this.avatarUrl,
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
      heightInches: heightInches ?? this.heightInches,
      weightLb: weightLb ?? this.weightLb,
      isFollowing: isFollowing ?? this.isFollowing,
      momentAssets: momentAssets ?? this.momentAssets,
      momentUrls: momentUrls ?? this.momentUrls,
      groupDescription: groupDescription ?? this.groupDescription,
      category: category ?? this.category,
      memberCount: memberCount ?? this.memberCount,
      postCount: postCount ?? this.postCount,
      level: level ?? this.level,
      emUserName: emUserName ?? this.emUserName,
      lastMsgAtMs: lastMsgAtMs ?? this.lastMsgAtMs,
      isSystem: isSystem ?? this.isSystem,
    );
  }
}
