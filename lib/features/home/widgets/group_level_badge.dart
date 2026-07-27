import 'package:flutter/material.dart';

import '../../../core/constants/app_assets.dart';

/// 小组贵族等级标识（设计资源 `group_level_1`…`group_level_6`）。
class GroupLevelBadge extends StatelessWidget {
  const GroupLevelBadge({super.key, required this.level});

  /// 等级数字（超出 1–6 时按边界资源展示）。
  final int level;

  /// 设计稿高度；宽度随资源比例自适应。
  static const double badgeHeight = 16;

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      AppAssets.groupLevel(level),
      height: badgeHeight,
      fit: BoxFit.contain,
      filterQuality: FilterQuality.high,
    );
  }
}
