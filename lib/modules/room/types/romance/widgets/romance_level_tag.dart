import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../common/constants/app_assets.dart';

/// 会话列表情侣等级标。对齐 joyride `RomanceLevelTag`。
class RomanceLevelTag extends StatelessWidget {
  const RomanceLevelTag(this.level, {super.key});

  final int level;

  @override
  Widget build(BuildContext context) {
    if (level < 1 || level > 9) return const SizedBox.shrink();
    return Padding(
      padding: EdgeInsetsDirectional.only(start: 4.w),
      child: Image.asset(AppAssets.romanceLevel(level), height: 16.w, fit: BoxFit.contain),
    );
  }
}
