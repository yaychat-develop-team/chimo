import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../app/app_jumper.dart';
import '../../../logic/mic_logic.dart';
import '../../../logic/room_logic.dart';
import '../../../model/mic_seat.dart';
import '../../../page/widgets/room_mic_grid.dart';

/// 兜风双麦：左右各一，对齐 m_chatroom `DoufengMicSeatWidget`。
class JoyRideMicArea extends StatelessWidget {
  const JoyRideMicArea({super.key});

  void _onTap(MicSeat seat) {
    if (!Get.isRegistered<RoomLogic>()) return;
    final room = Get.find<RoomLogic>();
    if (!seat.occupied) {
      room.toggleMic(position: seat.index);
      return;
    }
    AppJumper.showUserProfileSheet(
      uid: '${seat.uid ?? 0}',
      name: seat.name,
      avatar: seat.avatar,
    );
  }

  @override
  Widget build(BuildContext context) {
    if (!Get.isRegistered<MicLogic>()) return const SizedBox(height: 140);
    final logic = Get.find<MicLogic>();
    return Obx(() {
      logic.clock.value;
      final emotes = Map<int, String>.from(logic.micEmotes);
      final seats = logic.seats.toList();
      final left = seats.isNotEmpty ? seats[0] : const MicSeat(index: 0);
      final right = seats.length > 1 ? seats[1] : const MicSeat(index: 1);
      return Padding(
        padding: const EdgeInsets.only(top: 20, bottom: 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SizedBox(
              width: 100,
              child: RoomMicSeat(
                seat: left,
                host: true,
                anchor: logic.anchorFor(left),
                emoteUrl: _emoteOf(emotes, left.uid),
                onTap: () => _onTap(left),
              ),
            ),
            SizedBox(
              width: 100,
              child: RoomMicSeat(
                seat: right,
                host: true,
                anchor: logic.anchorFor(right),
                emoteUrl: _emoteOf(emotes, right.uid),
                onTap: () => _onTap(right),
              ),
            ),
          ],
        ),
      );
    });
  }

  static String _emoteOf(Map<int, String> emotes, int? uid) {
    if (uid == null || uid <= 0) return '';
    return emotes[uid]?.trim() ?? '';
  }
}
