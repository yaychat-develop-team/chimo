import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../common/constants/app_assets.dart';
import '../../../common/theme/app_colors.dart';
import '../../../common/utils/chimo.dart';

/// 装扮星级：`4-Star` + [AppAssets.dressStar] × level（星星部分重叠，对齐设计图）。
class DressStars extends StatelessWidget {
  const DressStars({
    super.key,
    required this.level,
    this.fontSize,
    this.starSize,
    this.dense = false,
  });

  final int level;
  final double? fontSize;
  final double? starSize;
  final bool dense;

  @override
  Widget build(BuildContext context) {
    if (level <= 0) return const SizedBox.shrink();
    final n = level.clamp(1, 5);
    final fs = fontSize ?? (dense ? 10.sp : 12.sp);
    final ss = starSize ?? (dense ? 10.w : 12.w);
    // 设计图约 18% 重叠。
    final step = ss * 0.82;
    final starsWidth = ss + (n - 1) * step;
    return SizedBox(
      height: 12.w,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            '$n-Star',
            style: TextStyle(
              color: AppColors.yellowFCDA42,
              fontSize: fs,
              fontWeight: FontWeight.w600,
              height: 1,
            ),
          ),
          SizedBox(width: dense ? 2.w : 3.w),
          SizedBox(
            width: starsWidth,
            height: ss,
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                for (var i = 0; i < n; i++)
                  Positioned(
                    left: i * step,
                    child: Chimo.image(AppAssets.dressStar, width: ss, height: ss),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
