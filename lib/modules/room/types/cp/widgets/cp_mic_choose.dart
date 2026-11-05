import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../../common/constants/app_assets.dart';
import '../../../../../common/models/server_client/room_cp.pb.dart';
import '../../../../../common/theme/app_colors.dart';
import '../../../../../common/utils/chimo.dart';
import '../../../logic/mic_logic.dart';
import '../../../model/mic_seat.dart';
import '../logic/cp_logic.dart';
import 'cp_mic_seat.dart';
import 'cp_util.dart';

/// 互选阶段：三组配对麦位 + Points。对齐 joyride `CPMicChoose`。
class CpMicChoose extends StatelessWidget {
  const CpMicChoose({super.key});

  /// 互选三组坐标。下方两组相对 303 宽舞台左右对称。
  Offset _avatarOffset(int index, bool left) {
    const stageW = 303.0;
    const seat = 52.0;
    if (index == 0) {
      // 顶组：相对舞台居中（对齐 oumi 98 / 147）。
      return left ? Offset(98.w, 0) : Offset(147.w, 0);
    }
    if (index == 1) {
      return left ? Offset(0, 127.w) : Offset(seat.w, 127.w);
    }
    // index 2：镜像 index 1 → left = stageW - 2*seat / stageW - seat
    return left ? Offset((stageW - seat * 2).w, 127.w) : Offset((stageW - seat).w, 127.w);
  }

  @override
  Widget build(BuildContext context) {
    if (!Get.isRegistered<CpLogic>() || !Get.isRegistered<MicLogic>()) {
      return const SizedBox.shrink();
    }
    final logic = Get.find<CpLogic>();
    final mic = Get.find<MicLogic>();
    return Obx(() {
      logic.info.value;
      final seats = List<MicSeat>.from(mic.seats);
      final emotes = Map<int, String>.from(mic.micEmotes);
      final choose = logic.info.value.hasChooseInfo()
          ? logic.info.value.chooseInfo
          : CPChooseInfo();
      final pairs = _buildPairs(logic, mic, choose, seats, emotes);
      return SizedBox(
        width: 310.w,
        height: 276.w,
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            Chimo.image(AppAssets.cpChooseTop, width: 167, height: 204),
            Positioned(
              top: 57.w,
              child: SizedBox(
                width: 303.w,
                height: 219.w,
                child: Stack(
                  alignment: Alignment.center,
                  children: _chooseStackChildren(pairs, choose),
                ),
              ),
            ),
          ],
        ),
      );
    });
  }

  /// 叠层：中间渐变条 → 配对麦位 → 心形 → Points。
  List<Widget> _chooseStackChildren(List<Widget> pairs, CPChooseInfo choose) {
    final count = choose.items.length;
    return [
      _pairShade(),
      ...pairs.reversed,
      ...List.generate(count > 1 ? count - 1 : 0, (i) => _pairHeart(i + 1)),
      ...List.generate(count, (i) => _pairPoints(i, choose.items[i].heart)),
    ];
  }

  Widget _pairShade() {
    return Positioned(
      left: 98.w,
      top: 63.w,
      child: Container(
        width: 110.w,
        height: 15.w,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.transparent,
              AppColors.black.withValues(alpha: 0.46),
              Colors.transparent,
            ],
            stops: const [0, 0.5, 1],
          ),
        ),
      ),
    );
  }

  Widget _pairHeart(int index) {
    final left = _avatarOffset(index, true);
    return Positioned(
      left: left.dx + 36.w,
      top: left.dy + 14.w,
      child: Chimo.image(AppAssets.cpChooseHeart, width: 36, height: 24),
    );
  }

  Widget _pairPoints(int index, Object heart) {
    final left = _avatarOffset(index, true);
    return Positioned(
      left: left.dx,
      top: left.dy + (index == 0 ? 82.w : 74.w),
      width: 107.w,
      child: Center(
        child: UnconstrainedBox(
          child: Container(
            height: 18.w,
            padding: EdgeInsets.symmetric(horizontal: 6.w),
            alignment: Alignment.center,
            decoration: const ShapeDecoration(shape: StadiumBorder(), color: Color(0xFFFF5780)),
            child: Text(
              'Points: $heart',
              style: TextStyle(fontSize: 10.sp, color: AppColors.white),
            ),
          ),
        ),
      ),
    );
  }

  List<Widget> _buildPairs(
    CpLogic logic,
    MicLogic mic,
    CPChooseInfo choose,
    List<MicSeat> seats,
    Map<int, String> emotes,
  ) {
    MicSeat seatAt(int index) {
      if (index < 0 || index >= seats.length) return logic.seatAt(index);
      return seats[index];
    }

    MicSeat? seatByUid(int uid) {
      if (uid <= 0) return null;
      for (final seat in seats) {
        if (seat.uid == uid) return seat;
      }
      return null;
    }

    final result = <Widget>[];
    final free = List<int>.generate(6, (i) => i + 1);
    final chosen = <int>{};

    for (var i = 0; i < choose.items.length; i++) {
      final item = choose.items[i];
      final s1 = seatByUid(item.uid1.toInt());
      final s2 = seatByUid(item.uid2.toInt());
      if (s1 != null && s2 != null) {
        result.add(_mic(mic, s1, i, true, emotes));
        result.add(_mic(mic, s2, i, false, emotes));
        chosen.add(s1.index);
        chosen.add(s2.index);
      }
    }
    free.removeWhere(chosen.contains);

    for (var i = chosen.length ~/ 2; i < 3; i++) {
      if (free.length < 2) break;
      final left = free.removeAt(0);
      final right = free.removeAt(0);
      result.add(_mic(mic, seatAt(left), i, true, emotes));
      result.add(_mic(mic, seatAt(right), i, false, emotes));
    }
    return result;
  }

  Widget _mic(MicLogic mic, MicSeat seat, int index, bool left, Map<int, String> emotes) {
    final offset = _avatarOffset(index, left);
    final pos = seat.index;
    final uid = seat.uid ?? 0;
    return AnimatedPositioned(
      key: ValueKey('cp_choose_${uid}_${index}_$left'),
      duration: const Duration(seconds: 1),
      left: offset.dx,
      top: offset.dy,
      child: CpMicSeat(
        seat: seat,
        position: pos,
        size: index == 0 ? 58 : 52,
        nickWidth: index == 0 ? 48 : null,
        borderColor: index == 0 ? const Color(0xFFDE57F7) : CpUtil.colorOf(pos),
        anchor: mic.anchorFor(seat),
        emoteUrl: uid > 0 ? (emotes[uid]?.trim() ?? '') : '',
        showHot: false,
      ),
    );
  }
}
