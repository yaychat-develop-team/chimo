import 'package:get/get.dart';

import '../../../../../app/chimo_api.dart';
import '../../../../../app/session_info.dart';
import '../../../../../common/models/server_client/room_cp.pb.dart';
import '../../../../../common/utils/app_log.dart';
import '../../../../../common/utils/app_toast.dart';
import '../../../logic/mic_logic.dart';
import '../../../logic/room_logic.dart';
import '../../../model/mic_seat.dart';
import '../../../page/widgets/mic_queue_sheet.dart';
import '../../../service/room_service.dart';

/// CP 房状态。对齐 joyride `CPController`。
class CpLogic extends GetxController {
  final info = CPInfo().obs;
  final pairEffect = Rxn<CpPairChange>();
  final stageAnim = ''.obs;
  final busy = false.obs;

  RoomService? get _room => RoomService.findOrNull();

  int get rid => _room?.rid ?? 0;

  int get myUid => SessionInfo.uid;

  CPStage get stage => info.value.stage;

  bool get started => stage.value > CPStage.none.value;

  /// 主持麦（位 0）为自己时视为 CP 管理员。
  bool get isCpAdmin {
    if (myUid <= 0 || !Get.isRegistered<MicLogic>()) return false;
    return Get.find<MicLogic>().seats.isNotEmpty &&
        (Get.find<MicLogic>().seats.first.uid ?? 0) == myUid;
  }

  bool get onMic {
    if (!Get.isRegistered<MicLogic>()) return false;
    return Get.find<MicLogic>().onMic;
  }

  MicSeat seatAt(int index) {
    if (!Get.isRegistered<MicLogic>()) return MicSeat(index: index);
    final seats = Get.find<MicLogic>().seats;
    if (index < 0 || index >= seats.length) return MicSeat(index: index);
    return seats[index];
  }

  MicSeat? seatByUid(int uid) {
    if (uid <= 0 || !Get.isRegistered<MicLogic>()) return null;
    for (final seat in Get.find<MicLogic>().seats) {
      if (seat.uid == uid) return seat;
    }
    return null;
  }

  Future<void> loadExt() async {
    final room = _room;
    if (room == null) return;
    final ext = await room.loadExt();
    if (ext != null && ext.hasCpInfo()) {
      apply(ext.cpInfo);
    }
  }

  void apply(CPInfo next) {
    final prev = info.value.stage;
    info.value = next;
    info.refresh();
    if (prev != next.stage) {
      stageAnim.value = _stageAnimOf(next.stage);
    }
  }

  void applyHandsHeart(CPHandsHeartChangeInfo change) {
    final cur = info.value;
    if (!cur.hasHandsInfo()) return;
    cur.handsInfo
      ..currentProgress = change.currentProgress
      ..progressDesc = change.progressDesc
      ..currentTitle = change.currentTitle;
    info.refresh();
  }

  void applyPairEffect(CpPairChange change) {
    pairEffect.value = change;
  }

  void clearStageAnim() => stageAnim.value = '';

  void clearPairEffect() => pairEffect.value = null;

  String _stageAnimOf(CPStage s) {
    switch (s) {
      case CPStage.introduce:
        return 'introduce';
      case CPStage.choose:
        return 'choose';
      case CPStage.hand:
        return 'hand';
      default:
        return '';
    }
  }

  Future<String?> start() async {
    if (rid <= 0 || busy.value) return null;
    if (!isCpAdmin) return 'No permission';
    busy.value = true;
    final result = await ChimoApis.cp.start(rid);
    busy.value = false;
    if (!result.ok) return result.message.isEmpty ? 'Start failed' : result.message;
    return null;
  }

  Future<String?> next({int? relationId}) async {
    if (rid <= 0 || busy.value) return null;
    if (!isCpAdmin) return 'No permission';
    busy.value = true;
    final result = await ChimoApis.cp.next(rid, stage, relationId: relationId);
    busy.value = false;
    if (!result.ok) return result.message.isEmpty ? 'Next failed' : result.message;
    return null;
  }

  Future<String?> end() async {
    if (rid <= 0 || busy.value) return null;
    if (!isCpAdmin) return 'No permission';
    busy.value = true;
    final result = await ChimoApis.cp.end(rid);
    busy.value = false;
    if (!result.ok) return result.message.isEmpty ? 'End failed' : result.message;
    return null;
  }

  /// 上麦；关闭自由上麦时走排麦申请。对齐 joyride `joinMicAuto`。
  Future<void> joinMic({int? position}) async {
    if (Get.isRegistered<RoomLogic>()) {
      await Get.find<RoomLogic>().toggleMic(position: position);
      return;
    }
    final room = _room;
    if (room == null) return;
    final failure = await room.toggleMic(position: position);
    if (failure == 'QUEUE') {
      await MicQueueSheet.show();
      return;
    }
    if (failure != null) AppToast.error(failure);
  }

  @override
  void onClose() {
    AppLog.d('CpLogic disposed');
    super.onClose();
  }
}
