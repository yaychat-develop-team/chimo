import 'package:card_swiper/card_swiper.dart';
import 'package:chimo/common/utils/chimo.dart';
import 'package:chimo/common/widgets/app_image.dart';
import 'package:chimo/common/widgets/app_pull_refresh.dart';
import 'package:chimo/common/widgets/app_scaffold.dart';
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../app/app_jumper.dart';
import '../../../common/constants/app_assets.dart';
import '../../../common/models/server_client/rtc.pb.dart';
import '../../../common/theme/app_colors.dart';
import '../logic/home_logic.dart';
import 'widgets/room_item_card.dart';
import 'widgets/home_search_header.dart';
import '../../../common/widgets/section_title_view.dart';

/// 房间 Tab：横幅、热门故事、房间列表。
///
/// 取数和跳转在 [HomeLogic]。下拉刷新 / 上拉加载走 [AppPullRefresh]，失败不弹提示。
class RoomListPage extends GetView<HomeLogic> {
  const RoomListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      backdrop: AppImage.image(
        AppAssets.homeTopBg,
        fit: BoxFit.cover,
        alignment: Alignment.topCenter,
      ),
      appBar: _buildAppBar(),
      body: Obx(_buildRooms),
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

  Widget _buildRooms() {
    if (controller.roomsInitialLoading.value && controller.rooms.isEmpty) {
      return const Center(
        child: CircularProgressIndicator(color: AppColors.green1BBA77),
      );
    }
    final rooms = controller.rooms.toList();
    final stories = controller.hotStories.toList();
    final loadError = controller.roomsError.value;

    return AppPullRefresh(
      onRefresh: controller.onRefresh,
      onLoadMore: () => controller.loadRooms(loadMore: true),
      hasMore: controller.roomsHasMore,
      loadingMore: controller.roomsLoadingMore.value,
      showNoMoreFooter: false,
      slivers: [
        if (stories.isNotEmpty) SliverToBoxAdapter(child: _hotSpots(stories)),
        const SliverToBoxAdapter(
          child: SectionTitleView(title: "Today's Top Picks"),
        ),
        if (loadError != null && rooms.isEmpty)
          SliverFillRemaining(
            hasScrollBody: false,
            child: Center(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 32.w),
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
                    SizedBox(height: 16.w),
                    TextButton(
                      onPressed: () => unawaited(controller.loadRooms()),
                      child: const Text(
                        'Retry',
                        style: TextStyle(color: AppColors.green1BBA77),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
        else if (rooms.isEmpty)
          const SliverFillRemaining(
            hasScrollBody: false,
            child: Center(
              child: Text(
                'No rooms',
                style: TextStyle(color: AppColors.gray9A9A9A, fontSize: 14),
              ),
            ),
          )
        else
          SliverList.builder(
            itemCount: rooms.length,
            itemBuilder: (context, index) {
              final room = rooms[index];
              return RoomItemCard(
                room: room,
                onTap: () => AppJumper.toRoom(room.rid.toInt()),
              );
            },
          ),
      ],
    );
  }

  Widget _hotSpots(List<HotStoryInfo> stories) {
    return Column(
      children: [
        const SectionTitleView(title: 'Hot Spots'),
        SizedBox(
          height: 72.w,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            itemCount: stories.length,
            separatorBuilder: (context, index) => SizedBox(width: 8.w),
            itemBuilder: (context, index) {
              final info = stories[index];
              return Container(
                width: 142.w,
                padding: EdgeInsetsDirectional.only(
                  start: 12.w,
                  top: 10.w,
                  end: 12.w,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16.w),
                  image: Chimo.decorationImage(info.cover, fit: BoxFit.cover),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      info.name,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        color: AppColors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(height: 4.w),
                    Text(
                      '${info.joinCount} joined',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        color: AppColors.white,
                        fontSize: 11,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
