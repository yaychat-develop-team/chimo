import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../common/constants/app_assets.dart';
import '../../../../common/theme/app_colors.dart';
import '../../../../common/widgets/app_image.dart';
import '../../logic/mic_logic.dart';
import '../../model/mic_seat.dart';
import '../../model/room_format.dart';
import '../../service/room_service.dart';
import 'package:chimo/common/utils/chimo.dart';

class RoomMicGrid extends StatelessWidget {
  const RoomMicGrid({super.key, required this.onTap});

  final void Function(MicSeat seat) onTap;

  @override
  Widget build(BuildContext context) {
    if (!Get.isRegistered<MicLogic>()) return const SizedBox(height: 220);
    final logic = Get.find<MicLogic>();
    return Obx(() {
      logic.clock.value;
      // 必须在 Obx 回调里读完整 map，否则只改 value、length 不变时不会刷新。
      final emotes = Map<int, String>.from(logic.micEmotes);
      final hostOnTop = RoomService.findOrNull()?.hostOnTop.value ?? true;
      RoomService.findOrNull()?.giftValueCountSwitch.value;
      final seats = logic.seats.toList();
      if (seats.isEmpty) return const SizedBox(height: 220);
      if (!hostOnTop || seats.length < 5) {
        return _grid(seats, host: false, logic: logic, emotes: emotes);
      }
      final host = seats.first;
      final guests = seats.skip(1).toList();
      return Column(
        children: [
          RoomMicSeat(
            seat: host,
            host: true,
            anchor: logic.anchorFor(host),
            emoteUrl: _emoteOf(emotes, host.uid),
            onTap: () => onTap(host),
          ),
          const SizedBox(height: 6),
          _grid(guests, host: false, logic: logic, emotes: emotes),
        ],
      );
    });
  }

  /// 用 children 全量构建，避免 builder 懒加载导致接收者 GlobalKey 尚未挂上。
  Widget _grid(
    List<MicSeat> seats, {
    required bool host,
    required MicLogic logic,
    required Map<int, String> emotes,
  }) {
    return GridView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.symmetric(horizontal: 8),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
        mainAxisExtent: 108,
      ),
      children: seats
          .map(
            (seat) => RoomMicSeat(
              seat: seat,
              host: host,
              anchor: logic.anchorFor(seat),
              emoteUrl: _emoteOf(emotes, seat.uid),
              onTap: () => onTap(seat),
            ),
          )
          .toList(),
    );
  }

  static String _emoteOf(Map<int, String> emotes, int? uid) {
    if (uid == null || uid <= 0) return '';
    return emotes[uid]?.trim() ?? '';
  }
}

/// 单个麦位。普通网格和兜风双麦共用。
class RoomMicSeat extends StatelessWidget {
  const RoomMicSeat({
    super.key,
    required this.seat,
    required this.host,
    required this.anchor,
    required this.emoteUrl,
    required this.onTap,
  });

  final MicSeat seat;
  final bool host;
  final GlobalKey anchor;
  final String emoteUrl;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final size = host ? 76.0 : 56.0;
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: Column(
        children: [
          SizedBox(key: anchor, width: size, height: size, child: _face(size)),
          const SizedBox(height: 4),
          _label(),
          if (seat.occupied &&
              (RoomService.findOrNull()?.giftValueCountSwitch.value ?? false)) ...[
            const SizedBox(height: 2),
            UnconstrainedBox(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 2),
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.12),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Chimo.image(AppAssets.roomLove, width: 11, height: 10),
                    const SizedBox(width: 2),
                    Text(
                      roomCount(seat.contribution),
                      style: const TextStyle(
                        color: AppColors.white,
                        fontSize: 10,
                        height: 1,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }

  Widget _face(double size) {
    if (!seat.occupied) {
      return Chimo.image(
        seat.boss ? AppAssets.roomSeatBoss : AppAssets.roomSeatEmpty,
        width: size,
        height: size,
      );
    }
    final avatar = Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: seat.boss ? AppColors.yellowFFC83D : Colors.transparent,
          width: seat.boss ? 2 : 0,
        ),
      ),
      child: ClipOval(child: _inner(size)),
    );
    final frame = seat.frame.trim();
    final emote = emoteUrl.trim();
    return Stack(
      alignment: Alignment.center,
      clipBehavior: Clip.none,
      children: [
        if (seat.speaking) RoomSeatWave(size: size),
        avatar,
        if (frame.isNotEmpty) IgnorePointer(child: _frame(frame, size)),
        if (emote.isNotEmpty)
          IgnorePointer(
            child: Chimo.image(
              emote,
              width: size * 1.3,
              height: size * 1.3,
              fit: BoxFit.contain,
            ),
          ),
        if (!seat.micOpen)
          Positioned(
            right: 0,
            top: 0,
            child: Container(
              width: 18.w,
              height: 18.w,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
              ),
              child: Chimo.image(
                AppAssets.roomMicOff,
                width: 14.w,
                height: 14.w,
                fit: BoxFit.contain,
              ),
            ),
          ),
        if (_remain > 0 && _remain <= 30) _remainTip(size),
      ],
    );
  }

  int get _remain => seat.remainSeconds();

  /// 剩余 ≤30 秒时显示在头像上方，对齐 Oumi `_micRemainTips`。
  Widget _remainTip(double size) {
    return OverflowBox(
      minWidth: size,
      minHeight: size,
      maxWidth: size * 2,
      maxHeight: size * 2,
      child: Container(
        width: 48,
        height: 15,
        alignment: Alignment.center,
        margin: EdgeInsets.only(bottom: size * 1.3 + 5),
        decoration: ShapeDecoration(
          shape: const StadiumBorder(),
          color: Colors.white.withValues(alpha: 0.12),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Chimo.image(AppAssets.roomMicRemain, width: 14, height: 14),
            const SizedBox(width: 3),
            Text(
              '${_remain}s',
              style: const TextStyle(
                color: AppColors.white,
                fontSize: 10,
                fontWeight: FontWeight.w500,
                height: 1,
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// 头像框按头像的 1.25 倍画，溢出槽位，不把麦位撑大。
  Widget _frame(String url, double size) {
    return OverflowBox(
      minWidth: size,
      minHeight: size,
      maxWidth: size * 1.6,
      maxHeight: size * 1.6,
      child: Chimo.image(
        url,
        width: size * 1.25,
        height: size * 1.25,
        fit: BoxFit.cover,
      ),
    );
  }

  Widget _inner(double size) => AppImage.avatar(seat.avatar, size: size);

  Widget _label() {
    if (!seat.occupied && seat.boss) {
      return const Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Flexible(
            child: Text(
              'Boss Seat',
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: AppColors.yellowFFC83D,
                fontSize: 11,
                height: 1.1,
              ),
            ),
          ),
        ],
      );
    }
    final text = seat.occupied
        ? seat.name
        : host
        ? ''
        : 'Seat ${seat.index}';
    if (text.isEmpty) return const SizedBox(height: 14);
    return Text(
      text,
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      textAlign: TextAlign.center,
      style: TextStyle(
        color: seat.occupied ? AppColors.white : AppColors.white30,
        fontSize: 11,
        height: 1.1,
      ),
    );
  }
}

/// 说话时从头像边缘扩出去的一圈，1 秒淡出后重复。对齐 Oumi `WaveBorder`。
class RoomSeatWave extends StatefulWidget {
  const RoomSeatWave({super.key, required this.size});

  final double size;

  @override
  State<RoomSeatWave> createState() => _RoomSeatWaveState();
}

class _RoomSeatWaveState extends State<RoomSeatWave>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 1000),
  )..repeat();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = widget.size;
    return OverflowBox(
      minWidth: size,
      minHeight: size,
      maxWidth: size * 1.6,
      maxHeight: size * 1.6,
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, _) {
          final progress = _controller.value;
          final diameter = size + size * 0.6 * progress;
          return Opacity(
            opacity: 1 - progress,
            child: Container(
              width: diameter,
              height: diameter,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: AppColors.pinkFC5CC6, width: 1.5),
              ),
            ),
          );
        },
      ),
    );
  }
}
