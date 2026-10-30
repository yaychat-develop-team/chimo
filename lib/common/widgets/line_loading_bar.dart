import 'package:flutter/material.dart';

import '../theme/app_colors.dart';

/// 导航栏下方的顶部细进度条。
class LineLoadingBar extends StatelessWidget {
  const LineLoadingBar({super.key, this.visible = true});

  final bool visible;

  @override
  Widget build(BuildContext context) {
    if (!visible) return const SizedBox.shrink();
    return const LinearProgressIndicator(
      minHeight: 2,
      color: AppColors.green1BBA77,
      backgroundColor: Colors.transparent,
    );
  }
}
