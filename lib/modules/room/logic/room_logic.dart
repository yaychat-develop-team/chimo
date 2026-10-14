import 'dart:async';

import 'package:get/get.dart';

import '../../../common/utils/app_toast.dart';
import '../model/room_join_result.dart';
import '../service/room_service.dart';

enum RoomPhase { loading, needPassword, ready, failed }

/// 跟房间页走的状态。频道、麦位、socket 都在 [RoomService]。
class RoomLogic extends GetxController {
  RoomLogic(this.rid);

  final int rid;
  final phase = RoomPhase.loading.obs;
  final joining = false.obs;

  /// 房间页还在树上。返回列表后为 false，下次进入要重新铺界面。
  var pageMounted = false;

  /// 页面销毁后清掉。路由回收有时会留下实例，再删一次才能真正放掉。
  static void release() {
    if (!Get.isRegistered<RoomLogic>()) return;
    Get.find<RoomLogic>().pageMounted = false;
    Get.delete<RoomLogic>(force: true);
    if (Get.isRegistered<RoomLogic>()) Get.delete<RoomLogic>(force: true);
  }

  RoomService get service => RoomService.ensure();

  @override
  void onReady() {
    super.onReady();
    final current = RoomService.findOrNull();
    if (current != null && current.inRoom.value && current.rid == rid) {
      unawaited(_restore(current));
      return;
    }
    enter();
  }

  Future<void> _restore(RoomService current) async {
    phase.value = RoomPhase.loading;
    current.restore();
    await current.ensureChildren();
    if (isClosed) return;
    phase.value = RoomPhase.ready;
  }

  Future<void> enter({String password = ''}) async {
    if (joining.value) return;
    joining.value = true;
    phase.value = RoomPhase.loading;
    final result = await service.join(rid, password: password);
    joining.value = false;
    await _apply(result);
  }

  Future<void> send(String text) async {
    final failure = await service.sendText(text);
    if (failure != null) AppToast.error(failure);
  }

  Future<void> toggleMic({int? position}) async {
    final failure = await service.toggleMic(position: position);
    if (failure != null) AppToast.error(failure);
  }

  /// 已上麦时开闭麦，未上麦时上麦。
  Future<void> toggleLocalMic() async {
    final failure = await service.toggleLocalMic();
    if (failure != null) AppToast.error(failure);
  }

  Future<void> toggleSave() async {
    final failure = await service.toggleSave();
    if (failure != null) AppToast.error(failure);
  }

  void minimize() => service.minimize();

  Future<void> leave() => service.leave();

  Future<void> abandon() => service.leave();

  Future<void> _apply(RoomJoinResult result) async {
    if (result.ok) {
      phase.value = RoomPhase.ready;
      return;
    }
    if (result.needPassword) {
      phase.value = RoomPhase.needPassword;
      return;
    }
    phase.value = RoomPhase.failed;
    final current = RoomService.findOrNull();
    if (current != null && !current.inRoom.value) {
      await Get.delete<RoomService>(force: true);
    }
    if (result.message.isNotEmpty) AppToast.error(result.message);
  }
}
