import 'package:flutter/material.dart';

import '../../../../../common/theme/app_colors.dart';
import 'room_barrage_host.dart';
import 'package:chimo/common/utils/chimo.dart';

class RoomBarrageHeartBody extends StatelessWidget {
  const RoomBarrageHeartBody({super.key, required this.host});

  final RoomBarrageHost host;

  @override
  Widget build(BuildContext context) {
    final heart = host.message.heart;
    if (heart == null) return const SizedBox.shrink();
    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: SizedBox(
        width: 220,
        height: 138,
        child: Stack(
          fit: StackFit.expand,
          children: [
            if (heart.photo.isNotEmpty)
              Chimo.image(heart.photo, width: 220, height: 138, fit: BoxFit.cover),
            const DecoratedBox(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [AppColors.transparent, AppColors.black],
                ),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(8),
                      bottomRight: Radius.circular(8),
                    ),
                    gradient: AppColors.roomHeartBadge,
                  ),
                  child: const Text(
                    'HeartLink Card',
                    style: TextStyle(
                      color: AppColors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: Row(
                    children: [
                      Text(
                        heart.name,
                        style: const TextStyle(
                          color: AppColors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const SizedBox(width: 4),
                      host.sex(heart.gender, age: heart.age),
                    ],
                  ),
                ),
                const SizedBox(height: 4),
                Container(
                  height: 18,
                  margin: const EdgeInsets.symmetric(horizontal: 12),
                  padding: const EdgeInsets.only(right: 10),
                  decoration: const ShapeDecoration(
                    shape: StadiumBorder(),
                    color: AppColors.black30,
                  ),
                  child: const Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(width: 8),
                      Text('Telegram:', style: TextStyle(color: AppColors.white, fontSize: 10)),
                      Text(
                        '****',
                        style: TextStyle(
                          color: AppColors.white,
                          fontSize: 10,
                          fontWeight: FontWeight.w700,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                      SizedBox(width: 10),
                      Text('Locked', style: TextStyle(color: AppColors.yellowFFE74F, fontSize: 10)),
                    ],
                  ),
                ),
                const SizedBox(height: 12),
                Container(
                  height: 28,
                  margin: const EdgeInsets.symmetric(horizontal: 12),
                  alignment: Alignment.center,
                  decoration: const ShapeDecoration(shape: StadiumBorder(), color: AppColors.white),
                  child: const Text(
                    'Spark or Skip',
                    style: TextStyle(
                      color: AppColors.black1C1C1E,
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                const SizedBox(height: 8),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
