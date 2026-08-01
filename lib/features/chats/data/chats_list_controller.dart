import 'package:flutter/material.dart';

import '../../../core/repositories/mock_chat_repository.dart';
import '../../../core/repositories/repositories.dart';
import '../../../shared/models/chat_conversation.dart';
import '../../../shared/models/group_item.dart';

/// Shared chats list state for chats page and nav unread badge.
///
/// - Join group → upsert conversation
/// - Leave group → keep conversation (membership only)
/// - Swipe-delete conversation → does not leave group
/// - Open/send DM → upsert private chat
class ChatsListController extends ChangeNotifier {
  ChatsListController({ChatRepository? chatRepository})
      : _chatRepository = chatRepository ?? MockChatRepository() {
    _conversations.addAll(_chatRepository.seedConversations());
  }

  final ChatRepository _chatRepository;

  final List<ChatConversation> _conversations = [];
  final List<String> _pinnedIds = [];
  final Set<String> _joinedGroupIds = {};

  List<ChatConversation> get conversations => List.unmodifiable(_conversations);

  List<String> get pinnedIds => List.unmodifiable(_pinnedIds);

  /// Group ids still joined (independent of conversation row).
  Set<String> get joinedGroupIds => Set.unmodifiable(_joinedGroupIds);

  bool isGroupJoined(String groupId) => _joinedGroupIds.contains(groupId);

  /// Sum of unread counts for bottom nav badge.
  int get totalUnread =>
      _conversations.fold(0, (sum, c) => sum + c.unreadCount);

  /// Pinned first, then natural order.
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

  /// Remove conversation only; group join state unchanged.
  /// Reappears via [onNewMessage] if new messages arrive.
  void delete(String id) {
    _conversations.removeWhere((c) => c.id == id);
    _pinnedIds.remove(id);
    notifyListeners();
  }

  /// Clear unread when the user opens a conversation.
  void markRead(String id) {
    final index = _conversations.indexWhere((c) => c.id == id);
    if (index < 0) return;
    final prev = _conversations[index];
    if (prev.unreadCount == 0) return;
    _conversations[index] = prev.copyWith(unreadCount: 0);
    notifyListeners();
  }

  /// Join group: record membership and ensure list row exists.
  void joinGroup(PopularGroupItem group) {
    _joinedGroupIds.add(group.id);
    _upsertConversation(group);
    notifyListeners();
  }

  /// Leave group: update membership only; keep list row.
  void leaveGroup(String groupId) {
    if (!_joinedGroupIds.remove(groupId)) return;
    notifyListeners();
  }

  /// Upsert group row display (does not change join state).
  void upsertJoinedGroup(PopularGroupItem group) {
    _upsertConversation(group);
    notifyListeners();
  }

  /// Open DM: ensure row exists (no unread bump).
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

  /// New message: update preview, move to top; restore if swipe-deleted.
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
