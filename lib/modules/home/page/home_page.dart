import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../app/app_jumper.dart';
import '../../../common/constants/app_assets.dart';
import '../../../common/theme/app_colors.dart';
import '../logic/home_logic.dart';
import '../../../common/extensions/wire_view.dart';
import '../../../common/models/server_client/group/group.pb.dart';
import 'widgets/home_app_bar.dart';
import 'widgets/home_feed_tabs.dart';
import 'widgets/home_hero_banner.dart';
import 'widgets/home_room_card.dart';
import 'widgets/my_groups_section.dart';
import 'widgets/popular_groups_section.dart';
import '../../../common/widgets/app_image.dart';
import '../../../common/utils/app_toast.dart';

/// 首页下拉刷新阶段文案。
enum _HomeRefreshPhase { idle, pull, release, loading, success }

/// 首页：应用栏、推广横幅、我的群组、热门群组。
///
/// 取数与加群状态在 [HomeLogic]。这里只剩 widget 那一半：下拉刷新相位机
/// 和 `ScrollController`。进群详情、已加入列表、成员弹层都走 [AppJumper]。
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  /// 还不能写成 `GetView<HomeLogic>` —— 下拉刷新相位机和 `ScrollController`
  /// 要求 `StatefulWidget`，而 `GetView` 是 `StatelessWidget`。
  final HomeLogic logic = Get.find<HomeLogic>();

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
    _scrollController.addListener(_onScroll);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      // Banner 与小组列表独立加载，互不阻塞。
      unawaited(logic.loadBanners());
      unawaited(_report(logic.loadGroups()));
    });
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    super.dispose();
  }

  /// Controller 把要弹的文案 `return` 回来（`null` = 不弹）。
  Future<void> _report(Future<String?> op) async {
    final message = await op;
    if (!mounted || message == null) return;
    AppToast.error(message);
  }

  void _onScroll() {
    if (!_scrollController.hasClients) return;
    final position = _scrollController.position;
    if (position.pixels < position.maxScrollExtent - 240) return;
    if (logic.showingGroups) {
      if (logic.initialLoading.value || logic.loadingMore.value || !logic.hasMore) return;
      unawaited(logic.loadGroups(loadMore: true));
      return;
    }
    if (logic.roomsInitialLoading.value || logic.roomsLoadingMore.value || !logic.roomsHasMore) {
      return;
    }
    unawaited(logic.loadRooms(loadMore: true));
  }

  String get _refreshHint => switch (_phase) {
    _HomeRefreshPhase.idle => '',
    _HomeRefreshPhase.pull => 'Pull down to refresh',
    _HomeRefreshPhase.release => 'Release to refresh',
    _HomeRefreshPhase.loading => 'Loading',
    _HomeRefreshPhase.success => 'Successfully loaded',
  };

  double get _hintHeight {
    if (_phase == _HomeRefreshPhase.loading || _phase == _HomeRefreshPhase.success) {
      return _statusExtent;
    }
    return _pullExtent;
  }

  bool get _isBusy => _phase == _HomeRefreshPhase.loading || _phase == _HomeRefreshPhase.success;

  bool get _atScrollTop {
    if (!_scrollController.hasClients) return true;
    return _scrollController.position.pixels <= 0;
  }

  void _openGroupDetails(GroupInfo group) {
    final latest = logic.latestGroup(group);
    AppJumper.toGroup(
      latest.gid,
      preview: latest,
      onMembershipChanged: (joined) => logic.setJoined(latest, joined),
    );
  }

  void _openMembersSheet(GroupInfo group) {
    AppJumper.showGroupMembers(
      groupId: group.gid,
      onMemberTap: (member) {
        AppJumper.back();
        WidgetsBinding.instance.addPostFrameCallback((_) {
          if (!mounted) return;
          AppJumper.toProfile(member.uid, preview: member);
        });
      },
    );
  }

  /// 下拉刷新只刷新当前 Tab。失败静默（同原版 showError: false）。
  Future<void> _reloadData() {
    if (logic.showingGroups) return logic.loadGroups();
    return logic.loadRooms();
  }

  void _updatePull(double extent) {
    final next = extent.clamp(0.0, _maxPullExtent);
    final phase = next <= 0
        ? _HomeRefreshPhase.idle
        : (next >= _triggerExtent ? _HomeRefreshPhase.release : _HomeRefreshPhase.pull);
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
              decoration: BoxDecoration(
                image: AppImage.decorationImage(
                  AppAssets.homeTopBg,
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
                        AppJumper.toHomeSearch();
                      },
                    ),
                    Obx(
                      () => HomeHeroBanner(
                        banners: logic.banners.toList(),
                        onBannerTap: (banner) {
                          AppJumper.openLink(banner.link);
                        },
                      ),
                    ),
                    Obx(
                      () => HomeFeedTabs(
                        labels: logic.feedLabels,
                        index: logic.feedIndex.value,
                        onSelected: (index) {
                          logic.selectFeed(index);
                          if (_scrollController.hasClients) _scrollController.jumpTo(0);
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
            // 下方：My Groups / Popular Groups（独立滚动 + 下拉刷新）
            AnimatedContainer(
              duration: Duration(
                milliseconds:
                    _phase == _HomeRefreshPhase.pull || _phase == _HomeRefreshPhase.release
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
              // 列表这一块整体套一个 `Obx`：里面既读 Controller 的四个 Rx，
              // 也读下拉刷新那几个 widget 字段（后者靠 setState 重建，两条路不冲突）。
              child: Obx(() => _buildList(lockListScroll)),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildList(bool lockListScroll) {
    if (!logic.showingGroups) return _buildRooms(lockListScroll);
    if (logic.initialLoading.value) {
      return const Center(child: CircularProgressIndicator(color: AppColors.primaryBright));
    }
    // `.toList` 是必须的：`PopularGroupsSection` 的 build 在 `Obx` 的 builder
    // 之外跑，光把 RxList 传下去登记不到依赖。
    final popular = logic.popularGroups.toList();
    final joined = logic.joinedGroups.toList();
    final loadError = logic.loadError.value;

    return Listener(
      onPointerMove: _onPointerMove,
      onPointerUp: _onPointerUp,
      onPointerCancel: _onPointerUp,
      child: CustomScrollView(
        controller: _scrollController,
        physics: lockListScroll
            ? const NeverScrollableScrollPhysics()
            : const AlwaysScrollableScrollPhysics(),
        slivers: [
          if (loadError != null && popular.isEmpty)
            SliverFillRemaining(
              hasScrollBody: false,
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(24),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        loadError,
                        textAlign: TextAlign.center,
                        style: const TextStyle(color: AppColors.textSecondary, fontSize: 14),
                      ),
                      const SizedBox(height: 16),
                      TextButton(
                        onPressed: () => unawaited(_report(logic.retryGroups())),
                        child: const Text('Retry'),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          if (joined.isNotEmpty)
            SliverToBoxAdapter(
              child: MyGroupsSection(
                groups: logic.joinedGroups.toList(),
                onMoreTap: () {
                  AppJumper.toJoinedGroups(
                    groups: logic.joinedGroups.toList(),
                    onMembershipChanged: logic.setJoined,
                  );
                },
                onGroupTap: _openGroupDetails,
              ),
            ),
          SliverToBoxAdapter(
            child: PopularGroupsSection(
              groups: popular,
              onJoinTap: (g) => unawaited(_report(logic.toggleJoin(g))),
              onGroupTap: _openGroupDetails,
              onMembersTap: _openMembersSheet,
            ),
          ),
          if (logic.loadingMore.value)
            const SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.fromLTRB(0, 8, 0, 20),
                child: Center(
                  child: SizedBox(
                    width: 22,
                    height: 22,
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                      color: AppColors.primaryBright,
                    ),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildRooms(bool lockListScroll) {
    if (logic.roomsInitialLoading.value && logic.rooms.isEmpty) {
      return const Center(child: CircularProgressIndicator(color: AppColors.primaryBright));
    }
    final rooms = logic.rooms.toList();
    final error = logic.roomsError.value;
    return Listener(
      onPointerMove: _onPointerMove,
      onPointerUp: _onPointerUp,
      onPointerCancel: _onPointerUp,
      child: CustomScrollView(
        controller: _scrollController,
        physics: lockListScroll ? const NeverScrollableScrollPhysics() : const AlwaysScrollableScrollPhysics(),
        slivers: [
          if (error != null && rooms.isEmpty)
            SliverFillRemaining(
              hasScrollBody: false,
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(24),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        error,
                        textAlign: TextAlign.center,
                        style: const TextStyle(color: AppColors.textSecondary, fontSize: 14),
                      ),
                      const SizedBox(height: 16),
                      TextButton(
                        onPressed: () => unawaited(logic.loadRooms()),
                        child: const Text('Retry'),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          if (rooms.isEmpty && error == null)
            const SliverFillRemaining(
              hasScrollBody: false,
              child: Center(
                child: Text('No rooms yet', style: TextStyle(color: AppColors.textSecondary, fontSize: 14)),
              ),
            ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) => HomeRoomCard(
                room: rooms[index],
                onTap: () => AppJumper.toRoom(rooms[index].rid.toInt()),
              ),
              childCount: rooms.length,
            ),
          ),
          if (logic.roomsLoadingMore.value)
            const SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.fromLTRB(0, 8, 0, 20),
                child: Center(
                  child: SizedBox(
                    width: 22,
                    height: 22,
                    child: CircularProgressIndicator(strokeWidth: 2, color: AppColors.primaryBright),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
