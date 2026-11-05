import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../common/constants/app_assets.dart';
import '../../../common/theme/app_bottom_sheet.dart';
import '../../../common/theme/app_colors.dart';
import 'package:chimo/common/utils/chimo.dart';
import '../../../common/widgets/app_pull_refresh.dart';
import '../../../common/widgets/app_scaffold.dart';
import '../logic/me_logic.dart';
import '../model/me_menu_data.dart';
import 'widgets/me_action_cards.dart';
import 'widgets/me_profile_header.dart';
import 'widgets/quick_access_section.dart';
import 'widgets/me_stats_section.dart';

/// Me 页：`mine_bg` 背景与屏幕宽度一致。
class MePage extends GetView<MeLogic> {
  const MePage({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      backgroundColor: AppColors.black111111,
      backdrop: Chimo.image(AppAssets.mineBg, fit: BoxFit.fitWidth, alignment: Alignment.topCenter),
      appBar: _toolbar(),
      body: AppPullRefresh(
        onRefresh: controller.load,
        padding: const EdgeInsets.fromLTRB(16, 8, 16, 24),
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Chimo.gap(height: 30),
                Obx(
                  () => MeProfileHeader(
                    profile: controller.profile.value,
                    onAvatarTap: () => unawaited(controller.openPersonalProfile()),
                    onProfileTap: () => unawaited(controller.openPersonalProfile()),
                  ),
                ),
                Chimo.gap(height: 18),
                Obx(
                  () => MeStatsSection(
                    stats: controller.stats,
                    onStatTap: (item) => unawaited(controller.openStat(item)),
                  ),
                ),
                Chimo.gap(height: 16),
                Obx(
                  () => MeActionCards(
                    coinText: controller.coinText.value,
                    wealthText: controller.wealthText,
                    peerageText: controller.peerageText,
                    onWalletTap: () => unawaited(controller.onQuickAccess('wallet')),
                    onLevelTap: () => unawaited(controller.onQuickAccess('level')),
                    onPeerageTap: () => unawaited(controller.onQuickAccess('peerage')),
                  ),
                ),
                Chimo.gap(height: 20),
                QuickAccessSection(
                  items: MeMenuData.featuredGames,
                  onItemTap: (item) => unawaited(controller.onQuickAccess(item.id)),
                ),
                Chimo.gap(height: 16),
                GestureDetector(
                  onTap: () => unawaited(controller.onQuickAccess('invite')),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: Chimo.image(
                      AppAssets.mineInviteEarn,
                      width: double.infinity,
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _toolbar() {
    return SafeArea(
      bottom: false,
      child: SizedBox(
        height: 44,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Row(
            children: [
              _actionButton(AppAssets.mineMenu, _openMenu),
              const Spacer(),
              _actionButton(AppAssets.mineEdit, () => unawaited(controller.openEditProfile())),
            ],
          ),
        ),
      ),
    );
  }

  Widget _actionButton(String asset, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: Container(
        width: 28.w,
        height: 28.w,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: AppColors.black20,
          borderRadius: BorderRadius.circular(14),
        ),
        child: Chimo.image(asset, width: 14.w, fit: BoxFit.fitWidth),
      ),
    );
  }

  Future<void> _openMenu() async {
    final items = controller.menuItems;
    await AppBottomSheet.actions(
      buildItems: () => [
        for (final item in items)
          AppSheetAction(
            label: item.label,
            onTap: () {
              Get.back();
              unawaited(controller.onQuickAccess(item.id));
            },
          ),
      ],
    );
  }
}
