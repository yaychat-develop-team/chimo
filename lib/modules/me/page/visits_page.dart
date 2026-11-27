import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../common/constants/app_assets.dart';
import '../../../common/models/server_client/user.pb.dart';
import '../../../common/theme/app_colors.dart';
import '../../../common/utils/chimo.dart';
import '../../../common/utils/time_fmt.dart';
import '../../../common/widgets/app_image.dart';
import '../../../common/widgets/app_empty_holder.dart';
import '../../../common/widgets/app_pull_refresh.dart';
import '../../../common/widgets/app_scaffold.dart';
import '../logic/visits_logic.dart';

/// Me → 访客：谁看过我的资料列表（`GET /user-relation/viewedBy`）。
///
/// UI 对齐设计稿：圆角卡片 + 绿色删除；[VisitsLogic] 由路由 binding 注入。
class VisitsPage extends GetView<VisitsLogic> {
  const VisitsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      backgroundColor: AppColors.black0F0F0F,
      appBar: const AppNavBar(
        title: 'Visitors',
        titleStyle: TextStyle(color: AppColors.white, fontSize: 17, fontWeight: FontWeight.w700),
      ),
      body: Obx(_buildList),
    );
  }

  Widget _buildList() {
    final items = controller.items.toList();
    final loading = controller.loading.value;
    final error = controller.error.value;

    return AppPullRefresh(
      onRefresh: controller.load,
      accentColor: AppColors.green1CFF8A,
      slivers: [
        if (error != null && items.isEmpty)
          AppEmptyHolder.error(message: error, onRetry: () => controller.load()).asSliver
        else if (items.isEmpty && !loading)
          const AppEmptyHolder.empty(
            message: 'No visitors yet',
            icon: AppAssets.friendsEmpty,
          ).asSliver
        else
          SliverPadding(
            padding: EdgeInsets.fromLTRB(16.w, 8.w, 16.w, 24.w),
            sliver: SliverList.separated(
              itemCount: items.length,
              separatorBuilder: (_, _) => SizedBox(height: 10.w),
              itemBuilder: (context, index) {
                final item = items[index];
                return _VisitorItem(
                  item: item,
                  onTap: () => controller.open(item),
                  onDelete: () => controller.remove(item),
                );
              },
            ),
          ),
      ],
    );
  }
}

class _VisitorItem extends StatelessWidget {
  const _VisitorItem({required this.item, required this.onTap, required this.onDelete});

  final ViewedByItem item;
  final VoidCallback onTap;
  final VoidCallback onDelete;

  String get _timesLabel {
    final n = item.viewCnt <= 0 ? 1 : item.viewCnt;
    return n == 1 ? 'The 1 time' : 'The $n time';
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.w),
        decoration: BoxDecoration(
          color: AppColors.rgba(255, 255, 255, 0.04),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            AppImage.avatar(item.avatar, fallbackAsset: AppAssets.avatarPlace, size: 48.w),
            SizedBox(width: 12.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.nickname.isEmpty ? 'User' : item.nickname,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      color: AppColors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: 6.w),
                  Text(
                    '${TimeFmt.recentAgo(item.lastViewTimestamp.toInt())} visited you  |  $_timesLabel',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      color: AppColors.white60,
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(width: 8.w),
            GestureDetector(
              onTap: onDelete,
              behavior: HitTestBehavior.opaque,
              child: Chimo.image(
                AppAssets.msgDelete,
                width: 36.w,
                height: 36.w,
                color: AppColors.green1CFF8A,
                fit: BoxFit.contain,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
