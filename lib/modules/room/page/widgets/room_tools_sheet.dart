import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../app/app_jumper.dart';
import '../../../../app/global_config.dart';
import '../../../../common/constants/app_assets.dart';
import '../../../../common/models/server_client/ban.pb.dart';
import '../../../../common/theme/app_bottom_sheet.dart';
import '../../../../common/theme/app_colors.dart';
import '../../../../common/theme/app_dialog.dart';
import '../../../../common/utils/app_toast.dart';
import '../../../../modules/report/model/report_target.dart';
import '../../types/turntable/logic/turntable_logic.dart';
import '../../logic/mic_logic.dart';
import '../../service/room_service.dart';
import 'room_activity_share_sheet.dart';
import 'room_setting_sheet.dart';
import 'room_share_sheet.dart';
import 'package:chimo/common/utils/chimo.dart';

/// 房间工具弹层。能力与可见性对齐 joyride `RoomToolWidget`。
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
      final items = service.isSuperAdmin ? _superItems() : _normalItems();

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
              SizedBox(height: 8.w),
              Text(
                'Room ID: ${service.rid}',
                style: TextStyle(color: AppColors.white50, fontSize: 12.sp),
              ),
              SizedBox(height: 16.w),
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: items.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  mainAxisSpacing: 18.w,
                  crossAxisSpacing: 8.w,
                  childAspectRatio: 0.92,
                ),
                itemBuilder: (context, index) => _ToolCell(item: items[index]),
              ),
            ],
          ),
        ),
      );
    });
  }

  /// 超管独占工具栏。对齐 joyride `superAdminItems`。
  List<_ToolItem> _superItems() {
    final closed = service.isRoomClosed;
    final publicOn = service.freePublicChat.value;
    return [
      _ToolItem(icon: AppAssets.roomToolWarn, label: 'Warn', onTap: _warn),
      _ToolItem(
        icon: AppAssets.roomToolClose,
        label: closed ? 'Open Room' : 'Close Room',
        onTap: closed ? _openRoom : _superCloseRoom,
      ),
      _ToolItem(icon: AppAssets.roomToolBan, label: 'Ban Room', onTap: _banRoom),
      _ToolItem(
        icon: publicOn ? AppAssets.roomToolScreenClose : AppAssets.roomToolScreenOpen,
        label: publicOn ? 'Close Screen' : 'Open Screen',
        onTap: _togglePublicChat,
      ),
    ];
  }

  List<_ToolItem> _normalItems() {
    final saved = service.saved.value;
    final closed = service.isRoomClosed;
    final publicOn = service.freePublicChat.value;
    final giftOn = service.giftValueCountSwitch.value;
    final timing = service.hasRoomTimer;
    final onMic = Get.isRegistered<MicLogic>() && Get.find<MicLogic>().onMic;

    return [
      if (service.showGsTask)
        _ToolItem(icon: AppAssets.roomToolTask, label: 'GS Task', onTap: _gsTask),
      if (service.isOwnerOrReceptionist)
        _ToolItem(icon: AppAssets.roomToolSetting, label: 'Setting', onTap: _setting),
      if (onMic) _ToolItem(icon: AppAssets.roomToolMusic, label: 'Music', onTap: _music),
      if (service.isStaff)
        _ToolItem(
          icon: publicOn ? AppAssets.roomToolScreenClose : AppAssets.roomToolScreenOpen,
          label: publicOn ? 'Close Screen' : 'Open Screen',
          onTap: _togglePublicChat,
        ),
      if (service.isOwnerOrReceptionist)
        _ToolItem(
          icon: AppAssets.roomToolStatistic,
          label: giftOn ? 'Hide Gift Stats' : 'Gift Stats',
          selected: giftOn,
          onTap: _toggleGiftStats,
        ),
      if (service.showFlikOpenGame)
        _ToolItem(icon: AppAssets.roomToolGameOpen, label: 'Open Lucky Game', onTap: _gameSoon),
      if (service.showFlikCloseGame)
        _ToolItem(icon: AppAssets.roomToolGameClose, label: 'Close Lucky Game', onTap: _gameSoon),
      if (service.showSudOpenGame)
        _ToolItem(icon: AppAssets.roomToolGameOpen, label: 'Open Game', onTap: _gameSoon),
      if (service.showSudSwitchGame)
        _ToolItem(icon: AppAssets.roomToolGameSwitch, label: 'Switch Game', onTap: _gameSoon),
      if (service.showSudCloseGame)
        _ToolItem(icon: AppAssets.roomToolGameClose, label: 'Close Game', onTap: _gameSoon),
      if (!service.isOwner)
        _ToolItem(
          icon: saved ? AppAssets.roomToolSaved : AppAssets.roomToolSave,
          label: saved ? 'Cancel Save' : 'Save Room',
          onTap: _save,
        ),
      if (service.canToggleClose)
        _ToolItem(
          icon: AppAssets.roomToolClose,
          label: closed ? 'Open Room' : 'Close Room',
          onTap: closed ? _openRoom : _closeRoom,
        ),
      if (service.showKnightHot)
        _ToolItem(icon: AppAssets.roomToolHot, label: 'Boost Hot', onTap: _addHot),
      if (service.isStaff)
        _ToolItem(
          icon: _turntableOn ? AppAssets.roomToolTurntableOff : AppAssets.roomToolTurntableOn,
          label: _turntableOn ? 'Lucky Spin Off' : 'Lucky Spin',
          onTap: _toggleTurntable,
        ),
      if (service.showCpRoomTimer)
        _ToolItem(
          icon: AppAssets.roomToolTimer,
          label: timing ? 'Close Timer' : 'Timer',
          onTap: timing ? _closeRoomTimer : _openRoomTimer,
        ),
      _ToolItem(icon: AppAssets.roomToolShare, label: 'Share Room', onTap: _share),
      if (!service.isOwner)
        _ToolItem(icon: AppAssets.roomToolReport, label: 'Report', onTap: _report),
      _ToolItem(icon: AppAssets.roomToolShareEvent, label: 'Share Event', onTap: _shareEvent),
    ];
  }

  Future<void> _setting() async {
    AppJumper.back();
    await showRoomSettingSheet();
  }

  Future<void> _share() async {
    AppJumper.back();
    await showRoomShareSheet();
  }

  Future<void> _shareEvent() async {
    AppJumper.back();
    await RoomActivityShareSheet.show(fromRoom: true);
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

  Future<void> _gsTask() async {
    final url = GlobalConfig.confResp?.gsTaskUrl.trim() ?? '';
    if (url.isEmpty) return;
    AppJumper.back();
    await AppJumper.toWeb(url: url, title: 'GS Task');
  }

  Future<void> _music() async {
    AppJumper.back();
    AppToast.info('Music coming soon');
  }

  Future<void> _gameSoon() async {
    AppJumper.back();
    AppToast.info('Games coming soon');
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

  Future<void> _superCloseRoom() async {
    final reason = await AppBottomSheet.actions<String>(
      buildItems: () => [
        AppSheetAction(
          label: 'Language conflict',
          onTap: () => AppJumper.back(result: 'Language conflict'),
        ),
        AppSheetAction(
          label: 'Sensitive topics',
          onTap: () => AppJumper.back(result: 'Sensitive topics'),
        ),
        AppSheetAction(
          label: 'Trade in room',
          onTap: () => AppJumper.back(result: 'Trade in room'),
        ),
        AppSheetAction(
          label: 'Gamble in room',
          onTap: () => AppJumper.back(result: 'Gamble in room'),
        ),
        AppSheetAction(
          label: 'Other',
          onTap: () => AppJumper.back(result: 'Other'),
        ),
        AppSheetAction(label: 'Cancel', onTap: () => AppJumper.back()),
      ],
    );
    if (reason == null || reason.isEmpty) return;
    final failure = await service.superCloseRoom(reason);
    if (failure != null) {
      AppToast.error(failure);
      return;
    }
    AppJumper.back();
    AppToast.info('Room closed');
  }

  Future<void> _banRoom() async {
    final reason = await AppBottomSheet.actions<String>(
      buildItems: () => [
        AppSheetAction(
          label: 'Break law',
          onTap: () => AppJumper.back(result: 'Break law'),
        ),
        AppSheetAction(
          label: 'Fraud',
          onTap: () => AppJumper.back(result: 'Fraud'),
        ),
        AppSheetAction(
          label: 'Abuse',
          onTap: () => AppJumper.back(result: 'Abuse'),
        ),
        AppSheetAction(
          label: 'Other',
          onTap: () => AppJumper.back(result: 'Other'),
        ),
        AppSheetAction(label: 'Cancel', onTap: () => AppJumper.back()),
      ],
    );
    if (reason == null || reason.isEmpty) return;
    final days = await AppBottomSheet.actions<int>(
      buildItems: () => [
        AppSheetAction(label: '1 day', onTap: () => AppJumper.back(result: 1)),
        AppSheetAction(label: '3 days', onTap: () => AppJumper.back(result: 3)),
        AppSheetAction(label: '7 days', onTap: () => AppJumper.back(result: 7)),
        AppSheetAction(label: 'Forever', onTap: () => AppJumper.back(result: 36500)),
        AppSheetAction(label: 'Cancel', onTap: () => AppJumper.back()),
      ],
    );
    if (days == null || days <= 0) return;
    final endMs = DateTime.now().millisecondsSinceEpoch + days * 24 * 3600 * 1000;
    final failure = await service.banTarget(
      busId: service.rid,
      type: BanType.ROOM_BAN,
      level: BanLevel.S,
      reason: reason,
      endMs: endMs,
    );
    if (failure != null) {
      AppToast.error(failure);
      return;
    }
    AppJumper.back();
    AppToast.info('Room banned');
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

  Future<void> _addHot() async {
    final failure = await service.addHotValue();
    if (failure != null) {
      AppToast.error(failure);
      return;
    }
    AppJumper.back();
    AppToast.info('Boosted');
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

  bool get _turntableOn => Get.isRegistered<TurntableLogic>() && Get.find<TurntableLogic>().enabled;

  Future<void> _toggleTurntable() async {
    AppJumper.back();
    await service.ensureTurntablePlay();
    if (!Get.isRegistered<TurntableLogic>()) return;
    final logic = Get.find<TurntableLogic>();
    if (logic.enabled) {
      await logic.disable();
    } else {
      await logic.enable();
    }
  }
}

class _ToolItem {
  const _ToolItem({
    required this.icon,
    required this.label,
    required this.onTap,
    this.selected = false,
  });

  final String icon;
  final String label;
  final VoidCallback onTap;
  final bool selected;
}

class _ToolCell extends StatelessWidget {
  const _ToolCell({required this.item});

  final _ToolItem item;

  @override
  Widget build(BuildContext context) {
    // 对齐 oumi `RoomToolBtn`：50×50 图标；选中态 ShaderMask 品牌渐变。
    Widget icon = Chimo.image(item.icon, width: 50, height: 50);
    if (item.selected) {
      icon = ShaderMask(
        blendMode: BlendMode.srcATop,
        shaderCallback: (bounds) => AppColors.primaryGradient.createShader(bounds),
        child: icon,
      );
    }
    return GestureDetector(
      onTap: item.onTap,
      behavior: HitTestBehavior.opaque,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(width: 50.w, height: 50.w, child: icon),
          SizedBox(height: 4.w),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 4.w),
            child: Text(
              item.label,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: AppColors.white.withValues(alpha: 0.7),
                fontSize: 12.sp,
                fontWeight: FontWeight.w400,
                height: 1.2,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
