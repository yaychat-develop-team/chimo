import 'package:flutter/material.dart';

import '../../../../app/app_jumper.dart';
import '../../../../common/constants/app_assets.dart';
import '../../../../common/theme/app_colors.dart';
import '../../../../common/widgets/app_image.dart';
import '../../model/mic_seat.dart';
import '../../model/room_format.dart';

/// 点麦上头像打开的资料卡。自己可以下麦，别人可以私聊和送礼。
class RoomUserSheet extends StatelessWidget {
  const RoomUserSheet({
    super.key,
    required this.seat,
    required this.mine,
    this.onLeave,
    this.onGift,
  });

  final MicSeat seat;
  final bool mine;
  final VoidCallback? onLeave;
  final VoidCallback? onGift;

  static Future<void> show(
    BuildContext context, {
    required MicSeat seat,
    required bool mine,
    VoidCallback? onLeave,
    VoidCallback? onGift,
  }) {
    return showModalBottomSheet<void>(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) => RoomUserSheet(seat: seat, mine: mine, onLeave: onLeave, onGift: onGift),
    );
  }

  @override
  Widget build(BuildContext context) {
    final bottom = MediaQuery.paddingOf(context).bottom;
    return Padding(
      padding: EdgeInsets.only(top: 36),
      child: Stack(
        alignment: Alignment.topCenter,
        clipBehavior: Clip.none,
        children: [
          Container(
            margin: const EdgeInsets.only(top: 36),
            padding: EdgeInsets.fromLTRB(20, 52, 20, 16 + bottom),
            decoration: const BoxDecoration(
              color: AppColors.rankSheet,
              borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  seat.name,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(color: AppColors.textPrimary, fontSize: 16, fontWeight: FontWeight.w700),
                ),
                const SizedBox(height: 6),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const AppImage(AppAssets.roomLove, width: 12, height: 11),
                    const SizedBox(width: 4),
                    Text(
                      roomCount(seat.contribution),
                      style: const TextStyle(color: AppColors.textPrimary, fontSize: 12),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                if (mine) _leave() else _others(),
              ],
            ),
          ),
          Positioned(top: 0, child: _avatar()),
        ],
      ),
    );
  }

  Widget _avatar() {
    final face = ClipOval(
      child: seat.avatar.trim().isEmpty
          ? const ColoredBox(color: AppColors.roomEmptySeat, child: SizedBox(width: 72, height: 72))
          : AppImage(seat.avatar, width: 72, height: 72, fit: BoxFit.cover),
    );
    return GestureDetector(
      onTap: () {
        AppJumper.back();
        AppJumper.toProfile('${seat.uid}');
      },
      child: Container(
        width: 76,
        height: 76,
        alignment: Alignment.center,
        decoration: const BoxDecoration(color: AppColors.textPrimary, shape: BoxShape.circle),
        child: face,
      ),
    );
  }

  Widget _leave() {
    return SizedBox(
      width: double.infinity,
      height: 44,
      child: FilledButton(
        onPressed: () {
          AppJumper.back();
          onLeave?.call();
        },
        style: FilledButton.styleFrom(
          backgroundColor: AppColors.roomSave,
          foregroundColor: AppColors.textPrimary,
          shape: const StadiumBorder(),
        ),
        child: const Text('Leave mic', style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700)),
      ),
    );
  }

  Widget _others() {
    return Row(
      children: [
        Expanded(child: _action('Message', AppColors.roomInput, AppColors.textPrimary, _message)),
        const SizedBox(width: 12),
        Expanded(child: _action('Gift', AppColors.giftGold, AppColors.roomNewMsgText, _gift)),
      ],
    );
  }

  Widget _action(String label, Color background, Color foreground, VoidCallback onTap) {
    return SizedBox(
      height: 44,
      child: FilledButton(
        onPressed: onTap,
        style: FilledButton.styleFrom(
          backgroundColor: background,
          foregroundColor: foreground,
          shape: const StadiumBorder(),
        ),
        child: Text(label, style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w700)),
      ),
    );
  }

  void _message() {
    AppJumper.back();
    AppJumper.toChat('${seat.uid}');
  }

  void _gift() {
    AppJumper.back();
    onGift?.call();
  }
}
