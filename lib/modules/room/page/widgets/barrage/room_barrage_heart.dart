import 'dart:ui';

import 'package:flutter/material.dart';

import '../../../../../common/constants/app_assets.dart';
import '../../../../../common/theme/app_colors.dart';
import '../../../../../common/utils/chimo.dart';
import '../../../../../common/widgets/gender_age_chip.dart';
import '../../../../../modules/heart_link/widgets/heart_link_secret_card_dialog.dart';
import 'room_barrage_host.dart';

/// 公屏 HeartLink 神秘卡。对齐 joyride `RoomHeartMsgItemBuilder`。
class RoomBarrageHeartBody extends StatelessWidget {
  const RoomBarrageHeartBody({super.key, required this.host});

  final RoomBarrageHost host;

  @override
  Widget build(BuildContext context) {
    final heart = host.message.heart;
    if (heart == null) return const SizedBox.shrink();
    final male = heart.gender.trim().toLowerCase() == 'male';

    return Container(
      clipBehavior: Clip.antiAlias,
      width: 220,
      height: 138,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(8)),
      child: Stack(
        children: [
          ImageFiltered(
            imageFilter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
            child: Chimo.image(
              heart.photo,
              width: 220,
              height: 138,
              fit: BoxFit.fill,
              fallbackAsset: AppAssets.avatarPlace,
            ),
          ),
          Positioned.fill(
            child: DecoratedBox(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [AppColors.black.withValues(alpha: 0), AppColors.black],
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadiusDirectional.only(
                        topStart: Radius.circular(8),
                        bottomEnd: Radius.circular(8),
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
                        Flexible(
                          child: Text(
                            heart.name,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              color: AppColors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                        if (heart.gender.trim().isNotEmpty && heart.age > 0) ...[
                          const SizedBox(width: 4),
                          GenderAgeChip(isMale: male, age: heart.age),
                        ],
                      ],
                    ),
                  ),
                  const SizedBox(height: 4),
                  Container(
                    height: 18,
                    margin: const EdgeInsets.symmetric(horizontal: 12),
                    decoration: const ShapeDecoration(
                      shape: StadiumBorder(),
                      color: AppColors.white10,
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Chimo.image(AppAssets.telegramIcon, height: 18, fit: BoxFit.fitHeight),
                        const SizedBox(width: 3),
                        const Text(
                          'Telegram:',
                          style: TextStyle(
                            color: AppColors.white,
                            fontSize: 10,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        const Text(
                          '****',
                          style: TextStyle(
                            color: AppColors.white,
                            fontSize: 10,
                            fontWeight: FontWeight.w700,
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                        const SizedBox(width: 10),
                        Chimo.image(
                          AppAssets.lockIcon,
                          width: 12,
                          fit: BoxFit.fitWidth,
                          color: AppColors.yellowFFE24B,
                        ),
                        const SizedBox(width: 3),
                        const Text(
                          'Locked',
                          style: TextStyle(
                            color: AppColors.yellowFFE24B,
                            fontSize: 10,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        const SizedBox(width: 10),
                      ],
                    ),
                  ),
                  const SizedBox(height: 12),
                  GestureDetector(
                    onTap: () {
                      if (heart.gsUid > 0) {
                        HeartLinkSecretCardDialog.show(heart.gsUid, source: 1);
                      }
                    },
                    child: Container(
                      height: 28,
                      margin: const EdgeInsets.symmetric(horizontal: 12),
                      alignment: Alignment.center,
                      decoration: const ShapeDecoration(
                        shape: StadiumBorder(),
                        gradient: AppColors.primaryGradient,
                        // color: AppColors.white,
                      ),
                      child: ShaderMask(
                        shaderCallback: (rect) => AppColors.primaryGradient.createShader(rect),
                        child: const Text(
                          'Spark or Skip',
                          style: TextStyle(
                            color: AppColors.black1F2518,
                            fontSize: 13,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
