import 'package:get/get.dart';

import '../../../app/chimo_api.dart';
import '../../../common/models/server_client/rtc.pb.dart';

/// 房间内 More Rooms 侧栏：Saved + For You。
///
/// 数据对齐 joyride `RoomDrawerController` / `RoomDrawerSubController`
///（`/rtc/channel-tags` + `/rtc/sidebar`）；Saved 优先用收藏列表，
/// 没有则回落到名称含 Saved/收藏 的 tag。
class MoreRoomsLogic extends GetxController {
  static const pageSize = 20;
  static const tag = 'RoomMoreRooms';

  final RxList<Channel> saved = <Channel>[].obs;
  final RxList<Channel> forYou = <Channel>[].obs;
  final RxBool loading = true.obs;
  final RxBool loadingMore = false.obs;
  final RxnString error = RxnString();

  bool hasMore = true;
  int _page = 1;
  String? _snapshotId;
  String? _forYouTagId;

  static MoreRoomsLogic create() {
    if (Get.isRegistered<MoreRoomsLogic>(tag: tag)) {
      return Get.find<MoreRoomsLogic>(tag: tag);
    }
    return Get.put(MoreRoomsLogic(), tag: tag);
  }

  static MoreRoomsLogic? findOrNull() {
    if (!Get.isRegistered<MoreRoomsLogic>(tag: tag)) return null;
    return Get.find<MoreRoomsLogic>(tag: tag);
  }

  static void release() {
    if (Get.isRegistered<MoreRoomsLogic>(tag: tag)) {
      Get.delete<MoreRoomsLogic>(tag: tag, force: true);
    }
  }

  @override
  void onReady() {
    super.onReady();
    load();
  }

  Future<void> load() async {
    loading.value = true;
    error.value = null;
    // 刷新时保留旧列表，拿到新数据后再 assignAll，避免闪空。
    hasMore = true;
    _page = 1;
    _snapshotId = null;

    try {
      final tagsRes = await ChimoApis.room.channelTags();
      if (isClosed) return;
      final tags = tagsRes.data?.tag ?? const <ChannelTagItem>[];
      final savedTag = _pickSavedTag(tags);
      final forYouTag = _pickForYouTag(tags, savedTag);

      await Future.wait([
        _loadSaved(savedTag),
        if (forYouTag != null) _loadForYou(forYouTag, reset: true),
      ]);

      if (forYouTag == null && forYou.isEmpty && !isClosed) {
        error.value = tagsRes.ok
            ? (tagsRes.message.isEmpty ? null : tagsRes.message)
            : (tagsRes.message.isEmpty ? 'Failed to load rooms' : tagsRes.message);
      }
    } catch (e) {
      if (!isClosed) error.value = '$e';
    } finally {
      if (!isClosed) loading.value = false;
    }
  }

  Future<void> loadMore() async {
    if (loadingMore.value || !hasMore || _forYouTagId == null) return;
    loadingMore.value = true;
    try {
      await _loadForYou(ChannelTagItem(tagId: _forYouTagId), reset: false);
    } finally {
      if (!isClosed) loadingMore.value = false;
    }
  }

  Future<void> _loadSaved(ChannelTagItem? savedTag) async {
    final collectRes = await ChimoApis.room.collectList();
    if (isClosed) return;
    if (collectRes.ok && collectRes.data != null) {
      final channels = [
        for (final item in collectRes.data!.contentList)
          if (item.hasChannel() && item.channel.channelId.toInt() > 0) item.channel,
      ];
      if (channels.isNotEmpty) {
        saved.assignAll(channels);
        return;
      }
    }
    if (savedTag == null || savedTag.tagId.isEmpty) return;
    final res = await ChimoApis.room.sidebar(tagId: savedTag.tagId, pageSize: 30);
    if (isClosed || !res.ok || res.data == null) return;
    saved.assignAll([
      for (final c in res.data!.sidebar.channelList)
        if (c.channelId.toInt() > 0) c,
    ]);
  }

  Future<void> _loadForYou(ChannelTagItem tagItem, {required bool reset}) async {
    final tagId = tagItem.tagId;
    if (tagId.isEmpty) return;
    _forYouTagId = tagId;
    final page = reset ? 1 : _page;
    final res = await ChimoApis.room.sidebar(
      tagId: tagId,
      pageNum: page,
      pageSize: pageSize,
      snapshotId: reset ? null : _snapshotId,
    );
    if (isClosed) return;
    if (!res.ok || res.data == null) {
      if (reset) {
        error.value = res.message.isEmpty ? 'Failed to load rooms' : res.message;
      }
      return;
    }
    final list = [
      for (final c in res.data!.sidebar.channelList)
        if (c.channelId.toInt() > 0) c,
    ];
    if (reset) {
      _snapshotId = res.data!.sidebar.snapshotId;
      forYou.assignAll(list);
    } else {
      final seen = {for (final c in forYou) c.channelId.toInt()};
      forYou.addAll([
        for (final c in list)
          if (seen.add(c.channelId.toInt())) c,
      ]);
    }
    hasMore = list.length >= pageSize;
    _page = page + 1;
    error.value = null;
  }

  ChannelTagItem? _pickSavedTag(List<ChannelTagItem> tags) {
    for (final tag in tags) {
      final name = tag.tagName.toLowerCase();
      if (name.contains('saved') ||
          name.contains('收藏') ||
          name.contains('collect') ||
          name.contains('follow')) {
        return tag;
      }
    }
    return null;
  }

  ChannelTagItem? _pickForYouTag(List<ChannelTagItem> tags, ChannelTagItem? savedTag) {
    ChannelTagItem? fallback;
    for (final tag in tags) {
      if (savedTag != null && tag.tagId == savedTag.tagId) continue;
      fallback ??= tag;
      final name = tag.tagName.toLowerCase();
      if (name.contains('for you') ||
          name.contains('foryou') ||
          name.contains('推荐') ||
          name.contains('热门') ||
          name.contains('popular') ||
          name.contains('hot')) {
        return tag;
      }
    }
    return fallback ?? (tags.isEmpty ? null : tags.first);
  }
}
