import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../app/chimo_api.dart';
import '../../../../../app/session_info.dart';
import '../../../../../common/models/server_client/room_turntable.pb.dart';
import '../../../../../common/theme/app_colors.dart';
import '../../../../../common/theme/app_dialog.dart';
import '../../../../../common/utils/app_log.dart';
import '../../../../../common/utils/app_toast.dart';
import '../../../service/room_service.dart';

/// 转盘状态。对齐 joyride `TurntableStatus`。
enum TurntableStatus {
  /// 初始态：未转动过，静止展示。
  idle,

  /// 转动态：收到 stopId == 0，或减速到目标中。
  rotating,

  /// 停止态：动画彻底结束后停在奖项上。
  stopped,
}

/// 房间转盘状态。对齐 joyride `TurntableController`。
class TurntableLogic extends GetxController {
  TurntableInfo? _info;
  final status = TurntableStatus.idle.obs;
  final visible = true.obs;
  final tick = 0.obs;

  static const _resetDelay = Duration(seconds: 5);

  Timer? _resetTimer;
  Timer? _fallbackStopTimer;

  RoomService? get _room => RoomService.findOrNull();

  int get rid => _room?.rid ?? 0;

  TurntableInfo? get info => _info;

  bool get enabled => _info?.items.isNotEmpty ?? false;

  bool get show => visible.value && _info != null && enabled;

  bool get isIdle => status.value == TurntableStatus.idle;

  bool get isRotating => status.value == TurntableStatus.rotating;

  bool get isStopped => status.value == TurntableStatus.stopped;

  int get stopId => _info?.stopId ?? 0;

  set info(TurntableInfo? value) {
    if (_info == null) {
      visible.value = true;
    }
    if (value == null) {
      _cancelResetTimer();
      _cancelFallbackTimer();
      status.value = TurntableStatus.idle;
    }
    _info = value;
    tick.value++;
  }

  Future<void> loadExt() async {
    final room = _room;
    if (room == null) return;
    final ext = await room.loadExt();
    if (ext == null) return;
    if (ext.hasTurntableInfo() && ext.turntableInfo.items.isNotEmpty) {
      info = ext.turntableInfo;
    } else if (!enabled) {
      info = null;
    }
  }

  /// stopId == 0 开始转动；stopId > 0 减速到目标。
  void onTurntableMsg(TurntableInfo? value) {
    if (value != null) {
      if (value.items.isEmpty && (_info?.items.isNotEmpty ?? false)) {
        value.items.addAll(_info!.items);
      }
      if (value.stopId == 0) {
        _cancelResetTimer();
        _cancelFallbackTimer();
        status.value = TurntableStatus.rotating;
      } else if (value.stopId > 0) {
        _cancelResetTimer();
        status.value = TurntableStatus.rotating;
        if (!show) {
          _startFallbackStopTimer();
        }
      } else {
        status.value = TurntableStatus.idle;
      }
    }
    AppLog.d('TurntableLogic.onTurntableMsg stopId=${value?.stopId} status=${status.value}');
    info = value;
  }

  /// 转盘动画彻底结束后回调。
  Future<void> onRotateStop() async {
    _cancelFallbackTimer();
    status.value = TurntableStatus.stopped;
    tick.value++;
    final winnerUid = _info?.userId.toInt() ?? 0;
    if (winnerUid > 0 && winnerUid == SessionInfo.uid) {
      await _showResultDialog();
      if (!isStopped) return;
      status.value = TurntableStatus.idle;
      tick.value++;
      return;
    }
    _startResetTimer();
  }

  Future<void> enable() async {
    if (rid <= 0) return;
    final result = await ChimoApis.room.enableTurntable(rid);
    if (!result.ok) {
      AppToast.error(result.message.isEmpty ? 'Enable failed' : result.message);
      return;
    }
    await loadExt();
  }

  Future<void> disable() async {
    if (rid <= 0) return;
    final result = await ChimoApis.room.disableTurntable(rid);
    if (!result.ok) {
      AppToast.error(result.message.isEmpty ? 'Disable failed' : result.message);
      return;
    }
    info = null;
  }

  Future<void> start() async {
    if (rid <= 0 || isRotating) return;
    final result = await ChimoApis.room.startTurntable(rid);
    if (!result.ok) {
      AppToast.error(result.message.isEmpty ? 'Start failed' : result.message);
    }
  }

  void hide() => visible.value = false;

  void reveal() => visible.value = true;

  Future<void> _showResultDialog() async {
    TurntableItem? item;
    for (final entry in _info?.items ?? const <TurntableItem>[]) {
      if (entry.id == stopId) {
        item = entry;
        break;
      }
    }
    if (item == null) return;
    await AppDialog.show(
      title: 'YOUR CHALLENGE',
      titleColor: AppColors.green00FEA8,
      contentWidget: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            item.title,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: AppColors.gray333333,
              fontSize: 18,
              fontWeight: FontWeight.w900,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            item.desc,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: AppColors.gray6E6E6E,
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
      confirmLabel: 'Got it!',
      buttons: DialogLoyoutStyle.confirmOnly,
      barrierDismissible: false,
    );
  }

  void _startFallbackStopTimer() {
    _cancelFallbackTimer();
    _fallbackStopTimer = Timer(const Duration(milliseconds: 2000), () {
      _fallbackStopTimer = null;
      if (isRotating && stopId > 0) {
        onRotateStop();
      }
    });
  }

  void _cancelFallbackTimer() {
    _fallbackStopTimer?.cancel();
    _fallbackStopTimer = null;
  }

  void _startResetTimer() {
    _cancelResetTimer();
    _resetTimer = Timer(_resetDelay, () {
      _resetTimer = null;
      if (!isStopped) return;
      status.value = TurntableStatus.idle;
      tick.value++;
    });
  }

  void _cancelResetTimer() {
    _resetTimer?.cancel();
    _resetTimer = null;
  }

  @override
  void onClose() {
    _cancelResetTimer();
    _cancelFallbackTimer();
    super.onClose();
  }
}
