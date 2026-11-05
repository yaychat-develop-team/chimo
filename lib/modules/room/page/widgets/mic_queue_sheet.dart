import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../app/app_jumper.dart';
import '../../../../common/constants/app_assets.dart';
import '../../../../common/models/server_client/rtc.pb.dart';
import '../../../../common/theme/app_bottom_sheet.dart';
import '../../../../common/theme/app_colors.dart';
import '../../../../common/utils/app_toast.dart';
import '../../../../common/utils/chimo.dart';
import '../../../../common/widgets/app_blur_backdrop.dart';
import '../../logic/mic_logic.dart';
import '../../logic/room_rank_logic.dart';
import '../../service/room_service.dart';
import 'mic_seat_pick_sheet.dart';

/// 排麦面板。对齐设计图：主持「Take the Mic」/ 申请人「Request Mic」。
class MicQueueSheet extends StatefulWidget {
  const MicQueueSheet({super.key, this.tabIndex = 0});

  final int tabIndex;

  static Future<void> show({int tabIndex = 0}) {
    return AppBottomSheet.show<void>(
      isScrollControlled: true,
      child: MicQueueSheet(tabIndex: tabIndex),
    );
  }

  @override
  State<MicQueueSheet> createState() => _MicQueueSheetState();
}

class _MicQueueSheetState extends State<MicQueueSheet> with SingleTickerProviderStateMixin {
  late final TabController _tabs;
  var _busy = false;

  RoomService? get _room => RoomService.findOrNull();

  bool get _auction => _room?.isAuctionRoom == true;

  bool get _staff => _room?.isStaff == true;

  List<QueueType> get _types => _auction
      ? const [QueueType.CAR_OWNER_QUEUE, QueueType.COMMON_QUEUE]
      : const [QueueType.COMMON_QUEUE];

  List<String> get _titles => _auction ? const ['Performers', 'Audience'] : const ['Queue'];

  QueueType get _current => _types[_tabs.index.clamp(0, _types.length - 1)];

  @override
  void initState() {
    super.initState();
    final initial = widget.tabIndex.clamp(0, _titles.length - 1);
    _tabs = TabController(length: _titles.length, vsync: this, initialIndex: initial);
    _tabs.addListener(() {
      if (!_tabs.indexIsChanging) setState(() {});
    });
  }

  @override
  void dispose() {
    _tabs.dispose();
    super.dispose();
  }

  Future<void> _join() async {
    final room = _room;
    if (room == null || _busy) return;
    setState(() => _busy = true);
    final failure = await room.queueMic(_current);
    if (mounted) setState(() => _busy = false);
    if (failure != null) AppToast.error(failure);
  }

  Future<void> _cancel() async {
    final room = _room;
    if (room == null || _busy) return;
    final type = room.inQueue(QueueType.CAR_OWNER_QUEUE)
        ? QueueType.CAR_OWNER_QUEUE
        : QueueType.COMMON_QUEUE;
    setState(() => _busy = true);
    final failure = await room.cancelQueueMic(type);
    if (mounted) setState(() => _busy = false);
    if (failure != null) AppToast.error(failure);
  }

  Future<void> _grant(SimpleChannelUserSlot slot) async {
    final room = _room;
    if (room == null || _busy || !slot.hasUser()) return;
    final uid = slot.user.id.toInt();
    // 拍卖房：按队列类型抱麦；其它房：选空麦位（对齐 joyride MicSelectPage）。
    if (room.isAuctionRoom) {
      setState(() => _busy = true);
      final failure = await room.grantTypeOnMic(uid: uid, type: _current);
      if (mounted) setState(() => _busy = false);
      if (failure != null) {
        AppToast.error(failure);
        return;
      }
      Get.back<void>();
      return;
    }
    final empties = <int>[];
    if (Get.isRegistered<MicLogic>()) {
      final seats = Get.find<MicLogic>().seats;
      for (var i = 0; i < seats.length; i++) {
        if (!seats[i].occupied) empties.add(i);
      }
    }
    if (empties.isEmpty) {
      AppToast.error('No empty mic');
      return;
    }
    final position = await showMicSeatPickSheet(user: slot.user, emptyPositions: empties);
    if (position == null) return;
    setState(() => _busy = true);
    final failure = await room.grantOnMic(uid: uid, position: position);
    if (mounted) setState(() => _busy = false);
    if (failure != null) {
      AppToast.error(failure);
      return;
    }
    Get.back<void>();
  }

  @override
  Widget build(BuildContext context) {
    final room = _room;
    if (room == null) return const SizedBox.shrink();
    final bottom = MediaQuery.paddingOf(context).bottom;
    final height = MediaQuery.sizeOf(context).height * 0.62;
    return AppBlurBackdrop(
      blur: 28,
      color: AppColors.black111DE5.withValues(alpha: 0.9),
      borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
      child: SizedBox(
        height: height,
        child: Obx(() {
        room.waitQueue.length;
        room.carOwnerMicQueue.length;
        final inQueue =
            room.inQueue(QueueType.COMMON_QUEUE) || room.inQueue(QueueType.CAR_OWNER_QUEUE);
        final list = _current == QueueType.CAR_OWNER_QUEUE
            ? room.carOwnerMicQueue.toList()
            : room.waitQueue.toList();
        return Column(
          children: [
            SizedBox(height: 18.w),
            _header(),
            SizedBox(height: 14.w),
            if (_titles.length > 1) ...[
              _tabBar(),
              Divider(height: 1, thickness: 0.5, color: AppColors.white.withValues(alpha: 0.08)),
            ],
            Expanded(
              child: list.isEmpty
                  ? Center(
                      child: Text(
                        'No one in queue',
                        style: TextStyle(
                          color: AppColors.white.withValues(alpha: 0.45),
                          fontSize: 14.sp,
                        ),
                      ),
                    )
                  : ListView.separated(
                      padding: EdgeInsets.fromLTRB(16.w, 14.w, 16.w, 8.w),
                      itemCount: list.length,
                      separatorBuilder: (_, _) => SizedBox(height: 10.w),
                      itemBuilder: (_, index) => _card(list[index], index + 1),
                    ),
            ),
            // 申请人视角：底部 Request Mic；主持只在行内 Take the Mic
            if (!_staff)
              Padding(
                padding: EdgeInsets.fromLTRB(24.w, 8.w, 24.w, bottom + 16.w),
                child: _requestBtn(inQueue),
              )
            else
              SizedBox(height: bottom + 12.w),
          ],
        );
      }),
      ),
    );
  }

  Widget _header() {
    return SizedBox(
      height: 28.w,
      child: Stack(
        fit: StackFit.expand,
        alignment: Alignment.center,
        children: [
          Text(
            'Mic Queue',
            style: TextStyle(color: AppColors.white, fontSize: 17.sp, fontWeight: FontWeight.w700),
            textAlign: TextAlign.center,
          ),
          Positioned(
            top: 0,
            right: 12.w,
            child: GestureDetector(
              onTap: () => Get.back<void>(),
              behavior: HitTestBehavior.opaque,
              child: Padding(
                padding: EdgeInsets.all(6.w),
                child: Icon(
                  Icons.close,
                  color: AppColors.white.withValues(alpha: 0.85),
                  size: 22.w,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _tabBar() {
    return TabBar(
      controller: _tabs,
      labelColor: AppColors.white,
      unselectedLabelColor: AppColors.white.withValues(alpha: 0.4),
      labelStyle: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.w600),
      unselectedLabelStyle: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.w500),
      indicatorSize: TabBarIndicatorSize.label,
      indicator: UnderlineTabIndicator(
        borderSide: BorderSide(color: AppColors.green29EEAA, width: 3.w),
        borderRadius: BorderRadius.circular(2.w),
        insets: EdgeInsets.symmetric(horizontal: 8.w),
      ),
      dividerColor: Colors.transparent,
      tabs: [for (final title in _titles) Tab(text: title, height: 40.w)],
    );
  }

  Widget _requestBtn(bool inQueue) {
    return GestureDetector(
      onTap: _busy ? null : (inQueue ? _cancel : _join),
      child: Container(
        width: double.infinity,
        height: 48.w,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: AppColors.green29EEAA,
          borderRadius: BorderRadius.circular(24.w),
        ),
        child: _busy
            ? SizedBox(
                width: 20.w,
                height: 20.w,
                child: const CircularProgressIndicator(
                  strokeWidth: 2,
                  color: AppColors.black1C1C1E,
                ),
              )
            : Text(
                inQueue ? 'Cancel Request' : 'Request Mic',
                style: TextStyle(
                  color: AppColors.black1C1C1E,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w700,
                ),
              ),
      ),
    );
  }

  Widget _card(SimpleChannelUserSlot slot, int rank) {
    final user = slot.hasUser() ? slot.user : null;
    final name = user?.nickname.trim() ?? '';
    final avatar = user?.avatar.trim() ?? '';
    final uid = user?.id.toInt() ?? 0;
    final male = user == null ? true : RoomRankLogic.isMale(user);

    return Container(
      height: 72.w,
      padding: EdgeInsets.symmetric(horizontal: 12.w),
      decoration: BoxDecoration(
        color: const Color(0xFF1C1C24),
        borderRadius: BorderRadius.circular(16.w),
      ),
      child: Row(
        children: [
          SizedBox(
            width: 22.w,
            child: Text(
              '$rank',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: AppColors.white.withValues(alpha: 0.35),
                fontSize: 15.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          SizedBox(width: 8.w),
          GestureDetector(
            onTap: () {
              if (user == null) return;
              AppJumper.showUserProfileSheet(uid: '$uid', name: name, avatar: avatar);
            },
            child: _avatar(avatar, male),
          ),
          SizedBox(width: 10.w),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name.isEmpty ? 'User' : name,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: AppColors.white,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 4.w),
                Text(
                  'ID: $uid',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(color: AppColors.white.withValues(alpha: 0.4), fontSize: 12.sp),
                ),
              ],
            ),
          ),
          if (_staff) ...[SizedBox(width: 8.w), _takeMicBtn(slot)],
        ],
      ),
    );
  }

  Widget _avatar(String url, bool male) {
    return SizedBox(
      width: 44.w,
      height: 44.w,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          ClipOval(
            child: url.isEmpty
                ? Container(
                    width: 44.w,
                    height: 44.w,
                    color: AppColors.white.withValues(alpha: 0.12),
                  )
                : Chimo.image(url, width: 44.w, height: 44.w, fit: BoxFit.cover),
          ),
          Positioned(
            right: -1.w,
            bottom: -1.w,
            child: Chimo.image(
              male ? AppAssets.roomMale : AppAssets.roomFemale,
              width: 14.w,
              height: 14.w,
            ),
          ),
        ],
      ),
    );
  }

  Widget _takeMicBtn(SimpleChannelUserSlot slot) {
    return GestureDetector(
      onTap: _busy ? null : () => _grant(slot),
      child: Container(
        height: 28.w,
        padding: EdgeInsets.symmetric(horizontal: 12.w),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: AppColors.green29EEAA,
          borderRadius: BorderRadius.circular(14.w),
        ),
        child: Text(
          'Take the Mic',
          style: TextStyle(
            color: AppColors.black1C1C1E,
            fontSize: 12.sp,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }
}
