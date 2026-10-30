import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../common/constants/app_assets.dart';
import '../../../common/theme/app_colors.dart';
import '../../../common/utils/text_fmt.dart';
import '../../../common/utils/time_fmt.dart';
import '../../../common/widgets/app_pull_refresh.dart';
import '../../../common/widgets/app_scaffold.dart';
import '../../../common/models/server_client/user.pb.dart';
import 'package:chimo/common/utils/chimo.dart';
import '../logic/visits_logic.dart';
import 'package:chimo/common/widgets/app_image.dart';

/// Me → 访客：谁看过我的资料列表（`GET /user-relation/viewedBy`）。
///
/// [VisitsLogic] 由路由 binding 注入。
class VisitsPage extends GetView<VisitsLogic> {
  const VisitsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBar: AppNavBar(
        title: 'Visits',
        titleStyle: const TextStyle(
          color: AppColors.white,
          fontSize: 17,
          fontWeight: FontWeight.w700,
        ),
      ),
      body: Obx(_buildList),
    );
  }

  Widget _buildList() {
    final items = controller.items.toList();
    final loading = controller.loading.value;
    final error = controller.error.value;

    final Widget sliver;
    if (error != null && items.isEmpty) {
      sliver = SliverFillRemaining(
        hasScrollBody: false,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(24, 120, 24, 24),
          child: Column(
            children: [
              Text(
                error,
                textAlign: TextAlign.center,
                style: const TextStyle(color: AppColors.gray9A9A9A, fontSize: 14),
              ),
              const SizedBox(height: 12),
              TextButton(onPressed: () => unawaited(controller.load()), child: const Text('Retry')),
            ],
          ),
        ),
      );
    } else if (items.isEmpty && !loading) {
      sliver = const SliverFillRemaining(
        hasScrollBody: false,
        child: Padding(
          padding: EdgeInsets.only(top: 140),
          child: Text(
            'No visitors yet',
            textAlign: TextAlign.center,
            style: TextStyle(color: AppColors.gray9A9A9A, fontSize: 14),
          ),
        ),
      );
    } else {
      sliver = SliverPadding(
        padding: const EdgeInsets.only(top: 4, bottom: 24),
        sliver: SliverList.builder(
          itemCount: items.length,
          itemBuilder: (context, index) {
            final item = items[index];
            return _VisitTile(
              item: item,
              onTap: () => unawaited(controller.open(item)),
              onDelete: () => unawaited(controller.remove(item)),
            );
          },
        ),
      );
    }
    return AppPullRefresh(onRefresh: controller.load, slivers: [sliver]);
  }
}

class _VisitTile extends StatelessWidget {
  const _VisitTile({required this.item, required this.onTap, required this.onDelete});

  final ViewedByItem item;
  final VoidCallback onTap;
  final VoidCallback onDelete;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        child: SizedBox(
          height: 74,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 10, 20, 12),
            child: Row(
              children: [
                AppImage.avatar(item.avatar, fallbackAsset: AppAssets.avatarPlace, size: 50),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        item.nickname,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          Flexible(
                            child: Text(
                              '${TimeFmt.recentAgo(item.lastViewTimestamp.toInt())} visited you',
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                color: AppColors.gray9A9A9A,
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                          Container(
                            width: 0.5,
                            height: 10,
                            color: AppColors.grayD5D5D5,
                            margin: const EdgeInsets.symmetric(horizontal: 6),
                          ),
                          Text(
                            TextFmt.times(item.viewCnt),
                            style: const TextStyle(
                              color: AppColors.gray9A9A9A,
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                IconButton(
                  onPressed: onDelete,
                  padding: EdgeInsets.zero,
                  constraints: const BoxConstraints(minWidth: 36, minHeight: 36),
                  icon: Chimo.image(
                    AppAssets.msgDelete,
                    width: 20,
                    height: 20,
                    fit: BoxFit.contain,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
