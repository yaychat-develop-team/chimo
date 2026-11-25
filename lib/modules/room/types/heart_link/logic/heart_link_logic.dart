import 'package:get/get.dart';

import '../../../../../app/chimo_api.dart';
import '../../../../../app/session_info.dart';
import '../../../../../common/models/server_client/heart_link.pb.dart';
import '../../../../../common/models/server_client/rtc.pb.dart';
import '../../../../../common/utils/app_log.dart';
import '../../../../../common/utils/app_toast.dart';
import '../../../logic/mic_logic.dart';
import '../../../model/mic_seat.dart';
import '../../../service/room_service.dart';
import '../widgets/heart_link_tips_dialog.dart';

/// Heart Link 房状态。对齐 joyride `HtController`。
class HeartLinkLogic extends GetxController {
  final heartLinkInfo = Rxn<RoomHeartLinkInfo>();
  final heartfelt = Rxn<HeartfeltWordsRsp>();
  final noticeInfo = Rxn<HeartLinkInfo>();
  final successInfo = Rxn<HeartLinkInfo>();
  final heartiesIds = <int>{}.obs;
  final wordsFold = false.obs;
  final needShowTipsFlag = false.obs;
  final busy = false.obs;

  /// Boss 引导 tips：有嘉宾且当前用户非嘉宾时才展示。
  bool get needShowTips => needShowTipsFlag.value && hasGuest && !isGuest;

  /// 房内观众列表（Outlookers / Host Control 条）。
  final roomUsers = <SimpleChannelUser>[].obs;
  final showOutlookerDot = false.obs;
  final _dismissedOutlookers = <int>{}.obs;

  RoomService? get _room => RoomService.findOrNull();

  int get rid => _room?.rid ?? 0;

  int get myUid => SessionInfo.uid;

  bool get showHeartfeltWords => _room?.showHeartfeltWords ?? false;

  RoomHeartLinkInfo? get roomHtInfo => heartLinkInfo.value;

  MicSeat seatAt(int index) {
    if (!Get.isRegistered<MicLogic>()) return MicSeat(index: index);
    final seats = Get.find<MicLogic>().seats;
    if (index < 0 || index >= seats.length) return MicSeat(index: index);
    return seats[index];
  }

  bool get isHost {
    final uid = seatAt(0).uid ?? 0;
    return uid > 0 && uid == myUid;
  }

  bool get isGuest {
    final uid = seatAt(1).uid ?? 0;
    return uid > 0 && uid == myUid;
  }

  bool get hasGuest => (seatAt(1).uid ?? 0) > 0;

  bool get needShowSecretCard => seatAt(1).heartLinkCardStatus == 1;

  bool get showHeartLinkBtn => hasGuest && !isGuest;

  /// Host 可见、未点开过的进房用户。
  List<SimpleChannelUser> get outlookerUsers {
    final hostUid = seatAt(0).uid ?? 0;
    final dismissed = _dismissedOutlookers.toSet();
    return roomUsers.toList().where((u) {
      final id = u.id.toInt();
      if (id <= 0 || id == hostUid || id == myUid) return false;
      return !dismissed.contains(id);
    }).toList();
  }

  @override
  void onReady() {
    super.onReady();
    refreshHearties();
    refreshUserList();
    if (showHeartfeltWords) {
      refreshHeartfeltWords();
    }
  }

  Future<void> refreshUserList() async {
    if (rid <= 0) return;
    final result = await ChimoApis.room.channelUsers(rid, count: 200);
    if (!result.ok || result.data == null) return;
    roomUsers.assignAll(result.data!.users);
    if (isHost && outlookerUsers.isNotEmpty) {
      showOutlookerDot.value = true;
    }
  }

  void dismissOutlooker(int uid) {
    if (uid <= 0) return;
    _dismissedOutlookers.add(uid);
    if (outlookerUsers.isEmpty) showOutlookerDot.value = false;
  }

  void clearOutlookerDot() => showOutlookerDot.value = false;

  Future<void> loadExt() async {
    final room = _room;
    if (room == null) return;
    final ext = await room.loadExt();
    if (ext != null && ext.hasHeartLinkInfo()) {
      heartLinkInfo.value = ext.heartLinkInfo;
    }
  }

  Future<void> refreshHearties() async {
    final result = await ChimoApis.heartLink.getHeartiesIdList();
    if (!result.ok || result.data == null) return;
    heartiesIds
      ..clear()
      ..addAll(result.data!.userId.map((e) => e.toInt()));
  }

  Future<void> refreshHeartfeltWords() async {
    final result = await ChimoApis.heartLink.heartfeltWords();
    if (!result.ok) {
      AppLog.w('heartfeltWords failed: ${result.message}');
      return;
    }
    heartfelt.value = result.data;
  }

  Future<void> chooseAnswer(String answer, int questionId) async {
    if (busy.value || rid <= 0) return;
    busy.value = true;
    final result = await ChimoApis.heartLink.chooseHeartfelt(
      rid: rid,
      questionId: questionId,
      answer: answer,
    );
    busy.value = false;
    if (!result.ok) {
      AppToast.error(result.message.isEmpty ? 'Failed' : result.message);
      return;
    }
    AppToast.success('Done!');
    await refreshHeartfeltWords();
  }

  Future<void> viewCard() async {
    if (rid <= 0) return;
    await ChimoApis.heartLink.viewCard(rid);
  }

  Future<void> inviteViewCard() async {
    final gsId = seatAt(1).uid ?? 0;
    if (rid <= 0 || gsId <= 0) {
      AppToast.info('Please invite a guest on mic first');
      return;
    }
    if (!needShowSecretCard) {
      AppToast.info('Please remind the guest to complete the Reveal Card');
      return;
    }
    final result = await ChimoApis.heartLink.inviteViewCard(rid: rid, gsId: gsId);
    if (!result.ok) {
      AppToast.error(result.message.isEmpty ? 'Failed' : result.message);
      return;
    }
    AppToast.success('Done!');
  }

  Future<bool> createPrivateRoom(int uid1, int uid2) async {
    if (rid <= 0) return false;
    final result = await ChimoApis.heartLink.createPrivateRoom(
      rid: rid,
      uid1: uid1,
      uid2: uid2,
    );
    if (!result.ok) {
      AppToast.error(result.message.isEmpty ? 'Failed' : result.message);
      return false;
    }
    return true;
  }

  void onHeartLinkSuccess(HeartLinkInfo info) {
    successInfo.value = info;
    refreshHearties();
  }

  void clearSuccess() => successInfo.value = null;

  void onUnlockCard(HeartLinkInfo info) {
    AppToast.success('${info.name1} and ${info.name2} sparked a connection!');
  }

  void onGrantUpToMic() {
    // 对齐 oumi `HtController.showMicOnDialog`：嘉宾被抱麦后弹开麦提示。
    HeartLinkTipsDialog.showMicOn();
  }

  void onViewCardNotice(HeartLinkInfo info) {
    noticeInfo.value = info;
  }

  void clearNotice() => noticeInfo.value = null;

  void onNewUserJoin(HeartLinkInfo info) {
    // 对齐 oumi `HtController.showNewUserDialog`：Host 收到新人进房弹窗。
    HeartLinkTipsDialog.showNewUser(info);
    refreshUserList();
  }

  void onUserJoin() {
    refreshUserList();
  }

  bool isHeartie(int uid) => uid > 0 && heartiesIds.contains(uid);
}
