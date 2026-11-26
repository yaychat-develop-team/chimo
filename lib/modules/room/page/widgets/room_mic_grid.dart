import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../common/constants/app_assets.dart';
import '../../../../common/models/server_client/rtc.pbenum.dart';
import '../../../../common/theme/app_colors.dart';
import '../../../../common/utils/chimo.dart';
import '../../../../common/utils/text_fmt.dart';
import '../../../../common/widgets/app_image.dart';
import '../../logic/mic_logic.dart';
import '../../model/mic_seat.dart';
import '../../service/room_service.dart';

class RoomMicGrid extends StatelessWidget {
  const RoomMicGrid({super.key, required this.onTap});

  final void Function(MicSeat seat) onTap;

  @override
  Widget build(BuildContext context) {
    if (!Get.isRegistered<MicLogic>()) return const SizedBox(height: 220);
    final logic = Get.find<MicLogic>();
    return Obx(() {
      // 必须在 Obx 回调里读完整 map，否则只改 value、length 不变时不会刷新。
      // 剩余时长由 RoomMicSeat 内层 Obx 订阅 clock，避免整表每秒重建。
      final emotes = Map<int, String>.from(logic.micEmotes);
      final service = RoomService.findOrNull();
      service?.giftValueCountSwitch.value;
      service?.hostOnTop.value;
      final layout = service?.micLayout;
      final seats = logic.seats.toList();
      if (seats.isEmpty) return const SizedBox(height: 220);

      final ctx = _MicLayoutCtx(seats: seats, logic: logic, emotes: emotes, onTap: onTap);
      switch (layout) {
        case MicLayoutEnum.ROUND_TABLE_6:
          return _buildRoundTable6(ctx);
        case MicLayoutEnum.TILED_4_4:
          return _buildTiledRows(ctx, const [4, 4]);
        case MicLayoutEnum.TILED_3_5:
          return _buildTiled35(ctx);
        case MicLayoutEnum.TILED_3_3_3:
          return _buildTiledRows(ctx, const [3, 3, 3], seatWidth: 50);
        case MicLayoutEnum.TILED_2:
          return _buildTiled2(ctx);
        case MicLayoutEnum.TILED_1_4_4:
          return _buildTiled144(ctx);
        case MicLayoutEnum.TILED_3_3:
          return _buildTiledRows(ctx, const [3, 3]);
        case MicLayoutEnum.ROUND_TABLE_7:
        case MicLayoutEnum.TILED_1_1_3_3:
        case MicLayoutEnum.LUCKY_GAME_6:
        case null:
        default:
          // 7 座等沿用现有 hostOnTop 网格，不改动。
          return _buildLegacyHostGrid(ctx);
      }
    });
  }

  /// 7 座 / 未识别布局：主持置顶 + 4 列网格。对齐原行为。
  Widget _buildLegacyHostGrid(_MicLayoutCtx ctx) {
    final hostOnTop = RoomService.findOrNull()?.hostOnTop.value ?? true;
    if (!hostOnTop || ctx.seats.length < 5) {
      return _flatGrid(ctx, ctx.seats, host: false);
    }
    final host = ctx.seats.first;
    final guests = ctx.seats.skip(1).toList();
    return Column(
      children: [
        ctx.seat(host, host: true),
        const SizedBox(height: 6),
        _flatGrid(ctx, guests, host: false),
      ],
    );
  }

  Widget _flatGrid(_MicLayoutCtx ctx, List<MicSeat> seats, {required bool host}) {
    return GridView(
      shrinkWrap: true,
      // 波纹 / 头像框会溢出格子，不能裁切。
      clipBehavior: Clip.none,
      physics: const NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.symmetric(horizontal: 8),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
        // 头像 56 + 波纹外扩 0.3*56≈17 + 昵称行，给足纵向避免裁切。
        mainAxisExtent: 120,
      ),
      children: [for (final seat in seats) ctx.seat(seat, host: host)],
    );
  }

  /// 6 麦环形。对齐 joyride `MicSeatWidget6`。
  Widget _buildRoundTable6(_MicLayoutCtx ctx) {
    Widget pair(int a, int b, double gap) {
      return Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          ctx.seat(ctx.at(a)),
          SizedBox(width: gap),
          ctx.seat(ctx.at(b)),
        ],
      );
    }

    return Padding(
      padding: const EdgeInsets.only(top: 20, bottom: 8),
      child: Column(
        children: [
          pair(0, 5, 68),
          const SizedBox(height: 16),
          pair(1, 4, 181),
          const SizedBox(height: 16),
          pair(2, 3, 68),
        ],
      ),
    );
  }

  /// 按行平铺。
  Widget _buildTiledRows(
    _MicLayoutCtx ctx,
    List<int> rows, {
    double? seatWidth,
  }) {
    final children = <Widget>[];
    var index = 0;
    for (var r = 0; r < rows.length; r++) {
      if (r > 0) children.add(SizedBox(height: rows.length >= 3 ? 15 : 16));
      final count = rows[r];
      final rowSeats = <Widget>[];
      for (var i = 0; i < count; i++) {
        final seat = ctx.at(index++);
        rowSeats.add(
          seatWidth == null
              ? Expanded(child: ctx.seat(seat))
              : SizedBox(width: seatWidth + 20, child: ctx.seat(seat)),
        );
      }
      children.add(
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: rowSeats,
        ),
      );
    }
    return Padding(
      padding: const EdgeInsets.only(top: 8, bottom: 8),
      child: Column(children: children),
    );
  }

  /// 1+4+4。对齐 joyride `MicSeatWidget144`。
  Widget _buildTiled144(_MicLayoutCtx ctx) {
    return Padding(
      padding: const EdgeInsets.only(top: 8, bottom: 8),
      child: Column(
        children: [
          ctx.seat(ctx.at(0), host: true),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              for (var i = 1; i <= 4; i++) Expanded(child: ctx.seat(ctx.at(i))),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              for (var i = 5; i <= 8; i++) Expanded(child: ctx.seat(ctx.at(i))),
            ],
          ),
        ],
      ),
    );
  }

  /// 双麦。对齐 joyride `DoufengMicSeatWidget`。
  Widget _buildTiled2(_MicLayoutCtx ctx) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, bottom: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          SizedBox(width: 100, child: ctx.seat(ctx.at(0), host: true)),
          SizedBox(width: 100, child: ctx.seat(ctx.at(1), host: true)),
        ],
      ),
    );
  }

  /// 3+5（上区 2+1，下排 5）。对齐 joyride `MicSeatWidget35` 座位结构，车位装饰简化。
  Widget _buildTiled35(_MicLayoutCtx ctx) {
    return Padding(
      padding: const EdgeInsets.only(top: 8, bottom: 8),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Container(
                  height: 122,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      stops: const [0, 0.73, 1],
                      colors: [
                        const Color(0xFF9A4BE6).withValues(alpha: 0.1),
                        const Color(0xFF666FF4).withValues(alpha: 0.1),
                        const Color(0xFF537BFE).withValues(alpha: 0.1),
                      ],
                    ),
                    borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(8),
                      bottomRight: Radius.circular(8),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ctx.seat(ctx.at(0)),
                      const SizedBox(width: 32),
                      ctx.seat(ctx.at(1)),
                    ],
                  ),
                ),
              ),
              const SizedBox(width: 6),
              Expanded(
                child: Container(
                  height: 122,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        const Color(0xFFFFDE85).withValues(alpha: 0.05),
                        const Color(0xFFFFA050).withValues(alpha: 0.05),
                      ],
                    ),
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(8),
                      bottomLeft: Radius.circular(8),
                    ),
                  ),
                  child: ctx.seat(ctx.at(2)),
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              for (var i = 3; i < 8; i++)
                SizedBox(width: 60, child: ctx.seat(ctx.at(i))),
            ],
          ),
        ],
      ),
    );
  }
}

class _MicLayoutCtx {
  const _MicLayoutCtx({
    required this.seats,
    required this.logic,
    required this.emotes,
    required this.onTap,
  });

  final List<MicSeat> seats;
  final MicLogic logic;
  final Map<int, String> emotes;
  final void Function(MicSeat seat) onTap;

  MicSeat at(int index) {
    if (index < 0 || index >= seats.length) return MicSeat(index: index);
    return seats[index];
  }

  Widget seat(MicSeat seat, {bool host = false}) {
    return RoomMicSeat(
      seat: seat,
      host: host,
      anchor: logic.anchorFor(seat),
      emoteUrl: _emoteUrl(seat.uid),
      onTap: () => onTap(seat),
    );
  }

  String _emoteUrl(int? uid) {
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
                      TextFmt.roomCount(seat.contribution),
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
        RoomSeatSpeakingFx(
          uid: seat.uid,
          micOpen: seat.micOpen,
          size: size,
          micEffect: seat.micEffect,
        ),
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
              decoration: const BoxDecoration(
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
        if (seat.downMicAt > 0) _remainOverlay(size),
      ],
    );
  }

  /// 仅限时麦订阅 clock；剩余 ≤30 秒时显示，对齐 Oumi `_micRemainTips`。
  Widget _remainOverlay(double size) {
    return Obx(() {
      if (Get.isRegistered<MicLogic>()) Get.find<MicLogic>().clock.value;
      final remain = seat.remainSeconds();
      if (remain <= 0 || remain > 30) return const SizedBox.shrink();
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
                '${remain}s',
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
    });
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

/// 发言特效。对齐 joyride `ValueListenableBuilder(speakers)`。
class RoomSeatSpeakingFx extends StatelessWidget {
  const RoomSeatSpeakingFx({
    super.key,
    required this.uid,
    required this.micOpen,
    required this.size,
    this.micEffect = '',
  });

  final int? uid;
  final bool micOpen;
  final double size;
  final String micEffect;

  @override
  Widget build(BuildContext context) {
    if (!Get.isRegistered<MicLogic>()) return const SizedBox.shrink();
    final logic = Get.find<MicLogic>();
    final seatUid = uid ?? 0;
    // 对齐 joyride `_overFlowBox(waveBorder)`：给波纹 / 麦效 1.6 倍绘制空间。
    return OverflowBox(
      minWidth: size,
      minHeight: size,
      maxWidth: size * 1.6,
      maxHeight: size * 1.6,
      child: ValueListenableBuilder<Set<int>>(
        valueListenable: logic.speakers,
        builder: (context, ids, _) {
          MicSeat? live;
          for (final seat in logic.seats) {
            if (seat.uid == seatUid) {
              live = seat;
              break;
            }
          }
          final open = live?.micOpen ?? micOpen;
          final speaking = open &&
              seatUid > 0 &&
              (ids.contains(seatUid) ||
                  (ids.contains(0) && seatUid == logic.myUid));
          if (!speaking) return const SizedBox.shrink();
          final effect = (live?.micEffect ?? micEffect).trim();
          if (effect.isNotEmpty) {
            return IgnorePointer(
              child: Chimo.image(
                effect,
                width: size * 1.6,
                height: size * 1.6,
                fit: BoxFit.cover,
              ),
            );
          }
          return RoomSeatWave(size: size);
        },
      ),
    );
  }
}

/// 说话波纹。对齐 joyride `WaveBorder`：直径从 [size] 扩到 [size]*1.6，1s 淡出循环。
/// 外层需用 OverflowBox(max: size*1.6) 包住（见 [_face]）。
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
    final min = widget.size;
    final max = widget.size * 1.6;
    return IgnorePointer(
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, _) {
          final t = _controller.value;
          final diameter = min + (max - min) * t;
          return Opacity(
            opacity: (1 - t).clamp(0.0, 1.0),
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
