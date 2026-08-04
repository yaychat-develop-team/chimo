import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../../core/constants/app_assets.dart';
import '../../../core/im/im_service.dart';
import '../../../core/network/group_dto.dart';
import '../../../core/network/network_bootstrap.dart';
import '../../../core/repositories/repositories.dart';
import '../../../shared/models/chat_conversation.dart';
import '../../../shared/models/group_item.dart';

/// Shared chats list state for chats page and nav unread badge.
///
/// Session rows for groups come from `GET /chat/group/myGroups`.
/// Last-message previews need IM (EaseMob); until then we show member count /
/// group desc as subtitle, and keep any local previews from this device.
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

  /// Load my groups from API and rebuild list (keeps pin/unread/local previews).
  Future<void> refreshFromApi() async {
    _loading = true;
    _loadError = null;
    notifyListeners();
    try {
      final groupsRes = await NetworkBootstrap.api.myGroups();
      final groups = GroupDto.parseList(groupsRes);

      final prevById = {for (final c in _conversations) c.id: c};
      final next = <ChatConversation>[];
      final nextJoined = <String>{};

      for (final g in groups) {
        nextJoined.add(g.id);
        final prev = prevById[g.id];
        next.add(_conversationFromGroup(g, prev));
      }

      // Keep non-group rows started in-app (real DMs / system), not bulk friends.
      for (final c in _conversations) {
        if (c.badge == ChatBadgeType.group) continue;
        if (next.any((n) => n.id == c.id)) continue;
        next.add(c);
      }

      // If API myGroups is empty but we locally joined, keep those rows and
      // re-pull detail so the list still reflects server group cards.
      for (final id in _joinedGroupIds) {
        if (nextJoined.contains(id)) continue;
        final prev = prevById[id];
        if (prev == null || prev.badge != ChatBadgeType.group) continue;
        final detail = await _fetchGroupDetail(id);
        if (detail != null) {
          nextJoined.add(detail.id);
          next.add(_conversationFromGroup(detail, prev));
        } else {
          nextJoined.add(id);
          next.add(prev);
        }
      }

      _conversations
        ..clear()
        ..addAll(next);
      _joinedGroupIds
        ..clear()
        ..addAll(nextJoined);
      await _mergeImDmConversations();
      _loading = false;
      if (!groupsRes.success && next.isEmpty) {
        _loadError = groupsRes.message.isEmpty
            ? 'Failed to load chats'
            : groupsRes.message;
      }
      notifyListeners();
    } catch (error) {
      _loading = false;
      _loadError = '$error';
      if (_conversations.isEmpty && _chatRepository != null) {
        _conversations.addAll(_chatRepository.seedConversations());
      }
      notifyListeners();
    }
  }

  Future<void> _mergeImDmConversations() async {
    try {
      if (!ImService.isConnected) {
        await ImService.connectFromServer();
      }
      final dms = await ImService.loadDmConversations();
      for (final conv in dms) {
        final emId = conv.id;
        if (emId.isEmpty) continue;
        final listId = 'dm_$emId';
        final preview = await ImService.previewFor(conv);
        final unread = await conv.unreadCount();
        // Prefer existing row by emUserName or id.
        final index = _conversations.indexWhere(
          (c) =>
              c.emUserName == emId ||
              c.id == listId ||
              c.id == 'dm_$emId',
        );
        if (index >= 0) {
          final prev = _conversations[index];
          _conversations[index] = prev.copyWith(
            lastMessage:
                preview.isNotEmpty ? preview : prev.lastMessage,
            timeLabel: preview.isNotEmpty ? 'Just' : prev.timeLabel,
            unreadCount: unread,
            emUserName: emId,
          );
          continue;
        }
        // Resolve profile via msg-user for nickname/avatar.
        String title = emId;
        String? avatarUrl;
        try {
          final res = await NetworkBootstrap.api.msgUser(emId);
          if (res.success && res.data is Map) {
            final data = Map<String, dynamic>.from(res.data as Map);
            final user = data['user'] is Map
                ? Map<String, dynamic>.from(data['user'] as Map)
                : data;
            final nick =
                '${user['nickname'] ?? user['nickName'] ?? ''}'.trim();
            if (nick.isNotEmpty) title = nick;
            final av = '${user['avatar'] ?? ''}'.trim();
            if (av.isNotEmpty) avatarUrl = av;
          }
        } catch (_) {}
        _conversations.insert(
          0,
          ChatConversation(
            id: listId,
            title: title,
            avatarAsset: AppAssets.avatarPlace,
            avatarUrl: avatarUrl,
            lastMessage: preview,
            timeLabel: preview.isEmpty ? '' : 'Just',
            unreadCount: unread,
            emUserName: emId,
          ),
        );
      }
    } catch (error) {
      debugPrint('ChatsListController IM merge: $error');
    }
  }

  Future<PopularGroupItem?> _fetchGroupDetail(String gid) async {
    try {
      final res = await NetworkBootstrap.api.groupDetail(gid);
      if (!res.success) return null;
      final data = res.data;
      if (data is Map) {
        // Some envelopes nest under group.
        final nested = data['group'];
        if (nested is Map) {
          return GroupDto.fromMap(Map<String, dynamic>.from(nested));
        }
        final list = GroupDto.parseData(data);
        if (list.isNotEmpty) return list.first;
        if (data.containsKey('name') || data.containsKey('emGroupId')) {
          return GroupDto.fromMap(Map<String, dynamic>.from(data));
        }
      }
    } catch (_) {}
    return null;
  }

  ChatConversation _conversationFromGroup(
    PopularGroupItem g,
    ChatConversation? prev,
  ) {
    final hadLocalPreview =
        prev != null && prev.lastMessage.trim().isNotEmpty;
    return ChatConversation(
      id: g.id,
      title: g.name.isEmpty ? 'Group' : g.name,
      avatarAsset: g.avatarAsset,
      avatarUrl: g.avatarUrl,
      // Only keep real previews written by onNewMessage / IM later.
      lastMessage: hadLocalPreview ? prev.lastMessage : '',
      timeLabel: hadLocalPreview
          ? (prev.timeLabel.isEmpty ? 'Just' : prev.timeLabel)
          : '',
      badge: ChatBadgeType.group,
      unreadCount: prev?.unreadCount ?? 0,
      isPinned: prev?.isPinned ?? false,
      groupDescription: g.description,
      category: g.category,
      memberCount: g.memberCount,
      postCount: g.postCount,
      level: g.level,
    );
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
    // Sync list fields from server detail when available.
    unawaited(_syncJoinedGroup(group.id));
  }

  Future<void> _syncJoinedGroup(String id) async {
    final detail = await _fetchGroupDetail(id);
    if (detail == null) return;
    _joinedGroupIds.add(detail.id);
    _upsertConversation(detail.copyWith(isJoined: true));
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
        emUserName: dm.emUserName.isNotEmpty ? dm.emUserName : prev.emUserName,
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
    String? groupDescription,
    String? category,
    int? memberCount,
    int? postCount,
    int? level,
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
          groupDescription: groupDescription,
          category: category,
          memberCount: memberCount,
          postCount: postCount,
          level: level,
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
          groupDescription: groupDescription ?? '',
          category: category ?? '',
          memberCount: memberCount ?? 0,
          postCount: postCount ?? 0,
          level: level ?? 1,
        ),
      );
    }
    notifyListeners();
  }

  void _upsertConversation(PopularGroupItem group) {
    final index = _conversations.indexWhere((c) => c.id == group.id);
    final prev = index >= 0 ? _conversations[index] : null;
    final next = _conversationFromGroup(group, prev);
    if (index >= 0) {
      _conversations[index] = next;
    } else {
      _conversations.insert(0, next);
    }
  }
}
