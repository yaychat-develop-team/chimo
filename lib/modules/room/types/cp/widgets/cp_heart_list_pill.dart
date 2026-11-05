import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../common/constants/app_assets.dart';
import '../../../../../common/theme/app_colors.dart';
import '../../../../../common/utils/chimo.dart';
import 'cp_rank_sheet.dart';

/// 顶栏 Heart Rank 入口胶囊。
class CpHeartListPill extends StatelessWidget {
  const CpHeartListPill({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => CpRankSheet.show(),
      child: Container(
        height: 22.w,
        padding: const EdgeInsets.symmetric(horizontal: 8),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: AppColors.black30,
          borderRadius: BorderRadius.circular(11),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Chimo.image(AppAssets.cpRankIcon, width: 10, height: 10),
            SizedBox(width: 3.w),
            Text(
              'Heart Rank',
              style: TextStyle(color: AppColors.white, fontSize: 10.sp, height: 1),
            ),
          ],
        ),
      ),
    );
  }
}
