import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../constants/app_assets.dart';
import '../theme/app_colors.dart';

enum AppNavBackIcon { chatBack, backArrow }

/// 标准二级页导航：高度 48，返回 + 居中标题 + 可选尾部。
class AppNavBar extends StatelessWidget {
  const AppNavBar({
    super.key,
    required this.title,
    this.onBack,
    this.trailing,
    this.backIcon = AppNavBackIcon.chatBack,
    this.titleStyle,
  });

  final String title;
  final VoidCallback? onBack;
  final Widget? trailing;
  final AppNavBackIcon backIcon;
  final TextStyle? titleStyle;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: IconButton(
              onPressed: onBack ?? () => Navigator.of(context).maybePop(),
              icon: _BackIcon(kind: backIcon),
            ),
          ),
          Text(
            title,
            style: titleStyle ??
                const TextStyle(
                  color: AppColors.textPrimary,
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                ),
          ),
          if (trailing != null)
            Align(
              alignment: Alignment.centerRight,
              child: trailing!,
            ),
        ],
      ),
    );
  }
}

class _BackIcon extends StatelessWidget {
  const _BackIcon({required this.kind});

  final AppNavBackIcon kind;

  @override
  Widget build(BuildContext context) {
    switch (kind) {
      case AppNavBackIcon.chatBack:
        return SvgPicture.asset(
          AppAssets.chatBack,
          width: 17,
          height: 7,
        );
      case AppNavBackIcon.backArrow:
        return SvgPicture.asset(
          AppAssets.backArrow,
          width: 7,
          height: 12,
          colorFilter: const ColorFilter.mode(
            Colors.white,
            BlendMode.srcIn,
          ),
        );
    }
  }
}
