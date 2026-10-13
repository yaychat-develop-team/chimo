import 'package:flutter/material.dart';

/// 会话标题旁的徽章类型。
enum ChatBadgeType {
  /// 无徽章
  none,

  /// 官方认证勾
  verified,

  /// 绿色 Group 徽章
  group,

  /// 粉色 Soulmate 手写徽章
  soulmate,
}

/// 列表中的单条会话行。
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
    this.zodiac = '',
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

  /// 最近聊天预览。在 IM / 本地发送提供内容前为空。
  final String lastMessage;
  final String timeLabel;
  final int unreadCount;
  final ChatBadgeType badge;

  /// 头像右下角绿色在线点。
  final bool isOnline;

  /// 是否置顶。
  final bool isPinned;

  /// 可选标题颜色（如官方绿色名称）。
  final Color? titleColor;

  /// 对端性别（私聊导航栏）。
  final bool isMale;

  /// 对端签名；为空时用默认占位。
  final String signature;

  /// 对端星座文案。
  final String zodiac;

  /// 对端身高（英寸；0 = 不展示）。
  final int heightInches;

  /// 对端体重（磅；0 = 不展示）。
  final int weightLb;

  /// 是否已关注（私聊导航栏 Follow）。
  final bool isFollowing;

  /// 资料 Moments 本地资源，供私聊顶栏预览。
  final List<String> momentAssets;

  /// 资料 Moments 远程 URL，供私聊顶栏预览。
  final List<String> momentUrls;

  /// 来自 `/chat/group/*` 的群组资料字段（不是最后一条消息）。
  final String groupDescription;
  final String category;
  final int memberCount;
  final int postCount;
  final int level;

  /// 1v1 对端环信用户名（群组为空）。
  final String emUserName;

  /// 最近消息服务端时间（毫秒），用于排序 / 相对时间文案。
  final int lastMsgAtMs;

  /// 官方 / 系统会话（新朋友等）。
  final bool isSystem;

  String get signatureDisplay {
    if (signature.trim().isNotEmpty) return signature.trim();
    return isMale
        ? "He doesn't have a signature yet."
        : "She doesn't have a signature yet.";
  }

  /// 列表行标题下方的副标题。
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
    bool clearTitleColor = false,
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
      titleColor: clearTitleColor ? null : (titleColor ?? this.titleColor),
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
