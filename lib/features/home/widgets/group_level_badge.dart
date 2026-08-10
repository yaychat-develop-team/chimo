import 'package:flutter/material.dart';

import '../../../core/constants/app_assets.dart';

/// 群组贵族等级徽章（资源 `group_level_1`…`group_level_6`）。
class GroupLevelBadge extends StatelessWidget {
  const GroupLevelBadge({super.key, required this.level});

  /// 等级数字（限制在 1–6 资源范围内）。
  final int level;

  /// 设计高度；宽度随资源宽高比缩放。
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
