import 'dart:async';

import 'package:flutter/material.dart';
import 'package:im_flutter_sdk/im_flutter_sdk.dart';

import '../../../core/auth/auth_session.dart';
import '../../../core/constants/app_assets.dart';
import '../../../core/im/im_service.dart';
import '../../../core/im/im_system_accounts.dart';
import '../../../core/network/app_apis.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/utils/chat_time_label.dart';
import '../../../shared/models/chat_conversation.dart';
import '../../../shared/models/group_item.dart';

/// 会话页与底部导航未读角标共用的会话列表状态。
///
/// 群组会话行来自 `GET /chat/group/myGroups`。
/// 最近消息预览依赖 IM（环信）；在此之前用成员数 /
/// 群简介作副标题，并保留本机已有本地预览。
///
/// 监听 [ImService.messages]，使预览 / 未读无需下拉
/// 刷新即可更新（forya ConversationController 模式）。
class ChatsListController extends ChangeNotifier {
  ChatsListController() {
    _imSub = ImService.messages.listen(_onImMessage);
    _imConnSub = ImService.connectionChanges.listen((_) {
      unawaited(_onImConnectionChanged());
    });
  }

  final List<ChatConversation> _conversations = [];
  final List<String> _pinnedIds = [];
  final Set<String> _joinedGroupIds = {};
  /// 左滑删除的行；在新消息恢复前，API/IM 刷新后仍保持隐藏。
  final Set<String> _hiddenIds = {};
  /// 当前打开的聊天/群详情 key（列表 id 或环信 id）— 查看中不增加未读。
  String? _activeConversationKey;
  /// 当前列表绑定的业务 uid；换号时整表清空，避免沿用上一账号群聊。
  String? _sessionUserId;
  String? _sessionEmUser;
  StreamSubscription<ImChatMessage>? _imSub;
  StreamSubscription<void>? _imConnSub;
  bool _loading = false;
  String? _loadError;

  bool get loading => _loading;
  String? get loadError => _loadError;

  List<ChatConversation> get conversations => List.unmodifiable(_conversations);

  List<String> get pinnedIds => List.unmodifiable(_pinnedIds);

  /// 仍在加入中的群组 id（与会话行无关）。
  Set<String> get joinedGroupIds => Set.unmodifiable(_joinedGroupIds);

  bool isGroupJoined(String groupId) => _joinedGroupIds.contains(groupId);

  /// 底部导航角标用的未读总数。
  int get totalUnread => _conversations.fold(
        0,
        (sum, c) => _isSuppressedOfficial(c) ? sum : sum + c.unreadCount,
      );

  /// 置顶优先，再按最近消息时间降序。
  List<ChatConversation> get visibleConversations {
    final byId = {for (final c in _conversations) c.id: c};
    final pinned = <ChatConversation>[];
    for (final id in _pinnedIds) {
      final item = byId[id];
      if (item == null || _isSuppressedOfficial(item)) continue;
      pinned.add(item.copyWith(isPinned: true));
    }
    final pinnedSet = _pinnedIds.toSet();
    final unpinned = _conversations
        .where((c) => !pinnedSet.contains(c.id) && !_isSuppressedOfficial(c))
        .map((c) => c.copyWith(isPinned: false))
        .toList()
      ..sort((a, b) => b.lastMsgAtMs.compareTo(a.lastMsgAtMs));
    return [...pinned, ...unpinned];
  }

  bool _isSuppressedOfficial(ChatConversation c) {
    return ImSystemAccounts.isSuppressedOfficialChat(c.id) ||
        ImSystemAccounts.isSuppressedOfficialChat(c.emUserName);
  }

  /// 登出 / 换号时清空内存会话，避免新账号看到上一账号群聊。
  void clearLocalState({bool notify = true}) {
    _conversations.clear();
    _pinnedIds.clear();
    _joinedGroupIds.clear();
    _hiddenIds.clear();
    _activeConversationKey = null;
    _sessionUserId = null;
    _sessionEmUser = null;
    _loading = false;
    _loadError = null;
    if (notify) notifyListeners();
  }

  /// 绑定当前登录用户；uid 变化时清空上一账号残留。
  Future<void> ensureBoundToCurrentUser() async {
    final uid = (await AuthSession.userId())?.trim() ?? '';
    final em = (await AuthSession.emUsername())?.trim() ?? '';
    if (uid == (_sessionUserId ?? '') && em == (_sessionEmUser ?? '')) return;
    clearLocalState(notify: true);
    _sessionUserId = uid.isEmpty ? null : uid;
    _sessionEmUser = em.isEmpty ? null : em;
  }

  Future<void> _onImConnectionChanged() async {
    if (!ImService.isConnected) return;
    final em = (await AuthSession.emUsername())?.trim() ?? '';
    final sdk = (await ImService.sdkUserId())?.trim() ?? '';
    if (em.isEmpty || sdk.isEmpty || em != sdk) return;
    if (_conversations.isEmpty && _joinedGroupIds.isEmpty) {
      await refreshFromApi();
      return;
    }
    await _mergeImConversations();
    notifyListeners();
  }

  /// 从 API 加载我的群组并重建列表（保留置顶/未读/本地预览）。
  Future<void> refreshFromApi() async {
    _loading = true;
    _loadError = null;
    notifyListeners();
    try {
      await ensureBoundToCurrentUser();
      _loading = true;

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

      // 保留应用内发起的非群组行（真实私聊 / 系统），不是批量好友。
      for (final c in _conversations) {
        if (c.badge == ChatBadgeType.group) continue;
        if (_isHidden(c.id, c.emUserName)) continue;
        if (next.any((n) => n.id == c.id)) continue;
        next.add(c);
      }

      // 仅当本账号会话内乐观加入、且 API 尚未回写时保留本地群行。
      // 换号后 _joinedGroupIds 已空，不会把上一账号群补回来。
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

      next.removeWhere(_isSuppressedOfficial);
      _conversations
        ..clear()
        ..addAll(next);
      _joinedGroupIds
        ..clear()
        ..addAll(nextJoined);
      await _mergeImConversations();
      _dedupePrivateConversations();
      _dedupeGroupConversations();
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
      final sessionEm = (await AuthSession.emUsername())?.trim() ?? '';
      if (sessionEm.isEmpty) return;
      if (!ImService.isConnected) {
        await ImService.connectFromServer();
      }
      final sdkEm = (await ImService.sdkUserId())?.trim() ?? '';
      if (sdkEm.isEmpty || sdkEm != sessionEm) {
        debugPrint(
          'ChatsListController skip IM merge sdk=$sdkEm session=$sessionEm',
        );
        return;
      }
      final all = await ImService.loadListConversations();
      for (final conv in all) {
        final emId = conv.id;
        if (emId.isEmpty) continue;
        if (ImSystemAccounts.isSuppressedOfficialChat(emId)) continue;

        final preview = await ImService.previewFor(conv);
        final unread = await conv.unreadCount();
        final atMs = await ImService.latestTimeMs(conv);
        final timeLabel = ChatTimeLabel.forList(atMs);

        if (conv.type == EMConversationType.GroupChat &&
            !ImSystemAccounts.isSystemAccount(emId)) {
          if (_isHidden(emId)) continue;
          final index = _indexOfGroup(id: emId, emUserName: emId);
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

        // —— Chat（私聊 / 官方 / 系统）——
        // 官方号即使被标成 GroupChat 也按私聊合并。
        final isOfficial = ImSystemAccounts.isOfficialAccount(emId);
        final isSystem = ImSystemAccounts.isSystemAccount(emId);
        // 官方账号走私聊 id（dm_），其余系统号仍用 sys_。
        final listId = isOfficial
            ? 'dm_$emId'
            : isSystem
                ? 'sys_$emId'
                : 'dm_$emId';
        if (_isHidden(listId, emId)) continue;

        final index = _indexOfPeer(id: listId, emUserName: emId);
        if (index >= 0) {
          final prev = _conversations[index];
          _conversations[index] = prev.copyWith(
            id: listId,
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
            badge: isOfficial ? ChatBadgeType.verified : prev.badge,
            titleColor: isOfficial ? null : (isSystem ? AppColors.primaryBright : prev.titleColor),
            clearTitleColor: isOfficial,
          );
          _collapsePeerDuplicates(index);
          continue;
        }

        String title = emId;
        String avatarAsset = AppAssets.avatarPlace;
        String? avatarUrl;
        Color? titleColor;
        var badge = ChatBadgeType.none;

        if (isSystem) {
          title = ImSystemAccounts.displayName(emId);
          avatarAsset = ImSystemAccounts.avatarAsset(emId);
          if (isOfficial) {
            badge = ChatBadgeType.verified;
          } else {
            titleColor = AppColors.primaryBright;
          }
        } else {
          try {
            final res = await AppApis.relation.msgUser(emId);
            final brief = res.data;
            if (res.ok && brief != null) {
              if (brief.nickname.isNotEmpty) title = brief.nickname;
              if (brief.avatarUrl.isNotEmpty) avatarUrl = brief.avatarUrl;
              // 插入前先吃掉资料页留下的 `dm_<数字uid>` 行。
              final appId = brief.id.trim();
              if (appId.isNotEmpty) {
                final existingIdx = _indexOfPeer(
                  id: 'dm_$appId',
                  emUserName: emId,
                );
                if (existingIdx >= 0) {
                  final prev = _conversations[existingIdx];
                  _conversations[existingIdx] = prev.copyWith(
                    id: listId,
                    title: title.isNotEmpty ? title : prev.title,
                    avatarUrl: avatarUrl ?? prev.avatarUrl,
                    lastMessage:
                        preview.isNotEmpty ? preview : prev.lastMessage,
                    timeLabel:
                        timeLabel.isNotEmpty ? timeLabel : prev.timeLabel,
                    unreadCount: unread > 0 ? unread : prev.unreadCount,
                    emUserName: emId,
                    lastMsgAtMs: atMs > 0 ? atMs : prev.lastMsgAtMs,
                  );
                  _collapsePeerDuplicates(existingIdx);
                  continue;
                }
              }
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
            badge: badge,
          ),
        );
      }
      _dedupePrivateConversations();
      _dedupeGroupConversations();
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
      // 仅保留后续由 onNewMessage / IM 写入的真实预览。
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
      emUserName: g.id,
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

  /// 仅移除会话；群组加入状态不变。
  ///
  /// 刷新后仍保持隐藏（myGroups / IM 合并）。新消息会通过
  /// [onNewMessage] / [upsertPrivateChat] 恢复该行。同时删除环信
  /// 本地+远程会话，对齐 forya `removeItem`。
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
      isGroup: c.badge == ChatBadgeType.group &&
          !ImSystemAccounts.isSystemAccount(emId),
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
    // 持久化到环信，避免重启后角标恢复。
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
          isGroup: prev.badge == ChatBadgeType.group &&
              !ImSystemAccounts.isSystemAccount(emId),
        ),
      );
    }
  }

  void joinGroup(PopularGroupItem group) {
    _joinedGroupIds.add(group.id);
    _unhide(group.id);
    _upsertConversation(group);
    notifyListeners();
    // 有服务端详情时同步列表字段。
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
    if (_isSuppressedOfficial(conversation)) return;
    final em = conversation.emUserName.trim();
    final canonicalId = _canonicalDmId(
      id: conversation.id,
      emUserName: em,
    );
    final dm = conversation.copyWith(
      id: canonicalId,
      badge: conversation.badge == ChatBadgeType.group
          ? ChatBadgeType.none
          : conversation.badge,
      emUserName: em,
    );
    _unhide(dm.id, emUserName: dm.emUserName);
    final index = _indexOfPeer(id: dm.id, emUserName: dm.emUserName);
    if (index >= 0) {
      final prev = _conversations[index];
      final mergedEm =
          dm.emUserName.isNotEmpty ? dm.emUserName : prev.emUserName;
      _conversations[index] = dm.copyWith(
        id: _canonicalDmId(id: dm.id, emUserName: mergedEm),
        unreadCount: prev.unreadCount,
        isPinned: prev.isPinned || dm.isPinned,
        lastMessage: dm.lastMessage.isNotEmpty
            ? dm.lastMessage
            : prev.lastMessage,
        timeLabel: dm.lastMessage.isNotEmpty ? dm.timeLabel : prev.timeLabel,
        lastMsgAtMs: dm.lastMsgAtMs > 0 ? dm.lastMsgAtMs : prev.lastMsgAtMs,
        avatarUrl: dm.avatarUrl ?? prev.avatarUrl,
        emUserName: mergedEm,
      );
      _collapsePeerDuplicates(index);
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
    final em = (emUserName ?? '').trim();
    if (ImSystemAccounts.isSuppressedOfficialChat(id) ||
        ImSystemAccounts.isSuppressedOfficialChat(em)) {
      return;
    }
    final isGroupMsg = badge == ChatBadgeType.group;
    final listId = isGroupMsg
        ? (em.isNotEmpty ? em : id.trim())
        : _canonicalDmId(id: id, emUserName: em);
    _unhide(listId, emUserName: em);
    final nowMs = DateTime.now().millisecondsSinceEpoch;
    final timeLabel = ChatTimeLabel.forList(nowMs);
    final index = isGroupMsg
        ? _indexOfGroup(id: listId, emUserName: em)
        : _indexOfPeer(id: listId, emUserName: em);
    if (index >= 0) {
      final prev = _conversations.removeAt(index);
      final mergedEm = em.isNotEmpty ? em : prev.emUserName;
      final keepGroup = prev.badge == ChatBadgeType.group || isGroupMsg;
      final placeholderTitle =
          title.trim().isEmpty || title.trim() == 'Group';
      _conversations.insert(
        0,
        prev.copyWith(
          id: isGroupMsg
              ? _canonicalGroupId(prev.id, listId, mergedEm)
              : _canonicalDmId(id: listId, emUserName: mergedEm),
          title: keepGroup && placeholderTitle && prev.title.trim().isNotEmpty
              ? prev.title
              : title,
          avatarAsset: keepGroup &&
                  avatarAsset == AppAssets.avatarPlace &&
                  prev.avatarAsset.isNotEmpty
              ? prev.avatarAsset
              : avatarAsset,
          avatarUrl: keepGroup ? (avatarUrl ?? prev.avatarUrl) : avatarUrl,
          lastMessage: lastMessage,
          timeLabel: timeLabel,
          badge: keepGroup ? ChatBadgeType.group : badge,
          unreadCount: prev.unreadCount + unreadDelta,
          isMale: isMale ?? prev.isMale,
          signature: signature ?? prev.signature,
          zodiac: zodiac ?? prev.zodiac,
          isFollowing: isFollowing ?? prev.isFollowing,
          momentAssets: momentAssets ?? prev.momentAssets,
          groupDescription: groupDescription ?? prev.groupDescription,
          category: category ?? prev.category,
          memberCount: memberCount ?? prev.memberCount,
          postCount: postCount ?? prev.postCount,
          level: level ?? prev.level,
          lastMsgAtMs: nowMs,
          emUserName: mergedEm,
          isSystem: isSystem ?? prev.isSystem,
          titleColor: titleColor,
          clearTitleColor: isSystem == true &&
              ImSystemAccounts.isOfficialAccount(mergedEm),
        ),
      );
      if (isGroupMsg) {
        _collapseGroupDuplicates(0);
      } else {
        _collapsePeerDuplicates(0);
      }
    } else {
      _conversations.insert(
        0,
        ChatConversation(
          id: listId,
          title: title,
          avatarAsset: avatarAsset,
          avatarUrl: avatarUrl,
          lastMessage: lastMessage,
          timeLabel: timeLabel,
          badge: badge,
          unreadCount: unreadDelta,
          isMale: isMale ?? true,
          signature: signature ?? '',
          zodiac: zodiac ?? '',
          isFollowing: isFollowing ?? false,
          momentAssets: momentAssets ?? const [],
          groupDescription: groupDescription ?? '',
          category: category ?? '',
          memberCount: memberCount ?? 0,
          postCount: postCount ?? 0,
          level: level ?? 1,
          lastMsgAtMs: nowMs,
          emUserName: em,
          isSystem: isSystem ?? false,
          titleColor: titleColor,
        ),
      );
    }
    notifyListeners();
  }

  /// 标记当前打开的会话，使实时推送不增加未读。
  void setActiveConversation(String? idOrEm) {
    final key = idOrEm?.trim();
    _activeConversationKey = (key == null || key.isEmpty) ? null : key;
  }

  void _onImMessage(ImChatMessage m) {
    if (m.msgType == 'follow') return;
    final boundEm = _sessionEmUser?.trim() ?? '';
    final sdkEm = ImService.currentEmUser?.trim() ?? '';
    if (boundEm.isNotEmpty && sdkEm.isNotEmpty && boundEm != sdkEm) return;
    final emId = m.conversationId.trim();
    if (emId.isEmpty) return;
    if (ImSystemAccounts.isSuppressedOfficialChat(emId) ||
        ImSystemAccounts.isSuppressedOfficialChat(m.from) ||
        ImSystemAccounts.isSuppressedOfficialChat(m.to)) {
      return;
    }

    final preview = m.text.trim().isEmpty ? '[Message]' : m.text;
    final viewing = _isViewingConversation(emId);
    final unreadDelta = (m.isSelf || viewing) ? 0 : 1;

    final isSystem = ImSystemAccounts.isSystemAccount(emId);
    final isGroupCandidate =
        !isSystem && (m.isGroup || _joinedGroupIds.contains(emId));
    final existing = isGroupCandidate
        ? _findGroupByEmId(emId)
        : _findByEmOrListId(emId);
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

    final isSystemAccount = ImSystemAccounts.isSystemAccount(emId);
    // 官方 / 系统号永远走私聊，即使环信消息标成 GroupChat。
    final isGroup =
        !isSystemAccount && (m.isGroup || _joinedGroupIds.contains(emId));
    if (isGroup) {
      // 不展示从未加入过的群组（本地 IM 幽灵会话）。
      if (!_joinedGroupIds.contains(emId) && !_isHidden(emId)) return;
      onNewMessage(
        id: existing?.id ?? emId,
        title: existing?.title ?? 'Group',
        avatarAsset: existing?.avatarAsset ?? AppAssets.avatarPlace,
        avatarUrl: existing?.avatarUrl,
        lastMessage: preview,
        badge: ChatBadgeType.group,
        unreadDelta: unreadDelta,
        emUserName: emId,
        groupDescription: existing?.groupDescription,
        category: existing?.category,
        memberCount: existing?.memberCount,
        postCount: existing?.postCount,
        level: existing?.level,
      );
      if (existing == null ||
          existing.title == 'Group' ||
          (existing.avatarUrl ?? '').isEmpty) {
        unawaited(_enrichHiddenOrNewGroup(emId));
      }
      return;
    }

    final isOfficial = ImSystemAccounts.isOfficialAccount(emId);
    final listId = isOfficial
        ? 'dm_$emId'
        : isSystemAccount
            ? 'sys_$emId'
            : 'dm_$emId';
    if (isSystemAccount) {
      onNewMessage(
        id: listId,
        title: ImSystemAccounts.displayName(emId),
        avatarAsset: ImSystemAccounts.avatarAsset(emId),
        lastMessage: preview,
        unreadDelta: unreadDelta,
        emUserName: emId,
        isSystem: true,
        badge: isOfficial ? ChatBadgeType.verified : ChatBadgeType.none,
        titleColor: isOfficial ? null : AppColors.primaryBright,
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
    final index = _indexOfPeer(id: 'dm_$emId', emUserName: emId);
    if (index < 0) return null;
    return _conversations[index];
  }

  ChatConversation? _findGroupByEmId(String emId) {
    final index = _indexOfGroup(id: emId, emUserName: emId);
    if (index < 0) return null;
    return _conversations[index];
  }

  Set<String> _groupMatchKeys({String? id, String? emUserName}) {
    final keys = <String>{};
    void add(String? value) {
      final raw = (value ?? '').trim();
      if (raw.isEmpty) return;
      keys.add(raw);
      if (raw.startsWith('dm_')) {
        keys.add(raw.substring(3));
      }
    }

    add(id);
    add(emUserName);
    return keys;
  }

  int _indexOfGroup({String? id, String? emUserName}) {
    final keys = _groupMatchKeys(id: id, emUserName: emUserName);
    if (keys.isEmpty) return -1;
    return _conversations.indexWhere((c) {
      if (c.badge != ChatBadgeType.group) return false;
      final left = _groupMatchKeys(id: c.id, emUserName: c.emUserName);
      return left.any(keys.contains);
    });
  }

  String _canonicalGroupId(String idA, String idB, String em) {
    if (em.isNotEmpty) return em;
    for (final id in [idA, idB]) {
      final bare = id.startsWith('dm_') ? id.substring(3) : id;
      if (bare.isNotEmpty) return bare;
    }
    return idA;
  }

  bool _isSameGroup(
    ChatConversation a, {
    String? id,
    String? emUserName,
  }) {
    if (a.badge != ChatBadgeType.group) return false;
    final left = _groupMatchKeys(id: a.id, emUserName: a.emUserName);
    final right = _groupMatchKeys(id: id, emUserName: emUserName);
    return left.any(right.contains);
  }

  ChatConversation _mergeGroupRows(ChatConversation a, ChatConversation b) {
    final preferA = a.lastMsgAtMs >= b.lastMsgAtMs;
    final newer = preferA ? a : b;
    final older = preferA ? b : a;
    final em = a.emUserName.isNotEmpty ? a.emUserName : b.emUserName;
    String pickTitle() {
      for (final title in [newer.title, older.title]) {
        final text = title.trim();
        if (text.isNotEmpty && text != 'Group') return text;
      }
      return newer.title.trim().isNotEmpty ? newer.title : older.title;
    }

    return newer.copyWith(
      id: _canonicalGroupId(a.id, b.id, em),
      emUserName: em,
      unreadCount: a.unreadCount + b.unreadCount,
      isPinned: a.isPinned || b.isPinned,
      title: pickTitle(),
      avatarUrl: newer.avatarUrl ?? older.avatarUrl,
      avatarAsset: newer.avatarAsset.isNotEmpty &&
              newer.avatarAsset != AppAssets.avatarPlace
          ? newer.avatarAsset
          : older.avatarAsset,
      lastMessage: newer.lastMessage.trim().isNotEmpty
          ? newer.lastMessage
          : older.lastMessage,
      timeLabel: newer.lastMessage.trim().isNotEmpty
          ? newer.timeLabel
          : older.timeLabel,
      lastMsgAtMs: newer.lastMsgAtMs > 0 ? newer.lastMsgAtMs : older.lastMsgAtMs,
      groupDescription: newer.groupDescription.trim().isNotEmpty
          ? newer.groupDescription
          : older.groupDescription,
      category:
          newer.category.trim().isNotEmpty ? newer.category : older.category,
      memberCount:
          newer.memberCount > 0 ? newer.memberCount : older.memberCount,
      postCount: newer.postCount > 0 ? newer.postCount : older.postCount,
      level: newer.level > 0 ? newer.level : older.level,
    );
  }

  void _collapseGroupDuplicates(int keepIndex) {
    if (keepIndex < 0 || keepIndex >= _conversations.length) return;
    final keep = _conversations[keepIndex];
    if (keep.badge != ChatBadgeType.group) return;
    for (var i = _conversations.length - 1; i >= 0; i--) {
      if (i == keepIndex) continue;
      final other = _conversations[i];
      if (other.badge != ChatBadgeType.group) continue;
      if (!_isSameGroup(keep, id: other.id, emUserName: other.emUserName)) {
        continue;
      }
      final merged = _mergeGroupRows(keep, other);
      _conversations.removeAt(i);
      if (i < keepIndex) keepIndex -= 1;
      _conversations[keepIndex] = merged;
    }
  }

  void _dedupeGroupConversations() {
    for (var i = 0; i < _conversations.length; i++) {
      final row = _conversations[i];
      if (row.badge != ChatBadgeType.group) continue;
      for (var j = _conversations.length - 1; j > i; j--) {
        final other = _conversations[j];
        if (other.badge != ChatBadgeType.group) continue;
        if (!_isSameGroup(row, id: other.id, emUserName: other.emUserName)) {
          continue;
        }
        _conversations[i] = _mergeGroupRows(row, other);
        _conversations.removeAt(j);
      }
    }
  }

  /// 私聊列表 id：有环信 id 时统一 `dm_/sys_<em>`，避免与 `dm_<数字uid>` 并存。
  String _canonicalDmId({required String id, String emUserName = ''}) {
    final em = emUserName.trim();
    if (em.isNotEmpty) {
      if (ImSystemAccounts.isOfficialAccount(em)) return 'dm_$em';
      if (ImSystemAccounts.isSystemAccount(em)) return 'sys_$em';
      return 'dm_$em';
    }
    final raw = id.trim();
    if (raw.startsWith('dm_') || raw.startsWith('sys_')) return raw;
    if (raw.isEmpty) return raw;
    return 'dm_$raw';
  }

  Set<String> _peerMatchKeys({String? id, String? emUserName}) {
    final keys = <String>{};
    void add(String? v) {
      final t = (v ?? '').trim();
      if (t.isNotEmpty) keys.add(t);
    }

    add(id);
    add(emUserName);
    final em = (emUserName ?? '').trim();
    if (em.isNotEmpty) {
      add('dm_$em');
      add('sys_$em');
    }
    final raw = (id ?? '').trim();
    if (raw.startsWith('dm_')) {
      final bare = raw.substring(3);
      add(bare);
      add('sys_$bare');
    } else if (raw.startsWith('sys_')) {
      final bare = raw.substring(4);
      add(bare);
      add('dm_$bare');
    } else if (raw.isNotEmpty) {
      add('dm_$raw');
      add('sys_$raw');
    }
    return keys;
  }

  bool _isSamePeer(
    ChatConversation a, {
    String? id,
    String? emUserName,
  }) {
    if (a.badge == ChatBadgeType.group) return false;
    final left = _peerMatchKeys(id: a.id, emUserName: a.emUserName);
    final right = _peerMatchKeys(id: id, emUserName: emUserName);
    return left.any(right.contains);
  }

  int _indexOfPeer({String? id, String? emUserName}) {
    return _conversations.indexWhere(
      (c) => _isSamePeer(c, id: id, emUserName: emUserName),
    );
  }

  ChatConversation _mergePeerRows(ChatConversation a, ChatConversation b) {
    final em = a.emUserName.isNotEmpty ? a.emUserName : b.emUserName;
    final preferA = a.lastMsgAtMs >= b.lastMsgAtMs;
    final newer = preferA ? a : b;
    final older = preferA ? b : a;
    return newer.copyWith(
      id: _canonicalDmId(id: newer.id, emUserName: em),
      emUserName: em,
      unreadCount: a.unreadCount + b.unreadCount,
      isPinned: a.isPinned || b.isPinned,
      title: newer.title.trim().isNotEmpty ? newer.title : older.title,
      avatarUrl: newer.avatarUrl ?? older.avatarUrl,
      avatarAsset: newer.avatarAsset.isNotEmpty
          ? newer.avatarAsset
          : older.avatarAsset,
      lastMessage: newer.lastMessage.trim().isNotEmpty
          ? newer.lastMessage
          : older.lastMessage,
      timeLabel: newer.lastMessage.trim().isNotEmpty
          ? newer.timeLabel
          : older.timeLabel,
      lastMsgAtMs: newer.lastMsgAtMs > 0 ? newer.lastMsgAtMs : older.lastMsgAtMs,
      isSystem: a.isSystem || b.isSystem,
      badge: a.badge == ChatBadgeType.verified ||
              b.badge == ChatBadgeType.verified
          ? ChatBadgeType.verified
          : newer.badge,
      titleColor: newer.titleColor ?? older.titleColor,
      clearTitleColor: a.badge == ChatBadgeType.verified ||
          b.badge == ChatBadgeType.verified,
    );
  }

  void _collapsePeerDuplicates(int keepIndex) {
    if (keepIndex < 0 || keepIndex >= _conversations.length) return;
    final keep = _conversations[keepIndex];
    if (keep.badge == ChatBadgeType.group) return;
    for (var i = _conversations.length - 1; i >= 0; i--) {
      if (i == keepIndex) continue;
      final other = _conversations[i];
      if (other.badge == ChatBadgeType.group) continue;
      if (!_isSamePeer(keep, id: other.id, emUserName: other.emUserName)) {
        continue;
      }
      final merged = _mergePeerRows(keep, other);
      _conversations.removeAt(i);
      if (i < keepIndex) keepIndex -= 1;
      _conversations[keepIndex] = merged;
    }
  }

  /// 去掉同一对端的重复私聊行（`dm_<uid>` 与 `dm_<em>` 并存）。
  void _dedupePrivateConversations() {
    for (var i = 0; i < _conversations.length; i++) {
      final a = _conversations[i];
      if (a.badge == ChatBadgeType.group) continue;
      for (var j = _conversations.length - 1; j > i; j--) {
        final b = _conversations[j];
        if (b.badge == ChatBadgeType.group) continue;
        if (!_isSamePeer(a, id: b.id, emUserName: b.emUserName)) continue;
        _conversations[i] = _mergePeerRows(a, b);
        _conversations.removeAt(j);
      }
    }
  }

  Future<void> _enrichDmProfile(String listId, String emId) async {
    try {
      final res = await AppApis.relation.msgUser(emId);
      final brief = res.data;
      if (!res.ok || brief == null) return;
      final appId = brief.id.trim();
      // 同时吃掉 `dm_<数字uid>` 与 `dm_<em>` 两行。
      final index = _indexOfPeer(
        id: listId,
        emUserName: emId.isNotEmpty ? emId : null,
      );
      final alsoByApp = appId.isEmpty
          ? -1
          : _conversations.indexWhere(
              (c) =>
                  c.badge != ChatBadgeType.group &&
                  (c.id == 'dm_$appId' || c.id == appId),
            );
      var keep = index;
      if (keep < 0) keep = alsoByApp;
      if (keep < 0) return;
      if (alsoByApp >= 0 && alsoByApp != keep) {
        _conversations[keep] = _mergePeerRows(
          _conversations[keep],
          _conversations[alsoByApp],
        );
        _conversations.removeAt(alsoByApp);
        if (alsoByApp < keep) keep -= 1;
      }
      final prev = _conversations[keep];
      _conversations[keep] = prev.copyWith(
        id: _canonicalDmId(id: listId, emUserName: emId),
        title: brief.nickname.isNotEmpty ? brief.nickname : prev.title,
        avatarUrl:
            brief.avatarUrl.isNotEmpty ? brief.avatarUrl : prev.avatarUrl,
        emUserName: emId,
      );
      _collapsePeerDuplicates(keep);
      notifyListeners();
    } catch (_) {}
  }

  Future<void> _enrichHiddenOrNewGroup(String groupId) async {
    final detail = await _fetchGroupDetail(groupId);
    if (detail == null) return;
    _joinedGroupIds.add(detail.id);
    final index = _indexOfGroup(id: groupId, emUserName: groupId);
    if (index < 0) return;
    final prev = _conversations[index];
    _conversations[index] = _conversationFromGroup(detail, prev).copyWith(
      lastMessage: prev.lastMessage,
      timeLabel: prev.timeLabel,
      unreadCount: prev.unreadCount,
      lastMsgAtMs: prev.lastMsgAtMs,
      emUserName: detail.id,
    );
    _collapseGroupDuplicates(index);
    notifyListeners();
  }

  void _upsertConversation(PopularGroupItem group) {
    final index = _indexOfGroup(id: group.id, emUserName: group.id);
    final prev = index >= 0 ? _conversations[index] : null;
    final next = _conversationFromGroup(group, prev);
    if (index >= 0) {
      _conversations[index] = next;
      _collapseGroupDuplicates(index);
    } else {
      _conversations.insert(0, next);
    }
  }

  @override
  void dispose() {
    unawaited(_imSub?.cancel() ?? Future<void>.value());
    unawaited(_imConnSub?.cancel() ?? Future<void>.value());
    _imSub = null;
    _imConnSub = null;
    super.dispose();
  }
}
