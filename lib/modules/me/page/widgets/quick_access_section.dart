import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../common/theme/app_colors.dart';
import '../../model/me_menu_data.dart';
import 'package:chimo/common/utils/chimo.dart';

/// Featured Games：四列，切图铺底，文案贴在底部。
class QuickAccessSection extends StatelessWidget {
  const QuickAccessSection({super.key, required this.items, this.onItemTap});

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
            return _FeaturedGridItem(
              item: item,
              onTap: onItemTap == null ? null : () => onItemTap!(item),
            );
          },
        ),
      ],
    );
  }
}

class _FeaturedGridItem extends StatelessWidget {
  const _FeaturedGridItem({required this.item, this.onTap});

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
