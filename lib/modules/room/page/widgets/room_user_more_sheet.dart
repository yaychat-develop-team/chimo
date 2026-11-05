import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../app/app_jumper.dart';
import '../../../../app/chimo_api.dart';
import '../../../../app/session_info.dart';
import '../../../../common/constants/app_assets.dart';
import '../../../../common/extensions/wire_view.dart';
import '../../../../common/models/server_client/rtc.pb.dart';
import '../../../../common/models/server_client/user.pb.dart';
import '../../../../common/theme/app_bottom_sheet.dart';
import '../../../../common/theme/app_colors.dart';
import '../../../../common/theme/app_dialog.dart';
import '../../../../common/utils/app_toast.dart';
import '../../service/room_service.dart';
import 'mic_select_sheet.dart';
import 'package:chimo/common/utils/chimo.dart';

/// 房间资料卡「更多」操作面板。对齐 joyride `RoomUserMoreBtns`。
Future<void> showRoomUserMoreSheet({required User profile, SimpleChannelUser? channelUser}) {
  return AppBottomSheet.show<void>(
    isScrollControlled: true,
    child: _RoomUserMoreSheet(profile: profile, channelUser: channelUser),
  );
}

class _RoomUserMoreSheet extends StatefulWidget {
  const _RoomUserMoreSheet({required this.profile, this.channelUser});

  final User profile;
  final SimpleChannelUser? channelUser;

  @override
  State<_RoomUserMoreSheet> createState() => _RoomUserMoreSheetState();
}

class _RoomUserMoreSheetState extends State<_RoomUserMoreSheet> {
  SimpleChannelUser? _channelUser;
  bool _blocked = false;
  bool _busy = false;

  RoomService? get _room => RoomService.findOrNull();

  int get _uid => widget.profile.id.toInt();

  bool get _isSelf => _uid > 0 && _uid == SessionInfo.uid;

  bool get _isSuper => SessionInfo.currentUser?.superAdmin ?? false;

  bool get _isOwner => _room?.role.value == RtcUserRole.Owner;

  bool get _isReception => _room?.role.value == RtcUserRole.Receptionist;

  bool get _isNormalManager => _room?.role.value == RtcUserRole.Manager;

  bool get _isManager => _isOwner || _isReception || _isNormalManager;

  bool get _targetIsOwner =>
      (_channelUser?.role == RtcUserRole.Owner) ||
      (_room != null && _room!.hostUid() == _uid && _uid > 0);

  bool get _targetIsReceptionist => _channelUser?.role == RtcUserRole.Receptionist;

  bool get _targetIsManager => _channelUser?.role == RtcUserRole.Manager;

  /// 操作对象管理权限比自己低。对齐 joyride `isLowerManager`。
  bool get _isLowerManager =>
      _isOwner ||
      (_isReception && !_targetIsOwner && !_targetIsReceptionist) ||
      (_isNormalManager && !_targetIsOwner && !_targetIsReceptionist && !_targetIsManager);

  bool get _onMic => _room?.userOnMic(_uid) ?? false;

  bool get _forceMic => _channelUser?.isForceTurnOffMicrophone ?? false;

  bool get _hasTimer => _room?.userHasMicTimer(_uid) ?? false;

  bool get _hasKnightBan => (SessionInfo.currentUser?.knightLevel ?? 0) >= 6;

  @override
  void initState() {
    super.initState();
    _channelUser = widget.channelUser;
    _bootstrap();
  }

  Future<void> _bootstrap() async {
    final room = _room;
    if (room == null || !room.inRoom.value) return;
    final found = await room.lookupChannelUser(_uid);
    if (!mounted) return;
    if (found != null) setState(() => _channelUser = found);

    final uidStr = widget.profile.uid;
    if (uidStr.isEmpty || uidStr == '0') return;
    try {
      final res = await ChimoApis.relation.isBlocked(uidStr);
      if (!mounted || !res.ok) return;
      setState(() => _blocked = res.data ?? false);
    } catch (_) {}
  }

  Future<void> _run(Future<String?> Function() action, {String done = 'Done'}) async {
    if (_busy) return;
    _busy = true;
    final failure = await action();
    _busy = false;
    if (!mounted) return;
    if (failure != null) {
      AppToast.error(failure);
      return;
    }
    AppToast.info(done);
    AppJumper.back();
  }

  List<_MoreItem> get _items {
    if (_isSuper) {
      return [
        if (!_isSelf && _onMic) _micItem(),
        if (!_isSelf) _kickItem(),
        if (!_isSelf) _warnItem(),
        _reportItem(),
        if (!_isSelf) _blockItem(),
      ];
    }
    return [
      if (!_isSelf && _isManager) _micItem(),
      if (_isManager) _clearItem(),
      if (_isManager && _onMic) _timerItem(),
      if (_isLowerManager && !_isSelf && _onMic) _micForbidItem(),
      if (_isLowerManager && !_isSelf && !(_channelUser?.kickOutPermission ?? false)) _kickItem(),
      if (_channelUser?.kickOutPermission ?? false) _knightKickItem(),
      if (_hasKnightBan && !_isSelf) _knightBanItem(),
      if (_isLowerManager && (_isOwner || _isReception) && !_isSelf) _adminItem(),
      _reportItem(),
      if (!_isSelf) _blockItem(),
    ];
  }

  _MoreItem _micItem() => _MoreItem(
    icon: _onMic ? AppAssets.roomUserMicDown : AppAssets.roomUserMicOn,
    label: _onMic ? 'Pass the mic' : 'Hug up mic',
    onTap: () {
      final room = _room;
      if (room == null) return;
      if (_onMic) {
        _run(() => room.grantDownMic(_uid));
        return;
      }
      // 拍卖房对齐 joyride：先选表演者 / 经纪人。
      if (room.isAuctionRoom) {
        AppJumper.back();
        MicSelectSheet.show(profile: widget.profile);
        return;
      }
      _run(() => room.grantFirstEmptyMic(_uid));
    },
  );

  _MoreItem _timerItem() => _MoreItem(
    icon: AppAssets.roomUserTimer,
    label: _hasTimer ? 'Close the timer' : 'Timer',
    onTap: () async {
      final room = _room;
      if (room == null) return;
      if (_hasTimer) {
        await _run(() => room.setMicTimer(uid: _uid, open: false));
        return;
      }
      final seconds = await AppBottomSheet.actions<int>(
        buildItems: () => List.generate(
          10,
          (i) => AppSheetAction(
            label: '${i + 1} min',
            onTap: () => AppJumper.back(result: (i + 1) * 60),
          ),
        )..add(AppSheetAction(label: 'Cancel', onTap: () => AppJumper.back())),
      );
      if (seconds == null || seconds <= 0) return;
      await _run(() => room.setMicTimer(uid: _uid, open: true, seconds: seconds));
    },
  );

  _MoreItem _clearItem() => _MoreItem(
    icon: AppAssets.roomUserClear,
    label: 'Clear stats',
    onTap: () => _run(() => _room!.clearMicScore(_uid)),
  );

  _MoreItem _micForbidItem() => _MoreItem(
    icon: _forceMic ? AppAssets.roomUserMicForbidCancel : AppAssets.roomUserMicForbid,
    label: _forceMic ? 'Cancel Mic Ban' : 'Mic Ban',
    onTap: () async {
      await _run(
        () => _room!.setForceMic(uid: _uid, forbid: !_forceMic),
        done: _forceMic ? 'Mic ban cancelled' : 'Mic banned',
      );
    },
  );

  _MoreItem _kickItem() =>
      _MoreItem(icon: AppAssets.roomUserKick, label: 'Kick out', onTap: _kickFlow);

  _MoreItem _knightKickItem() => _MoreItem(
    icon: AppAssets.roomUserKnightKick,
    label: 'Knight kick',
    onTap: () => _run(() => _room!.kickUser(uid: _uid, leaveSeconds: 600), done: 'Kicked'),
  );

  _MoreItem _knightBanItem() => _MoreItem(
    icon: AppAssets.roomUserKnightBan,
    label: 'Knight mute',
    onTap: () => _run(() => _room!.forbidWord(_uid), done: 'Muted'),
  );

  _MoreItem _adminItem() =>
      _MoreItem(icon: AppAssets.roomUserAdmin, label: 'Admin setting', onTap: _adminFlow);

  _MoreItem _reportItem() => _MoreItem(
    icon: AppAssets.roomUserReport,
    label: 'Report',
    onTap: () {
      AppJumper.back();
      AppJumper.toReport(reportedId: widget.profile.uid);
    },
  );

  _MoreItem _blockItem() => _MoreItem(
    icon: AppAssets.roomUserBlock,
    label: _blocked ? 'Cancel Block' : 'Block',
    onTap: _toggleBlock,
  );

  _MoreItem _warnItem() => _MoreItem(
    icon: AppAssets.roomUserWarn,
    label: 'Warn',
    onTap: () async {
      final ok = await AppDialog.show(
        title: 'Warn',
        content: 'Send a warning to this user?',
        confirmLabel: 'Warn',
        cancelLabel: 'Cancel',
        buttons: DialogLoyoutStyle.horizontal,
      );
      if (ok != true) return;
      await _run(() => _room!.warnUser(_uid), done: 'Warning sent');
    },
  );

  Future<void> _kickFlow() async {
    final room = _room;
    if (room == null) return;
    final seconds = await AppBottomSheet.actions<int>(
      buildItems: () => [
        AppSheetAction(label: '1 hour', onTap: () => AppJumper.back(result: 3600)),
        AppSheetAction(
          label: '1 day',
          onTap: () => AppJumper.back(result: 24 * 3600),
        ),
        AppSheetAction(
          label: '7 days',
          onTap: () => AppJumper.back(result: 7 * 24 * 3600),
        ),
        AppSheetAction(label: 'Cancel', onTap: () => AppJumper.back()),
      ],
    );
    if (seconds == null || seconds <= 0) return;
    final label = seconds == 3600
        ? '1 hour'
        : seconds == 24 * 3600
        ? '1 day'
        : '7 days';
    final ok = await AppDialog.show(
      title: 'Kick out',
      content: 'Kick this user out for $label?',
      confirmLabel: 'Kick',
      cancelLabel: 'Cancel',
      buttons: DialogLoyoutStyle.horizontal,
    );
    if (ok != true) return;
    await _run(
      () => room.kickUser(uid: _uid, leaveSeconds: seconds),
      done: 'Kicked',
    );
  }

  Future<void> _adminFlow() async {
    final room = _room;
    if (room == null) return;
    final next = await AppBottomSheet.actions<RtcUserRole>(
      buildItems: () {
        final items = <AppSheetAction>[];
        if (_isOwner && !_targetIsManager) {
          items.add(
            AppSheetAction(
              label: _targetIsReceptionist ? 'Cancel receptionist' : 'Set receptionist',
              onTap: () => AppJumper.back(
                result: _targetIsReceptionist ? RtcUserRole.Guest : RtcUserRole.Receptionist,
              ),
            ),
          );
        }
        if ((_isOwner || _isReception) && !_targetIsReceptionist) {
          items.add(
            AppSheetAction(
              label: _targetIsManager ? 'Cancel admin' : 'Set admin',
              onTap: () => AppJumper.back(
                result: _targetIsManager ? RtcUserRole.Guest : RtcUserRole.Manager,
              ),
            ),
          );
        }
        items.add(AppSheetAction(label: 'Cancel', onTap: () => AppJumper.back()));
        return items;
      },
    );
    if (next == null) return;
    await _run(
      () => room.changeUserRole(uid: _uid, nextRole: next),
      done: 'Role updated',
    );
  }

  Future<void> _toggleBlock() async {
    if (_busy) return;
    final uidStr = widget.profile.uid;
    if (uidStr.isEmpty || uidStr == '0') return;
    _busy = true;
    final cancel = _blocked;
    if (!cancel) {
      final ok = await AppDialog.show(
        title: 'Block',
        content: 'Block this user? They will not be able to message you.',
        confirmLabel: 'Block',
        cancelLabel: 'Cancel',
        buttons: DialogLoyoutStyle.horizontal,
      );
      if (ok != true) {
        _busy = false;
        return;
      }
    }
    final res = await ChimoApis.relation.setBlackList(userId: uidStr, isCancel: cancel);
    _busy = false;
    if (!mounted) return;
    if (!res.ok) {
      AppToast.error(res.message.isEmpty ? 'Action failed' : res.message);
      return;
    }
    AppToast.info(cancel ? 'Unblocked' : 'Blocked');
    AppJumper.back();
  }

  @override
  Widget build(BuildContext context) {
    final bottom = MediaQuery.paddingOf(context).bottom;
    final items = _items;
    return DecoratedBox(
      decoration: const BoxDecoration(
        color: AppColors.black1C1C1E,
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      child: Padding(
        padding: EdgeInsets.fromLTRB(16.w, 22.w, 16.w, 20.w + bottom),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'More',
              style: TextStyle(
                color: AppColors.white70,
                fontSize: 14.sp,
                fontWeight: FontWeight.w400,
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
              itemBuilder: (context, index) => _MoreCell(item: items[index]),
            ),
          ],
        ),
      ),
    );
  }
}

class _MoreItem {
  const _MoreItem({required this.icon, required this.label, required this.onTap});

  final String icon;
  final String label;
  final VoidCallback onTap;
}

class _MoreCell extends StatelessWidget {
  const _MoreCell({required this.item});

  final _MoreItem item;

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
            child: Chimo.image(item.icon),
          ),
          SizedBox(height: 8.w),
          Text(
            item.label,
            maxLines: 2,
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
