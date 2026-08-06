import 'dart:async';

import 'package:flutter/material.dart';
import 'package:im_flutter_sdk/im_flutter_sdk.dart';

import '../../../core/constants/app_assets.dart';
import '../../../core/im/im_service.dart';
import '../../../core/im/im_system_accounts.dart';
import '../../../core/network/app_apis.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/utils/chat_time_label.dart';
import '../../../shared/models/chat_conversation.dart';
import '../../../shared/models/group_item.dart';

/// Shared chats list state for chats page and nav unread badge.
///
/// Session rows for groups come from `GET /chat/group/myGroups`.
/// Last-message previews need IM (EaseMob); until then we show member count /
/// group desc as subtitle, and keep any local previews from this device.
///
/// Listens to [ImService.messages] so previews / unread update without pull
/// refresh (forya ConversationController pattern).
class ChatsListController extends ChangeNotifier {
  ChatsListController() {
    _imSub = ImService.messages.listen(_onImMessage);
  }

  final List<ChatConversation> _conversations = [];
  final List<String> _pinnedIds = [];
  final Set<String> _joinedGroupIds = {};
  /// Swipe-deleted rows; survive API/IM refresh until a new message restores them.
  final Set<String> _hiddenIds = {};
  /// Open chat/group detail key (list id or EM id) — no unread bump while viewing.
  String? _activeConversationKey;
  StreamSubscription<ImChatMessage>? _imSub;
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

  /// Pinned first, then by latest message time (desc).
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
        .toList()
      ..sort((a, b) => b.lastMsgAtMs.compareTo(a.lastMsgAtMs));
    return [...pinned, ...unpinned];
  }

  /// Load my groups from API and rebuild list (keeps pin/unread/local previews).
  Future<void> refreshFromApi() async {
    _loading = true;
    _loadError = null;
    notifyListeners();
    try {
      final groupsRes = await AppApis.group.myGroups();
      final groups = groupsRes.data ?? const [];

      final prevById = {for (final c in _conversations) c.id: c};
      final next = <ChatConversation>[];
      final nextJoined = <String>{};

      for (final g in groups) {
        nextJoined.add(g.id);
        if (_isHidden(g.id)) continue;
        final prev = prevById[g.id];
        next.add(_conversationFromGroup(g, prev));
      }

      // Keep non-group rows started in-app (real DMs / system), not bulk friends.
      for (final c in _conversations) {
        if (c.badge == ChatBadgeType.group) continue;
        if (_isHidden(c.id, c.emUserName)) continue;
        if (next.any((n) => n.id == c.id)) continue;
        next.add(c);
      }

      // If API myGroups is empty but we locally joined, keep those rows and
      // re-pull detail so the list still reflects server group cards.
      for (final id in _joinedGroupIds) {
        if (nextJoined.contains(id)) continue;
        if (_isHidden(id)) continue;
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
      await _mergeImConversations();
      _loading = false;
      if (!groupsRes.ok && next.isEmpty) {
        _loadError = groupsRes.message.isEmpty
            ? 'Failed to load chats'
            : groupsRes.message;
      }
      notifyListeners();
    } catch (error) {
      _loading = false;
      _loadError = '$error';
      notifyListeners();
    }
  }

  Future<void> _mergeImConversations() async {
    try {
      if (!ImService.isConnected) {
        await ImService.connectFromServer();
      }
      final all = await ImService.loadListConversations();
      for (final conv in all) {
        final emId = conv.id;
        if (emId.isEmpty) continue;

        final preview = await ImService.previewFor(conv);
        final unread = await conv.unreadCount();
        final atMs = await ImService.latestTimeMs(conv);
        final timeLabel = ChatTimeLabel.forList(atMs);

        if (conv.type == EMConversationType.GroupChat) {
          if (_isHidden(emId)) continue;
          final index = _conversations.indexWhere(
            (c) =>
                c.badge == ChatBadgeType.group &&
                (c.id == emId || c.emUserName == emId),
          );
          if (index < 0) continue;
          final prev = _conversations[index];
          _conversations[index] = prev.copyWith(
            lastMessage:
                preview.isNotEmpty ? preview : prev.lastMessage,
            timeLabel: timeLabel.isNotEmpty ? timeLabel : prev.timeLabel,
            unreadCount: unread,
            lastMsgAtMs: atMs > 0 ? atMs : prev.lastMsgAtMs,
            emUserName: emId,
          );
          continue;
        }

        // —— Chat (DM / system) ——
        final isSystem = ImSystemAccounts.isSystemAccount(emId);
        final listId = isSystem ? 'sys_$emId' : 'dm_$emId';
        if (_isHidden(listId, emId)) continue;

        final index = _conversations.indexWhere(
          (c) =>
              c.emUserName == emId ||
              c.id == listId ||
              c.id == 'dm_$emId' ||
              c.id == 'sys_$emId' ||
              c.id == emId,
        );
        if (index >= 0) {
          final prev = _conversations[index];
          _conversations[index] = prev.copyWith(
            title: isSystem
                ? ImSystemAccounts.displayName(emId)
                : prev.title,
            avatarAsset: isSystem
                ? ImSystemAccounts.avatarAsset(emId)
                : prev.avatarAsset,
            avatarUrl: isSystem ? null : prev.avatarUrl,
            lastMessage:
                preview.isNotEmpty ? preview : prev.lastMessage,
            timeLabel: timeLabel.isNotEmpty ? timeLabel : prev.timeLabel,
            unreadCount: unread,
            emUserName: emId,
            lastMsgAtMs: atMs > 0 ? atMs : prev.lastMsgAtMs,
            isSystem: isSystem || prev.isSystem,
            titleColor: isSystem ? AppColors.primaryBright : prev.titleColor,
          );
          continue;
        }

        String title = emId;
        String avatarAsset = AppAssets.avatarPlace;
        String? avatarUrl;
        Color? titleColor;

        if (isSystem) {
          title = ImSystemAccounts.displayName(emId);
          avatarAsset = ImSystemAccounts.avatarAsset(emId);
          titleColor = AppColors.primaryBright;
        } else {
          try {
            final res = await AppApis.relation.msgUser(emId);
            final brief = res.data;
            if (res.ok && brief != null) {
              if (brief.nickname.isNotEmpty) title = brief.nickname;
              if (brief.avatarUrl.isNotEmpty) avatarUrl = brief.avatarUrl;
            }
          } catch (_) {}
        }

        _conversations.insert(
          0,
          ChatConversation(
            id: listId,
            title: title,
            avatarAsset: avatarAsset,
            avatarUrl: avatarUrl,
            lastMessage: preview,
            timeLabel: timeLabel,
            unreadCount: unread,
            emUserName: emId,
            lastMsgAtMs: atMs,
            isSystem: isSystem,
            titleColor: titleColor,
          ),
        );
      }
    } catch (error) {
      debugPrint('ChatsListController IM merge: $error');
    }
  }

  Future<PopularGroupItem?> _fetchGroupDetail(String gid) async {
    try {
      final res = await AppApis.group.detail(gid);
      if (!res.ok) return null;
      return res.data;
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
  ///
  /// Persists hide across refresh (myGroups / IM merge). New messages restore
  /// the row via [onNewMessage] / [upsertPrivateChat]. Also deletes EaseMob
  /// local+remote session like forya `removeItem`.
  void delete(String id) {
    final index = _conversations.indexWhere((c) => c.id == id);
    ChatConversation? removed;
    if (index >= 0) {
      removed = _conversations.removeAt(index);
    }
    _pinnedIds.remove(id);
    _hide(id, emUserName: removed?.emUserName);
    if (removed != null) {
      unawaited(_deleteImConversation(removed));
    }
    notifyListeners();
  }

  bool _isHidden(String id, [String? emUserName]) {
    if (_hiddenIds.contains(id)) return true;
    if (emUserName != null &&
        emUserName.isNotEmpty &&
        _hiddenIds.contains(emUserName)) {
      return true;
    }
    return false;
  }

  void _hide(String id, {String? emUserName}) {
    if (id.isNotEmpty) _hiddenIds.add(id);
    final em = (emUserName ?? '').trim();
    if (em.isEmpty) return;
    _hiddenIds.add(em);
    _hiddenIds.add('dm_$em');
    _hiddenIds.add('sys_$em');
  }

  void _unhide(String id, {String? emUserName}) {
    _hiddenIds.remove(id);
    final em = (emUserName ?? '').trim();
    if (em.isEmpty) {
      if (id.startsWith('dm_')) _hiddenIds.remove(id.substring(3));
      if (id.startsWith('sys_')) _hiddenIds.remove(id.substring(4));
      return;
    }
    _hiddenIds.remove(em);
    _hiddenIds.remove('dm_$em');
    _hiddenIds.remove('sys_$em');
  }

  Future<void> _deleteImConversation(ChatConversation c) async {
    final emId = c.emUserName.isNotEmpty
        ? c.emUserName
        : c.id.startsWith('dm_')
            ? c.id.substring(3)
            : c.id.startsWith('sys_')
                ? c.id.substring(4)
                : c.badge == ChatBadgeType.group
                    ? c.id
                    : '';
    if (emId.isEmpty) return;
    await ImService.deleteConversation(
      emId,
      isGroup: c.badge == ChatBadgeType.group,
    );
  }

  void markRead(String id) {
    final index = _conversations.indexWhere((c) => c.id == id);
    if (index < 0) return;
    final prev = _conversations[index];
    if (prev.unreadCount != 0) {
      _conversations[index] = prev.copyWith(unreadCount: 0);
      notifyListeners();
    }
    // Persist to EaseMob so restart does not restore the badge.
    final emId = prev.emUserName.isNotEmpty
        ? prev.emUserName
        : prev.id.startsWith('dm_')
            ? prev.id.substring(3)
            : prev.id.startsWith('sys_')
                ? prev.id.substring(4)
                : prev.badge == ChatBadgeType.group
                    ? prev.id
                    : '';
    if (emId.isNotEmpty) {
      unawaited(
        ImService.markConversationRead(
          emId,
          isGroup: prev.badge == ChatBadgeType.group,
        ),
      );
    }
  }

  void joinGroup(PopularGroupItem group) {
    _joinedGroupIds.add(group.id);
    _unhide(group.id);
    _upsertConversation(group);
    notifyListeners();
    // Sync list fields from server detail when available.
    unawaited(_syncJoinedGroup(group.id));
  }

  Future<void> _syncJoinedGroup(String id) async {
    final detail = await _fetchGroupDetail(id);
    if (detail == null) return;
    _joinedGroupIds.add(detail.id);
    if (_isHidden(detail.id)) return;
    _upsertConversation(detail.copyWith(isJoined: true));
    notifyListeners();
  }

  void leaveGroup(String groupId) {
    _joinedGroupIds.remove(groupId);
    notifyListeners();
  }

  void upsertJoinedGroup(PopularGroupItem group) {
    _joinedGroupIds.add(group.id);
    if (_isHidden(group.id)) {
      notifyListeners();
      return;
    }
    _upsertConversation(group);
    notifyListeners();
  }

  void upsertPrivateChat(ChatConversation conversation) {
    final dm = conversation.copyWith(
      badge: conversation.badge == ChatBadgeType.group
          ? ChatBadgeType.none
          : conversation.badge,
    );
    _unhide(dm.id, emUserName: dm.emUserName);
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
    String? emUserName,
    bool? isSystem,
    Color? titleColor,
  }) {
    _unhide(id, emUserName: emUserName);
    final nowMs = DateTime.now().millisecondsSinceEpoch;
    final timeLabel = ChatTimeLabel.forList(nowMs);
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
          timeLabel: timeLabel,
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
          lastMsgAtMs: nowMs,
          emUserName: (emUserName != null && emUserName.isNotEmpty)
              ? emUserName
              : prev.emUserName,
          isSystem: isSystem ?? prev.isSystem,
          titleColor: titleColor ?? prev.titleColor,
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
          timeLabel: timeLabel,
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
          lastMsgAtMs: nowMs,
          emUserName: emUserName ?? '',
          isSystem: isSystem ?? false,
          titleColor: titleColor,
        ),
      );
    }
    notifyListeners();
  }

  /// Mark which conversation is open so realtime pushes don't bump unread.
  void setActiveConversation(String? idOrEm) {
    final key = idOrEm?.trim();
    _activeConversationKey = (key == null || key.isEmpty) ? null : key;
  }

  void _onImMessage(ImChatMessage m) {
    if (m.msgType == 'follow') return;
    final emId = m.conversationId.trim();
    if (emId.isEmpty) return;

    final preview = m.text.trim().isEmpty ? '[Message]' : m.text;
    final viewing = _isViewingConversation(emId);
    final unreadDelta = (m.isSelf || viewing) ? 0 : 1;

    final existing = _findByEmOrListId(emId);
    if (existing != null) {
      onNewMessage(
        id: existing.id,
        title: existing.title,
        avatarAsset: existing.avatarAsset,
        avatarUrl: existing.avatarUrl,
        lastMessage: preview,
        badge: existing.badge,
        unreadDelta: unreadDelta,
        isMale: existing.isMale,
        signature: existing.signature,
        zodiac: existing.zodiac,
        isFollowing: existing.isFollowing,
        momentAssets: existing.momentAssets,
        groupDescription: existing.groupDescription,
        category: existing.category,
        memberCount: existing.memberCount,
        postCount: existing.postCount,
        level: existing.level,
        emUserName: existing.emUserName.isNotEmpty ? existing.emUserName : emId,
        isSystem: existing.isSystem,
        titleColor: existing.titleColor,
      );
      if (viewing && !m.isSelf) {
        markRead(existing.id);
      }
      return;
    }

    final isGroup = m.isGroup || _joinedGroupIds.contains(emId);
    if (isGroup) {
      // Don't surface groups we never joined (local IM ghosts).
      if (!_joinedGroupIds.contains(emId) && !_isHidden(emId)) return;
      onNewMessage(
        id: emId,
        title: 'Group',
        avatarAsset: AppAssets.avatarPlace,
        lastMessage: preview,
        badge: ChatBadgeType.group,
        unreadDelta: unreadDelta,
        emUserName: emId,
      );
      unawaited(_enrichHiddenOrNewGroup(emId));
      return;
    }

    final isSystem = ImSystemAccounts.isSystemAccount(emId);
    final listId = isSystem ? 'sys_$emId' : 'dm_$emId';
    if (isSystem) {
      onNewMessage(
        id: listId,
        title: ImSystemAccounts.displayName(emId),
        avatarAsset: ImSystemAccounts.avatarAsset(emId),
        lastMessage: preview,
        unreadDelta: unreadDelta,
        emUserName: emId,
        isSystem: true,
        titleColor: AppColors.primaryBright,
      );
      return;
    }

    onNewMessage(
      id: listId,
      title: emId,
      avatarAsset: AppAssets.avatarPlace,
      lastMessage: preview,
      unreadDelta: unreadDelta,
      emUserName: emId,
    );
    unawaited(_enrichDmProfile(listId, emId));
  }

  bool _isViewingConversation(String emId) {
    final active = _activeConversationKey;
    if (active == null || active.isEmpty) return false;
    if (active == emId) return true;
    if (active == 'dm_$emId' || active == 'sys_$emId') return true;
    final existing = _findByEmOrListId(emId);
    return existing != null && existing.id == active;
  }

  ChatConversation? _findByEmOrListId(String emId) {
    final index = _conversations.indexWhere(
      (c) =>
          c.emUserName == emId ||
          c.id == emId ||
          c.id == 'dm_$emId' ||
          c.id == 'sys_$emId',
    );
    if (index < 0) return null;
    return _conversations[index];
  }

  Future<void> _enrichDmProfile(String listId, String emId) async {
    try {
      final res = await AppApis.relation.msgUser(emId);
      final brief = res.data;
      if (!res.ok || brief == null) return;
      final index = _conversations.indexWhere((c) => c.id == listId);
      if (index < 0) return;
      final prev = _conversations[index];
      _conversations[index] = prev.copyWith(
        title: brief.nickname.isNotEmpty ? brief.nickname : prev.title,
        avatarUrl:
            brief.avatarUrl.isNotEmpty ? brief.avatarUrl : prev.avatarUrl,
        emUserName: emId,
      );
      notifyListeners();
    } catch (_) {}
  }

  Future<void> _enrichHiddenOrNewGroup(String groupId) async {
    final detail = await _fetchGroupDetail(groupId);
    if (detail == null) return;
    _joinedGroupIds.add(detail.id);
    final index = _conversations.indexWhere((c) => c.id == groupId);
    if (index < 0) return;
    final prev = _conversations[index];
    _conversations[index] = _conversationFromGroup(detail, prev).copyWith(
      lastMessage: prev.lastMessage,
      timeLabel: prev.timeLabel,
      unreadCount: prev.unreadCount,
      lastMsgAtMs: prev.lastMsgAtMs,
      emUserName: groupId,
    );
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

  @override
  void dispose() {
    unawaited(_imSub?.cancel() ?? Future<void>.value());
    _imSub = null;
    super.dispose();
  }
}
