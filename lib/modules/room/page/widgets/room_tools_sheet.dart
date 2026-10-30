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
import 'room_share_sheet.dart';
import 'package:chimo/common/utils/chimo.dart';

/// 房间工具弹层。
///
/// UI 对齐 Cosmic Lounge；能力与可见性对齐 joyride/yaychat `RoomToolWidget`：
/// Share 邀请好友、Report/Save 非房主、Warn 管理角色、Close/Open 房主(接待)。
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
      final items = <_ToolItem>[
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
        // joyride 超管 Warn；此处管理角色可见（Owner/Manager/Receptionist）。
        if (service.isStaff) _ToolItem(icon: AppAssets.roomToolWarn, label: 'Warn', onTap: _warn),
        if (service.canToggleClose)
          _ToolItem(
            icon: AppAssets.roomToolClose,
            label: closed ? 'Open Room' : 'Close Room',
            onTap: closed ? _openRoom : _closeRoom,
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
