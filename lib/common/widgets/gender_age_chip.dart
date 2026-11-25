import 'package:chimo/common/utils/chimo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constants/app_assets.dart';
import '../theme/app_colors.dart';

/// 性别 + 年龄小胶囊。男蓝女粉。
class GenderAgeChip extends StatelessWidget {
  const GenderAgeChip({super.key, required this.isMale, required this.age});

  final bool isMale;
  final int age;

  @override
  Widget build(BuildContext context) {
    return UnconstrainedBox(
      child: Container(
        height: 16.w,
        padding: EdgeInsets.symmetric(horizontal: 4.w),
        decoration: BoxDecoration(
          color: isMale ? AppColors.blue4F8BFF : AppColors.pinkFF5BA8,
          borderRadius: BorderRadius.circular(12),
        ),
        alignment: Alignment.center,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Chimo.image(
              isMale ? AppAssets.genderMan : AppAssets.genderWoman,
              width: 16.w,
              height: 16.w,
            ),
            // const SizedBox(width: 3),
            Text(
              '$age',
              style: TextStyle(color: Colors.white, fontSize: 11.sp, fontWeight: FontWeight.w700),
            ),
          ],
        ),
      ),
    );
  }
}
