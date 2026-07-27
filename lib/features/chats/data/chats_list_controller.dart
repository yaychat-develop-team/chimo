import 'package:flutter/material.dart';

import '../models/chat_conversation.dart';
import 'chats_mock_data.dart';

/// 消息列表共享状态：供消息页与底部导航未读角标共用。
class ChatsListController extends ChangeNotifier {
  ChatsListController() {
    _conversations = List.of(ChatsMockData.conversations);
  }

  late List<ChatConversation> _conversations;
  final List<String> _pinnedIds = [];

  List<ChatConversation> get conversations =>
      List.unmodifiable(_conversations);

  List<String> get pinnedIds => List.unmodifiable(_pinnedIds);

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

  void delete(String id) {
    _conversations.removeWhere((c) => c.id == id);
    _pinnedIds.remove(id);
    notifyListeners();
  }
}
