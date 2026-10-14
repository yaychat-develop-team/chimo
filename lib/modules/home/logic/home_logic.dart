import 'package:get/get.dart';

import '../../../app/app_jumper.dart';
import '../../../app/chimo_api.dart';
import '../../../common/extensions/wire_view.dart';
import '../../../common/models/server_client/group/group.pb.dart';
import '../../../common/models/server_client/home_page/home_page_main.pb.dart';
import '../../chat/logic/chats_list_logic.dart';

/// 首页（Home Tab）的取数与加群状态。
///
/// **留在 View 的**：手搓的下拉刷新相位机（`_pullExtent` / `_phase`）与
/// `ScrollController`。那些是 widget 的手势状态，不是会话数据。
///
/// 没有 `onReady` 自动取数：原版是 `initState` 里 `addPostFrameCallback` 发两条
/// 独立请求，且失败提示只在首次 / Retry 弹（下拉刷新与翻页静默）。**谁触发谁提
/// 示**，所以取数由 View 调，方法把要弹的文案 `return` 回去，`null` = 不提示。
class HomeLogic extends GetxController {
  /// 会话列表：加群状态的唯一事实来源（乐观加入 + 换号清零都在它那边）。
  final ChatsListLogic chats = Get.find<ChatsListLogic>();

  final RxList<GroupInfo> popularGroups = <GroupInfo>[].obs;
  final RxList<GroupInfo> joinedGroups = <GroupInfo>[].obs;
  final RxList<HomeBannerItem> banners = <HomeBannerItem>[].obs;

  /// 0 是群组，后面每一项对应 [roomTabs] 里的一个房间 Tab。
  final RxInt feedIndex = 0.obs;
  final RxList<HomeTabItem> roomTabs = <HomeTabItem>[].obs;
  final RxList<HomeRoomItem> rooms = <HomeRoomItem>[].obs;
  final RxBool roomsInitialLoading = false.obs;
  final RxBool roomsLoadingMore = false.obs;
  final RxnString roomsError = RxnString();

  bool roomsHasMore = true;
  int roomsPage = 1;
  String? _roomsSnapshot;
  String? _loadedRoomTabId;

  final RxBool initialLoading = true.obs;
  final RxBool loadingMore = false.obs;
  final RxnString loadError = RxnString();

  /// 翻页游标。只在 `_onScroll` / [loadGroups] 里读写，不进 build，所以是普通字段。
  bool hasMore = true;
  int pageNum = 1;
  static const int pageSize = 20;
  static const int roomPageSize = 8;

  @override
  void onInit() {
    super.onInit();
    chats.addListener(syncMembershipFromChats);
  }

  @override
  void onClose() {
    chats.removeListener(syncMembershipFromChats);
    super.onClose();
  }

  /// 别处（群详情 / 已加入列表 / 会话列表）改了加群状态后回流到首页两张列表。
  void syncMembershipFromChats() {
    final ids = chats.joinedGroupIds;
    final staleJoined = joinedGroups.any((g) => !ids.contains(g.gid));
    final popularMismatch = popularGroups.any((g) => g.isJoin != ids.contains(g.gid));
    final missingJoined = popularGroups.any(
      (g) => ids.contains(g.gid) && !joinedGroups.any((j) => j.gid == g.gid),
    );
    if (!staleJoined && !popularMismatch && !missingJoined) return;

    final nextPopular = [for (final g in popularGroups) g.withJoined(ids.contains(g.gid))];
    final nextJoined = [
      for (final g in joinedGroups)
        if (ids.contains(g.gid)) g.withJoined(true),
    ];
    for (final g in nextPopular) {
      if (!ids.contains(g.gid)) continue;
      if (nextJoined.any((j) => j.gid == g.gid)) continue;
      nextJoined.add(g);
    }
    if (isClosed) return;
    popularGroups.assignAll(nextPopular);
    joinedGroups.assignAll(nextJoined);
  }

  bool get showingGroups => feedIndex.value == 0;

  HomeTabItem? get selectedRoomTab {
    final index = feedIndex.value - 1;
    if (index < 0 || index >= roomTabs.length) return null;
    return roomTabs[index];
  }

  List<String> get feedLabels => [
    'Groups',
    if (roomTabs.isEmpty) 'Rooms',
    for (final tab in roomTabs) tab.name.trim().isEmpty ? 'Rooms' : tab.name.trim(),
  ];

  void selectFeed(int index) {
    if (index == feedIndex.value || index < 0 || index >= feedLabels.length) return;
    feedIndex.value = index;
    final tab = selectedRoomTab;
    if (tab == null) return;
    if (tab.id != _loadedRoomTabId) {
      rooms.clear();
      roomsPage = 1;
      roomsHasMore = true;
      _roomsSnapshot = null;
      roomsError.value = null;
      _loadedRoomTabId = null;
    }
    if (rooms.isEmpty) {
      loadRooms();
    }
  }

  /// 取当前列表里最新的那份（乐观加入后 `isJoin` 已经变了，别用旧闭包里的）。
  GroupInfo latestGroup(GroupInfo group) {
    for (final item in popularGroups) {
      if (item.gid == group.gid) return item;
    }
    for (final item in joinedGroups) {
      if (item.gid == group.gid) return item;
    }
    return group;
  }

  /// 两张列表 + 会话列表一起改。加群失败时原样再调一次（`joined: false`）回滚。
  void setJoined(GroupInfo group, bool joined) {
    late GroupInfo updated;
    final popularIndex = popularGroups.indexWhere((item) => item.gid == group.gid);
    if (popularIndex >= 0) {
      popularGroups[popularIndex] = popularGroups[popularIndex].withJoined(joined);
    }

    final joinedIndex = joinedGroups.indexWhere((item) => item.gid == group.gid);
    if (joined) {
      updated = (popularIndex >= 0 ? popularGroups[popularIndex] : group).withJoined(true);
      if (joinedIndex < 0) {
        joinedGroups.add(updated);
      } else {
        joinedGroups[joinedIndex] = updated;
      }
    } else {
      updated = group.withJoined(false);
      joinedGroups.removeWhere((item) => item.gid == group.gid);
    }

    if (joined) {
      chats.joinGroup(updated);
    } else {
      chats.leaveGroup(group.gid);
    }
  }

  /// 加群：先乐观置上，失败回滚并把文案交给 View 弹。
  Future<String?> toggleJoin(GroupInfo group) async {
    final latest = latestGroup(group);
    if (latest.isJoin) return null;

    setJoined(latest, true);

    try {
      final res = await ChimoApis.group.join([latest.gid]);
      if (isClosed) return null;
      if (!res.ok) {
        setJoined(latest, false);
        return res.message.isEmpty ? 'Join failed' : res.message;
      }
    } catch (failure) {
      if (isClosed) return null;
      setJoined(latest, false);
      return 'Join failed: $failure';
    }
    return null;
  }

  Future<void> loadBanners() async {
    try {
      final homeRes = await ChimoApis.home.homeMain();
      if (isClosed || !homeRes.ok) return;
      final data = homeRes.data;
      if (data == null) return;
      banners.assignAll([
        for (final banner in data.banners)
          if (banner.type == HomeBannerItem_Type.image || banner.type == HomeBannerItem_Type.unknown)
            banner,
      ]);
      final nextTabs = [
        for (final tab in data.tabs)
          if (tab.type == HomeTabItem_Type.room && tab.id.isNotEmpty) tab,
      ];
      roomTabs.assignAll(nextTabs);
      if (feedIndex.value > feedLabels.length - 1) feedIndex.value = 0;
      if (!showingGroups && rooms.isEmpty && selectedRoomTab != null) {
        loadRooms();
      }
    } catch (_) {
      // Banner 失败不影响下方小组列表。
    }
  }

  Future<String?> loadRooms({bool loadMore = false}) async {
    final tab = selectedRoomTab;
    if (tab == null) return null;
    if (loadMore) {
      if (roomsLoadingMore.value || !roomsHasMore) return null;
      roomsLoadingMore.value = true;
    } else {
      roomsPage = 1;
      roomsHasMore = true;
      _roomsSnapshot = null;
      if (rooms.isEmpty) roomsInitialLoading.value = true;
    }
    try {
      final requestPage = roomsPage;
      final res = await ChimoApis.home.homeTabList(
        tabId: tab.id,
        pageNum: requestPage,
        pageSize: roomPageSize,
        snapshotId: _roomsSnapshot,
      );
      if (isClosed) return null;
      if (!res.ok && res.isNotLogin) {
        AppJumper.toLoginAndClear();
        return null;
      }
      final data = res.data;
      final page = [
        for (final item in data?.items ?? const <HomeListItem>[])
          if (item.hasRoom() && item.room.rid.toInt() > 0) item.room,
      ];
      if (loadMore) {
        final seen = {for (final room in rooms) room.rid.toInt()};
        rooms.addAll([for (final room in page) if (seen.add(room.rid.toInt())) room]);
      } else {
        rooms.assignAll(page);
      }
      _loadedRoomTabId = tab.id;
      _roomsSnapshot = data?.snapshotId;
      roomsHasMore = page.length >= roomPageSize;
      roomsPage = requestPage + 1;
      roomsInitialLoading.value = false;
      roomsLoadingMore.value = false;
      roomsError.value = res.ok ? null : (res.message.isEmpty ? 'Failed to load rooms' : res.message);
      return null;
    } catch (failure) {
      if (isClosed) return null;
      roomsInitialLoading.value = false;
      roomsLoadingMore.value = false;
      roomsError.value = '$failure';
      return 'Failed to load rooms: $failure';
    }
  }

  /// Retry 按钮：先回到 loading 态再重取（原版就是这两步）。
  Future<String?> retryGroups() {
    initialLoading.value = true;
    loadError.value = null;
    return loadGroups();
  }

  /// 返回值 = 要弹的文案，`null` = 不弹。首次进页与 Retry 弹，下拉刷新与翻页不弹。
  Future<String?> loadGroups({bool loadMore = false}) async {
    if (loadMore) {
      if (loadingMore.value || !hasMore) return null;
      loadingMore.value = true;
    } else {
      pageNum = 1;
      hasMore = true;
    }
    try {
      await chats.ensureBoundToCurrentUser();
      final requestPage = pageNum;
      final popularFuture = ChimoApis.group.list(pageNum: requestPage, pageSize: pageSize);
      final mineFuture = ChimoApis.group.myGroups();
      final popularRes = await popularFuture;
      final mineRes = await mineFuture;

      if (isClosed) return null;

      if (!popularRes.ok && popularRes.isNotLogin) {
        AppJumper.toLoginAndClear();
        return null;
      }

      final popular = popularRes.data ?? const <GroupInfo>[];
      final mine = mineRes.data ?? const <GroupInfo>[];

      // My Groups 以 myGroups 为准；controller 只作本会话乐观加入。
      final mineIds = {for (final g in mine) g.gid};
      final optimisticIds = chats.joinedGroupIds;
      final joinedFlagIds = {...mineIds, ...optimisticIds};
      final mergedPopularPage = [
        for (final g in popular) g.withJoined(g.isJoin || joinedFlagIds.contains(g.gid)),
      ];
      final mergedPopular = loadMore
          ? [
              ...popularGroups,
              for (final g in mergedPopularPage)
                if (!popularGroups.any((old) => old.gid == g.gid)) g,
            ]
          : mergedPopularPage;

      final joined = <GroupInfo>[for (final g in mine) g.withJoined(true)];
      // Popular 上服务端已标 isJoin 的，补进 My Groups。
      for (final g in mergedPopular) {
        if (!g.isJoin) continue;
        if (joined.any((j) => j.gid == g.gid)) continue;
        joined.add(g.withJoined(true));
      }
      // 本会话刚加入、mine 尚未回写时，从 Popular 卡片乐观补一条。
      for (final id in optimisticIds) {
        if (joined.any((j) => j.gid == id)) continue;
        final index = mergedPopular.indexWhere((g) => g.gid == id);
        if (index < 0) continue;
        joined.add(mergedPopular[index].withJoined(true));
      }

      popularGroups.assignAll(mergedPopular);
      joinedGroups.assignAll(joined);
      initialLoading.value = false;
      loadingMore.value = false;
      hasMore = popular.length >= pageSize;
      pageNum = requestPage + 1;
      loadError.value = popularRes.ok
          ? null
          : (popularRes.message.isEmpty ? 'Failed to load groups' : popularRes.message);

      for (final g in joined) {
        if (!chats.joinedGroupIds.contains(g.gid)) {
          chats.joinGroup(g);
        }
      }
      return null;
    } catch (failure) {
      if (isClosed) return null;
      initialLoading.value = false;
      loadingMore.value = false;
      loadError.value = '$failure';
      return 'Failed to load groups: $failure';
    }
  }
}
