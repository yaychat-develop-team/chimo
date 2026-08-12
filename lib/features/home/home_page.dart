import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';

import '../../app/app_router.dart';
import '../../core/constants/app_assets.dart';
import '../../core/navigation/app_scheme_helper.dart';
import '../../core/network/app_apis.dart';
import '../../core/theme/app_colors.dart';
import '../chats/data/chats_list_controller.dart';
import 'chat_user_profile_page.dart';
import 'data/banner_dto.dart';
import 'group_details_page.dart';
import 'home_search_page.dart';
import 'joined_groups_page.dart';
import 'models/chat_user_profile.dart';
import 'models/group_item.dart';
import 'widgets/group_members_sheet.dart';
import 'widgets/home_app_bar.dart';
import 'widgets/home_hero_banner.dart';
import 'widgets/my_groups_section.dart';
import 'widgets/popular_groups_section.dart';

/// 首页下拉刷新阶段文案。
enum _HomeRefreshPhase {
  idle,
  pull,
  release,
  loading,
  success,
}

/// 首页：应用栏、推广横幅、我的群组、热门群组。
class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.chatsController});

  /// 与壳层共用：加入 / 离开时同步会话列表。
  final ChatsListController chatsController;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<PopularGroupItem> _popularGroups = const [];
  List<PopularGroupItem> _joinedGroups = const [];
  List<HomeBannerItem> _banners = const [];
  bool _initialLoading = true;
  String? _loadError;

  final ScrollController _scrollController = ScrollController();

  double _pullExtent = 0;
  _HomeRefreshPhase _phase = _HomeRefreshPhase.idle;
  bool _draggingRefresh = false;

  static const double _triggerExtent = 56;
  static const double _maxPullExtent = 88;
  static const double _statusExtent = 48;

  @override
  void initState() {
    super.initState();
    widget.chatsController.addListener(_syncMembershipFromController);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      // Banner 与小组列表独立加载，互不阻塞。
      unawaited(_loadBanners());
      unawaited(_loadGroups(showError: true));
    });
  }

  @override
  void dispose() {
    widget.chatsController.removeListener(_syncMembershipFromController);
    _scrollController.dispose();
    super.dispose();
  }

  void _syncMembershipFromController() {
    final ids = widget.chatsController.joinedGroupIds;
    final staleJoined = _joinedGroups.any((g) => !ids.contains(g.id));
    final popularMismatch = _popularGroups.any(
      (g) => g.isJoined != ids.contains(g.id),
    );
    final missingJoined = _popularGroups.any(
      (g) => ids.contains(g.id) && !_joinedGroups.any((j) => j.id == g.id),
    );
    if (!staleJoined && !popularMismatch && !missingJoined) return;

    setState(() {
      _popularGroups = [
        for (final g in _popularGroups)
          g.copyWith(isJoined: ids.contains(g.id)),
      ];
      _joinedGroups = [
        for (final g in _joinedGroups)
          if (ids.contains(g.id)) g.copyWith(isJoined: true),
      ];
      for (final g in _popularGroups) {
        if (!ids.contains(g.id)) continue;
        if (_joinedGroups.any((j) => j.id == g.id)) continue;
        _joinedGroups = [..._joinedGroups, g];
      }
    });
  }

  List<MyGroupItem> get _myGroups => [
        for (final group in _joinedGroups) group.toMyGroupItem(),
      ];

  String get _refreshHint => switch (_phase) {
        _HomeRefreshPhase.idle => '',
        _HomeRefreshPhase.pull => 'Pull down to refresh',
        _HomeRefreshPhase.release => 'Release to refresh',
        _HomeRefreshPhase.loading => 'Loading',
        _HomeRefreshPhase.success => 'Successfully loaded',
      };

  double get _hintHeight {
    if (_phase == _HomeRefreshPhase.loading ||
        _phase == _HomeRefreshPhase.success) {
      return _statusExtent;
    }
    return _pullExtent;
  }

  bool get _isBusy =>
      _phase == _HomeRefreshPhase.loading ||
      _phase == _HomeRefreshPhase.success;

  bool get _atScrollTop {
    if (!_scrollController.hasClients) return true;
    return _scrollController.position.pixels <= 0;
  }

  void _setJoined(PopularGroupItem group, bool joined) {
    late PopularGroupItem updated;
    setState(() {
      final popularIndex =
          _popularGroups.indexWhere((item) => item.id == group.id);
      if (popularIndex >= 0) {
        _popularGroups = [
          for (var i = 0; i < _popularGroups.length; i++)
            if (i == popularIndex)
              _popularGroups[i].copyWith(isJoined: joined)
            else
              _popularGroups[i],
        ];
      }

      final joinedIndex =
          _joinedGroups.indexWhere((item) => item.id == group.id);
      if (joined) {
        updated = (popularIndex >= 0
                ? _popularGroups[popularIndex]
                : group)
            .copyWith(isJoined: true);
        if (joinedIndex < 0) {
          _joinedGroups = [..._joinedGroups, updated];
        } else {
          _joinedGroups = [
            for (var i = 0; i < _joinedGroups.length; i++)
              if (i == joinedIndex) updated else _joinedGroups[i],
          ];
        }
      } else {
        updated = group.copyWith(isJoined: false);
        _joinedGroups = [
          for (final item in _joinedGroups)
            if (item.id != group.id) item,
        ];
      }
    });

    if (joined) {
      widget.chatsController.joinGroup(updated);
    } else {
      widget.chatsController.leaveGroup(group.id);
    }
  }

  Future<void> _toggleJoin(PopularGroupItem group) async {
    final latest = _latestGroup(group);
    if (latest.isJoined) return;

    _setJoined(latest, true);

    try {
      final res = await AppApis.group.join([latest.id]);
      if (!mounted) return;
      if (!res.ok) {
        _setJoined(latest, false);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(res.message.isEmpty ? 'Join failed' : res.message),
            behavior: SnackBarBehavior.floating,
          ),
        );
      }
    } catch (error) {
      if (!mounted) return;
      _setJoined(latest, false);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Join failed: $error'),
          behavior: SnackBarBehavior.floating,
        ),
      );
    }
  }

  PopularGroupItem _latestGroup(PopularGroupItem group) {
    for (final item in _popularGroups) {
      if (item.id == group.id) return item;
    }
    for (final item in _joinedGroups) {
      if (item.id == group.id) return item;
    }
    return group;
  }

  void _openGroupDetails(PopularGroupItem group) {
    final latest = _latestGroup(group);
    Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder: (_) => GroupDetailsPage(
          group: latest,
          chatsController: widget.chatsController,
          onMembershipChanged: (joined) => _setJoined(latest, joined),
        ),
      ),
    );
  }

  void _openMembersSheet(PopularGroupItem group) {
    GroupMembersSheet.show(
      context,
      groupId: group.id,
      onMemberTap: (member) {
        Navigator.of(context).pop();
        WidgetsBinding.instance.addPostFrameCallback((_) {
          if (!mounted) return;
          Navigator.of(context).push(
            MaterialPageRoute<void>(
              builder: (_) => ChatUserProfilePage(
                profile: ChatUserProfile.fromMember(member),
                chatsController: widget.chatsController,
              ),
            ),
          );
        });
      },
    );
  }

  Future<void> _loadBanners() async {
    try {
      final homeRes = await AppApis.app.homeBanners();
      if (!mounted) return;
      if (!homeRes.ok) return;
      setState(() {
        _banners = homeRes.data ?? const [];
      });
    } catch (_) {
      // Banner 失败不影响下方小组列表。
    }
  }

  Future<void> _loadGroups({bool showError = false}) async {
    try {
      await widget.chatsController.ensureBoundToCurrentUser();
      final popularFuture = AppApis.group.list(pageNum: 1, pageSize: 20);
      final mineFuture = AppApis.group.myGroups();
      final popularRes = await popularFuture;
      final mineRes = await mineFuture;

      if (!mounted) return;

      if (!popularRes.ok && popularRes.isNotLogin) {
        if (!mounted) return;
        context.go(AppRoutes.login);
        return;
      }

      final popular = popularRes.data ?? const [];
      final mine = mineRes.data ?? const [];

      // My Groups 以 myGroups 为准；controller 只作本会话乐观加入。
      final mineIds = {for (final g in mine) g.id};
      final optimisticIds = widget.chatsController.joinedGroupIds;
      final joinedFlagIds = {...mineIds, ...optimisticIds};
      final mergedPopular = [
        for (final g in popular)
          g.copyWith(isJoined: g.isJoined || joinedFlagIds.contains(g.id)),
      ];

      final joined = <PopularGroupItem>[
        for (final g in mine) g.copyWith(isJoined: true),
      ];
      // Popular 上服务端已标 isJoined 的，补进 My Groups。
      for (final g in popular) {
        if (!g.isJoined) continue;
        if (joined.any((j) => j.id == g.id)) continue;
        joined.add(g.copyWith(isJoined: true));
      }
      // 本会话刚加入、mine 尚未回写时，从 Popular 卡片乐观补一条。
      for (final id in optimisticIds) {
        if (joined.any((j) => j.id == id)) continue;
        final index = popular.indexWhere((g) => g.id == id);
        if (index < 0) continue;
        joined.add(popular[index].copyWith(isJoined: true));
      }

      setState(() {
        _popularGroups = mergedPopular;
        _joinedGroups = joined;
        _initialLoading = false;
        _loadError = popularRes.ok
            ? null
            : (popularRes.message.isEmpty
                ? 'Failed to load groups'
                : popularRes.message);
      });

      for (final g in joined) {
        if (!widget.chatsController.joinedGroupIds.contains(g.id)) {
          widget.chatsController.joinGroup(g);
        }
      }
    } catch (error) {
      if (!mounted) return;
      setState(() {
        _initialLoading = false;
        _loadError = '$error';
      });
      if (showError) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Failed to load groups: $error'),
            behavior: SnackBarBehavior.floating,
          ),
        );
      }
    }
  }

  /// 下拉刷新只刷新小组列表，不碰上方 Banner。
  Future<void> _reloadData() => _loadGroups();

  void _updatePull(double extent) {
    final next = extent.clamp(0.0, _maxPullExtent);
    final phase = next <= 0
        ? _HomeRefreshPhase.idle
        : (next >= _triggerExtent
            ? _HomeRefreshPhase.release
            : _HomeRefreshPhase.pull);
    if (next == _pullExtent && phase == _phase) return;
    setState(() {
      _pullExtent = next;
      _phase = phase;
    });
  }

  Future<void> _onPullEnd() async {
    _draggingRefresh = false;
    if (_isBusy) return;
    if (_pullExtent >= _triggerExtent) {
      setState(() {
        _phase = _HomeRefreshPhase.loading;
        _pullExtent = _statusExtent;
      });
      await _reloadData();
      if (!mounted) return;
      setState(() => _phase = _HomeRefreshPhase.success);
      await Future<void>.delayed(const Duration(milliseconds: 800));
      if (!mounted) return;
      setState(() {
        _phase = _HomeRefreshPhase.idle;
        _pullExtent = 0;
      });
      return;
    }
    setState(() {
      _phase = _HomeRefreshPhase.idle;
      _pullExtent = 0;
    });
  }

  void _onPointerMove(PointerMoveEvent event) {
    if (_isBusy) return;
    if (!_atScrollTop && _pullExtent <= 0) return;

    if (event.delta.dy > 0 && _atScrollTop) {
      _draggingRefresh = true;
      _updatePull(_pullExtent + event.delta.dy * 0.5);
      return;
    }
    if (_pullExtent > 0 && event.delta.dy != 0) {
      _draggingRefresh = true;
      _updatePull(_pullExtent + event.delta.dy);
    }
  }

  void _onPointerUp(PointerEvent event) {
    if (_draggingRefresh || _pullExtent > 0) {
      _onPullEnd();
    }
  }

  @override
  Widget build(BuildContext context) {
    final lockListScroll = _pullExtent > 0 || _isBusy;

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light,
        statusBarBrightness: Brightness.dark,
      ),
      child: ColoredBox(
        color: AppColors.background,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // 上方：Logo + Banner（固定，不随列表滚动）
            DecoratedBox(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(AppAssets.homeTopBg),
                  fit: BoxFit.cover,
                  alignment: Alignment.topCenter,
                ),
              ),
              child: SafeArea(
                bottom: false,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    HomeAppBar(
                      onSearchTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute<void>(
                            builder: (_) => HomeSearchPage(
                              chatsController: widget.chatsController,
                            ),
                          ),
                        );
                      },
                    ),
                    HomeHeroBanner(
                      banners: _banners,
                      onBannerTap: (banner) {
                        AppSchemeHelper.open(
                          context,
                          banner.link,
                          chatsController: widget.chatsController,
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
            // 下方：My Groups / Popular Groups（独立滚动 + 下拉刷新）
            AnimatedContainer(
              duration: Duration(
                milliseconds: _phase == _HomeRefreshPhase.pull ||
                        _phase == _HomeRefreshPhase.release
                    ? 0
                    : 220,
              ),
              curve: Curves.easeOut,
              height: _hintHeight,
              width: double.infinity,
              alignment: Alignment.center,
              child: _hintHeight > 8
                  ? Text(
                      _refreshHint,
                      style: const TextStyle(
                        color: AppColors.textTertiary,
                        fontSize: 13,
                        fontWeight: FontWeight.w400,
                      ),
                    )
                  : null,
            ),
            Expanded(
              child: _initialLoading
                  ? const Center(
                      child: CircularProgressIndicator(
                        color: AppColors.primaryBright,
                      ),
                    )
                  : Listener(
                      onPointerMove: _onPointerMove,
                      onPointerUp: _onPointerUp,
                      onPointerCancel: _onPointerUp,
                      child: CustomScrollView(
                        controller: _scrollController,
                        physics: lockListScroll
                            ? const NeverScrollableScrollPhysics()
                            : const AlwaysScrollableScrollPhysics(),
                        slivers: [
                          if (_loadError != null && _popularGroups.isEmpty)
                            SliverFillRemaining(
                              hasScrollBody: false,
                              child: Center(
                                child: Padding(
                                  padding: const EdgeInsets.all(24),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Text(
                                        _loadError!,
                                        textAlign: TextAlign.center,
                                        style: const TextStyle(
                                          color: AppColors.textSecondary,
                                          fontSize: 14,
                                        ),
                                      ),
                                      const SizedBox(height: 16),
                                      TextButton(
                                        onPressed: () {
                                          setState(() {
                                            _initialLoading = true;
                                            _loadError = null;
                                          });
                                          unawaited(
                                            _loadGroups(showError: true),
                                          );
                                        },
                                        child: const Text('Retry'),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          if (_joinedGroups.isNotEmpty)
                            SliverToBoxAdapter(
                              child: MyGroupsSection(
                                groups: _myGroups,
                                onMoreTap: () {
                                  Navigator.of(context).push(
                                    MaterialPageRoute<void>(
                                      builder: (_) => JoinedGroupsPage(
                                        groups: _joinedGroups,
                                        chatsController: widget.chatsController,
                                        onMembershipChanged: _setJoined,
                                      ),
                                    ),
                                  );
                                },
                                onGroupTap: (item) {
                                  final full = _joinedGroups.firstWhere(
                                    (g) => g.id == item.id,
                                    orElse: () => PopularGroupItem(
                                      id: item.id,
                                      name: item.name,
                                      category: '',
                                      description: '',
                                      avatarAsset: item.avatarAsset,
                                      avatarUrl: item.avatarUrl,
                                      memberCount: 0,
                                      postCount: 0,
                                      level: 1,
                                      isJoined: true,
                                    ),
                                  );
                                  _openGroupDetails(full);
                                },
                              ),
                            ),
                          SliverToBoxAdapter(
                            child: PopularGroupsSection(
                              groups: _popularGroups,
                              onJoinTap: (g) => unawaited(_toggleJoin(g)),
                              onGroupTap: _openGroupDetails,
                              onMembersTap: _openMembersSheet,
                            ),
                          ),
                        ],
                      ),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
