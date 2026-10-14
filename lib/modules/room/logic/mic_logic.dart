import 'package:get/get.dart';

import '../../../common/models/server_client/message.pb.dart';
import '../../../common/models/server_client/rtc.pb.dart';
import '../model/mic_seat.dart';
import '../socket/room_msg_handler.dart';

/// 麦位列表。上麦下麦由 [RoomService] 调接口，这里只改展示。
class MicLogic extends GetxController {
  final seats = <MicSeat>[].obs;
  int myUid = 0;

  bool get onMic => seats.any((seat) => seat.uid == myUid);

  bool get localOpen => seats.any((seat) => seat.uid == myUid && seat.micOpen);

  void apply(List<SimpleChannelUserSlot> slots, {int? seatCount}) {
    final speaking = {
      for (final seat in seats)
        if (seat.speaking && seat.uid != null) seat.uid!: true,
    };
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
        ),
      );
    }
    if (next.isEmpty) {
      seats.assignAll(List.generate(9, (i) => MicSeat(index: i, boss: i == 8)));
      return;
    }
    seats.assignAll(next);
  }

  void setLocalOpen(bool open) {
    seats.assignAll([
      for (final seat in seats)
        if (seat.uid == myUid) seat.copyWith(micOpen: open) else seat,
    ]);
  }

  void setSpeaking(Set<int> uids) {
    seats.assignAll([
      for (final seat in seats) seat.copyWith(speaking: seat.uid != null && uids.contains(seat.uid)),
    ]);
  }

  RoomMsgHandler handler() => _MicMsgHandler(this);
}

class _MicMsgHandler implements RoomMsgHandler {
  _MicMsgHandler(this.logic);

  final MicLogic logic;

  @override
  bool supports(Message message) {
    return message.type == MessageTypeEnum.cmd && message.data.scene == Scene.MIC_CHANGE;
  }

  @override
  void handle(Message message) {
    try {
      final change = message.data.content.unpackInto(RoomMicChange());
      logic.apply(change.broadcaster);
    } catch (_) {}
  }
}
