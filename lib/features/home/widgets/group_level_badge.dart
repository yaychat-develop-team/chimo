import 'package:flutter/material.dart';

import '../../../core/constants/app_assets.dart';

/// Group noble level badge (assets `group_level_1`…`group_level_6`).
class GroupLevelBadge extends StatelessWidget {
  const GroupLevelBadge({super.key, required this.level});

  /// Level number (clamped to 1–6 asset bounds).
  final int level;

  /// Design height; width scales with asset aspect ratio.
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
