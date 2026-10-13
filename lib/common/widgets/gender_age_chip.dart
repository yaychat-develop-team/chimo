import 'package:flutter/material.dart';

import '../constants/app_assets.dart';
import '../theme/app_colors.dart';
import 'app_image.dart';

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
        color: isMale ? AppColors.infoBlue : AppColors.genderFemale,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          AppImage(
            isMale ? AppAssets.genderMan : AppAssets.genderWoman,
            width: 11,
            height: 11,
          ),
          const SizedBox(width: 3),
          Text(
            '$age',
            style: const TextStyle(
              color: Colors.white,
              fontSize: 12,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }
}
