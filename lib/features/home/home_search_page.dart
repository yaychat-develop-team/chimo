import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../core/constants/app_assets.dart';
import '../../core/network/network_bootstrap.dart';
import '../../core/theme/app_colors.dart';
import '../../core/widgets/app_asset_image.dart';
import '../../core/widgets/center_toast.dart';
import '../../core/widgets/network_or_asset_avatar.dart';
import '../../shared/models/friend_user.dart';
import '../chats/chat_detail_page.dart';
import '../chats/data/chats_list_controller.dart';
import '../chats/models/chat_conversation.dart';
import '../friends/data/friend_dto.dart';
import '../me/data/user_dto.dart';
import 'models/chat_user_profile.dart';

enum _SearchRelation { self, notFollowing, following }

/// User hit from home search (`/user-relation/searchUser`).
class _SearchUser {
  const _SearchUser({
    required this.id,
    required this.nickname,
    required this.userId,
    required this.avatarAsset,
    required this.isMale,
    required this.age,
    this.avatarUrl,
    this.momentAssets = const [],
    this.relation = _SearchRelation.notFollowing,
  });

  final String id;
  final String nickname;
  final String userId;
  final String avatarAsset;
  final String? avatarUrl;
  final bool isMale;
  final int age;
  final List<String> momentAssets;
  final _SearchRelation relation;

  _SearchUser copyWith({_SearchRelation? relation}) {
    return _SearchUser(
      id: id,
      nickname: nickname,
      userId: userId,
      avatarAsset: avatarAsset,
      avatarUrl: avatarUrl,
      isMale: isMale,
      age: age,
      momentAssets: momentAssets,
      relation: relation ?? this.relation,
    );
  }
}

/// Home search: contacts / messages, history, and user results.
class HomeSearchPage extends StatefulWidget {
  const HomeSearchPage({super.key, this.chatsController});

  final ChatsListController? chatsController;

  @override
  State<HomeSearchPage> createState() => _HomeSearchPageState();
}

class _HomeSearchPageState extends State<HomeSearchPage> {
  final TextEditingController _controller = TextEditingController();
  final FocusNode _focusNode = FocusNode();
  final List<String> _history = [];
  bool _editingHistory = false;
  _SearchUser? _result;
  bool _hasSearched = false;
  bool _searching = false;
  String? _selfUserId;

  /// Matches forya `searchHistoryKey`.
  static const _historyPrefsKey = 'searchHistoryKey';
  static final RegExp _idPattern = RegExp(r'^\d{5,}$');

  @override
  void initState() {
    super.initState();
    _controller.addListener(_onInputChanged);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) _focusNode.requestFocus();
      unawaited(_loadSelfId());
      unawaited(_loadHistory());
    });
  }

  Future<void> _loadHistory() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final saved = prefs.getStringList(_historyPrefsKey) ?? const [];
      if (!mounted || saved.isEmpty) return;
      setState(() {
        _history
          ..clear()
          ..addAll(saved);
      });
    } catch (_) {}
  }

  Future<void> _persistHistory() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setStringList(_historyPrefsKey, List<String>.from(_history));
    } catch (_) {}
  }

  void _addHistory(String query) {
    setState(() {
      _history.remove(query);
      _history.insert(0, query);
      if (_history.length > 20) {
        _history.removeRange(20, _history.length);
      }
    });
    unawaited(_persistHistory());
  }

  Future<void> _loadSelfId() async {
    try {
      final res = await NetworkBootstrap.api.userInfo();
      final profile = UserDto.parseProfile(res);
      if (!mounted || profile == null) return;
      setState(() => _selfUserId = profile.userId);
    } catch (_) {}
  }

  @override
  void dispose() {
    _controller.removeListener(_onInputChanged);
    _controller.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  void _onInputChanged() {
    setState(() {});
  }

  void _enterEditHistory() {
    if (_history.isEmpty) return;
    FocusScope.of(context).unfocus();
    setState(() {
      _editingHistory = true;
      _result = null;
      _hasSearched = false;
    });
  }

  void _exitEditHistory() {
    setState(() => _editingHistory = false);
  }

  void _clearAllHistory() {
    setState(() {
      _history.clear();
      _editingHistory = false;
    });
    unawaited(_persistHistory());
  }

  void _removeHistoryItem(String item) {
    setState(() {
      _history.remove(item);
      if (_history.isEmpty) _editingHistory = false;
    });
    unawaited(_persistHistory());
  }

  void _clearInput() {
    _controller.clear();
    setState(() {
      _result = null;
      _hasSearched = false;
      _editingHistory = false;
    });
    _focusNode.requestFocus();
  }

  bool _isValidId(String query) => _idPattern.hasMatch(query);

  _SearchUser _fromFriend(FriendUser u) {
    final relation = switch (u.relation) {
      FriendRelation.mutual || FriendRelation.following =>
        _SearchRelation.following,
      _ => _SearchRelation.notFollowing,
    };
    return _SearchUser(
      id: 'dm_${u.id}',
      nickname: u.nickname,
      userId: u.userId,
      avatarAsset: u.avatarAsset,
      avatarUrl: u.avatarUrl,
      isMale: u.isMale,
      age: u.age,
      momentAssets: ChatUserProfile.demoMomentAssets,
      relation: relation,
    );
  }

  Future<void> _submit(String raw) async {
    final query = raw.trim();
    if (query.isEmpty) return;

    if (_editingHistory) {
      _exitEditHistory();
    }

    if (!_isValidId(query)) {
      setState(() {
        _result = null;
        _hasSearched = false;
      });
      showCenterToast(context, message: 'Search by correct ID');
      return;
    }

    FocusScope.of(context).unfocus();
    setState(() {
      _searching = true;
      _hasSearched = true;
      _result = null;
    });

    try {
      final res = await NetworkBootstrap.api.searchUsers(query);
      if (!mounted) return;

      if (!res.success) {
        setState(() => _searching = false);
        showCenterToast(
          context,
          message: res.message.isEmpty ? 'Search failed' : res.message,
        );
        return;
      }

      final users = FriendDto.parseList(
        res,
        relation: FriendRelation.follower,
      );
      _SearchUser? hit;
      for (final u in users) {
        if (u.userId == query || u.id == query) {
          hit = _fromFriend(u);
          break;
        }
      }
      hit ??= users.isEmpty ? null : _fromFriend(users.first);

      if (hit != null &&
          _selfUserId != null &&
          hit.userId == _selfUserId) {
        hit = hit.copyWith(relation: _SearchRelation.self);
      }

      // forya: only record history when search returns a hit.
      if (hit != null) {
        _addHistory(query);
      }

      setState(() {
        _result = hit;
        _searching = false;
      });
    } catch (error) {
      if (!mounted) return;
      setState(() => _searching = false);
      showCenterToast(context, message: 'Search failed: $error');
    }
  }

  void _onHistoryTap(String item) {
    if (_editingHistory) return;
    _controller.text = item;
    _controller.selection = TextSelection.collapsed(offset: item.length);
    unawaited(_submit(item));
  }

  Future<void> _follow(_SearchUser user) async {
    setState(() {
      _result = user.copyWith(relation: _SearchRelation.following);
    });
    try {
      final res = await NetworkBootstrap.api.followUser(user.userId);
      if (!mounted) return;
      if (!res.success) {
        setState(() {
          _result = user.copyWith(relation: _SearchRelation.notFollowing);
        });
        showCenterToast(
          context,
          message: res.message.isEmpty ? 'Follow failed' : res.message,
        );
      }
    } catch (error) {
      if (!mounted) return;
      setState(() {
        _result = user.copyWith(relation: _SearchRelation.notFollowing);
      });
      showCenterToast(context, message: 'Follow failed: $error');
    }
  }

  void _openChat(_SearchUser user) {
    final conversation = ChatConversation(
      id: user.id,
      title: user.nickname,
      avatarAsset: user.avatarAsset,
      avatarUrl: user.avatarUrl,
      lastMessage: '',
      timeLabel: 'Just',
      isMale: user.isMale,
      isFollowing: true,
      momentAssets: user.momentAssets,
    );
    widget.chatsController?.upsertPrivateChat(conversation);
    Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder: (_) => ChatDetailPage(
          conversation: conversation,
          chatsController: widget.chatsController,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final hasText = _controller.text.isNotEmpty;
    // After submit, show result / empty / loading; clear input returns to History.
    final showResults = _hasSearched;

    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 8, 8, 0),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 40,
                      padding: const EdgeInsets.symmetric(horizontal: 14),
                      decoration: BoxDecoration(
                        color: const Color(0xFF2A2A2A),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Row(
                        children: [
                          const AppAssetImage(
                            AppAssets.msgSearch,
                            width: 16,
                            height: 16,
                            color: AppColors.textTertiary,
                          ),
                          const SizedBox(width: 8),
                          Expanded(
                            child: TextField(
                              controller: _controller,
                              focusNode: _focusNode,
                              style: const TextStyle(
                                color: AppColors.textPrimary,
                                fontSize: 15,
                              ),
                              cursorColor: AppColors.primaryBright,
                              cursorWidth: 1.5,
                              textInputAction: TextInputAction.search,
                              inputFormatters: [
                                LengthLimitingTextInputFormatter(64),
                              ],
                              onSubmitted: (v) => unawaited(_submit(v)),
                              decoration: const InputDecoration(
                                isDense: true,
                                border: InputBorder.none,
                                hintText: 'Search contacts or mess...',
                                hintStyle: TextStyle(
                                  color: AppColors.textTertiary,
                                  fontSize: 15,
                                ),
                              ),
                            ),
                          ),
                          if (hasText)
                            GestureDetector(
                              onTap: _clearInput,
                              behavior: HitTestBehavior.opaque,
                              child: const Padding(
                                padding: EdgeInsets.only(left: 6),
                                child: Icon(
                                  Icons.cancel_rounded,
                                  size: 18,
                                  color: AppColors.textTertiary,
                                ),
                              ),
                            ),
                        ],
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () => Navigator.of(context).pop(),
                    style: TextButton.styleFrom(
                      foregroundColor: AppColors.textPrimary,
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      minimumSize: const Size(0, 40),
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    ),
                    child: const Text(
                      'Cancel',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            if (showResults)
              Expanded(
                child: _searching
                    ? const Center(
                        child: SizedBox(
                          width: 28,
                          height: 28,
                          child: CircularProgressIndicator(strokeWidth: 2.4),
                        ),
                      )
                    : _result == null
                        ? const Center(
                            child: Text(
                              'No users found',
                              style: TextStyle(
                                color: AppColors.textTertiary,
                                fontSize: 14,
                              ),
                            ),
                          )
                        : _UsersResult(
                            user: _result!,
                            onFollow: () => unawaited(_follow(_result!)),
                            onChat: () => _openChat(_result!),
                          ),
              )
            else ...[
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 24, 16, 8),
                child: Row(
                  children: [
                    const Expanded(
                      child: Text(
                        'History',
                        style: TextStyle(
                          color: AppColors.textSecondary,
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    if (_editingHistory) ...[
                      GestureDetector(
                        onTap: _clearAllHistory,
                        behavior: HitTestBehavior.opaque,
                        child: const Padding(
                          padding: EdgeInsets.symmetric(
                            vertical: 6,
                            horizontal: 4,
                          ),
                          child: Text(
                            'Clear All',
                            style: TextStyle(
                              color: AppColors.textSecondary,
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        width: 1,
                        height: 12,
                        margin: const EdgeInsets.symmetric(horizontal: 10),
                        color: const Color(0xFF4A4A4A),
                      ),
                      GestureDetector(
                        onTap: _exitEditHistory,
                        behavior: HitTestBehavior.opaque,
                        child: const Padding(
                          padding: EdgeInsets.symmetric(
                            vertical: 6,
                            horizontal: 4,
                          ),
                          child: Text(
                            'Done',
                            style: TextStyle(
                              color: AppColors.textPrimary,
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ),
                    ] else
                      IconButton(
                        onPressed: _history.isEmpty ? null : _enterEditHistory,
                        padding: EdgeInsets.zero,
                        constraints: const BoxConstraints(
                          minWidth: 36,
                          minHeight: 36,
                        ),
                        icon: Image.asset(
                          AppAssets.msgDelete,
                          width: 22,
                          height: 22,
                          color: _history.isEmpty
                              ? AppColors.textTertiary
                              : AppColors.textSecondary,
                        ),
                      ),
                  ],
                ),
              ),
              if (_history.isNotEmpty)
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 4, 16, 16),
                  child: Wrap(
                    spacing: 10,
                    runSpacing: 10,
                    children: [
                      for (final item in _history)
                        _HistoryChip(
                          label: item,
                          editing: _editingHistory,
                          onTap: () => _onHistoryTap(item),
                          onDelete: () => _removeHistoryItem(item),
                        ),
                    ],
                  ),
                ),
            ],
          ],
        ),
      ),
    );
  }
}

class _UsersResult extends StatelessWidget {
  const _UsersResult({
    required this.user,
    required this.onFollow,
    required this.onChat,
  });

  final _SearchUser user;
  final VoidCallback onFollow;
  final VoidCallback onChat;

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.fromLTRB(16, 24, 16, 16),
      children: [
        const Text(
          'Users',
          style: TextStyle(
            color: AppColors.textPrimary,
            fontSize: 17,
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(height: 16),
        Row(
          children: [
            ClipOval(
              child: NetworkOrAssetAvatar(
                asset: user.avatarAsset,
                url: user.avatarUrl,
                width: 52,
                height: 52,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Flexible(
                        child: Text(
                          user.nickname,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            color: AppColors.textPrimary,
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                      const SizedBox(width: 8),
                      _GenderAgeChip(isMale: user.isMale, age: user.age),
                    ],
                  ),
                  const SizedBox(height: 6),
                  Text(
                    'ID:${user.userId}',
                    style: const TextStyle(
                      color: AppColors.textSecondary,
                      fontSize: 13,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
            if (user.relation != _SearchRelation.self) ...[
              const SizedBox(width: 10),
              if (user.relation == _SearchRelation.notFollowing)
                _FollowAction(onTap: onFollow)
              else
                _ChatAction(onTap: onChat),
            ],
          ],
        ),
      ],
    );
  }
}

class _FollowAction extends StatelessWidget {
  const _FollowAction({required this.onTap});

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 32,
        padding: const EdgeInsets.symmetric(horizontal: 18),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: const Color(0xFF1CFF8A),
          borderRadius: BorderRadius.circular(16),
        ),
        child: const Text(
          'Follow',
          style: TextStyle(
            color: Colors.black,
            fontSize: 14,
            fontWeight: FontWeight.w800,
          ),
        ),
      ),
    );
  }
}

class _ChatAction extends StatelessWidget {
  const _ChatAction({required this.onTap});

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 32,
        padding: const EdgeInsets.symmetric(horizontal: 18),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: const Color(0xFF1A3A28),
          borderRadius: BorderRadius.circular(16),
        ),
        child: const Text(
          'Chat',
          style: TextStyle(
            color: Color(0xFF1CFF8A),
            fontSize: 14,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }
}

class _GenderAgeChip extends StatelessWidget {
  const _GenderAgeChip({required this.isMale, required this.age});

  final bool isMale;
  final int age;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
      decoration: BoxDecoration(
        color: isMale ? const Color(0xFF4F8BFF) : const Color(0xFFFF5BA8),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            isMale ? AppAssets.genderMan : AppAssets.genderWoman,
            width: 11,
            height: 11,
          ),
          const SizedBox(width: 3),
          Text(
            '$age',
            style: const TextStyle(
              color: Colors.white,
              fontSize: 12,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }
}

class _HistoryChip extends StatelessWidget {
  const _HistoryChip({
    required this.label,
    required this.editing,
    required this.onTap,
    required this.onDelete,
  });

  final String label;
  final bool editing;
  final VoidCallback onTap;
  final VoidCallback onDelete;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: editing ? null : onTap,
      child: Container(
        padding: EdgeInsets.fromLTRB(14, 8, editing ? 8 : 14, 8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18),
          border: Border.all(color: const Color(0xFF4A4A4A), width: 1),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              label,
              style: const TextStyle(
                color: AppColors.textPrimary,
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
            if (editing) ...[
              const SizedBox(width: 6),
              GestureDetector(
                onTap: onDelete,
                behavior: HitTestBehavior.opaque,
                child: const Padding(
                  padding: EdgeInsets.all(2),
                  child: Icon(
                    Icons.close_rounded,
                    size: 14,
                    color: AppColors.textSecondary,
                  ),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
