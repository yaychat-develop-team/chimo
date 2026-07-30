import 'package:flutter/material.dart';

import '../../home/models/group_item.dart';
import '../models/chat_conversation.dart';
import 'chats_mock_data.dart';

/// 消息列表共享状态：供消息页与底部导航未读角标共用。
///
/// - 加入小组 → 写入会话
/// - 退出小组 → 不删会话（仅改成员身份）
/// - 左滑删除会话 → 不退出小组
/// - 打开 / 发送私聊 → 写入或刷新私聊会话
class ChatsListController extends ChangeNotifier {
  ChatsListController() {
    _conversations.addAll(ChatsMockData.conversations);
  }

  final List<ChatConversation> _conversations = [];
  final List<String> _pinnedIds = [];
  final Set<String> _joinedGroupIds = {};

  List<ChatConversation> get conversations => List.unmodifiable(_conversations);

  List<String> get pinnedIds => List.unmodifiable(_pinnedIds);

  /// 当前仍在组内的小组 id（与会话是否存在无关）。
  Set<String> get joinedGroupIds => Set.unmodifiable(_joinedGroupIds);

  bool isGroupJoined(String groupId) => _joinedGroupIds.contains(groupId);

  /// 所有会话未读数之和，供底部导航角标使用。
  int get totalUnread =>
      _conversations.fold(0, (sum, c) => sum + c.unreadCount);

  /// 置顶区在前，其余按自然顺序。
  List<ChatConversation> get visibleConversations {
    final byId = {for (final c in _conversations) c.id: c};
    final pinned = <ChatConversation>[];
    for (final id in _pinnedIds) {
      final item = byId[id];
      if (item != null) pinned.add(item.copyWith(isPinned: true));
    }
    final pinnedSet = _pinnedIds.toSet();
    final unpinned = _conversations
        .where((c) => !pinnedSet.contains(c.id))
        .map((c) => c.copyWith(isPinned: false))
        .toList();
    return [...pinned, ...unpinned];
  }

  void togglePin(String id) {
    if (_pinnedIds.contains(id)) {
      _pinnedIds.remove(id);
    } else {
      _pinnedIds.insert(0, id);
    }
    notifyListeners();
  }

  /// 仅删除会话，不影响小组加入状态。
  /// 之后该会话若有新消息，会通过 [onNewMessage] 重新出现。
  void delete(String id) {
    _conversations.removeWhere((c) => c.id == id);
    _pinnedIds.remove(id);
    notifyListeners();
  }

  /// 加入小组：记录成员身份，并确保消息列表有该会话。
  void joinGroup(PopularGroupItem group) {
    _joinedGroupIds.add(group.id);
    _upsertConversation(group);
    notifyListeners();
  }

  /// 退出小组：只改成员身份，保留消息列表会话。
  void leaveGroup(String groupId) {
    if (!_joinedGroupIds.remove(groupId)) return;
    notifyListeners();
  }

  /// 写入 / 刷新小组会话展示信息（不改变加入状态）。
  void upsertJoinedGroup(PopularGroupItem group) {
    _upsertConversation(group);
    notifyListeners();
  }

  /// 打开私聊：确保消息列表中有该会话（不增加未读）。
  void upsertPrivateChat(ChatConversation conversation) {
    final dm = conversation.copyWith(
      badge: conversation.badge == ChatBadgeType.group
          ? ChatBadgeType.none
          : conversation.badge,
    );
    final index = _conversations.indexWhere((c) => c.id == dm.id);
    if (index >= 0) {
      final prev = _conversations[index];
      _conversations[index] = dm.copyWith(
        unreadCount: prev.unreadCount,
        isPinned: prev.isPinned,
        lastMessage: dm.lastMessage.isNotEmpty
            ? dm.lastMessage
            : prev.lastMessage,
        timeLabel: dm.lastMessage.isNotEmpty ? dm.timeLabel : prev.timeLabel,
      );
    } else {
      _conversations.insert(0, dm);
    }
    notifyListeners();
  }

  /// 会话产生新消息：更新摘要并置顶；若曾被左滑删除则重新显示。
  void onNewMessage({
    required String id,
    required String title,
    required String avatarAsset,
    required String lastMessage,
    ChatBadgeType badge = ChatBadgeType.none,
    int unreadDelta = 0,
    bool? isMale,
    String? signature,
    String? zodiac,
    bool? isFollowing,
    List<String>? momentAssets,
  }) {
    final index = _conversations.indexWhere((c) => c.id == id);
    if (index >= 0) {
      final prev = _conversations.removeAt(index);
      _conversations.insert(
        0,
        prev.copyWith(
          title: title,
          avatarAsset: avatarAsset,
          lastMessage: lastMessage,
          timeLabel: 'Just',
          badge: badge,
          unreadCount: prev.unreadCount + unreadDelta,
          isMale: isMale,
          signature: signature,
          zodiac: zodiac,
          isFollowing: isFollowing,
          momentAssets: momentAssets,
        ),
      );
    } else {
      _conversations.insert(
        0,
        ChatConversation(
          id: id,
          title: title,
          avatarAsset: avatarAsset,
          lastMessage: lastMessage,
          timeLabel: 'Just',
          badge: badge,
          unreadCount: unreadDelta,
          isMale: isMale ?? true,
          signature: signature ?? '',
          zodiac: zodiac ?? 'Capricorn',
          isFollowing: isFollowing ?? false,
          momentAssets: momentAssets ?? const [],
        ),
      );
    }
    notifyListeners();
  }

  void _upsertConversation(PopularGroupItem group) {
    final next = ChatConversation(
      id: group.id,
      title: group.name,
      avatarAsset: group.avatarAsset,
      lastMessage: group.description,
      timeLabel: 'Just',
      badge: ChatBadgeType.group,
    );
    final index = _conversations.indexWhere((c) => c.id == group.id);
    if (index >= 0) {
      final prev = _conversations[index];
      _conversations[index] = next.copyWith(
        unreadCount: prev.unreadCount,
        isPinned: prev.isPinned,
      );
    } else {
      _conversations.insert(0, next);
    }
  }
}
