import 'dart:async';
import 'dart:convert';

import 'package:fixnum/fixnum.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../../../app/chimo_api.dart';
import '../../../app/session_info.dart';
import '../../../common/models/server_client/message.pb.dart';
import '../../../common/models/server_client/mic_tool.pbenum.dart';
import '../../../common/models/server_client/rtc.pb.dart';
import '../../../common/utils/app_log.dart';
import '../../../common/utils/app_permissions.dart';
import '../../../common/utils/app_toast.dart';
import '../logic/barrage_logic.dart';
import '../logic/mic_logic.dart';
import '../logic/room_effect_logic.dart';
import '../model/room_join_result.dart';
import '../page/widgets/room_float.dart';
import '../play/room_play.dart';
import '../rtc/room_rtc.dart';
import '../rtc/tencent_room_rtc.dart';
import '../socket/room_msg_handler.dart';
import '../socket/room_socket.dart';

/// 一次进房的存活对象。最小化关页面时它还在，真正退房才释放。
class RoomService extends GetxService {
  static RoomService ensure() {
    if (Get.isRegistered<RoomService>()) return Get.find<RoomService>();
    return Get.put(RoomService());
  }

  static RoomService? findOrNull() {
    if (!Get.isRegistered<RoomService>()) return null;
    return Get.find<RoomService>();
  }

  int rid = 0;
  final title = ''.obs;
  final theme = ''.obs;
  final online = 0.obs;
  final cover = ''.obs;
  final hot = 0.obs;
  final notice = ''.obs;
  final background = ''.obs;
  final saved = false.obs;
  final hostOnTop = true.obs;
  final audience = <String>[].obs;
  final inRoom = false.obs;
  final minimized = false.obs;
  final plays = <RoomPlay>[].obs;
  /// 当前用户在房角色，对齐 joyride `channel.role`。
  final role = RtcUserRole.Guest.obs;
  /// 房间开关状态，对齐 joyride `channel.status`（`NORMAL` / `CLOSED`）。
  final status = ''.obs;
  /// 是否自由上麦。`false` 时非管理需排麦。对齐 joyride `channel.freePub`。
  final freePub = true.obs;
  /// 是否开放公屏。对齐 joyride `channel.freePublicChat`。
  final freePublicChat = true.obs;
  /// 是否展示麦上礼物统计。对齐 joyride `channel.giftValueCountSwitch`。
  final giftValueCountSwitch = false.obs;
  /// 是否设置了进房密码。对齐 joyride `channel.hasPassword`。
  final hasPassword = false.obs;
  /// 是否隐私模式。对齐 joyride `channel.isPrivacy`。
  final isPrivacy = false.obs;
  /// 当前麦位布局名。对齐 joyride `roomTypeObj.layoutName`。
  final layoutName = ''.obs;
  MicLayoutEnum? micLayout;
  /// 普通排队 / Boss 排队。对齐 joyride `waitQueue` / `carOwnerMicQueue`。
  final waitQueue = <SimpleChannelUserSlot>[].obs;
  final carOwnerMicQueue = <SimpleChannelUserSlot>[].obs;
  /// 进房扩展（拍卖 / CP 等）。由 [loadExt] 填充。
  JoinChannelExtendRsp? channelExt;
  RoomType? roomType;
  /// 房间停留倒计时截止（unix 秒）。0 表示无。来自 `Channel.countDownTimestamp`。
  final countDownAt = 0.obs;
  var _saving = false;

  bool get isOwner => role.value == RtcUserRole.Owner;

  bool get isStaff =>
      role.value == RtcUserRole.Owner ||
      role.value == RtcUserRole.Receptionist ||
      role.value == RtcUserRole.Manager;

  /// 房主 / 接待。对齐 joyride `isOwnerOrRec`。
  bool get isOwnerOrReceptionist =>
      isOwner || role.value == RtcUserRole.Receptionist;

  /// 拍卖主持麦：仅房主 / 接待可上。对齐流程图。
  bool get canTakeHostMic =>
      isOwner || role.value == RtcUserRole.Receptionist;

  bool get isRoomClosed => status.value == RoomStatusEnum.CLOSED.name;

  bool get isAuctionRoom =>
      roomType == RoomType.AUCTION || (channelExt?.hasAuctionInfo() ?? false);

  bool get isCpRoom =>
      roomType == RoomType.CP || (channelExt?.hasCpInfo() ?? false);

  /// 非管理且非自由上麦时需走排麦。对齐 joyride `micNeedQueue`。
  bool get micNeedQueue => !isStaff && !freePub.value;

  /// 麦位目标数量；拍卖房 5；CP 房 8（0 主持 / 1–6 嘉宾 / 7 嘉宾位）。
  int? get preferredSeatCount {
    if (isAuctionRoom) return 5;
    if (isCpRoom) return 8;
    return null;
  }

  /// 房主可关/开；接待仅可关（对齐 joyride）。
  bool get canToggleClose =>
      isOwner || (role.value == RtcUserRole.Receptionist && !isRoomClosed);

  /// 房间倒计时是否仍在进行。对齐 joyride `hasTimingInRoom`。
  bool get hasRoomTimer {
    final at = countDownAt.value;
    if (at <= 0) return false;
    return at > DateTime.now().millisecondsSinceEpoch ~/ 1000;
  }

  /// CP 房且本人在 0 号主持麦。对齐 joyride `showTimeAction`。
  bool get showCpRoomTimer => isCpRoom && hostUid() == myUid;

  RoomSocket? _socket;
  RoomRtc? _rtc;
  OverlayEntry? _float;

  /// 成功连上次数；>0 表示本次是重连，需补刷麦位。
  var _socketConnectCount = 0;
  DateTime? _lastSeatRefreshAt;

  int get myUid => SessionInfo.uid;

  String get myName => SessionInfo.currentUser?.nickname.trim() ?? '';

  Future<RoomJoinResult> join(int nextRid, {String password = ''}) async {
    if (inRoom.value && rid != nextRid) await _teardown();
    if (inRoom.value && rid == nextRid) return const RoomJoinResult.ok();

    final result = await ChimoApis.room.join(rid: nextRid, password: password);
    if (!result.ok || result.data == null) {
      if (result.code == RoomApi.lockedCode) return const RoomJoinResult.password();
      return RoomJoinResult.fail(
        result.message.isEmpty ? 'Unable to enter the room' : result.message,
      );
    }

    final channel = result.data!.channel;
    _applyChannel(channel);
    _mountChildren(channel);

    final resolved = RoomPlays.resolve(channel);
    plays.assignAll(resolved);
    for (final play in resolved) {
      await play.onJoined(this);
    }

    // 麦位和房间信息已经在 join 回包里。聊天和语音放后台，避免历史请求卡住整页。
    inRoom.value = true;
    final joinRsp = result.data!;
    unawaited(_openSocket(joinRsp));
    unawaited(_openRtc(joinRsp));
    unawaited(_maybeAutoMic(joinRsp));
    return const RoomJoinResult.ok();
  }

  /// 拉房间扩展信息。拍卖 / CP / 心动等玩法共用。
  Future<JoinChannelExtendRsp?> loadExt() async {
    if (rid <= 0) return null;
    final result = await ChimoApis.room.joinChannelExt(rid);
    if (!result.ok || result.data == null) {
      AppLog.w('RoomService loadExt failed: ${result.message}');
      return null;
    }
    channelExt = result.data;
    return channelExt;
  }

  Future<String?> sendText(String raw) async {
    final text = raw.trim();
    if (text.isEmpty || !inRoom.value) return null;
    final result = await ChimoApis.room.sendText(rid, text);
    if (!result.ok) return result.message.isEmpty ? 'Send failed' : result.message;
    // 对齐 yaychat：不本地插一条；等 socket 回推进公屏，避免自己发的弹幕出现两条。
    return null;
  }

  /// 房间贴纸。对齐 joyride：`mic_emote` → `/rtc/mic_img/show`；其它 → 公屏 text+extra。
  Future<String?> sendRoomSticker({
    required String packId,
    required String packType,
    required String stickerId,
    required String name,
    required String url,
  }) async {
    if (!inRoom.value || rid <= 0) return null;
    final icon = url.trim();
    if (icon.isEmpty) return null;
    if (packType.trim() == 'mic_emote') {
      final result = await ChimoApis.room.sendMicImage(
        rid: rid,
        uid: myUid,
        url: icon,
        type: 3,
      );
      if (!result.ok) return result.message.isEmpty ? 'Send failed' : result.message;
      // 乐观展示：不等 SOCKET 回推，麦位立刻能看到（对齐用户「发出去了」的预期）。
      if (Get.isRegistered<MicLogic>()) {
        Get.find<MicLogic>().showMicEmote(uid: myUid, url: icon, type: 3);
      }
      return null;
    }
    final extra = jsonEncode({
      'type': 'emote',
      'emote': {
        'emoticons_id': packId,
        'emoticons_type': packType,
        'id': stickerId,
        'desc': name,
        'url': icon,
      },
    });
    final text = name.trim().isEmpty ? '[Sticker]' : name.trim();
    final result = await ChimoApis.room.sendShowItems(rid, [
      ShowItem(style: ItemStyle.text, text: text, extra: extra),
    ]);
    if (!result.ok) return result.message.isEmpty ? 'Send failed' : result.message;
    return null;
  }

  /// 麦上表情公屏 icon（对齐 joyride `sendMicImgMsg`，仅自己发一次）。
  Future<String?> sendMicIconBarrage(String url) async {
    final icon = url.trim();
    if (icon.isEmpty || !inRoom.value) return null;
    final result = await ChimoApis.room.sendShowItems(rid, [
      ShowItem(style: ItemStyle.icon, url: icon, size: 30),
    ]);
    if (!result.ok) return result.message.isEmpty ? 'Send failed' : result.message;
    return null;
  }

  /// 已在麦上时只切换本地开闭麦，不下麦。
  Future<String?> toggleLocalMic() async {
    if (!inRoom.value) return null;
    final mic = Get.find<MicLogic>();
    if (!mic.onMic) return toggleMic();
    if (mic.localOpen) {
      await _rtc?.closeMic();
      mic.setLocalOpen(false);
      return null;
    }
    final micPermission = await _ensureMicPermission();
    if (micPermission != null) return micPermission;
    await _rtc?.openMic();
    mic.setLocalOpen(true);
    return null;
  }

  /// 未上麦则上麦；已上麦则下麦。点空麦位时带 [position]。
  ///
  /// 需排麦时返回 `'QUEUE'`，由页面打开 [MicQueueSheet]（避免 Service 依赖 UI）。
  Future<String?> toggleMic({int? position}) async {
    if (!inRoom.value) return null;
    final mic = Get.find<MicLogic>();
    if (mic.onMic && position == null) {
      final result = await ChimoApis.room.downMic(rid);
      if (!result.ok) return result.message.isEmpty ? 'Unable to leave the mic' : result.message;
      await _refreshSeats();
      _syncLocalAudio();
      return null;
    }
    if (mic.onMic && position != null) {
      final mine = mic.seats.firstWhere((seat) => seat.uid == myUid);
      if (mine.index == position) {
        if (mine.micOpen) {
          await _rtc?.closeMic();
          mic.setLocalOpen(false);
        } else {
          final micPermission = await _ensureMicPermission();
          if (micPermission != null) return micPermission;
          await _rtc?.openMic();
          mic.setLocalOpen(true);
        }
        return null;
      }
    }
    // 拍卖主持麦：仅房主 / 接待（流程图）；不进排麦。
    if (!mic.onMic && isAuctionRoom && position == 0 && !canTakeHostMic) {
      return 'Only owner or receptionist can take the host mic';
    }
    if (!mic.onMic && micNeedQueue) return 'QUEUE';
    final micPermission = await _ensureMicPermission();
    if (micPermission != null) return micPermission;
    final result = await ChimoApis.room.upMic(rid, position: position);
    if (!result.ok) return result.message.isEmpty ? 'Unable to take the mic' : result.message;
    await _refreshSeats();
    _syncLocalAudio();
    return null;
  }

  Future<String?> queueMic(QueueType type) async {
    if (!inRoom.value || rid <= 0) return null;
    final micPermission = await _ensureMicPermission();
    if (micPermission != null) return micPermission;
    final result = await ChimoApis.room.queueMic(rid, type);
    if (!result.ok) return result.message.isEmpty ? 'Unable to join the queue' : result.message;
    return null;
  }

  Future<String?> cancelQueueMic(QueueType type) async {
    if (!inRoom.value || rid <= 0) return null;
    final result = await ChimoApis.room.cancelQueueMic(rid, type);
    if (!result.ok) return result.message.isEmpty ? 'Unable to leave the queue' : result.message;
    return null;
  }

  Future<String?> grantOnMic({required int uid, required int position}) async {
    if (!inRoom.value || rid <= 0 || uid <= 0) return null;
    if (!isStaff) return 'No permission';
    final result = await ChimoApis.room.grantUpMic(rid: rid, uid: uid, position: position);
    if (!result.ok) return result.message.isEmpty ? 'Unable to grant mic' : result.message;
    await _refreshSeats();
    return null;
  }

  /// 拍卖房按队列类型抱麦：艺人→1，Boss→2/3/4 空位。对齐 joyride `grantTypeOnMic`。
  Future<String?> grantTypeOnMic({required int uid, required QueueType type}) async {
    if (!isAuctionRoom) return 'Not an auction room';
    if (type == QueueType.CAR_OWNER_QUEUE) {
      if (_uidAt(1) > 0) return 'Artist mic is occupied';
      return grantOnMic(uid: uid, position: 1);
    }
    if (type == QueueType.COMMON_QUEUE) {
      final empty = [2, 3, 4].firstWhere((i) => _uidAt(i) == 0, orElse: () => -1);
      if (empty < 0) return 'Boss mics are full';
      return grantOnMic(uid: uid, position: empty);
    }
    return 'Unsupported queue';
  }

  int _uidAt(int index) {
    if (!Get.isRegistered<MicLogic>()) return 0;
    final seats = Get.find<MicLogic>().seats;
    if (index < 0 || index >= seats.length) return 0;
    return seats[index].uid ?? 0;
  }

  void applyMicQueues({
    Iterable<SimpleChannelUserSlot>? wait,
    Iterable<SimpleChannelUserSlot>? carOwner,
  }) {
    if (wait != null) {
      waitQueue
        ..assignAll(wait)
        ..refresh();
    }
    if (carOwner != null) {
      carOwnerMicQueue
        ..assignAll(carOwner)
        ..refresh();
    }
  }

  bool inQueue(QueueType type) {
    final list = type == QueueType.CAR_OWNER_QUEUE ? carOwnerMicQueue : waitQueue;
    return list.any((slot) => slot.hasUser() && slot.user.id.toInt() == myUid);
  }

  Future<String?> toggleSave() async {
    if (_saving || !inRoom.value || rid <= 0) return null;
    _saving = true;
    final next = !saved.value;
    final result = next ? await ChimoApis.room.collect(rid) : await ChimoApis.room.uncollect(rid);
    _saving = false;
    if (!result.ok) return result.message.isEmpty ? 'Unable to save the room' : result.message;
    saved.value = next;
    return null;
  }

  /// 全员警告。对齐 joyride Room Tools Warn。
  Future<String?> warnAll({String reason = ''}) async {
    if (!inRoom.value || rid <= 0) return null;
    if (!isStaff) return 'No permission';
    final result = await ChimoApis.room.warnAll(rid, reason: reason);
    if (!result.ok) return result.message.isEmpty ? 'Warn failed' : result.message;
    return null;
  }

  /// 警告指定用户。
  Future<String?> warnUser(int uid, {String reason = ''}) async {
    if (!inRoom.value || rid <= 0 || uid <= 0) return null;
    if (!isStaff) return 'No permission';
    final result = await ChimoApis.room.warnUser(rid: rid, uid: uid, reason: reason);
    if (!result.ok) return result.message.isEmpty ? 'Warn failed' : result.message;
    return null;
  }

  Future<String?> grantDownMic(int uid) async {
    if (!inRoom.value || rid <= 0 || uid <= 0) return null;
    if (!isStaff) return 'No permission';
    final result = await ChimoApis.room.grantDownMic(rid: rid, uid: uid);
    if (!result.ok) return result.message.isEmpty ? 'Unable to take off mic' : result.message;
    await _refreshSeats();
    return null;
  }

  /// 抱上第一个空麦；拍卖房优先表演麦(1)，否则 Boss 空位。
  Future<String?> grantFirstEmptyMic(int uid) async {
    if (!inRoom.value || rid <= 0 || uid <= 0) return null;
    if (!isStaff) return 'No permission';
    if (isAuctionRoom) {
      if (_uidAt(1) == 0) return grantOnMic(uid: uid, position: 1);
      final empty = [2, 3, 4].firstWhere((i) => _uidAt(i) == 0, orElse: () => -1);
      if (empty < 0) return 'No empty mic';
      return grantOnMic(uid: uid, position: empty);
    }
    if (!Get.isRegistered<MicLogic>()) return 'Mic unavailable';
    final seats = Get.find<MicLogic>().seats;
    final empty = seats.indexWhere((s) => !s.occupied);
    if (empty < 0) return 'No empty mic';
    return grantOnMic(uid: uid, position: empty);
  }

  Future<String?> kickUser({required int uid, required int leaveSeconds}) async {
    if (!inRoom.value || rid <= 0 || uid <= 0) return null;
    if (!isStaff) return 'No permission';
    final result = await ChimoApis.room.kickUser(
      rid: rid,
      uid: uid,
      leaveSeconds: leaveSeconds,
    );
    if (!result.ok) return result.message.isEmpty ? 'Kick failed' : result.message;
    await _refreshSeats();
    return null;
  }

  Future<String?> changeUserRole({required int uid, required RtcUserRole nextRole}) async {
    if (!inRoom.value || rid <= 0 || uid <= 0) return null;
    final me = role.value;
    final canManage =
        me == RtcUserRole.Owner || me == RtcUserRole.Receptionist;
    if (!canManage) return 'No permission';
    if (nextRole == RtcUserRole.Receptionist && me != RtcUserRole.Owner) {
      return 'No permission';
    }
    final result = await ChimoApis.room.changeRole(rid: rid, uid: uid, role: nextRole);
    if (!result.ok) return result.message.isEmpty ? 'Role update failed' : result.message;
    return null;
  }

  /// 查在线用户（角色 / 禁麦等）。对齐 joyride 资料卡更多面板。
  Future<SimpleChannelUser?> lookupChannelUser(int uid) async {
    if (!inRoom.value || rid <= 0 || uid <= 0) return null;
    final result = await ChimoApis.room.channelUsers(rid, count: 100);
    if (!result.ok || result.data == null) return null;
    for (final user in result.data!.users) {
      if (user.id.toInt() == uid) return user;
    }
    if (result.data!.hasMyself() && result.data!.myself.id.toInt() == uid) {
      return result.data!.myself;
    }
    return null;
  }

  Future<String?> setForceMic({required int uid, required bool forbid}) async {
    if (!inRoom.value || rid <= 0 || uid <= 0) return null;
    if (!isStaff) return 'No permission';
    final result = forbid
        ? await ChimoApis.room.managerCloseMic(rid: rid, uid: uid)
        : await ChimoApis.room.managerOpenMic(rid: rid, uid: uid);
    if (!result.ok) return result.message.isEmpty ? 'Mic ban failed' : result.message;
    return null;
  }

  Future<String?> forbidWord(int uid) async {
    if (!inRoom.value || rid <= 0 || uid <= 0) return null;
    if (!isStaff) return 'No permission';
    final result = await ChimoApis.room.forbidWord(rid: rid, uid: uid);
    if (!result.ok) return result.message.isEmpty ? 'Mute failed' : result.message;
    return null;
  }

  Future<String?> clearMicScore(int uid) async {
    if (!inRoom.value || rid <= 0 || uid <= 0) return null;
    if (!isStaff) return 'No permission';
    final result = await ChimoApis.room.clearMicScore(rid: rid, uid: uid);
    if (!result.ok) return result.message.isEmpty ? 'Clear failed' : result.message;
    await _refreshSeats();
    return null;
  }

  Future<String?> setMicTimer({
    required int uid,
    required bool open,
    int seconds = 60,
  }) async {
    if (!inRoom.value || rid <= 0 || uid <= 0) return null;
    if (!isStaff) return 'No permission';
    final result = await ChimoApis.room.micCounter(
      type: open ? OpType.OP_OPEN : OpType.OP_CLOSE,
      rid: rid,
      uid: uid,
      seconds: open ? seconds : 0,
    );
    if (!result.ok) return result.message.isEmpty ? 'Timer failed' : result.message;
    await _refreshSeats();
    return null;
  }

  /// 开关公屏。对齐 joyride `switchPublicScreen`。
  Future<String?> togglePublicChat() async {
    if (!inRoom.value || rid <= 0) return null;
    if (!isStaff) return 'No permission';
    final next = !freePublicChat.value;
    final result = await ChimoApis.room.updateFields(
      rid,
      ChannelFields(freePublicChat: next),
    );
    if (!result.ok) {
      return result.message.isEmpty ? 'Public screen update failed' : result.message;
    }
    freePublicChat.value = next;
    return null;
  }

  /// 开关麦上礼物统计。对齐 joyride `switchGiftValueCountSwitch`。
  Future<String?> toggleGiftValueCount() async {
    if (!inRoom.value || rid <= 0) return null;
    if (!isOwnerOrReceptionist) return 'No permission';
    final next = !giftValueCountSwitch.value;
    final result = await ChimoApis.room.updateFields(
      rid,
      ChannelFields(giftValueCountSwitch: next),
    );
    if (!result.ok) {
      return result.message.isEmpty ? 'Gift stats update failed' : result.message;
    }
    giftValueCountSwitch.value = next;
    return null;
  }

  /// 房间倒计时（CP 主持麦）。对齐 joyride `managerShowRoomTime`。
  Future<String?> setRoomTimer({required bool open, int seconds = 60}) async {
    if (!inRoom.value || rid <= 0) return null;
    if (!showCpRoomTimer) return 'No permission';
    final result = await ChimoApis.room.roomCounter(
      type: open ? OpType.OP_OPEN : OpType.OP_CLOSE,
      rid: rid,
      seconds: open ? seconds : 0,
    );
    if (!result.ok) return result.message.isEmpty ? 'Timer failed' : result.message;
    if (!open) {
      countDownAt.value = 0;
    } else {
      countDownAt.value = DateTime.now().millisecondsSinceEpoch ~/ 1000 + seconds;
    }
    return null;
  }

  /// 更新房间名称。对齐 joyride `updateTitle`。
  Future<String?> updateTitle(String value) async {
    if (!inRoom.value || rid <= 0) return null;
    if (!isOwnerOrReceptionist) return 'No permission';
    final next = value.trim();
    if (next == title.value) return null;
    final result = await ChimoApis.room.updateFields(rid, ChannelFields(title: next));
    if (!result.ok) return result.message.isEmpty ? 'Update failed' : result.message;
    title.value = next.isEmpty ? 'Room $rid' : next;
    return null;
  }

  /// 更新房间主题。对齐 joyride `updateTheme`。
  Future<String?> updateTheme(String value) async {
    if (!inRoom.value || rid <= 0) return null;
    if (!isOwnerOrReceptionist) return 'No permission';
    final next = value.trim();
    if (next == theme.value) return null;
    final result = await ChimoApis.room.updateFields(rid, ChannelFields(theme: next));
    if (!result.ok) return result.message.isEmpty ? 'Update failed' : result.message;
    theme.value = next;
    return null;
  }

  /// 更新房间公告。对齐 joyride `updateNotice`。
  Future<String?> updateNotice(String value) async {
    if (!inRoom.value || rid <= 0) return null;
    if (!isOwnerOrReceptionist) return 'No permission';
    if (value == notice.value) return null;
    final result = await ChimoApis.room.updateFields(rid, ChannelFields(notice: value));
    if (!result.ok) return result.message.isEmpty ? 'Update failed' : result.message;
    notice.value = value;
    return null;
  }

  /// 开关自由上麦。对齐 joyride `switchFreePub`。
  Future<String?> toggleFreePub() async {
    if (!inRoom.value || rid <= 0) return null;
    if (!isOwnerOrReceptionist) return 'No permission';
    final next = !freePub.value;
    freePub.value = next;
    final result = await ChimoApis.room.updateFields(rid, ChannelFields(freePub: next));
    if (!result.ok) {
      freePub.value = !next;
      return result.message.isEmpty ? 'Update failed' : result.message;
    }
    return null;
  }

  /// 更新隐私设置。对齐 joyride `RoomMainToolPrivacyModel.confirm`。
  Future<String?> updatePrivacy({
    required bool lock,
    required String password,
    required bool privacy,
  }) async {
    if (!inRoom.value || rid <= 0) return null;
    if (!isOwnerOrReceptionist) return 'No permission';
    if (lock && password.length != 4) return 'Please enter a 4-digit password';
    final result = await ChimoApis.room.updateFields(
      rid,
      ChannelFields(
        isPrivacy: privacy,
        password: lock ? password : '',
      ),
    );
    if (!result.ok) return result.message.isEmpty ? 'Update failed' : result.message;
    hasPassword.value = lock;
    isPrivacy.value = privacy;
    return null;
  }

  /// 更新麦位布局。对齐 joyride `updateMicLayout`。
  Future<String?> updateMicLayout(MicLayoutItem item) async {
    if (!inRoom.value || rid <= 0) return null;
    if (!isOwnerOrReceptionist) return 'No permission';
    if (micLayout == item.layout) return null;
    final result = await ChimoApis.room.updateFields(
      rid,
      ChannelFields(layout: item.layout),
    );
    if (!result.ok) return result.message.isEmpty ? 'Update failed' : result.message;
    micLayout = item.layout;
    layoutName.value = item.layoutName;
    hostOnTop.value = item.layout != MicLayoutEnum.TILED_4_4 &&
        item.layout != MicLayoutEnum.TILED_3_3;
    if (Get.isRegistered<MicLogic>()) {
      await _refreshSeats();
    }
    return null;
  }

  /// 更新房间背景。对齐 joyride `ChooseBackgroundModel.confirm`。
  Future<String?> updateBackground(BackgroundItem item) async {
    if (!inRoom.value || rid <= 0) return null;
    if (!isOwnerOrReceptionist) return 'No permission';
    final result = await ChimoApis.room.updateFields(
      rid,
      ChannelFields(backgroundId: Int64(item.id.toInt())),
    );
    if (!result.ok) return result.message.isEmpty ? 'Update failed' : result.message;
    if (item.url.isNotEmpty) background.value = item.url;
    return null;
  }

  /// 读取当前房间密码（设置页用）。对齐 joyride `toolPermission`。
  Future<String?> fetchRoomPassword() async {
    if (!inRoom.value || rid <= 0) return null;
    if (!isOwnerOrReceptionist) return null;
    final result = await ChimoApis.room.buttonPermission(rid);
    if (!result.ok || result.data == null) return null;
    return result.data!.password;
  }

  bool userOnMic(int uid) {
    if (uid <= 0 || !Get.isRegistered<MicLogic>()) return false;
    return Get.find<MicLogic>().seats.any((s) => s.uid == uid);
  }

  bool userHasMicTimer(int uid) {
    if (uid <= 0 || !Get.isRegistered<MicLogic>()) return false;
    for (final seat in Get.find<MicLogic>().seats) {
      if (seat.uid == uid && seat.downMicAt > 0 && seat.remainSeconds() > 0) return true;
    }
    return false;
  }

  int hostUid() => _uidAt(0);

  /// 房主/接待关闭房间。对齐 joyride `closeRoom`。
  Future<String?> closeRoom() async {
    if (!inRoom.value || rid <= 0) return null;
    if (role.value != RtcUserRole.Owner && role.value != RtcUserRole.Receptionist) {
      return 'No permission';
    }
    final result = await ChimoApis.room.changeStatus(rid, RoomStatusEnum.CLOSED);
    if (!result.ok) return result.message.isEmpty ? 'Close failed' : result.message;
    status.value = RoomStatusEnum.CLOSED.name;
    return null;
  }

  /// 房主重新打开房间。对齐 joyride `openRoom`。
  Future<String?> openRoom() async {
    if (!inRoom.value || rid <= 0) return null;
    if (!isOwner) return 'No permission';
    final result = await ChimoApis.room.changeStatus(rid, RoomStatusEnum.NORMAL);
    if (!result.ok) return result.message.isEmpty ? 'Open failed' : result.message;
    status.value = RoomStatusEnum.NORMAL.name;
    return null;
  }

  /// 邀请好友进房。对齐 joyride `UserApi.inviteRoom`。
  Future<String?> inviteFriend(int toUid) async {
    if (!inRoom.value || rid <= 0 || toUid <= 0) return null;
    final result = await ChimoApis.user.inviteRoom(roomId: rid, toUid: toUid);
    if (!result.ok) return result.message.isEmpty ? 'Invite failed' : result.message;
    return null;
  }

  void minimize() {
    if (!inRoom.value) return;
    if (Get.isRegistered<RoomEffectLogic>()) Get.find<RoomEffectLogic>().clearPlayback();
    minimized.value = true;
    _showFloat();
  }

  void restore() {
    minimized.value = false;
    _hideFloat();
  }

  /// 返回列表时页面会拆掉麦位、公屏、特效。再进房把这三份补回来。
  Future<void> ensureChildren() async {
    if (_childrenReady) return;
    await _recoverChildren();
  }

  bool get _childrenReady =>
      Get.isRegistered<MicLogic>() &&
      Get.isRegistered<BarrageLogic>() &&
      Get.isRegistered<RoomEffectLogic>();

  Future<void> leave() async {
    await _teardown();
    await Get.delete<RoomService>(force: true);
  }

  Future<void> _teardown() async {
    final leavingRid = rid;
    _hideFloat();
    minimized.value = false;
    for (final play in plays.reversed) {
      await play.onLeave();
    }
    plays.clear();
    channelExt = null;
    roomType = null;
    waitQueue.clear();
    carOwnerMicQueue.clear();
    freePub.value = true;
    freePublicChat.value = true;
    giftValueCountSwitch.value = false;
    hasPassword.value = false;
    isPrivacy.value = false;
    theme.value = '';
    layoutName.value = '';
    micLayout = null;
    countDownAt.value = 0;
    await _rtc?.leave();
    _rtc = null;
    await _socket?.close();
    _socket = null;
    _socketConnectCount = 0;
    _lastSeatRefreshAt = null;
    if (leavingRid > 0) {
      await ChimoApis.room.leave(leavingRid);
    }
    if (Get.isRegistered<MicLogic>()) await Get.delete<MicLogic>(force: true);
    if (Get.isRegistered<BarrageLogic>()) await Get.delete<BarrageLogic>(force: true);
    if (Get.isRegistered<RoomEffectLogic>()) await Get.delete<RoomEffectLogic>(force: true);
    inRoom.value = false;
    rid = 0;
  }

  Future<void> _recoverChildren() async {
    final result = await ChimoApis.room.join(rid: rid, reconnect: 1);
    final channel = result.data?.channel;
    if (result.ok && channel != null) {
      _applyChannel(channel);
      _mountChildren(channel);
    } else {
      _mountChildren(null);
    }
    _rebindSocket();
    unawaited(_loadHistory());
  }

  var _loadingHistory = false;

  /// 对齐 joyride：连上后拉历史；失败/超时重试。空列表也短重试（服务端偶发未就绪）。
  Future<void> _loadHistory({int maxAttempts = 3}) async {
    if (_loadingHistory) return;
    _loadingHistory = true;
    try {
      for (var attempt = 1; attempt <= maxAttempts; attempt++) {
        if (!inRoom.value || _socket == null) return;
        if (!Get.isRegistered<BarrageLogic>()) {
          await Future<void>.delayed(Duration(milliseconds: 120 * attempt));
          continue;
        }
        try {
          final history = await _socket!.pullHistory();
          if (history == null) {
            AppLog.w('Room history pull timeout attempt=$attempt');
            await Future<void>.delayed(Duration(milliseconds: 300 * attempt));
            continue;
          }
          if (history.isEmpty) {
            if (attempt < maxAttempts) {
              await Future<void>.delayed(Duration(milliseconds: 400 * attempt));
              continue;
            }
            return;
          }
          if (!Get.isRegistered<BarrageLogic>()) return;
          Get.find<BarrageLogic>().addAll(history);
          return;
        } catch (error) {
          AppLog.w('Room history pull failed attempt=$attempt', error: error);
          await Future<void>.delayed(Duration(milliseconds: 300 * attempt));
        }
      }
    } finally {
      _loadingHistory = false;
    }
  }

  bool _barrageNeedsHistory() {
    if (!Get.isRegistered<BarrageLogic>()) return true;
    return Get.find<BarrageLogic>().messages.every((item) => item.id.startsWith('local-'));
  }

  void _mountChildren(Channel? channel) {
    final mic = _session<MicLogic>(MicLogic.new);
    final barrage = _session<BarrageLogic>(BarrageLogic.new);
    final effect = _session<RoomEffectLogic>(RoomEffectLogic.new);
    mic.myUid = myUid;
    if (channel != null) {
      // 拍卖 / CP 等模板房强制坑位数，避免进房瞬间 broadcaster 短列表裁掉空麦。
      mic.apply(
        channel.broadcaster,
        seatCount: preferredSeatCount ?? _seatCount(channel),
      );
    }
    barrage.clear();
    effect.reset();
    barrage.seedEntry(notice.value);
  }

  /// 跟进房会话走，不跟页面走。返回列表时页面 logic 会拆掉，这三份要留着。
  T _session<T extends GetxController>(T Function() create) {
    if (Get.isRegistered<T>()) return Get.find<T>();
    return Get.put(create(), permanent: true);
  }

  void _rebindSocket() {
    final socket = _socket;
    if (socket == null || !_childrenReady) return;
    socket.handlers
      ..clear()
      ..addAll(_handlers());
  }

  List<RoomMsgHandler> _handlers() {
    return [
      topBarHandler(),
      queueHandler(),
      Get.find<MicLogic>().handler(),
      Get.find<BarrageLogic>().handler(),
      Get.find<RoomEffectLogic>().handler(),
      ...plays.expand((play) => play.msgHandlers(this)),
    ];
  }

  void _seedBarrage() {
    if (!Get.isRegistered<BarrageLogic>()) return;
    Get.find<BarrageLogic>().seedEntry(notice.value);
  }

  Future<void> _openSocket(JoinChannelRsp rsp) async {
    final url = rsp.wsUrl;
    if (url.isEmpty) {
      _seedBarrage();
      return;
    }
    final socket = RoomSocket(url: url, rid: rid, uid: '$myUid', token: SessionInfo.token ?? '');
    // 对齐 joyride：连上（含静默重连成功）再拉历史；握手偶发失败不弹 toast。
    socket.onConnected = () => unawaited(_onSocketConnected());
    socket.addHandlers(_handlers());
    _socket = socket;
    await socket.connect();
  }

  Future<void> _onSocketConnected() async {
    if (!inRoom.value || _socket == null) return;
    final reconnected = _socketConnectCount > 0;
    _socketConnectCount++;
    // 对齐 joyride：重连后 join(reconnect) 补麦位；不 await，避免堵住历史拉取与实时帧。
    if (reconnected) unawaited(_refreshSeatsThrottled());
    await _loadHistory();
    if (!_barrageNeedsHistory()) return;
    await Future<void>.delayed(const Duration(milliseconds: 500));
    if (inRoom.value && _socket != null) await _loadHistory(maxAttempts: 2);
  }

  /// 重连风暴下至少间隔 2s（对齐 joyride `_reloadData` 节流）。
  Future<void> _refreshSeatsThrottled() async {
    final now = DateTime.now();
    final last = _lastSeatRefreshAt;
    if (last != null && now.difference(last) < const Duration(seconds: 2)) return;
    _lastSeatRefreshAt = now;
    try {
      await _refreshSeats();
    } catch (error) {
      AppLog.w('RoomService refresh seats after reconnect failed', error: error);
    }
  }

  Future<void> _openRtc(JoinChannelRsp rsp) async {
    if (!rsp.hasRtcConfig() || !rsp.rtcConfig.hasTencentConfig()) {
      AppLog.w('RoomService missing tencent config');
      return;
    }
    final rtc = TencentRoomRtc();
    rtc.onSpeaking = (uids) {
      if (Get.isRegistered<MicLogic>()) Get.find<MicLogic>().setSpeaking(uids);
    };
    _rtc = rtc;
    try {
      await rtc.enter(rsp.rtcConfig.tencentConfig, userId: '${myUid > 0 ? myUid : ''}');
      _syncLocalAudio();
    } catch (error) {
      AppLog.w('TencentRoomRtc enter failed', error: error);
      AppToast.error('Voice chat is unavailable');
    }
  }

  Future<void> _refreshSeats() async {
    final result = await ChimoApis.room.join(rid: rid, reconnect: 1);
    final channel = result.data?.channel;
    if (!result.ok || channel == null) {
      AppLog.w('RoomService _refreshSeats failed: ${result.message}');
      return;
    }
    _applyChannel(channel);
    if (!Get.isRegistered<MicLogic>()) return;
    // 拍卖房固定 5 麦，保证表演位(1)在列表变更后仍可刷新。
    Get.find<MicLogic>().apply(
      channel.broadcaster,
      seatCount: preferredSeatCount ?? _seatCount(channel),
    );
  }

  void _applyChannel(Channel channel) {
    rid = channel.channelId.toInt();
    title.value = channel.title.isEmpty ? 'Room $rid' : channel.title;
    theme.value = channel.theme;
    online.value = channel.currentUserCount;
    cover.value = channel.icon;
    hot.value = channel.hotValue.toInt();
    notice.value = channel.notice;
    background.value = channel.backgroundUrl;
    saved.value = channel.inMyCollection;
    role.value = channel.role;
    status.value = channel.status.trim();
    freePub.value = channel.freePub;
    freePublicChat.value = channel.freePublicChat;
    giftValueCountSwitch.value = channel.giftValueCountSwitch;
    hasPassword.value = channel.hasPassword;
    isPrivacy.value = channel.isPrivacy;
    hostOnTop.value = _hostOnTop(channel);
    roomType = channel.hasRoomTypeObj() ? channel.roomTypeObj.type : null;
    if (channel.hasRoomTypeObj()) {
      micLayout = channel.roomTypeObj.layout;
      layoutName.value = channel.roomTypeObj.layoutName;
    } else {
      micLayout = null;
      layoutName.value = '';
    }
    countDownAt.value = channel.hasCountDownTimestamp() ? channel.countDownTimestamp : 0;
    applyMicQueues(wait: channel.waitQueue, carOwner: channel.carOwnerMicQueue);
    // 对齐 yaychat 顶栏：头像只吃 giftRank；进房瞬间若榜为空再退 userList。
    final rankFaces = _avatarsOf(channel.giftRank);
    audience.assignAll(
      rankFaces.isNotEmpty ? rankFaces : _avatarsOf(channel.userList),
    );
  }

  /// 对齐 yaychat：`USER_JOIN` **不改顶栏头像**（头像只跟 giftRank）。
  /// Cosmic 额外展示在线人数 → 用 `join.count`（服务端 total）。
  void applyUserJoin(RoomUserJoin join) {
    if (join.count <= 0) return;
    if (online.value == join.count) {
      online.refresh();
      return;
    }
    online.value = join.count;
  }

  /// 对齐 yaychat `RoomCmdMsgHandler` + `REAL_TIME_RANK_CHANGE`：
  /// `channel.giftRank.clear(); addAll(rank); notifyListeners();`
  void applyGiftRank(List<SimpleChannelUser> rank) {
    audience
      ..assignAll(_avatarsOf(rank))
      ..refresh();
  }

  /// 对齐 yaychat `GIFT_VALUE_CHANGE`：`channel.hotValue = …; notifyListeners();`
  void applyHotValue(int value) {
    if (value < 0) return;
    if (hot.value == value) {
      hot.refresh();
      return;
    }
    hot.value = value;
  }

  /// 顶栏专用：不依赖公屏 / 特效 handler，避免那边解包失败时漏刷。
  RoomMsgHandler topBarHandler() => _TopBarMsgHandler(this);

  /// 排麦队列 + 房间 meta（freePub）。
  RoomMsgHandler queueHandler() => _QueueMsgHandler(this);

  List<String> _avatarsOf(Iterable<SimpleChannelUser> users) {
    return users
        .map((user) => user.avatar.trim())
        .where((avatar) => avatar.isNotEmpty)
        .take(3)
        .toList();
  }

  bool _hostOnTop(Channel channel) {
    if (!channel.hasRoomTypeObj()) return true;
    final type = channel.roomTypeObj;
    if (type.layout == MicLayoutEnum.TILED_4_4 || type.layout == MicLayoutEnum.TILED_3_3) {
      return false;
    }
    return true;
  }

  int _seatCount(Channel channel) {
    if (channel.hasRoomTypeObj()) {
      final type = channel.roomTypeObj.type;
      if (type == RoomType.AUCTION) return 5;
      if (type == RoomType.CP) return 8;
    }
    if (!channel.hasRoomTypeObj() || channel.roomTypeObj.mics.isEmpty) {
      return hostOnTop.value ? 9 : 8;
    }
    return channel.roomTypeObj.mics.length;
  }

  Future<void> _maybeAutoMic(JoinChannelRsp rsp) async {
    if (!inRoom.value) return;
    int? position;
    if (rsp.hasPosition() && rsp.position >= 0) {
      position = rsp.position;
    } else if (rsp.autoMic) {
      position = isOwner ? 0 : 1;
    }
    if (position == null) return;
    // 服务端指定自动上麦：直上固定位，不走排麦。
    final micPermission = await _ensureMicPermission();
    if (micPermission != null) return;
    final result = await ChimoApis.room.upMic(rid, position: position);
    if (!result.ok) {
      AppLog.w('RoomService autoMic failed: ${result.message}');
      return;
    }
    await _refreshSeats();
    _syncLocalAudio();
  }

  void _syncLocalAudio() {
    if (!Get.isRegistered<MicLogic>()) return;
    final mic = Get.find<MicLogic>();
    if (mic.onMic && mic.localOpen) {
      _rtc?.openMic();
    } else {
      _rtc?.closeMic();
    }
  }

  /// 已授权返回 null。被拒绝时返回要 Toast 的文案；已经弹出「去设置」则不再 Toast。
  Future<String?> _ensureMicPermission() async {
    final outcome = await AppPermissions.microphone();
    if (outcome.granted) return null;
    if (outcome.explained) return null;
    return 'Microphone permission is required';
  }

  void _showFloat() {
    _hideFloat();
    final overlay = Get.key.currentState?.overlay;
    if (overlay == null) return;
    _float = OverlayEntry(builder: (_) => const RoomFloat());
    overlay.insert(_float!);
  }

  void _hideFloat() {
    _float?.remove();
    _float = null;
  }
}

/// 对齐 yaychat `RoomCmdMsgHandler` 里顶栏相关分支；
/// yaychat 每条 cmd 末尾 `notifyListeners()`，这里直接改 Rx 触发 Obx。
class _TopBarMsgHandler implements RoomMsgHandler {
  _TopBarMsgHandler(this.service);

  final RoomService service;

  @override
  bool supports(Message message) {
    final scene = message.data.scene;
    return scene == Scene.USER_JOIN ||
        scene == Scene.REAL_TIME_RANK_CHANGE ||
        scene == Scene.GIFT_VALUE_CHANGE;
  }

  @override
  void handle(Message message) {
    try {
      final scene = message.data.scene;
      if (scene == Scene.USER_JOIN) {
        final join = message.data.content.unpackInto(RoomUserJoin());
        service.applyUserJoin(join);
        AppLog.d('RoomTopBar USER_JOIN count=${join.count} online=${service.online.value}');
        return;
      }
      if (scene == Scene.REAL_TIME_RANK_CHANGE) {
        final change = message.data.content.unpackInto(RoomRealTimeRankChange());
        service.applyGiftRank(change.rank);
        AppLog.d('RoomTopBar RANK faces=${service.audience.length}');
        return;
      }
      if (scene == Scene.GIFT_VALUE_CHANGE) {
        final change = message.data.content.unpackInto(RoomGiftValueChange());
        service.applyHotValue(change.hotValue.toInt());
        AppLog.d('RoomTopBar HOT hot=${service.hot.value}');
      }
    } catch (error) {
      AppLog.w('RoomTopBar socket frame skipped scene=${message.data.scene}', error: error);
    }
  }
}

class _QueueMsgHandler implements RoomMsgHandler {
  _QueueMsgHandler(this.service);

  final RoomService service;

  @override
  bool supports(Message message) {
    final scene = message.data.scene;
    return scene == Scene.MIC_QUEUE_CHANGE || scene == Scene.ROOM_META_DATA_CHANGE;
  }

  @override
  void handle(Message message) {
    try {
      final scene = message.data.scene;
      if (scene == Scene.MIC_QUEUE_CHANGE) {
        final change = message.data.content.unpackInto(RoomMicQueueChange());
        service.applyMicQueues(
          wait: change.waitQueue,
          carOwner: change.carOwnerMicQueue,
        );
        return;
      }
      if (scene == Scene.ROOM_META_DATA_CHANGE) {
        final meta = message.data.content.unpackInto(RoomMetaDataChange());
        service.freePub.value = meta.freePub;
        if (meta.hasFreePublicChat()) {
          service.freePublicChat.value = meta.freePublicChat;
        }
        if (meta.hasGiftValueCountSwitch()) {
          service.giftValueCountSwitch.value = meta.giftValueCountSwitch;
        }
        if (meta.hasCountDownTimestamp()) {
          service.countDownAt.value = meta.countDownTimestamp;
        }
        if (meta.notice.isNotEmpty) service.notice.value = meta.notice;
        if (meta.backgroundUrl.isNotEmpty) {
          service.background.value = meta.backgroundUrl;
        }
        if (meta.title.isNotEmpty) service.title.value = meta.title;
      }
    } catch (error) {
      AppLog.w('QueueMsgHandler failed scene=${message.data.scene}', error: error);
    }
  }
}
