import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../app/app_jumper.dart';
import '../../../common/constants/app_assets.dart';
import '../../../common/theme/app_colors.dart';
import 'package:chimo/common/utils/chimo.dart';
import '../../../common/widgets/app_pull_refresh.dart';
import '../../../common/widgets/line_loading_bar.dart';
import '../logic/me_logic.dart';
import 'widgets/me_action_cards.dart';
import 'widgets/me_profile_header.dart';
import 'widgets/me_quick_access_section.dart';
import 'widgets/me_stats_row.dart';

/// Me 页：`mine_bg` 背景与屏幕宽度一致。
class MePage extends GetView<MeLogic> {
  const MePage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.sizeOf(context).width;

    return ColoredBox(
      // 对齐 `mine_bg` 底部（#0F0F0F），避免 Quick Access 纯黑。
      color: AppColors.black111111,
      child: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Chimo.image(
              AppAssets.mineBg,
              width: screenWidth,
              fit: BoxFit.fitWidth,
              alignment: Alignment.topCenter,
            ),
          ),
          SafeArea(
            bottom: false,
            child: AppPullRefresh(
              onRefresh: controller.load,
              padding: const EdgeInsets.fromLTRB(16, 80, 16, 24),
              slivers: [
                SliverToBoxAdapter(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Obx(
                        () => controller.loading.value
                            ? const Padding(
                                padding: EdgeInsets.only(bottom: 16),
                                child: LineLoadingBar(),
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
                          onStatTap: (item) => unawaited(controller.openStat(item)),
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
                          onItemTap: (item) => unawaited(controller.onQuickAccess(item.id)),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
