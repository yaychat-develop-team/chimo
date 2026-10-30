import 'package:chimo/common/utils/chimo.dart';
import 'package:flutter/material.dart';

import '../constants/app_assets.dart';
import '../theme/app_colors.dart';

/// 性别 + 年龄小胶囊。男蓝女粉。
class GenderAgeChip extends StatelessWidget {
  const GenderAgeChip({super.key, required this.isMale, required this.age});

  final bool isMale;
  final int age;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
      decoration: BoxDecoration(
        color: isMale ? AppColors.blue4F8BFF : AppColors.pinkFF5BA8,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Chimo.image(isMale ? AppAssets.genderMan : AppAssets.genderWoman, width: 11, height: 11),
          const SizedBox(width: 3),
          Text(
            '$age',
            style: const TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.w700),
          ),
        ],
      ),
    );
  }
}
