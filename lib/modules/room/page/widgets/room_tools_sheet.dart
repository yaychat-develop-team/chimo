import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../app/app_jumper.dart';
import '../../../../common/constants/app_assets.dart';
import '../../../../common/theme/app_bottom_sheet.dart';
import '../../../../common/theme/app_colors.dart';
import '../../../../common/theme/app_dialog.dart';
import '../../../../common/utils/app_toast.dart';
import '../../../../modules/report/model/report_target.dart';
import '../../service/room_service.dart';
import 'room_setting_sheet.dart';
import 'room_share_sheet.dart';
import 'package:chimo/common/utils/chimo.dart';

/// 房间工具弹层。
///
/// UI 对齐 Cosmic Lounge；能力与可见性对齐 joyride/yaychat `RoomToolWidget`：
/// Share / Report / Save；管理：公屏、礼物统计、Warn、Close/Open、CP Timer。
Future<void> showRoomToolsSheet() {
  final service = RoomService.findOrNull();
  if (service == null || !service.inRoom.value) {
    AppToast.info('Not in a room');
    return Future.value();
  }
  return AppBottomSheet.show<void>(
    isScrollControlled: true,
    child: _RoomToolsSheet(service: service),
  );
}

class _RoomToolsSheet extends StatelessWidget {
  const _RoomToolsSheet({required this.service});

  final RoomService service;

  @override
  Widget build(BuildContext context) {
    final bottom = MediaQuery.paddingOf(context).bottom;
    return Obx(() {
      final saved = service.saved.value;
      final closed = service.isRoomClosed;
      final publicOn = service.freePublicChat.value;
      final giftOn = service.giftValueCountSwitch.value;
      final timing = service.hasRoomTimer;
      final items = <_ToolItem>[
        // 房间设置：房主 / 接待。对齐 joyride `room_setting`。
        if (service.isOwnerOrReceptionist)
          _ToolItem(icon: AppAssets.roomToolSetting, label: 'Setting', onTap: _setting),
        // 对齐 joyride：分享打开好友邀请页，不是剪贴板。
        _ToolItem(icon: AppAssets.roomToolShare, label: 'Share Room', onTap: _share),
        // 房主不举报自己的房。
        if (!service.isOwner)
          _ToolItem(icon: AppAssets.roomToolReport, label: 'Report', onTap: _report),
        // 房主不可收藏自己的房；已收藏 icon_saved，未收藏 icon_save。
        if (!service.isOwner)
          _ToolItem(
            icon: saved ? AppAssets.roomToolSaved : AppAssets.roomToolSave,
            label: saved ? 'Cancel Save' : 'Save Room',
            onTap: _save,
          ),
        // 公屏开关：房主 / 接待 / 管理。对齐 joyride `switchPublicScreen`。
        if (service.isStaff)
          _ToolItem(
            icon: publicOn ? AppAssets.roomToolScreenClose : AppAssets.roomToolScreenOpen,
            label: publicOn ? 'Close Screen' : 'Open Screen',
            onTap: _togglePublicChat,
          ),
        // 礼物统计：房主 / 接待。对齐 joyride `package_statistics`。
        if (service.isOwnerOrReceptionist)
          _ToolItem(
            icon: AppAssets.roomToolStatistic,
            label: giftOn ? 'Hide Gift Stats' : 'Gift Stats',
            onTap: _toggleGiftStats,
          ),
        // joyride 超管 Warn；此处管理角色可见（Owner/Manager/Receptionist）。
        if (service.isStaff) _ToolItem(icon: AppAssets.roomToolWarn, label: 'Warn', onTap: _warn),
        if (service.canToggleClose)
          _ToolItem(
            icon: AppAssets.roomToolClose,
            label: closed ? 'Open Room' : 'Close Room',
            onTap: closed ? _openRoom : _closeRoom,
          ),
        // CP 房间倒计时：本人在 0 号主持麦。对齐 joyride `showTimeAction`。
        if (service.showCpRoomTimer)
          _ToolItem(
            icon: AppAssets.roomToolTimer,
            label: timing ? 'Close Timer' : 'Timer',
            onTap: timing ? _closeRoomTimer : _openRoomTimer,
          ),
      ];

      return DecoratedBox(
        decoration: const BoxDecoration(
          color: AppColors.black1C1C1E,
          borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
        ),
        child: Padding(
          padding: EdgeInsets.fromLTRB(16.w, 20.w, 16.w, 20.w + bottom),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Room Tools',
                style: TextStyle(
                  color: AppColors.white,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                  height: 1.2,
                ),
              ),
              SizedBox(height: 20.w),
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: items.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  mainAxisSpacing: 18.w,
                  crossAxisSpacing: 8.w,
                  childAspectRatio: 0.72,
                ),
                itemBuilder: (context, index) => _ToolCell(item: items[index]),
              ),
            ],
          ),
        ),
      );
    });
  }

  Future<void> _setting() async {
    AppJumper.back();
    await showRoomSettingSheet();
  }

  Future<void> _share() async {
    AppJumper.back();
    await showRoomShareSheet();
  }

  Future<void> _report() async {
    AppJumper.back();
    await AppJumper.toReport(reportedId: '${service.rid}', kind: ReportTargetKind.room);
  }

  Future<void> _save() async {
    final failure = await service.toggleSave();
    if (failure != null) {
      AppToast.error(failure);
      return;
    }
    AppToast.info(service.saved.value ? 'Saved' : 'Cancel Save');
  }

  Future<void> _togglePublicChat() async {
    final next = !service.freePublicChat.value;
    final failure = await service.togglePublicChat();
    if (failure != null) {
      AppToast.error(failure);
      return;
    }
    AppJumper.back();
    AppToast.info(next ? 'Public screen opened' : 'Public screen closed');
  }

  Future<void> _toggleGiftStats() async {
    final next = !service.giftValueCountSwitch.value;
    final failure = await service.toggleGiftValueCount();
    if (failure != null) {
      AppToast.error(failure);
      return;
    }
    AppJumper.back();
    AppToast.info(next ? 'Gift stats shown' : 'Gift stats hidden');
  }

  Future<void> _warn() async {
    final ok = await AppDialog.show(
      title: 'Warn',
      content: 'Send a general warning to everyone in this room?',
      confirmLabel: 'Warn',
      cancelLabel: 'Cancel',
      buttons: DialogLoyoutStyle.horizontal,
    );
    if (ok != true) return;
    final failure = await service.warnAll();
    if (failure != null) {
      AppToast.error(failure);
      return;
    }
    AppJumper.back();
    AppToast.info('Warning sent');
  }

  Future<void> _closeRoom() async {
    final ok = await AppDialog.show(
      title: 'Close Room',
      content: 'Close this room for everyone?',
      confirmLabel: 'Close',
      cancelLabel: 'Cancel',
      buttons: DialogLoyoutStyle.horizontal,
    );
    if (ok != true) return;
    final failure = await service.closeRoom();
    if (failure != null) {
      AppToast.error(failure);
      return;
    }
    AppJumper.back();
    AppToast.info('Room closed');
  }

  Future<void> _openRoom() async {
    final failure = await service.openRoom();
    if (failure != null) {
      AppToast.error(failure);
      return;
    }
    AppJumper.back();
    AppToast.info('Room opened');
  }

  Future<void> _closeRoomTimer() async {
    final failure = await service.setRoomTimer(open: false);
    if (failure != null) {
      AppToast.error(failure);
      return;
    }
    AppJumper.back();
    AppToast.info('Timer closed');
  }

  Future<void> _openRoomTimer() async {
    final seconds = await AppBottomSheet.actions<int>(
      buildItems: () => [
        AppSheetAction(label: '30s', onTap: () => AppJumper.back(result: 30)),
        AppSheetAction(label: '1 min', onTap: () => AppJumper.back(result: 60)),
        AppSheetAction(label: '3 min', onTap: () => AppJumper.back(result: 180)),
        AppSheetAction(label: '5 min', onTap: () => AppJumper.back(result: 300)),
        AppSheetAction(label: 'Cancel', onTap: () => AppJumper.back()),
      ],
    );
    if (seconds == null || seconds <= 0) return;
    final failure = await service.setRoomTimer(open: true, seconds: seconds);
    if (failure != null) {
      AppToast.error(failure);
      return;
    }
    AppJumper.back();
    AppToast.info('Timer started');
  }
}

class _ToolItem {
  const _ToolItem({required this.icon, required this.label, required this.onTap});

  final String icon;
  final String label;
  final VoidCallback onTap;
}

class _ToolCell extends StatelessWidget {
  const _ToolCell({required this.item});

  final _ToolItem item;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: item.onTap,
      behavior: HitTestBehavior.opaque,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 52.w,
            height: 52.w,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: AppColors.white.withValues(alpha: 0.08),
              shape: BoxShape.circle,
            ),
            child: Chimo.image(item.icon, width: 24.w, height: 24.w),
          ),
          SizedBox(height: 8.w),
          Text(
            item.label,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: AppColors.white,
              fontSize: 11.sp,
              fontWeight: FontWeight.w500,
              height: 1.2,
            ),
          ),
        ],
      ),
    );
  }
}
