import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../common/constants/app_assets.dart';
import '../../../../common/theme/app_colors.dart';
import '../../../../common/widgets/app_image.dart';
import '../../logic/mic_logic.dart';
import '../../model/mic_seat.dart';
import '../../model/room_format.dart';
import '../../service/room_service.dart';

class RoomMicGrid extends StatelessWidget {
  const RoomMicGrid({super.key, required this.onTap});

  final void Function(MicSeat seat) onTap;

  @override
  Widget build(BuildContext context) {
    if (!Get.isRegistered<MicLogic>()) return const SizedBox(height: 220);
    final logic = Get.find<MicLogic>();
    return Obx(() {
      final hostOnTop = RoomService.findOrNull()?.hostOnTop.value ?? true;
      final seats = logic.seats.toList();
      if (seats.isEmpty) return const SizedBox(height: 220);
      if (!hostOnTop || seats.length < 5) {
        return _grid(seats, host: false);
      }
      final host = seats.first;
      final guests = seats.skip(1).toList();
      return Column(
        children: [
          _Seat(seat: host, host: true, onTap: () => onTap(host)),
          const SizedBox(height: 6),
          _grid(guests, host: false),
        ],
      );
    });
  }

  Widget _grid(List<MicSeat> seats, {required bool host}) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.symmetric(horizontal: 8),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
        mainAxisExtent: 108,
      ),
      itemCount: seats.length,
      itemBuilder: (context, index) {
        final seat = seats[index];
        return _Seat(seat: seat, host: host, onTap: () => onTap(seat));
      },
    );
  }
}

class _Seat extends StatelessWidget {
  const _Seat({required this.seat, required this.host, required this.onTap});

  final MicSeat seat;
  final bool host;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final size = host ? 76.0 : 56.0;
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: Column(
        children: [
          SizedBox(width: size + (seat.frame.isNotEmpty ? 10 : 0), height: size + (seat.frame.isNotEmpty ? 10 : 0), child: _face(size)),
          const SizedBox(height: 4),
          _label(),
          if (seat.occupied) ...[
            const SizedBox(height: 2),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const AppImage(AppAssets.roomLove, width: 12, height: 11),
                const SizedBox(width: 2),
                Text(
                  roomCount(seat.contribution),
                  style: const TextStyle(color: AppColors.textPrimary, fontSize: 10, height: 1),
                ),
              ],
            ),
          ],
        ],
      ),
    );
  }

  Widget _face(double size) {
    if (!seat.occupied) {
      return AppImage(
        seat.boss ? AppAssets.roomSeatBoss : AppAssets.roomSeatEmpty,
        width: size,
        height: size,
      );
    }
    final ring = seat.boss
        ? AppColors.roomBossGold
        : seat.speaking
        ? AppColors.roomSave
        : Colors.transparent;
    final avatar = Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: ring, width: seat.boss || seat.speaking ? 2 : 0),
      ),
      child: ClipOval(child: _inner(size)),
    );
    final frame = seat.frame.trim();
    return Stack(
      alignment: Alignment.center,
      clipBehavior: Clip.none,
      children: [
        avatar,
        if (frame.isNotEmpty)
          IgnorePointer(child: AppImage(frame, width: size * 1.35, height: size * 1.35, fit: BoxFit.contain)),
        if (!seat.micOpen)
          Positioned(
            right: 0,
            bottom: 0,
            child: AppImage(AppAssets.roomMicOff, width: 18, height: 18, fit: BoxFit.contain),
          ),
      ],
    );
  }

  Widget _inner(double size) {
    if (seat.avatar.trim().isEmpty) {
      return const ColoredBox(color: AppColors.roomEmptySeat);
    }
    return AppImage(seat.avatar, width: size, height: size, fit: BoxFit.cover);
  }

  Widget _label() {
    if (!seat.occupied && seat.boss) {
      return const Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AppImage(AppAssets.roomKing, width: 12, height: 12),
          SizedBox(width: 2),
          Flexible(
            child: Text(
              'Boss Seat',
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(color: AppColors.roomBossGold, fontSize: 11, height: 1.1),
            ),
          ),
        ],
      );
    }
    final text = seat.occupied ? seat.name : host ? '' : '${seat.index}';
    if (text.isEmpty) return const SizedBox(height: 14);
    return Text(
      text,
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      textAlign: TextAlign.center,
      style: const TextStyle(color: AppColors.textPrimary, fontSize: 11, height: 1.1),
    );
  }
}
