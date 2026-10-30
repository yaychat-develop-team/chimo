import 'dart:async';

import 'package:flutter/scheduler.dart';
import 'package:get/get.dart';

import '../../../app/app_jumper.dart';
import '../../../app/chimo_api.dart';
import '../../../common/extensions/wire_view.dart';
import '../../../common/models/server_client/group/group.pb.dart';
import '../../../common/models/server_client/home_page/home_page_main.pb.dart';
import '../../../common/models/server_client/rtc.pb.dart';
import '../../../common/utils/app_toast.dart';
import '../../chat/logic/chats_list_logic.dart';

/// 首页小组和房间列表。下拉刷新、重试、首屏都走 [loadGroups] / [loadRooms]。
class HomeLogic extends GetxController {
  /// 加群状态以会话列表为准（乐观加入和换号清零都在那边）。
  final ConversationListLogic chats = Get.find<ConversationListLogic>();

  final RxList<GroupInfo> popularGroups = <GroupInfo>[].obs;
  final RxList<GroupInfo> joinedGroups = <GroupInfo>[].obs;
  final RxList<HomeBannerItem> banners = <HomeBannerItem>[].obs;

  final RxList<HomeRoomItem> rooms = <HomeRoomItem>[].obs;
  final RxList<HotStoryInfo> hotStories = <HotStoryInfo>[].obs;
  final RxBool roomsInitialLoading = false.obs;
  final RxBool roomsLoadingMore = false.obs;
  final RxnString roomsError = RxnString();

  bool roomsHasMore = true;
  int roomsPage = 1;
  String? _roomsSnapshot;
  List<HomeTabItem> _roomTabs = const [];

  final RxBool initialLoading = true.obs;
  final RxBool loadingMore = false.obs;
  final RxnString loadError = RxnString();

  bool hasMore = true;
  int pageNum = 1;
  static const int pageSize = 20;
  static const int roomPageSize = 8;

  HomeTabItem? get _roomTab => _roomTabs.isEmpty ? null : _roomTabs.first;

  @override
  void onInit() {
    super.onInit();
    chats.addListener(syncMembershipFromChats);
  }

  @override
  void onReady() {
    super.onReady();
    unawaited(loadBanners());
    unawaited(loadHotStories());
    unawaited(loadGroups());
  }

  @override
  void onClose() {
    chats.removeListener(syncMembershipFromChats);
    super.onClose();
  }

  /// 群详情、已加入列表或会话列表改了加群状态后，回流到首页两张列表。
  void syncMembershipFromChats() {
    final ids = chats.joinedGroupIds;
    final joinedIds = {for (final group in joinedGroups) group.gid};
    final staleJoined = joinedGroups.any((group) => !ids.contains(group.gid));
    final popularMismatch = popularGroups.any(
      (group) => group.isJoin != ids.contains(group.gid),
    );
    final missingJoined = popularGroups.any(
      (group) => ids.contains(group.gid) && !joinedIds.contains(group.gid),
    );
    if (!staleJoined && !popularMismatch && !missingJoined) return;

    final nextPopular = [
      for (final group in popularGroups)
        group.withJoined(ids.contains(group.gid)),
    ];
    final nextJoined = [
      for (final group in joinedGroups)
        if (ids.contains(group.gid)) group.withJoined(true),
    ];
    final nextJoinedIds = {for (final group in nextJoined) group.gid};
    for (final group in nextPopular) {
      if (ids.contains(group.gid) && nextJoinedIds.add(group.gid)) {
        nextJoined.add(group);
      }
    }
    popularGroups.assignAll(nextPopular);
    joinedGroups.assignAll(nextJoined);
  }

  /// 用列表里最新的那份，避免乐观加入后闭包还拿着旧的 `isJoin`。
  GroupInfo _latest(GroupInfo group) {
    for (final item in popularGroups) {
      if (item.gid == group.gid) return item;
    }
    for (final item in joinedGroups) {
      if (item.gid == group.gid) return item;
    }
    return group;
  }

  /// 两张列表和会话列表一起改。加群失败时再调一次（`joined: false`）回滚。
  void setJoined(GroupInfo group, bool joined) {
    final popularIndex = popularGroups.indexWhere(
      (item) => item.gid == group.gid,
    );
    if (popularIndex >= 0) {
      popularGroups[popularIndex] = popularGroups[popularIndex].withJoined(
        joined,
      );
    }

    if (joined) {
      final updated = (popularIndex >= 0 ? popularGroups[popularIndex] : group)
          .withJoined(true);
      final joinedIndex = joinedGroups.indexWhere(
        (item) => item.gid == group.gid,
      );
      if (joinedIndex < 0) {
        joinedGroups.add(updated);
      } else {
        joinedGroups[joinedIndex] = updated;
      }
      chats.joinGroup(updated);
      return;
    }

    joinedGroups.removeWhere((item) => item.gid == group.gid);
    chats.leaveGroup(group.gid);
  }

  void openGroup(GroupInfo group) {
    final latest = _latest(group);
    AppJumper.toGroup(
      latest.gid,
      preview: latest,
      onMembershipChanged: (joined) => setJoined(latest, joined),
    );
  }

  /// 先关掉成员弹层再进资料页，避免返回时弹层还盖在上面。
  void openMembers(GroupInfo group) {
    AppJumper.showGroupMembers(
      groupId: group.gid,
      onMemberTap: (member) {
        AppJumper.back();
        SchedulerBinding.instance.addPostFrameCallback((_) {
          AppJumper.toProfile(member.uid, preview: member);
        });
      },
    );
  }

  /// 房间下拉刷新：房间列表和热门故事一起重取。
  Future<void> onRefresh() async {
    await loadRooms();
    await loadHotStories();
  }

  /// 失败时保留上一次的故事，不影响房间列表。
  Future<void> loadHotStories() async {
    try {
      final res = await ChimoApis.room.hotStories();
      if (!res.ok) return;
      hotStories.assignAll(res.data?.hotStoryList ?? const <HotStoryInfo>[]);
    } catch (_) {}
  }

  /// 已加入则忽略。失败回滚并 toast。
  Future<void> join(GroupInfo group) async {
    final latest = _latest(group);
    if (latest.isJoin) return;
    setJoined(latest, true);
    try {
      final res = await ChimoApis.group.join([latest.gid]);
      if (res.ok) return;
      setJoined(latest, false);
      AppToast.error(res.message.isEmpty ? 'Join failed' : res.message);
    } catch (failure) {
      setJoined(latest, false);
      AppToast.error('Join failed: $failure');
    }
  }

  /// 横幅失败不影响小组列表。拿到房间分类后再拉房间。
  Future<void> loadBanners() async {
    try {
      final homeRes = await ChimoApis.home.homeMain();
      if (!homeRes.ok) return;
      final data = homeRes.data;
      if (data == null) return;
      banners.assignAll([
        for (final banner in data.banners)
          if (banner.type == HomeBannerItem_Type.image ||
              banner.type == HomeBannerItem_Type.unknown)
            banner,
      ]);
      _roomTabs = [
        for (final tab in data.tabs)
          if (tab.type == HomeTabItem_Type.room && tab.id.isNotEmpty) tab,
      ];
      if (rooms.isEmpty && _roomTab != null) unawaited(loadRooms());
    } catch (_) {}
  }

  Future<void> loadRooms({bool loadMore = false}) async {
    final tab = _roomTab;
    if (tab == null) return;
    if (loadMore) {
      if (roomsLoadingMore.value || !roomsHasMore) return;
      roomsLoadingMore.value = true;
    } else {
      roomsPage = 1;
      roomsHasMore = true;
      _roomsSnapshot = null;
      roomsError.value = null;
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
      if (!res.ok && res.isNotLogin) {
        AppJumper.toLoginAndClear();
        return;
      }
      final data = res.data;
      final page = [
        for (final item in data?.items ?? const <HomeListItem>[])
          if (item.hasRoom() && item.room.rid.toInt() > 0) item.room,
      ];
      if (loadMore) {
        final seen = {for (final room in rooms) room.rid.toInt()};
        rooms.addAll([
          for (final room in page)
            if (seen.add(room.rid.toInt())) room,
        ]);
      } else {
        rooms.assignAll(page);
      }
      _roomsSnapshot = data?.snapshotId;
      roomsHasMore = page.length >= roomPageSize;
      roomsPage = requestPage + 1;
      roomsError.value = res.ok
          ? null
          : (res.message.isEmpty ? 'Failed to load rooms' : res.message);
    } catch (failure) {
      roomsError.value = '$failure';
    } finally {
      roomsInitialLoading.value = false;
      roomsLoadingMore.value = false;
    }
  }

  Future<void> loadGroups({bool loadMore = false}) async {
    if (loadMore) {
      if (loadingMore.value || !hasMore) return;
      loadingMore.value = true;
    } else {
      pageNum = 1;
      hasMore = true;
      loadError.value = null;
      if (popularGroups.isEmpty) initialLoading.value = true;
    }
    try {
      await chats.ensureBoundToCurrentUser();
      final requestPage = pageNum;
      final popularRes = await ChimoApis.group.list(
        pageNum: requestPage,
        pageSize: pageSize,
      );
      final mineRes = await ChimoApis.group.myGroups();

      if (!popularRes.ok && popularRes.isNotLogin) {
        AppJumper.toLoginAndClear();
        return;
      }

      final popular = popularRes.data ?? const <GroupInfo>[];
      final mine = mineRes.data ?? const <GroupInfo>[];
      final joinedFlagIds = {
        for (final group in mine) group.gid,
        ...chats.joinedGroupIds,
      };
      final mergedPopularPage = [
        for (final group in popular)
          group.withJoined(group.isJoin || joinedFlagIds.contains(group.gid)),
      ];
      final seen = {for (final group in popularGroups) group.gid};
      final mergedPopular = loadMore
          ? [
              ...popularGroups,
              for (final group in mergedPopularPage)
                if (seen.add(group.gid)) group,
            ]
          : mergedPopularPage;

      // myGroups 为准；Popular 上已加入（含本会话乐观加入）的补进 My Groups。
      final joinedIds = <String>{};
      final joined = <GroupInfo>[
        for (final group in mine)
          if (joinedIds.add(group.gid)) group.withJoined(true),
      ];
      for (final group in mergedPopular) {
        if (group.isJoin && joinedIds.add(group.gid)) {
          joined.add(group.withJoined(true));
        }
      }

      popularGroups.assignAll(mergedPopular);
      joinedGroups.assignAll(joined);
      hasMore = popular.length >= pageSize;
      pageNum = requestPage + 1;
      loadError.value = popularRes.ok
          ? null
          : (popularRes.message.isEmpty
                ? 'Failed to load groups'
                : popularRes.message);

      for (final group in joined) {
        if (!chats.joinedGroupIds.contains(group.gid)) chats.joinGroup(group);
      }
    } catch (failure) {
      loadError.value = '$failure';
    } finally {
      initialLoading.value = false;
      loadingMore.value = false;
    }
  }
}
