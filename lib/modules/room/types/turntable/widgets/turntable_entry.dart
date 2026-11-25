import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../common/constants/app_assets.dart';
import '../../../../../common/utils/chimo.dart';
import '../logic/turntable_logic.dart';

/// 转盘收起后的入口。对齐 joyride `TurntableEntryWidget`。
class TurntableEntry extends StatelessWidget {
  const TurntableEntry({super.key});

  @override
  Widget build(BuildContext context) {
    if (!Get.isRegistered<TurntableLogic>()) return const SizedBox.shrink();
    final logic = Get.find<TurntableLogic>();
    return Obx(() {
      logic.tick.value;
      logic.visible.value;
      if (!logic.enabled || logic.visible.value) return const SizedBox.shrink();
      return GestureDetector(
        onTap: logic.reveal,
        child: Padding(
          padding: const EdgeInsetsDirectional.only(top: 4),
          child: Chimo.image(AppAssets.turntableEntry, width: 60, height: 60),
        ),
      );
    });
  }
}
