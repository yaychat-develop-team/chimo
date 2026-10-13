import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../app/app_jumper.dart';
import '../../../common/constants/app_assets.dart';
import '../../../common/theme/app_colors.dart';
import '../../../common/utils/app_toast.dart';
import '../../../common/widgets/app_image.dart';
import '../../../common/widgets/app_top_loading_bar.dart';
import '../logic/me_logic.dart';
import 'widgets/me_action_cards.dart';
import 'widgets/me_profile_header.dart';
import 'widgets/me_quick_access_section.dart';
import 'widgets/me_stats_row.dart';

/// Me 页：`mine_bg` 背景与屏幕宽度一致。
class MePage extends GetView<MeLogic> {
  const MePage({super.key});

  /// Controller 的方法把要提示的文案 `return` 回来，由 View 决定怎么弹。
  Future<void> _report(Future<String?> op) async {
    final message = await op;
    if (message != null) AppToast.error(message);
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.sizeOf(context).width;

    return ColoredBox(
      // 对齐 `mine_bg` 底部（#0F0F0F），避免 Quick Access 纯黑。
      color: AppColors.surface,
      child: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: AppImage(
              AppAssets.mineBg,
              width: screenWidth,
              fit: BoxFit.fitWidth,
              alignment: Alignment.topCenter,
            ),
          ),
          SafeArea(
            bottom: false,
            child: RefreshIndicator(
              color: AppColors.primaryBright,
              onRefresh: () => _report(controller.load()),
              // 内容未超出页面高度时不可滑动；超出后才能滚。
              child: ListView(
                physics: const ClampingScrollPhysics(),
                padding: const EdgeInsets.fromLTRB(16, 80, 16, 24),
                children: [
                  Obx(
                    () => controller.loading.value
                        ? const Padding(
                            padding: EdgeInsets.only(bottom: 16),
                            child: AppTopLoadingBar(),
                          )
                        : const SizedBox.shrink(),
                  ),
                  Obx(
                    () => MeProfileHeader(
                      profile: controller.profile.value,
                      onAvatarTap: () => unawaited(controller.openPersonalProfile()),
                      onProfileTap: () => unawaited(controller.openEditProfile()),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Obx(
                    () => MeStatsRow(
                      stats: controller.stats,
                      onStatTap: (item) => unawaited(_report(controller.openStat(item))),
                    ),
                  ),
                  const SizedBox(height: 16),
                  MeActionCards(
                    onWalletTap: () => unawaited(AppJumper.toWallet()),
                    onLevelTap: () => unawaited(controller.openLevel()),
                  ),
                  const SizedBox(height: 24),
                  Obx(
                    () => MeQuickAccessSection(
                      items: controller.quickAccess,
                      onItemTap: (item) => unawaited(_report(controller.onQuickAccess(item.id))),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
