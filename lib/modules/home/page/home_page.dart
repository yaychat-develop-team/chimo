import 'package:card_swiper/card_swiper.dart';
import 'package:chimo/common/utils/chimo.dart';
import 'package:chimo/common/widgets/app_scaffold.dart';
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../app/app_jumper.dart';
import '../../../common/constants/app_assets.dart';
import '../../../common/models/server_client/group/group.pb.dart';
import '../../../common/theme/app_colors.dart';
import 'widgets/my_group_card.dart';
import 'widgets/popular_group_card.dart';
import '../logic/home_logic.dart';
import 'widgets/home_search_header.dart';
import '../../../common/widgets/section_title_view.dart';
import '../../../common/widgets/app_pull_refresh.dart';
import 'package:chimo/common/widgets/app_image.dart';

/// 首页：应用栏、推广横幅、我的群组、热门群组（房间列表见 [RoomListPage]）。
///
/// 取数、提示和跳转在 [HomeLogic]。列表下拉刷新 / 上拉加载走 [AppPullRefresh]。
class HomePage extends GetView<HomeLogic> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      backdrop: AppImage.image(
        AppAssets.homeTopBg,
        fit: BoxFit.cover,
        alignment: Alignment.topCenter,
      ),
      appBar: _buildAppBar(),
      body: Obx(_buildGroupSections),
    );
  }

  Widget _buildAppBar() {
    return SafeArea(
      bottom: false,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          HomeSearchHeader(
            onSearchTap: () {
              AppJumper.toHomeSearch();
            },
          ),
          Obx(() {
            final banners = controller.banners.toList();
            if (banners.isEmpty) {
              return Visibility(
                visible: banners.length > 1,
                child: const SizedBox.shrink(),
              );
            } else {
              return Container(
                height: 100.w,
                margin: const EdgeInsets.symmetric(horizontal: 16),
                child: Swiper(
                  autoplay: banners.length > 1,
                  axisDirection: AxisDirection.up,
                  scrollDirection: Axis.vertical,
                  itemCount: banners.length,
                  itemBuilder: (context, index) {
                    final banner = banners[index];
                    return Chimo.image(banner.img1, fit: BoxFit.cover);
                  },
                  onTap: (index) {
                    AppJumper.openLink(controller.banners.toList()[index].link);
                  },
                ),
              );
            }
          }),
        ],
      ),
    );
  }

  Widget _buildGroupSections() {
    if (controller.initialLoading.value) {
      return const Center(
        child: CircularProgressIndicator(color: AppColors.green1BBA77),
      );
    }
    // `.toList` 是必须的：卡片的 itemBuilder 在 `Obx` 的 builder 之外跑，
    // 光把 RxList 传下去登记不到依赖。
    final popular = controller.popularGroups.toList();
    final joined = controller.joinedGroups.toList();
    final loadError = controller.loadError.value;

    return AppPullRefresh(
      onRefresh: controller.loadGroups,
      onLoadMore: () => controller.loadGroups(loadMore: true),
      hasMore: controller.hasMore,
      loadingMore: controller.loadingMore.value,
      showNoMoreFooter: false,
      slivers: [
        if (loadError != null && popular.isEmpty)
          SliverFillRemaining(
            hasScrollBody: false,
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      loadError,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: AppColors.gray9A9A9A,
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(height: 16),
                    TextButton(
                      onPressed: () => unawaited(controller.loadGroups()),
                      child: const Text('Retry'),
                    ),
                  ],
                ),
              ),
            ),
          ),
        if (joined.isNotEmpty) _myGroups(joined),
        _popularGroups(popular),
      ],
    );
  }

  Widget _myGroups(List<GroupInfo> groups) {
    return SliverMainAxisGroup(
      slivers: [
        SliverToBoxAdapter(
          child: SectionTitleView(
            title: 'My Groups',
            actionLabel: 'More',
            onActionTap: () {
              AppJumper.toJoinedGroups(
                groups: controller.joinedGroups.toList(),
                onMembershipChanged: controller.setJoined,
              );
            },
          ),
        ),
        SliverToBoxAdapter(
          child: SizedBox(
            height: MyGroupCard.totalHeight,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemCount: groups.length,
              separatorBuilder: (_, _) => const SizedBox(width: 10),
              itemBuilder: (context, index) {
                final group = groups[index];
                return MyGroupCard(
                  group: group,
                  onTap: () => controller.openGroup(group),
                );
              },
            ),
          ),
        ),
        SliverToBoxAdapter(child: Chimo.gap(height: 24)),
      ],
    );
  }

  Widget _popularGroups(List<GroupInfo> groups) {
    return SliverMainAxisGroup(
      slivers: [
        const SliverToBoxAdapter(
          child: SectionTitleView(title: 'Popular Groups'),
        ),
        SliverList.separated(
          itemCount: groups.length,
          separatorBuilder: (_, _) => Chimo.gap(height: 12),
          itemBuilder: (context, index) {
            final group = groups[index];
            return PopularGroupCard(
              group: group,
              onJoinTap: () => unawaited(controller.join(group)),
              onTap: () => controller.openGroup(group),
              onMembersTap: () => controller.openMembers(group),
            );
          },
        ),
      ],
    );
  }
}
