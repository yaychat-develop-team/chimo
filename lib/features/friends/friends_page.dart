import 'dart:async';

import 'package:flutter/material.dart';

import '../../core/constants/app_assets.dart';
import '../../core/network/network_bootstrap.dart';
import '../../core/theme/app_colors.dart';
import '../../core/widgets/app_asset_image.dart';
import '../../core/widgets/network_or_asset_avatar.dart';
import '../chats/chat_detail_page.dart';
import '../chats/models/chat_conversation.dart';
import '../home/chat_user_profile_page.dart';
import '../home/models/chat_user_profile.dart';
import 'data/friend_dto.dart';
import 'models/friend_user.dart';

/// Friends page tabs.
enum FriendsTab { friends, follow, followers }

/// Contacts: Friends (mutual) / Follow (I follow) / Followers (follow me).
class FriendsPage extends StatefulWidget {
  const FriendsPage({super.key, this.initialTab = FriendsTab.friends});

  final FriendsTab initialTab;

  @override
  State<FriendsPage> createState() => _FriendsPageState();
}

class _FriendsPageState extends State<FriendsPage> {
  late FriendsTab _tab = widget.initialTab;
  final TextEditingController _searchController = TextEditingController();
  List<FriendUser> _users = const [];
  String _query = '';
  bool _loading = true;
  String? _error;
  Timer? _searchDebounce;

  @override
  void initState() {
    super.initState();
    _searchController.addListener(_onSearchChanged);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      unawaited(_loadRelations());
    });
  }

  @override
  void dispose() {
    _searchDebounce?.cancel();
    _searchController.removeListener(_onSearchChanged);
    _searchController.dispose();
    super.dispose();
  }

  void _onSearchChanged() {
    final next = _searchController.text.trim().toLowerCase();
    setState(() => _query = next);
    _searchDebounce?.cancel();
    _searchDebounce = Timer(const Duration(milliseconds: 350), () {
      unawaited(_loadRelations(keyword: _searchController.text.trim()));
    });
  }

  Future<void> _loadRelations({String keyword = ''}) async {
    setState(() {
      _loading = true;
      _error = null;
    });
    try {
      final api = NetworkBootstrap.api;
      final results = await Future.wait([
        api.searchFriends(keyword: keyword),
        api.searchFollowing(keyword: keyword),
        api.searchFans(keyword: keyword),
      ]);
      if (!mounted) return;

      final friends = FriendDto.parseList(
        results[0],
        relation: FriendRelation.mutual,
      );
      final following = FriendDto.parseList(
        results[1],
        relation: FriendRelation.following,
      );
      final fans = FriendDto.parseList(
        results[2],
        relation: FriendRelation.follower,
      );

      final anyFail = results.any((r) => !r.success);
      setState(() {
        _users = FriendDto.mergeGraphs(
          friends: friends,
          following: following,
          fans: fans,
        );
        _loading = false;
        if (anyFail && _users.isEmpty) {
          final msg = results
              .firstWhere((r) => !r.success, orElse: () => results.first)
              .message;
          _error = msg.isEmpty ? 'Failed to load contacts' : msg;
        }
      });
    } catch (error) {
      if (!mounted) return;
      setState(() {
        _loading = false;
        _error = '$error';
      });
    }
  }

  bool _matchesTab(FriendUser user) {
    return switch (_tab) {
      FriendsTab.friends => user.relation == FriendRelation.mutual,
      FriendsTab.follow =>
        user.relation == FriendRelation.mutual ||
            user.relation == FriendRelation.following,
      FriendsTab.followers =>
        user.relation == FriendRelation.mutual ||
            user.relation == FriendRelation.follower,
    };
  }

  String get _emptyTitle => switch (_tab) {
        FriendsTab.friends => 'No friends yet~',
        FriendsTab.follow => 'No follows yet~',
        FriendsTab.followers => 'No followers yet~',
      };

  String get _searchHint => switch (_tab) {
        FriendsTab.friends => 'Search for friends',
        FriendsTab.follow => 'Search for follows',
        FriendsTab.followers => 'Search for followers',
      };

  List<FriendUser> get _filtered {
    final list = _users.where(_matchesTab).toList();
    if (_query.isEmpty) return list;
    return list
        .where(
          (u) =>
              u.nickname.toLowerCase().contains(_query) ||
              u.userId.contains(_query),
        )
        .toList(growable: false);
  }

  Future<void> _followBack(FriendUser user) async {
    try {
      final res = await NetworkBootstrap.api.followUser(user.id);
      if (!mounted) return;
      if (!res.success) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(res.message.isEmpty ? 'Follow failed' : res.message),
            behavior: SnackBarBehavior.floating,
          ),
        );
        return;
      }
      setState(() {
        _users = [
          for (final u in _users)
            if (u.id == user.id)
              u.copyWith(relation: FriendRelation.mutual)
            else
              u,
        ];
      });
    } catch (error) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Follow failed: $error'),
          behavior: SnackBarBehavior.floating,
        ),
      );
    }
  }

  void _openProfile(FriendUser user) {
    final profile = ChatUserProfile(
      id: user.id,
      nickname: user.nickname,
      userId: user.userId,
      avatarAsset: user.avatarAsset,
      avatarUrl: user.avatarUrl,
      isMale: user.isMale,
      age: user.age,
      zodiac: user.zodiac,
      level: 1,
      bio: user.bio,
      isFollowing: user.relation == FriendRelation.mutual ||
          user.relation == FriendRelation.following,
    );
    Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder: (_) => ChatUserProfilePage(profile: profile),
      ),
    );
  }

  void _openChat(FriendUser user) {
    final conversation = ChatConversation(
      id: 'dm_${user.id}',
      title: user.nickname,
      avatarAsset: user.avatarAsset,
      lastMessage: '',
      timeLabel: 'Just',
      isMale: user.isMale,
      signature: user.bio,
      zodiac: user.zodiac,
      isFollowing: true,
      momentAssets: user.momentAssets,
    );
    Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder: (_) => ChatDetailPage(conversation: conversation),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final users = _filtered;

    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _FriendsHeader(
              current: _tab,
              onBack: () => Navigator.of(context).pop(),
              onTabChanged: (tab) => setState(() => _tab = tab),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 8, 16, 0),
              child: _FriendsSearchField(
                controller: _searchController,
                hintText: _searchHint,
              ),
            ),
            if (_loading)
              const LinearProgressIndicator(
                minHeight: 2,
                color: AppColors.primaryBright,
                backgroundColor: Colors.transparent,
              ),
            Expanded(
              child: RefreshIndicator(
                color: AppColors.primaryBright,
                onRefresh: () => _loadRelations(
                  keyword: _searchController.text.trim(),
                ),
                child: _error != null && users.isEmpty
                    ? ListView(
                        physics: const AlwaysScrollableScrollPhysics(),
                        children: [
                          const SizedBox(height: 120),
                          Center(
                            child: Padding(
                              padding: const EdgeInsets.all(24),
                              child: Column(
                                children: [
                                  Text(
                                    _error!,
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(
                                      color: AppColors.textSecondary,
                                      fontSize: 14,
                                    ),
                                  ),
                                  const SizedBox(height: 12),
                                  TextButton(
                                    onPressed: () => unawaited(_loadRelations()),
                                    child: const Text('Retry'),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      )
                    : users.isEmpty && !_loading
                        ? ListView(
                            physics: const AlwaysScrollableScrollPhysics(),
                            children: [
                              SizedBox(
                                height: MediaQuery.sizeOf(context).height * 0.55,
                                child: _FriendsEmptyState(title: _emptyTitle),
                              ),
                            ],
                          )
                        : ListView.separated(
                            physics: const AlwaysScrollableScrollPhysics(),
                            padding: const EdgeInsets.fromLTRB(16, 16, 16, 24),
                            itemCount: users.length,
                            separatorBuilder: (_, _) =>
                                const SizedBox(height: 18),
                            itemBuilder: (context, index) {
                              final user = users[index];
                              return _FriendTile(
                                user: user,
                                onTap: () => _openProfile(user),
                                onChat: () => _openChat(user),
                                onFollow:
                                    user.relation == FriendRelation.follower
                                        ? () => unawaited(_followBack(user))
                                        : null,
                              );
                            },
                          ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _FriendsHeader extends StatelessWidget {
  const _FriendsHeader({
    required this.current,
    required this.onBack,
    required this.onTabChanged,
  });

  final FriendsTab current;
  final VoidCallback onBack;
  final ValueChanged<FriendsTab> onTabChanged;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 52,
      child: Row(
        children: [
          IconButton(
            onPressed: onBack,
            icon: const Icon(
              Icons.arrow_back_ios_new_rounded,
              color: AppColors.textPrimary,
              size: 20,
            ),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                for (final tab in FriendsTab.values)
                  _FriendsTabLabel(
                    label: switch (tab) {
                      FriendsTab.friends => 'Friends',
                      FriendsTab.follow => 'Follow',
                      FriendsTab.followers => 'Followers',
                    },
                    selected: current == tab,
                    onTap: () => onTabChanged(tab),
                  ),
              ],
            ),
          ),
          const SizedBox(width: 48),
        ],
      ),
    );
  }
}

class _FriendsTabLabel extends StatelessWidget {
  const _FriendsTabLabel({
    required this.label,
    required this.selected,
    required this.onTap,
  });

  final String label;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              label,
              style: TextStyle(
                color: selected
                    ? AppColors.primaryBright
                    : AppColors.textSecondary,
                fontSize: 17,
                fontWeight: selected ? FontWeight.w700 : FontWeight.w500,
              ),
            ),
            const SizedBox(height: 6),
            AnimatedContainer(
              duration: const Duration(milliseconds: 180),
              height: 3,
              width: selected ? 28 : 0,
              decoration: BoxDecoration(
                color: AppColors.primaryBright,
                borderRadius: BorderRadius.circular(2),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _FriendsSearchField extends StatelessWidget {
  const _FriendsSearchField({
    required this.controller,
    required this.hintText,
  });

  final TextEditingController controller;
  final String hintText;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 44,
      padding: const EdgeInsets.symmetric(horizontal: 14),
      decoration: BoxDecoration(
        color: const Color(0xFF1A1A1A),
        borderRadius: BorderRadius.circular(22),
      ),
      child: Row(
        children: [
          const AppAssetImage(
            AppAssets.msgSearch,
            width: 18,
            height: 18,
            color: AppColors.textTertiary,
          ),
          const SizedBox(width: 10),
          Expanded(
            child: TextField(
              controller: controller,
              style: const TextStyle(
                color: AppColors.textPrimary,
                fontSize: 15,
              ),
              cursorColor: AppColors.primaryBright,
              decoration: InputDecoration(
                isDense: true,
                border: InputBorder.none,
                hintText: hintText,
                hintStyle: const TextStyle(
                  color: AppColors.textTertiary,
                  fontSize: 15,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _FriendsEmptyState extends StatelessWidget {
  const _FriendsEmptyState({required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              AppAssets.friendsEmpty,
              width: 180,
              fit: BoxFit.contain,
            ),
            const SizedBox(height: 16),
            Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: AppColors.textPrimary,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _FriendTile extends StatelessWidget {
  const _FriendTile({
    required this.user,
    required this.onTap,
    required this.onChat,
    this.onFollow,
  });

  final FriendUser user;
  final VoidCallback onTap;
  final VoidCallback onChat;
  final VoidCallback? onFollow;

  @override
  Widget build(BuildContext context) {
    final showFollow =
        user.relation == FriendRelation.follower && onFollow != null;

    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: onTap,
      child: Row(
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
          const SizedBox(width: 10),
          if (showFollow)
            _ActionChip(
              label: 'Follow',
              filled: true,
              onTap: onFollow!,
            )
          else
            _ActionChip(
              label: 'Chat',
              filled: false,
              onTap: onChat,
            ),
        ],
      ),
    );
  }
}

class _ActionChip extends StatelessWidget {
  const _ActionChip({
    required this.label,
    required this.filled,
    required this.onTap,
  });

  final String label;
  final bool filled;
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
          color: filled ? const Color(0xFF1CFF8A) : const Color(0xFF1A3A28),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Text(
          label,
          style: TextStyle(
            color: filled ? Colors.black : const Color(0xFF1CFF8A),
            fontSize: 14,
            fontWeight: filled ? FontWeight.w800 : FontWeight.w700,
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
