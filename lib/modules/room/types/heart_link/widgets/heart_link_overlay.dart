import 'package:flutter/material.dart';
import 'package:forya_pag/pag.dart';
import 'package:get/get.dart';

import '../../../../../app/network/http/media_upload.dart';
import '../../../../../common/constants/app_assets.dart';
import '../../../../../common/theme/app_colors.dart';
import '../../../../../common/utils/chimo.dart';
import '../logic/heart_link_logic.dart';

/// 牵手成功全屏层。对齐 joyride `HtRoomPageBuilder.successAnimation`。
class HeartLinkOverlay extends StatelessWidget {
  const HeartLinkOverlay({super.key});

  /// Joyride：`StringUtil.formatCDNUrl('heart_link/link_success.pag')`
  static const path = '/ugc-media/static/heart_link/link_success.pag';

  static String get pagUrl => '${MediaUpload.cdnDomain}$path';

  @override
  Widget build(BuildContext context) {
    if (!Get.isRegistered<HeartLinkLogic>()) return const SizedBox.shrink();
    final logic = Get.find<HeartLinkLogic>();
    return Obx(() {
      final info = logic.successInfo.value;
      if (info == null) return const SizedBox.shrink();
      final size = MediaQuery.sizeOf(context);
      return Stack(
        fit: StackFit.expand,
        children: [
          ColoredBox(color: AppColors.black60),
          Center(
            child: SizedBox(
              width: size.width,
              height: size.width * (500 / 375),
              child: PAGView.network(
                pagUrl,
                width: size.width,
                height: size.width * (500 / 375),
                autoPlay: true,
                texts: [info.name1, info.name2],
                imgs: ['', info.avatar1, info.avatar2],
                onAnimationEnd: logic.clearSuccess,
              ),
            ),
          ),
          // PAG 失败时仍保留可点关闭的静态兜底信息。
          Positioned(
            left: 24,
            right: 24,
            bottom: 48,
            child: GestureDetector(
              onTap: logic.clearSuccess,
              behavior: HitTestBehavior.opaque,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Chimo.image(
                        info.avatar1,
                        width: 48,
                        height: 48,
                        circle: true,
                        fallbackAsset: AppAssets.avatarPlace,
                      ),
                      const SizedBox(width: 12),
                      const Icon(Icons.favorite, color: AppColors.pinkFC5CC6, size: 22),
                      const SizedBox(width: 12),
                      Chimo.image(
                        info.avatar2,
                        width: 48,
                        height: 48,
                        circle: true,
                        fallbackAsset: AppAssets.avatarPlace,
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'Congrats! ${info.name1} & ${info.name2}\nbecame Hearties',
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: AppColors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      height: 1.35,
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'Tap to close',
                    style: TextStyle(color: AppColors.white50, fontSize: 12),
                  ),
                ],
              ),
            ),
          ),
        ],
      );
    });
  }
}
