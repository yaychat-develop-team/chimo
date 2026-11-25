import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../common/constants/app_assets.dart';
import '../../../common/theme/app_colors.dart';
import 'package:chimo/common/utils/chimo.dart';
import '../../../common/widgets/app_pull_refresh.dart';
import '../../../common/widgets/app_scaffold.dart';
import '../logic/me_logic.dart';
import '../model/me_menu_data.dart';
import 'widgets/me_action_cards.dart';
import 'widgets/me_features_drawer.dart';
import 'widgets/me_profile_header.dart';

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
                    onAvatarTap: () => controller.openPersonalProfile(),
                    onProfileTap: () => controller.openPersonalProfile(),
                  ),
                ),
                Chimo.gap(height: 18),
                Obx(
                  () => _StatsRow(
                    stats: controller.stats,
                    onStatTap: (item) => controller.openStat(item),
                  ),
                ),
                Chimo.gap(height: 16),
                Obx(
                  () => MeActionCards(
                    coinText: controller.coinText.value,
                    wealthText: controller.wealthText,
                    peerageText: controller.peerageText,
                    onWalletTap: () => controller.onQuickAccess('wallet'),
                    onLevelTap: () => controller.onQuickAccess('level'),
                    onPeerageTap: () => controller.onQuickAccess('peerage'),
                  ),
                ),
                Chimo.gap(height: 20),
                _FeaturedGames(
                  items: MeMenuData.featuredGames,
                  onItemTap: (item) => controller.onQuickAccess(item.id),
                ),
                Chimo.gap(height: 16),
                GestureDetector(
                  onTap: () => controller.onQuickAccess('invite'),
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
              _actionButton(AppAssets.mineEdit, () => controller.openEditProfile()),
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

  Future<void> _openMenu() {
    return MeFeaturesDrawer.show(
      onItemTap: (item) {
        Get.back();
        controller.onQuickAccess(item.id);
      },
    );
  }
}

/// 社交数据：数字在上、标签在下，未读红点贴在数字右上。
class _StatsRow extends StatelessWidget {
  const _StatsRow({required this.stats, this.onStatTap});

  final List<MeStatItem> stats;
  final ValueChanged<MeStatItem>? onStatTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        for (final item in stats) _StatItem(item: item, onTap: () => onStatTap?.call(item)),
      ],
    );
  }
}

class _StatItem extends StatelessWidget {
  const _StatItem({required this.item, this.onTap});

  final MeStatItem item;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final badge = item.badge;
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        behavior: HitTestBehavior.opaque,
        child: Column(
          children: [
            Stack(
              clipBehavior: Clip.none,
              alignment: Alignment.center,
              children: [
                Text(
                  item.value,
                  style: const TextStyle(
                    color: AppColors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w800,
                    height: 1.1,
                  ),
                ),
                if (badge > 0)
                  Positioned(
                    top: -8,
                    right: -10,
                    child: Container(
                      constraints: const BoxConstraints(minWidth: 16, minHeight: 16),
                      padding: const EdgeInsets.symmetric(horizontal: 4),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: AppColors.rgba(253, 75, 75, 1),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        badge > 99 ? '99+' : '$badge',
                        style: const TextStyle(
                          color: AppColors.white,
                          fontSize: 9,
                          fontWeight: FontWeight.w700,
                          height: 1,
                        ),
                      ),
                    ),
                  ),
              ],
            ),
            const SizedBox(height: 4),
            Text(
              item.label,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                color: AppColors.gray9A9A9A,
                fontSize: 12,
                fontWeight: FontWeight.w400,
                height: 1.1,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// Featured Games：四列，切图铺底，文案贴在底部。
class _FeaturedGames extends StatelessWidget {
  const _FeaturedGames({required this.items, this.onItemTap});

  final List<QuickAccessItem> items;
  final ValueChanged<QuickAccessItem>? onItemTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Featured Games',
          style: TextStyle(
            color: AppColors.white,
            fontSize: 16,
            fontWeight: FontWeight.w800,
            height: 1.2,
          ),
        ),
        const SizedBox(height: 12),
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          padding: EdgeInsets.zero,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
            mainAxisSpacing: 8.w,
            crossAxisSpacing: 8.w,
            childAspectRatio: 1,
          ),
          itemCount: items.length,
          itemBuilder: (context, index) {
            final item = items[index];
            return _FeaturedGameTile(
              item: item,
              onTap: onItemTap == null ? null : () => onItemTap!(item),
            );
          },
        ),
      ],
    );
  }
}

class _FeaturedGameTile extends StatelessWidget {
  const _FeaturedGameTile({required this.item, this.onTap});

  final QuickAccessItem item;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16.r),
        child: Stack(
          fit: StackFit.expand,
          children: [
            Chimo.image(item.iconAsset, fit: BoxFit.cover),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: EdgeInsets.fromLTRB(2.w, 0, 2.w, 6.w),
                child: Text(
                  item.label,
                  textAlign: TextAlign.center,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: AppColors.white70,
                    fontSize: 11.sp,
                    fontWeight: FontWeight.w500,
                    height: 1.1,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
