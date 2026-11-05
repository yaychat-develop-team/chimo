import 'dart:async';
import 'dart:math' as math;

import 'package:get/get.dart';

import '../../../../../app/chimo_api.dart';
import '../../../../../app/session_info.dart';
import '../../../../../common/models/server_client/auction.pb.dart';
import '../../../../../common/utils/app_log.dart';
import '../../../../../common/utils/app_toast.dart';
import '../../../../../common/utils/cache_util.dart';
import '../../../logic/mic_logic.dart';
import '../../../model/mic_seat.dart';
import '../../../service/room_service.dart';

/// 拍卖房状态。对齐 joyride `AuctionController` + 流程图阶段机。
class AuctionLogic extends GetxController {
  static const _micTipsDailyType = 'auction_mic_tips';

  final info = Auction.create().obs;
  final clock = 0.obs;
  final busy = false.obs;

  /// 底栏 Join Mic 引导气泡。每日最多展示 3 次（对齐 joyride）。
  final needShowMicTips = false.obs;

  Timer? _tick;
  Timer? _tipsTimer;

  RoomService? get _room => RoomService.findOrNull();

  int get rid => _room?.rid ?? 0;

  int get myUid => SessionInfo.uid;

  MicSeat seatAt(int index) {
    if (!Get.isRegistered<MicLogic>()) return MicSeat(index: index);
    final seats = Get.find<MicLogic>().seats;
    if (index < 0 || index >= seats.length) return MicSeat(index: index);
    return seats[index];
  }

  int uidAt(int index) => seatAt(index).uid ?? 0;

  /// 表演麦艺人 uid（位 1）。开拍必须传该位上的人。
  int get artistUid => uidAt(1);

  bool get isHost => uidAt(0) == myUid && myUid > 0;

  bool get isGuest => uidAt(1) == myUid && myUid > 0;

  bool get hasGuest => uidAt(1) > 0;

  bool get showPriceTips => hasGuest;

  bool get showBtn {
    if (info.value.stage == Stage.PREPARATION) {
      return hasGuest && isHost;
    }
    return info.value.stage != Stage.NONE && isHost;
  }

  bool get showPlusBtn => info.value.extendCount > 0 && isHost;

  bool get showTimeInfo => info.value.stage.value > Stage.PREPARATION.value;

  bool get showBidBtn {
    final stage = info.value.stage;
    return (stage == Stage.PERFORMANCE || stage == Stage.AUCTION) && !isGuest;
  }

  /// 流程图：准备→Start；结算→End；表演/拍卖→Next。
  String get btnLabel {
    switch (info.value.stage) {
      case Stage.PREPARATION:
        return 'Start';
      case Stage.SIGNING:
        return 'End';
      default:
        return 'Next';
    }
  }

  String get stageTitle {
    switch (info.value.stage) {
      case Stage.PREPARATION:
        return 'Stage Prep...';
      case Stage.PERFORMANCE:
        return 'Show Timer';
      case Stage.AUCTION:
        return 'Auction';
      case Stage.SIGNING:
        return 'Settlement';
      default:
        return 'CountDown';
    }
  }

  String get remainTimeStr {
    clock.value;
    var remain = 0;
    final end = info.value.endTime.toInt();
    if (end > 0) {
      final now = DateTime.now().millisecondsSinceEpoch ~/ 1000;
      remain = end - now;
    }
    remain = math.max(remain, 0);
    final m = remain ~/ 60;
    final s = remain % 60;
    return '${m.toString().padLeft(2, '0')}:${s.toString().padLeft(2, '0')}';
  }

  @override
  void onReady() {
    super.onReady();
    final key = CacheKeys.userDailyKey(myUid, _micTipsDailyType);
    final count = CacheUtil.getInt(key);
    if (count >= 3) return;
    _tipsTimer = Timer(const Duration(milliseconds: 1500), () {
      if (isClosed) return;
      needShowMicTips.value = true;
      CacheUtil.setInt(key, count + 1);
      _tipsTimer = Timer(const Duration(seconds: 6), () {
        if (!isClosed) needShowMicTips.value = false;
      });
    });
  }

  void dismissMicTips() => needShowMicTips.value = false;

  void apply(Auction next) {
    info.value = next;
    info.refresh();
    _syncTick();
  }

  Future<void> loadExt() async {
    final room = _room;
    if (room == null || rid <= 0) return;
    final ext = await room.loadExt();
    if (ext == null) {
      AppLog.w('AuctionLogic loadExt empty');
      return;
    }
    if (ext.hasAuctionInfo()) {
      apply(ext.auctionInfo);
    }
  }

  Future<void> hostAction() async {
    if (busy.value) return;
    busy.value = true;
    try {
      if (info.value.stage == Stage.PREPARATION) {
        final artistId = artistUid;
        if (artistId <= 0) {
          AppToast.error('No artist on mic');
          return;
        }
        AppLog.i(
          'AuctionLogic start artistId=$artistId rid=$rid '
          'host=${uidAt(0)} seats=${Get.find<MicLogic>().seats.map((s) => '${s.index}:${s.uid ?? 0}').join(',')}',
        );
        final result = await ChimoApis.auction.start(artistId: artistId, rid: rid);
        if (!result.ok) {
          // 101700005：服务端认定该 uid 不是当前房表演麦艺人 / 不可拍卖。
          AppToast.error(result.message.isEmpty ? 'Start failed' : result.message);
        }
      } else {
        final result = await ChimoApis.auction.nextStage(
          sessionId: info.value.auctionSessionId.toInt(),
          stage: info.value.stage,
        );
        if (!result.ok) {
          AppToast.error(result.message.isEmpty ? 'Next stage failed' : result.message);
        }
      }
    } finally {
      busy.value = false;
    }
  }

  Future<void> addTime() async {
    if (busy.value) return;
    busy.value = true;
    try {
      final result = await ChimoApis.auction.addTime(
        sessionId: info.value.auctionSessionId.toInt(),
        stage: info.value.stage,
      );
      if (!result.ok) {
        AppToast.error(result.message.isEmpty ? 'Extend failed' : result.message);
      }
    } finally {
      busy.value = false;
    }
  }

  void _syncTick() {
    final need = showTimeInfo;
    if (need && _tick == null) {
      _tick = Timer.periodic(const Duration(seconds: 1), (_) {
        clock.value++;
      });
    } else if (!need) {
      _tick?.cancel();
      _tick = null;
    }
  }

  @override
  void onClose() {
    _tick?.cancel();
    _tick = null;
    _tipsTimer?.cancel();
    _tipsTimer = null;
    super.onClose();
  }
}
