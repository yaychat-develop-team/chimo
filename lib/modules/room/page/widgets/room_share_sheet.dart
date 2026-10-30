import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../app/app_jumper.dart';
import '../../../../app/chimo_api.dart';
import '../../../../common/constants/app_assets.dart';
import '../../../../common/extensions/wire_view.dart';
import '../../../../common/models/server_client/user.pb.dart';
import '../../../../common/theme/app_bottom_sheet.dart';
import '../../../../common/theme/app_colors.dart';
import '../../../../common/utils/app_toast.dart';
import '../../../../common/widgets/app_image.dart';
import '../../../chat/logic/chats_list_logic.dart';
import '../../../chat/model/chat_conversation.dart';
import '../../service/room_service.dart';
import 'package:chimo/common/utils/chimo.dart';

/// 分享房间。UI 对齐 Cosmic Lounge；能力对齐 joyride `RoomSharePage`。
Future<void> showRoomShareSheet() {
  final service = RoomService.findOrNull();
  if (service == null || !service.inRoom.value) {
    AppToast.info('Not in a room');
    return Future.value();
  }
  return AppBottomSheet.show<void>(
    isScrollControlled: true,
    child: _RoomShareSheet(service: service),
  );
}

enum _ShareTab { recent, friends }

class _ShareTarget {
  const _ShareTarget({
    required this.uid,
    required this.name,
    required this.avatar,
    required this.isMale,
  });

  final int uid;
  final String name;
  final String avatar;
  final bool isMale;
}

class _RoomShareSheet extends StatefulWidget {
  const _RoomShareSheet({required this.service});

  final RoomService service;

  @override
  State<_RoomShareSheet> createState() => _RoomShareSheetState();
}

class _RoomShareSheetState extends State<_RoomShareSheet> {
  final _tab = _ShareTab.recent.obs;
  final _recent = <_ShareTarget>[].obs;
  final _friends = <_ShareTarget>[].obs;
  final _loadingRecent = false.obs;
  final _loadingFriends = false.obs;
  final _sharing = <int>{}.obs;
  final _shared = <int>{}.obs;

  @override
  void initState() {
    super.initState();
    _loadRecent();
    _loadFriends();
  }

  /// 会话 id 多为 `dm_<环信账号>`，邀请接口要业务数字 uid。
  Future<int> _resolveShareUid(ChatConversation c) async {
    final parsed = c.parsedAppUid;
    if (parsed > 0) return parsed;
    final em = c.emUserName.trim().isNotEmpty ? c.emUserName.trim() : _emFromConversationId(c.id);
    if (em.isEmpty) return 0;
    // 纯数字 em 极少见，但仍可当作 uid。
    final asUid = int.tryParse(em);
    if (asUid != null && asUid > 0) return asUid;
    try {
      final res = await ChimoApis.relation.msgUser(em);
      final id = res.data?.id.toInt() ?? 0;
      if (id > 0 && Get.isRegistered<ConversationListLogic>()) {
        Get.find<ConversationListLogic>().rememberPeerAppUid(emUserName: em, appUid: '$id');
      }
      return id;
    } catch (_) {
      return 0;
    }
  }

  String _emFromConversationId(String id) {
    var bare = id.trim();
    if (bare.startsWith('dm_')) bare = bare.substring(3);
    if (bare.startsWith('sys_')) bare = bare.substring(4);
    // 环信账号通常含字母 / 横线；纯数字是业务 uid，不是 em。
    if (bare.isEmpty || int.tryParse(bare) != null) return '';
    return bare;
  }

  Future<void> _loadRecent() async {
    _loadingRecent.value = true;
    if (!Get.isRegistered<ConversationListLogic>()) {
      _recent.clear();
      _loadingRecent.value = false;
      return;
    }
    final chats = Get.find<ConversationListLogic>().visibleConversations
        .where((c) => c.badge != ChatBadgeType.group && !c.isSystem)
        .toList();
    final resolved = await Future.wait(
      chats.map((c) async {
        final uid = await _resolveShareUid(c);
        if (uid <= 0) return null;
        return _ShareTarget(
          uid: uid,
          name: c.title.trim().isEmpty ? 'User' : c.title.trim(),
          avatar: (c.avatarUrl ?? '').trim(),
          isMale: c.isMale,
        );
      }),
    );
    if (!mounted) return;
    final out = <_ShareTarget>[];
    final seen = <int>{};
    for (final item in resolved) {
      if (item == null || !seen.add(item.uid)) continue;
      out.add(item);
    }
    _recent.assignAll(out);
    _loadingRecent.value = false;
  }

  Future<void> _loadFriends() async {
    _loadingFriends.value = true;
    final res = await ChimoApis.relation.searchFriends(pageSize: 100);
    if (!mounted) return;
    _friends.assignAll([
      for (final user in res.data ?? const <User>[])
        if (user.id.toInt() > 0)
          _ShareTarget(
            uid: user.id.toInt(),
            name: user.nickname.trim().isEmpty ? 'User' : user.nickname.trim(),
            avatar: user.shownAvatar,
            isMale: user.male,
          ),
    ]);
    _loadingFriends.value = false;
    if (!res.ok && _friends.isEmpty) {
      AppToast.error(res.message.isEmpty ? 'Failed to load friends' : res.message);
    }
  }

  Future<void> _share(_ShareTarget target) async {
    if (_shared.contains(target.uid) || _sharing.contains(target.uid)) return;
    _sharing.add(target.uid);
    final failure = await widget.service.inviteFriend(target.uid);
    _sharing.remove(target.uid);
    if (failure != null) {
      AppToast.error(failure);
      return;
    }
    _shared.add(target.uid);
  }

  @override
  Widget build(BuildContext context) {
    final bottom = MediaQuery.paddingOf(context).bottom;
    return DecoratedBox(
      decoration: BoxDecoration(
        color: const Color(0xFF16161E),
        borderRadius: BorderRadius.vertical(top: Radius.circular(24.r)),
      ),
      child: SizedBox(
        height: 0.68.sh,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _header(),
            _tabs(),
            Expanded(
              child: Obx(() {
                final tab = _tab.value;
                final shared = {..._shared};
                final sharing = {..._sharing};
                final loading = tab == _ShareTab.recent
                    ? _loadingRecent.value
                    : _loadingFriends.value;
                if (loading) {
                  return const Center(
                    child: CircularProgressIndicator(color: AppColors.green29EEAA),
                  );
                }
                final list = tab == _ShareTab.recent ? _recent.toList() : _friends.toList();
                if (list.isEmpty) {
                  return Center(
                    child: Text(
                      tab == _ShareTab.recent ? 'No recent chats' : 'No friends yet',
                      style: TextStyle(color: AppColors.gray9A9A9A, fontSize: 14.sp),
                    ),
                  );
                }
                return ListView.separated(
                  padding: EdgeInsets.fromLTRB(16.w, 8.w, 16.w, 16.w + bottom),
                  itemCount: list.length,
                  separatorBuilder: (_, _) => SizedBox(height: 10.w),
                  itemBuilder: (context, index) {
                    final item = list[index];
                    return _ShareRow(
                      target: item,
                      shared: shared.contains(item.uid),
                      busy: sharing.contains(item.uid),
                      onShare: () => _share(item),
                    );
                  },
                );
              }),
            ),
          ],
        ),
      ),
    );
  }

  Widget _header() {
    return Padding(
      padding: EdgeInsets.fromLTRB(16.w, 14.w, 8.w, 4.w),
      child: SizedBox(
        height: 40.w,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Text(
              'Share Room',
              style: TextStyle(
                color: AppColors.white,
                fontSize: 17.sp,
                fontWeight: FontWeight.w700,
                height: 1.2,
              ),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: IconButton(
                onPressed: AppJumper.back,
                padding: EdgeInsets.all(8.w),
                constraints: BoxConstraints(minWidth: 36.w, minHeight: 36.w),
                icon: Icon(Icons.close, color: AppColors.gray8A8A8A, size: 22.w),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _tabs() {
    return Obx(() {
      final tab = _tab.value;
      return Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Flexible(
              child: Center(
                child: _TabChip(
                  label: 'Recent Chat',
                  selected: tab == _ShareTab.recent,
                  onTap: () => _tab.value = _ShareTab.recent,
                ),
              ),
            ),
            SizedBox(width: 28.w),
            Flexible(
              child: Center(
                child: _TabChip(
                  label: 'Friends',
                  selected: tab == _ShareTab.friends,
                  onTap: () => _tab.value = _ShareTab.friends,
                ),
              ),
            ),
          ],
        ),
      );
    });
  }
}

class _TabChip extends StatelessWidget {
  const _TabChip({required this.label, required this.selected, required this.onTap});

  final String label;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: Padding(
        padding: EdgeInsets.only(top: 8.w, bottom: 10.w),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              label,
              style: TextStyle(
                color: selected ? AppColors.white : AppColors.gray9A9A9A,
                fontSize: 15.sp,
                fontWeight: selected ? FontWeight.w700 : FontWeight.w500,
                height: 1.2,
              ),
            ),
            SizedBox(height: 8.w),
            Container(
              width: 28.w,
              height: 3.w,
              decoration: BoxDecoration(
                color: selected ? AppColors.green29EEAA : Colors.transparent,
                borderRadius: BorderRadius.circular(2.r),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ShareRow extends StatelessWidget {
  const _ShareRow({
    required this.target,
    required this.shared,
    required this.busy,
    required this.onShare,
  });

  final _ShareTarget target;
  final bool shared;
  final bool busy;
  final VoidCallback onShare;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 10.w),
      decoration: BoxDecoration(
        color: AppColors.white.withValues(alpha: 0.06),
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Row(
        children: [
          _AvatarWithGender(url: target.avatar, isMale: target.isMale),
          SizedBox(width: 12.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  target.name,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: AppColors.white,
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w600,
                    height: 1.2,
                  ),
                ),
                SizedBox(height: 4.w),
                Text(
                  'ID: ${target.uid}',
                  style: TextStyle(
                    color: AppColors.gray9A9A9A,
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w400,
                    height: 1.2,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(width: 8.w),
          _ShareButton(shared: shared, busy: busy, onTap: onShare),
        ],
      ),
    );
  }
}

class _AvatarWithGender extends StatelessWidget {
  const _AvatarWithGender({required this.url, required this.isMale});

  final String url;
  final bool isMale;

  @override
  Widget build(BuildContext context) {
    final size = 48.w;
    return SizedBox(
      width: size,
      height: size,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          AppImage.avatar(url, fallbackAsset: AppAssets.avatarPlace, size: size),
          Positioned(
            right: -1.w,
            bottom: -1.w,
            child: Container(
              width: 16.w,
              height: 16.w,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: isMale ? AppColors.blue4F8BFF : AppColors.pinkFF5BA8,
                shape: BoxShape.circle,
                border: Border.all(color: const Color(0xFF16161E), width: 1.5),
              ),
              child: Chimo.image(
                isMale ? AppAssets.genderMan : AppAssets.genderWoman,
                width: 9.w,
                height: 9.w,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _ShareButton extends StatelessWidget {
  const _ShareButton({required this.shared, required this.busy, required this.onTap});

  final bool shared;
  final bool busy;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final done = shared || busy;
    return GestureDetector(
      onTap: done ? null : onTap,
      child: Container(
        height: 32.w,
        constraints: BoxConstraints(minWidth: 72.w),
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: done ? AppColors.white.withValues(alpha: 0.08) : AppColors.green29EEAA,
          borderRadius: BorderRadius.circular(16.r),
        ),
        child: Text(
          shared ? 'Shared' : (busy ? '…' : 'Share'),
          style: TextStyle(
            color: done ? AppColors.gray9A9A9A : AppColors.black1C1C1E,
            fontSize: 13.sp,
            fontWeight: FontWeight.w700,
            height: 1,
          ),
        ),
      ),
    );
  }
}
