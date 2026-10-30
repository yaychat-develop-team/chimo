import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../../../common/models/server_client/message.pb.dart';
import '../../../common/models/server_client/rtc.pb.dart';
import '../../../common/utils/app_log.dart';
import '../model/mic_seat.dart';
import '../model/room_gift_display.dart';
import '../service/room_service.dart';
import '../socket/room_msg_handler.dart';

/// 麦位列表。上麦下麦由 [RoomService] 调接口，这里只改展示。
class MicLogic extends GetxController {
  final seats = <MicSeat>[].obs;
  final List<GlobalKey> _seatKeys = [];
  /// 按 uid 挂锚点，避免 GridView.builder 懒构建导致 index Key 尚未挂上。
  final Map<int, GlobalKey> _uidKeys = {};

  /// 麦上表情：uid → 图片 URL。对齐 joyride mic avatar overlay。
  final micEmotes = <int, String>{}.obs;
  final Map<int, Timer> _micEmoteTimers = {};

  /// 秒表跳动，驱动麦位剩余时长刷新。
  final clock = 0.obs;

  /// 自己麦上剩余 ≤30 秒时置 true 一次，页面弹「Insufficient On-mic Time」。
  final insufficientPrompt = false.obs;

  int myUid = 0;
  Timer? _timer;
  var _shownInsufficient = false;

  bool get onMic => seats.any((seat) => seat.uid == myUid);

  bool get localOpen => seats.any((seat) => seat.uid == myUid && seat.micOpen);

  void apply(List<SimpleChannelUserSlot> slots, {int? seatCount}) {
    final speaking = <int, bool>{};
    for (final seat in seats) {
      final uid = seat.uid;
      if (seat.speaking && uid != null) speaking[uid] = true;
    }
    final count = seatCount != null && seatCount > slots.length ? seatCount : slots.length;
    final next = <MicSeat>[];
    for (var i = 0; i < (count == 0 ? 9 : count); i++) {
      final slot = i < slots.length ? slots[i] : null;
      final user = slot != null && slot.hasUser() ? slot.user : null;
      final uid = user?.id.toInt() ?? 0;
      final frame = (slot?.micFrameUrl ?? '').trim().isNotEmpty
          ? slot!.micFrameUrl.trim()
          : (user?.avatarFrame ?? '').trim();
      next.add(
        MicSeat(
          index: i,
          uid: uid > 0 ? uid : null,
          name: user?.nickname ?? '',
          avatar: user?.avatar ?? '',
          micOpen: slot != null && slot.hasUser() && slot.micStatus != MicStatus.CLOSE,
          speaking: speaking[uid] == true,
          contribution: slot?.contributionValue.toInt() ?? 0,
          frame: frame,
          boss: slot?.micType == MicTypeEnum.CAR_OWNER_MIC || (count == 9 && i == count - 1),
          downMicAt: slot?.downMicTimestamp ?? 0,
        ),
      );
    }
    if (next.isEmpty) {
      seats.assignAll(List.generate(9, (i) => MicSeat(index: i, boss: i == 8)));
      seats.refresh();
      _syncTimer();
      return;
    }
    seats.assignAll(next);
    seats.refresh();
    _syncTimer();
  }

  void setLocalOpen(bool open) {
    seats.assignAll(
      seats.map((seat) => seat.uid == myUid ? seat.copyWith(micOpen: open) : seat).toList(),
    );
  }

  void setSpeaking(Set<int> uids) {
    final talking = uids.contains(0) ? {...uids, myUid} : uids;
    seats.assignAll(
      seats
          .map(
            (seat) => seat.copyWith(
              speaking: seat.micOpen && seat.uid != null && talking.contains(seat.uid),
            ),
          )
          .toList(),
    );
  }

  RoomMsgHandler handler() => _MicMsgHandler(this);

  /// 展示麦上表情；约 3 秒后清除（无多帧回调时的兜底）。
  void showMicEmote({required int uid, required String url, int type = 3}) {
    final icon = url.trim();
    if (uid <= 0 || icon.isEmpty) return;
    _micEmoteTimers[uid]?.cancel();
    micEmotes[uid] = icon;
    micEmotes.refresh();
    _micEmoteTimers[uid] = Timer(const Duration(seconds: 3), () {
      if (micEmotes[uid] == icon) {
        micEmotes.remove(uid);
        micEmotes.refresh();
      }
      _micEmoteTimers.remove(uid);
    });
  }

  /// 麦位头像锚点（按下标）。对齐 joyride [getPositionGlobalKey]。
  GlobalKey seatKey(int index) {
    while (index >= _seatKeys.length) {
      _seatKeys.add(GlobalKey());
    }
    return _seatKeys[index];
  }

  /// 麦位锚点：有人优先按 uid，保证送礼取坐标不依赖 Grid 懒构建顺序。
  GlobalKey anchorFor(MicSeat seat) {
    final uid = seat.uid;
    if (uid != null && uid > 0) {
      return _uidKeys.putIfAbsent(uid, GlobalKey.new);
    }
    return seatKey(seat.index);
  }

  /// 按 uid 取麦位屏幕全局坐标。对齐 joyride [getPointByUid]（含 fallback 右上角）。
  RoomMicPoint pointByUid(int uid) {
    const fallbackSize = Size(50, 50);
    final media = WidgetsBinding.instance.platformDispatcher.views.first;
    final screen = media.physicalSize / media.devicePixelRatio;
    // joyride: Offset(screenWidth - 70, 50)
    final fallback = RoomMicPoint(
      Offset(screen.width - 70, 50),
      size: fallbackSize,
      inPosition: false,
    );
    if (uid <= 0) return fallback;

    RoomMicPoint? fromKey(GlobalKey key) {
      try {
        final ctx = key.currentContext;
        if (ctx == null) return null;
        final box = ctx.findRenderObject() as RenderBox?;
        if (box == null || !box.hasSize || !box.attached) return null;
        final offset = box.localToGlobal(Offset.zero);
        // joyride: offset.dx 在 [0, screenWidth] 内才算命中
        if (offset.dx < 0 || offset.dx > screen.width) return null;
        return RoomMicPoint(offset, size: box.size);
      } catch (_) {
        return null;
      }
    }

    final byUid = _uidKeys[uid];
    if (byUid != null) {
      final hit = fromKey(byUid);
      if (hit != null) return hit;
    }
    // joyride：用 broadcaster 列表下标取 key
    final seatIndex = seats.indexWhere((seat) => seat.uid == uid);
    if (seatIndex < 0) return fallback;
    for (final keyIndex in {seats[seatIndex].index, seatIndex}) {
      final hit = fromKey(seatKey(keyIndex));
      if (hit != null) return hit;
    }
    return fallback;
  }

  @override
  void onClose() {
    _timer?.cancel();
    _timer = null;
    for (final timer in _micEmoteTimers.values) {
      timer.cancel();
    }
    _micEmoteTimers.clear();
    micEmotes.clear();
    _seatKeys.clear();
    _uidKeys.clear();
    super.onClose();
  }

  void _syncTimer() {
    if (_needsTimer) {
      _timer ??= Timer.periodic(const Duration(seconds: 1), (_) => _onTick());
      _onTick();
      return;
    }
    _timer?.cancel();
    _timer = null;
    _shownInsufficient = false;
    if (insufficientPrompt.value) insufficientPrompt.value = false;
  }

  bool get _needsTimer {
    final now = DateTime.now().millisecondsSinceEpoch ~/ 1000;
    for (final seat in seats) {
      if (seat.occupied && seat.downMicAt > now) return true;
    }
    return false;
  }

  void _onTick() {
    clock.value++;
    final remain = _selfRemain();
    if (remain > 0 && remain <= 30) {
      if (!_shownInsufficient) {
        _shownInsufficient = true;
        insufficientPrompt.value = true;
      }
    } else {
      _shownInsufficient = false;
      if (insufficientPrompt.value) insufficientPrompt.value = false;
    }
    if (!_needsTimer) {
      _timer?.cancel();
      _timer = null;
    }
  }

  int _selfRemain() {
    for (final seat in seats) {
      if (seat.uid == myUid) return seat.remainSeconds();
    }
    return 0;
  }
}

class _MicMsgHandler implements RoomMsgHandler {
  _MicMsgHandler(this.logic);

  final MicLogic logic;

  @override
  bool supports(Message message) {
    if (message.type != MessageTypeEnum.cmd) return false;
    final scene = message.data.scene;
    return scene == Scene.MIC_CHANGE || scene == Scene.ROOM_MIC_SHOW_IMG;
  }

  @override
  void handle(Message message) {
    try {
      if (message.data.scene == Scene.ROOM_MIC_SHOW_IMG) {
        final img = message.data.content.unpackInto(RoomMicShowImg());
        final seatUrl =
            img.imgUrl.trim().isNotEmpty ? img.imgUrl.trim() : img.offMicImgUrl.trim();
        if (seatUrl.isEmpty) return;
        final uid = img.uid.toInt();
        logic.showMicEmote(uid: uid, url: seatUrl, type: img.type);
        // 对齐 joyride：公屏只用 offMicImgUrl；为空则不发（避免拿 seat 动图 URL 去 send-to-room）。
        final offUrl = img.offMicImgUrl.trim();
        if (img.type == 3 && uid == logic.myUid && offUrl.isNotEmpty) {
          unawaited(RoomService.findOrNull()?.sendMicIconBarrage(offUrl) ?? Future.value());
        }
        return;
      }
      final change = message.data.content.unpackInto(RoomMicChange());
      logic.apply(change.broadcaster);
    } catch (error) {
      AppLog.w(
        'MicMsgHandler failed type=${message.type} scene=${message.data.scene}',
        error: error,
      );
    }
  }
}
