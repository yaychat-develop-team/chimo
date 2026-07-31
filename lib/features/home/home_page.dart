import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../core/constants/app_assets.dart';
import '../../core/theme/app_colors.dart';
import '../chats/data/chats_list_controller.dart';
import 'data/home_mock_data.dart';
import 'chat_user_profile_page.dart';
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

/// Home pull-to-refresh phase labels.
enum _HomeRefreshPhase {
  idle,
  pull,
  release,
  loading,
  success,
}

/// Home: app bar, promo banner, My Groups, Popular Groups.
class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.chatsController});

  /// Shared with shell: sync chat list on join / leave.
  final ChatsListController chatsController;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late List<PopularGroupItem> _popularGroups;
  late List<PopularGroupItem> _joinedGroups;

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
    _popularGroups = List.of(HomeMockData.popularGroups);
    _joinedGroups = [
      for (final group in _popularGroups)
        if (group.isJoined) group,
    ];
    // Sync home membership from any join/leave entry (independent of chat existence).
    widget.chatsController.addListener(_syncMembershipFromController);
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
        _popularGroups[popularIndex] =
            _popularGroups[popularIndex].copyWith(isJoined: joined);
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
          _joinedGroups[joinedIndex] = updated;
        }
      } else if (joinedIndex >= 0) {
        updated = group.copyWith(isJoined: false);
        _joinedGroups = [
          for (var i = 0; i < _joinedGroups.length; i++)
            if (i != joinedIndex) _joinedGroups[i],
        ];
      } else {
        updated = group.copyWith(isJoined: false);
      }
    });

    if (joined) {
      widget.chatsController.joinGroup(updated);
    } else {
      widget.chatsController.leaveGroup(group.id);
    }
  }

  void _toggleJoin(PopularGroupItem group) {
    _setJoined(group, !group.isJoined);
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

  Future<void> _reloadData() async {
    await Future<void>.delayed(const Duration(milliseconds: 900));
    if (!mounted) return;
    setState(() {
      final joinedIds = {for (final group in _joinedGroups) group.id};
      _popularGroups = [
        for (final group in HomeMockData.popularGroups)
          group.copyWith(isJoined: joinedIds.contains(group.id)),
      ];
      _joinedGroups = [
        for (final group in _joinedGroups)
          () {
            for (final popular in _popularGroups) {
              if (popular.id == group.id) return popular;
            }
            return group;
          }(),
      ];
    });
  }

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
                    const HomeHeroBanner(),
                  ],
                ),
              ),
            ),
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
              child: Listener(
                onPointerMove: _onPointerMove,
                onPointerUp: _onPointerUp,
                onPointerCancel: _onPointerUp,
                child: CustomScrollView(
                  controller: _scrollController,
                  physics: lockListScroll
                      ? const NeverScrollableScrollPhysics()
                      : const AlwaysScrollableScrollPhysics(),
                  slivers: [
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
                              orElse: () => HomeMockData.resolveGroup(
                                id: item.id,
                                name: item.name,
                              ),
                            );
                            _openGroupDetails(full);
                          },
                        ),
                      ),
                    SliverToBoxAdapter(
                      child: PopularGroupsSection(
                        groups: _popularGroups,
                        onJoinTap: _toggleJoin,
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
