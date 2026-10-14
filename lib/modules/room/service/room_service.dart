import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../../../app/chimo_api.dart';
import '../../../app/session_info.dart';
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
  var _saving = false;

  RoomSocket? _socket;
  RoomRtc? _rtc;
  OverlayEntry? _float;

  int get myUid => SessionInfo.uid;

  String get myName => SessionInfo.currentUser?.nickname.trim() ?? '';

  Future<RoomJoinResult> join(int nextRid, {String password = ''}) async {
    if (inRoom.value && rid != nextRid) await _teardown();
    if (inRoom.value && rid == nextRid) return const RoomJoinResult.ok();

    final result = await ChimoApis.room.join(rid: nextRid, password: password);
    if (!result.ok || result.data == null) {
      if (result.code == RoomApi.lockedCode) return const RoomJoinResult.password();
      return RoomJoinResult.fail(result.message.isEmpty ? 'Unable to enter the room' : result.message);
    }

    final channel = result.data!.channel;
    _applyChannel(channel);
    _mountChildren(channel);

    final resolved = RoomPlays.resolve(channel);
    plays.assignAll(resolved);
    for (final play in resolved) {
      await play.onJoined(this);
    }

    await _openSocket(result.data!);
    await _openRtc(result.data!);
    inRoom.value = true;
    _syncLocalAudio();
    return const RoomJoinResult.ok();
  }

  Future<String?> sendText(String raw) async {
    final text = raw.trim();
    if (text.isEmpty || !inRoom.value) return null;
    final result = await ChimoApis.room.sendText(rid, text);
    if (!result.ok) return result.message.isEmpty ? 'Send failed' : result.message;
    if (Get.isRegistered<BarrageLogic>()) {
      final me = SessionInfo.currentUser;
      Get.find<BarrageLogic>().addLocal(
        text,
        sender: myName,
        avatar: me?.avatar ?? '',
        gender: me?.gender ?? '',
      );
    }
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
    final micPermission = await _ensureMicPermission();
    if (micPermission != null) return micPermission;
    final result = await ChimoApis.room.upMic(rid, position: position);
    if (!result.ok) return result.message.isEmpty ? 'Unable to take the mic' : result.message;
    await _refreshSeats();
    _syncLocalAudio();
    return null;
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
      Get.isRegistered<MicLogic>() && Get.isRegistered<BarrageLogic>() && Get.isRegistered<RoomEffectLogic>();

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
    await _rtc?.leave();
    _rtc = null;
    await _socket?.close();
    _socket = null;
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
    final history = await _socket?.pullHistory();
    if (history != null && history.isNotEmpty && Get.isRegistered<BarrageLogic>()) {
      Get.find<BarrageLogic>().addAll(history);
    }
  }

  void _mountChildren(Channel? channel) {
    final mic = _session<MicLogic>(MicLogic.new);
    final barrage = _session<BarrageLogic>(BarrageLogic.new);
    final effect = _session<RoomEffectLogic>(RoomEffectLogic.new);
    mic.myUid = myUid;
    if (channel != null) {
      mic.apply(channel.broadcaster, seatCount: _seatCount(channel));
    }
    barrage.messages.clear();
    effect.reset();
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
      ..addAll([
        Get.find<MicLogic>().handler(),
        Get.find<BarrageLogic>().handler(),
        Get.find<RoomEffectLogic>().handler(),
        for (final play in plays) ...play.msgHandlers(this),
      ]);
  }

  Future<void> _openSocket(JoinChannelRsp rsp) async {
    final url = rsp.wsUrl;
    if (url.isEmpty) return;
    final socket = RoomSocket(
      url: url,
      rid: rid,
      uid: '$myUid',
      token: SessionInfo.token ?? '',
    );
    socket.addHandlers([
      Get.find<MicLogic>().handler(),
      Get.find<BarrageLogic>().handler(),
      Get.find<RoomEffectLogic>().handler(),
      for (final play in plays) ...play.msgHandlers(this),
    ]);
    _socket = socket;
    try {
      await socket.connect();
      final history = await socket.pullHistory();
      if (Get.isRegistered<BarrageLogic>()) {
        Get.find<BarrageLogic>().addAll(history);
      }
    } catch (error) {
      AppLog.w('RoomSocket connect failed', error: error);
      AppToast.error('Room chat is unavailable');
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
      await rtc.enter(
        rsp.rtcConfig.tencentConfig,
        userId: '${myUid > 0 ? myUid : ''}',
      );
    } catch (error) {
      AppLog.w('TencentRoomRtc enter failed', error: error);
      AppToast.error('Voice chat is unavailable');
    }
  }

  Future<void> _refreshSeats() async {
    final result = await ChimoApis.room.join(rid: rid, reconnect: 1);
    final channel = result.data?.channel;
    if (!result.ok || channel == null) return;
    _applyChannel(channel);
    if (!Get.isRegistered<MicLogic>()) return;
    Get.find<MicLogic>().apply(channel.broadcaster, seatCount: _seatCount(channel));
  }

  void _applyChannel(Channel channel) {
    rid = channel.channelId.toInt();
    title.value = channel.title.isEmpty ? 'Room $rid' : channel.title;
    online.value = channel.currentUserCount;
    cover.value = channel.icon;
    hot.value = channel.hotValue.toInt();
    notice.value = channel.notice;
    background.value = channel.backgroundUrl;
    saved.value = channel.inMyCollection;
    hostOnTop.value = _hostOnTop(channel);
    final faces = channel.userList
        .map((user) => user.avatar.trim())
        .where((avatar) => avatar.isNotEmpty)
        .take(3)
        .toList();
    if (faces.isEmpty) {
      audience.assignAll(
        channel.giftRank.map((user) => user.avatar.trim()).where((avatar) => avatar.isNotEmpty).take(3),
      );
    } else {
      audience.assignAll(faces);
    }
  }

  bool _hostOnTop(Channel channel) {
    if (!channel.hasRoomTypeObj()) return true;
    final type = channel.roomTypeObj;
    if (type.layout == MicLayoutEnum.TILED_4_4 || type.layout == MicLayoutEnum.TILED_3_3) return false;
    return true;
  }

  int _seatCount(Channel channel) {
    if (!channel.hasRoomTypeObj() || channel.roomTypeObj.mics.isEmpty) {
      return hostOnTop.value ? 9 : 8;
    }
    return channel.roomTypeObj.mics.length;
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
