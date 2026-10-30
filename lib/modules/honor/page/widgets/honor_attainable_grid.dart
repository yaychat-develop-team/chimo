import 'package:chimo/common/utils/chimo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../common/models/server_client/honor.pb.dart';
import '../../../../common/theme/app_colors.dart';
import '../../../../common/widgets/app_pull_refresh.dart';
import '../../logic/honor_display.dart';

/// Attainable：两列任务卡 + 进度条（对齐设计稿）。
class HonorAttainableGrid extends StatelessWidget {
  const HonorAttainableGrid({super.key, required this.items, required this.onRefresh, this.onTap});

  final List<HonorItem> items;
  final Future<void> Function() onRefresh;
  final ValueChanged<HonorItem>? onTap;

  @override
  Widget build(BuildContext context) {
    return AppPullRefresh.grid(
      onRefresh: onRefresh,
      accentColor: AppColors.green00FEA8,
      padding: EdgeInsets.fromLTRB(16.w, 12.w, 16.w, 28.w),
      itemCount: items.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 10.w,
        crossAxisSpacing: 10.w,
        childAspectRatio: 166 / 214,
      ),
      itemBuilder: (context, index) {
        final item = items[index];
        return AttainableCardItem(item: item, onTap: () => onTap?.call(item));
      },
    );
  }
}

class AttainableCardItem extends StatelessWidget {
  const AttainableCardItem({super.key, required this.item, this.onTap});

  final HonorItem item;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final image = item.image.trim().isNotEmpty ? item.image : item.icon;
    final progress = HonorDisplay.progress(item);

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.black1C1C1E,
          borderRadius: BorderRadius.circular(16),
        ),
        padding: const EdgeInsets.fromLTRB(12, 14, 12, 12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Hero(
              tag: HonorDisplay.heroTag(item, fromTarget: true),
              child: Material(
                type: MaterialType.transparency,
                child: Chimo.image(
                  image,
                  width: 84,
                  height: 84,
                  fit: BoxFit.cover,
                  fadeIn: Duration.zero,
                  gaplessPlayback: true,
                ),
              ),
            ),
            Chimo.gap(height: 8),
            Text(
              item.name,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: AppColors.white,
                fontSize: 14.sp,
                fontWeight: FontWeight.w700,
                height: 1.2,
              ),
            ),
            Chimo.gap(height: 6),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
              decoration: BoxDecoration(
                color: AppColors.white8,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                HonorDisplay.rewardTag(item),
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: AppColors.gray9A9A9A,
                  fontSize: 10,
                  fontWeight: FontWeight.w500,
                  height: 1.2,
                ),
              ),
            ),
            Chimo.gap(height: 2),
            Expanded(
              child: Text(
                item.content,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: AppColors.gray9A9A9A,
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w400,
                  height: 1.35,
                ),
              ),
            ),
            Row(
              children: [
                Text(
                  HonorDisplay.progressText(item),
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: AppColors.gray9A9A9A,
                    fontSize: 11,
                    fontWeight: FontWeight.w500,
                    height: 1.2,
                  ),
                ),
                SizedBox(width: 4),
                Expanded(child: _ProgressBar(value: progress)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _ProgressBar extends StatelessWidget {
  const _ProgressBar({required this.value});

  final double value;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final w = constraints.maxWidth * value.clamp(0.0, 1.0);
        return Container(
          height: 4,
          width: double.infinity,
          decoration: BoxDecoration(
            color: AppColors.white12,
            borderRadius: BorderRadius.circular(4),
          ),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Container(
              width: w,
              height: 4,
              decoration: BoxDecoration(
                color: AppColors.green00FEA8,
                borderRadius: BorderRadius.circular(4),
                boxShadow: [
                  BoxShadow(color: AppColors.green00FEA8.withValues(alpha: 0.35), blurRadius: 4),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
