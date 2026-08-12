import 'package:flutter/material.dart';

import '../../../core/theme/app_colors.dart';

/// 引导页右上角 Skip。
class OnboardingSkipButton extends StatelessWidget {
  const OnboardingSkipButton({
    super.key,
    required this.onPressed,
    this.enabled = true,
  });

  final VoidCallback? onPressed;
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: enabled ? onPressed : null,
      style: TextButton.styleFrom(
        foregroundColor: AppColors.textSecondary,
        textStyle: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w500,
        ),
      ),
      child: const Text('Skip'),
    );
  }
}
