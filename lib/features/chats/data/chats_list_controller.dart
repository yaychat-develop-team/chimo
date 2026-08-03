import 'package:flutter/material.dart';

import '../../../core/network/group_dto.dart';
import '../../../core/network/network_bootstrap.dart';
import '../../../core/repositories/repositories.dart';
import '../../../shared/models/chat_conversation.dart';
import '../../../shared/models/group_item.dart';
import '../../friends/data/friend_dto.dart';
import '../../friends/models/friend_user.dart';

/// Shared chats list state for chats page and nav unread badge.
///
/// Session list comes from backend groups + friends (no IM SDK yet).
/// Join / leave / pin / delete still work locally on top of that.
class ChatsListController extends ChangeNotifier {
  ChatsListController({ChatRepository? chatRepository})
      : _chatRepository = chatRepository;

  final ChatRepository? _chatRepository;

  final List<ChatConversation> _conversations = [];
  final List<String> _pinnedIds = [];
  final Set<String> _joinedGroupIds = {};
  bool _loading = false;
  String? _loadError;

  bool get loading => _loading;
  String? get loadError => _loadError;

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

  /// Load my groups + friends from API and rebuild list (keeps pin/unread).
  Future<void> refreshFromApi() async {
    _loading = true;
    _loadError = null;
    notifyListeners();
    try {
      final api = NetworkBootstrap.api;
      final results = await Future.wait([
        api.myGroups(),
        api.searchFriends(pageSize: 50),
      ]);
      final groups = GroupDto.parseList(results[0]);
      final friends = FriendDto.parseList(
        results[1],
        relation: FriendRelation.mutual,
      );

      final prevById = {for (final c in _conversations) c.id: c};
      final next = <ChatConversation>[];
      final nextJoined = <String>{};

      for (final g in groups) {
        nextJoined.add(g.id);
        final prev = prevById[g.id];
        next.add(
          ChatConversation(
            id: g.id,
            title: g.name,
            avatarAsset: g.avatarAsset,
            avatarUrl: g.avatarUrl,
            lastMessage: g.description.isEmpty ? 'Group chat' : g.description,
            timeLabel: prev?.timeLabel ?? 'Just',
            badge: ChatBadgeType.group,
            unreadCount: prev?.unreadCount ?? 0,
            isPinned: prev?.isPinned ?? false,
          ),
        );
      }

      for (final f in friends) {
        final id = 'dm_${f.id}';
        final prev = prevById[id] ?? prevById[f.id];
        next.add(
          ChatConversation(
            id: id,
            title: f.nickname.isEmpty ? 'User' : f.nickname,
            avatarAsset: f.avatarAsset,
            avatarUrl: f.avatarUrl,
            lastMessage: f.bio.isEmpty ? 'Say hi~' : f.bio,
            timeLabel: prev?.timeLabel ?? 'Just',
            unreadCount: prev?.unreadCount ?? 0,
            isPinned: prev?.isPinned ?? false,
            isMale: f.isMale,
            signature: f.bio,
            zodiac: f.zodiac,
            isFollowing: true,
            isOnline: false,
          ),
        );
      }

      // Keep any local-only rows (e.g. system) that were pinned/opened.
      for (final c in _conversations) {
        if (next.any((n) => n.id == c.id)) continue;
        if (c.badge == ChatBadgeType.group) continue;
        if (c.id.startsWith('dm_')) continue;
        next.add(c);
      }

      _conversations
        ..clear()
        ..addAll(next);
      _joinedGroupIds
        ..clear()
        ..addAll(nextJoined);
      _loading = false;
      if (!results[0].success && !results[1].success && next.isEmpty) {
        _loadError = results[0].message.isNotEmpty
            ? results[0].message
            : 'Failed to load chats';
      }
      notifyListeners();
    } catch (error) {
      _loading = false;
      _loadError = '$error';
      // Optional one-time mock seed if completely empty and repo provided.
      if (_conversations.isEmpty && _chatRepository != null) {
        _conversations.addAll(_chatRepository.seedConversations());
      }
      notifyListeners();
    }
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
  void delete(String id) {
    _conversations.removeWhere((c) => c.id == id);
    _pinnedIds.remove(id);
    notifyListeners();
  }

  void markRead(String id) {
    final index = _conversations.indexWhere((c) => c.id == id);
    if (index < 0) return;
    final prev = _conversations[index];
    if (prev.unreadCount == 0) return;
    _conversations[index] = prev.copyWith(unreadCount: 0);
    notifyListeners();
  }

  void joinGroup(PopularGroupItem group) {
    _joinedGroupIds.add(group.id);
    _upsertConversation(group);
    notifyListeners();
  }

  void leaveGroup(String groupId) {
    _joinedGroupIds.remove(groupId);
    notifyListeners();
  }

  void upsertJoinedGroup(PopularGroupItem group) {
    _upsertConversation(group);
    notifyListeners();
  }

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
        avatarUrl: dm.avatarUrl ?? prev.avatarUrl,
      );
    } else {
      _conversations.insert(0, dm);
    }
    notifyListeners();
  }

  void onNewMessage({
    required String id,
    required String title,
    required String avatarAsset,
    required String lastMessage,
    String? avatarUrl,
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
          avatarUrl: avatarUrl,
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
          avatarUrl: avatarUrl,
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
      avatarUrl: group.avatarUrl,
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
