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

/// 舞台顶栏：主持麦 + 阶段条 + 右侧嘉宾位。
/// 布局对齐 joyride `CPStageHeader`（spaceEvenly + 固定宽 chip），避免宽度溢出。
class CpStageHeader extends StatelessWidget {
  const CpStageHeader({super.key});

  /// 设计图：Match Line / Flipped / Matched。
  String _label(CPStage stage) {
    switch (stage) {
      case CPStage.introduce:
        return 'Match Line';
      case CPStage.choose:
        return 'Flipped';
      case CPStage.hand:
        return 'Matched';
      default:
        return '';
    }
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
      final stage = logic.stage;
      final host = seats.isNotEmpty ? seats.first : logic.seatAt(0);
      final guest = seats.length > 7 ? seats[7] : logic.seatAt(7);
      return SizedBox(
        width: 1.sw,
        height: 90.w,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _HostSeat(
              seat: host,
              anchor: mic.anchorFor(host),
              emoteUrl: _emoteOf(emotes, host.uid),
            ),
            SizedBox(
              height: 52.w,
              child: FittedBox(
                fit: BoxFit.scaleDown,
                child: Row(mainAxisSize: MainAxisSize.min, children: _stageChips(stage)),
              ),
            ),
            CpMicSeat(
              seat: guest,
              position: 7,
              size: 52,
              nickWidth: 56,
              borderColor: const Color(0xFF5BBBF9),
              anchor: mic.anchorFor(guest),
              emoteUrl: _emoteOf(emotes, guest.uid),
              showHot: false,
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

  List<Widget> _stageChips(CPStage stage) {
    Widget chip(CPStage s) => _StageChip(
      label: _label(s),
      reached: stage.value >= s.value && stage != CPStage.none && stage != CPStage.end,
      current: stage == s,
    );

    // 对齐 oumi `DashedLine(width: 16)`。
    Widget gap() => CustomPaint(
      size: Size(16.w, 1),
      painter: _DashedLinePainter(color: AppColors.white.withValues(alpha: 0.3)),
    );

    return [chip(CPStage.introduce), gap(), chip(CPStage.choose), gap(), chip(CPStage.hand)];
  }
}

class _DashedLinePainter extends CustomPainter {
  _DashedLinePainter({required this.color});

  final Color color;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = 1
      ..style = PaintingStyle.stroke;
    const dash = 2.0;
    const space = 1.0;
    var x = 0.0;
    while (x < size.width) {
      canvas.drawLine(Offset(x, 0), Offset(x + dash, 0), paint);
      x += dash + space;
    }
  }

  @override
  bool shouldRepaint(covariant _DashedLinePainter oldDelegate) => oldDelegate.color != color;
}

class _HostSeat extends StatelessWidget {
  const _HostSeat({required this.seat, required this.anchor, required this.emoteUrl});

  final MicSeat seat;
  final GlobalKey anchor;
  final String emoteUrl;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        CpMicSeat(
          seat: seat,
          position: 0,
          size: 52,
          nickWidth: 56,
          borderColor: const Color(0xFFDE57F7),
          anchor: anchor,
          emoteUrl: emoteUrl,
          showHot: false,
          isHost: true,
          showName: true,
        ),
        if (seat.occupied) ...[
          SizedBox(height: 2.w),
          Container(
            height: 14.w,
            alignment: Alignment.center,
            padding: EdgeInsets.symmetric(horizontal: 8.w),
            decoration: BoxDecoration(
              color: AppColors.white8,
              borderRadius: BorderRadius.circular(7.r),
            ),
            child: Text(
              'Host',
              style: TextStyle(color: AppColors.white, fontSize: 10.sp, height: 1),
            ),
          ),
        ],
      ],
    );
  }
}

class _StageChip extends StatelessWidget {
  const _StageChip({required this.label, required this.reached, required this.current});

  final String label;
  final bool reached;
  final bool current;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 60.w,
      height: 20.w,
      alignment: Alignment.center,
      decoration: ShapeDecoration(
        color: reached ? null : AppColors.white.withValues(alpha: 0.08),
        gradient: reached ? (current ? AppColors.cpGradient : AppColors.cpGradient) : null,
        shape: StadiumBorder(side: BorderSide(color: AppColors.white50, width: 0.5)),
      ),
      child: Text(
        label,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 10.sp,
          height: 1,
          color: current ? AppColors.white : AppColors.white.withValues(alpha: 0.5),
        ),
      ),
    );
  }
}
