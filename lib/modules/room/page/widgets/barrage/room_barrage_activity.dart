import 'package:flutter/material.dart';

import '../../../../../common/theme/app_colors.dart';
import 'room_barrage_host.dart';
import 'package:chimo/common/utils/chimo.dart';

class RoomBarrageActivityBody extends StatelessWidget {
  const RoomBarrageActivityBody({super.key, required this.host});

  final RoomBarrageHost host;

  @override
  Widget build(BuildContext context) {
    final message = host.message;
    return GestureDetector(
      onTap: () => host.openLink(message.link),
      child: Container(
        width: 222,
        padding: const EdgeInsets.all(8),
        decoration: const BoxDecoration(
          borderRadius: BorderRadiusDirectional.only(
            topEnd: Radius.circular(12),
            bottomStart: Radius.circular(12),
            bottomEnd: Radius.circular(12),
          ),
          gradient: AppColors.roomActivityFill,
        ),
        child: Row(
          children: [
            Container(
              width: 60,
              height: 60,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                gradient: AppColors.roomActivityIcon,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Chimo.image(message.cover, width: 50, fit: BoxFit.fitWidth),
            ),
            const SizedBox(width: 10),
            const Flexible(
              child: Text(
                "Don't miss out on this great event. Come join me now!",
                style: TextStyle(color: AppColors.white, fontSize: 12),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
