import 'package:flutter/material.dart';

import '../theme/app_colors.dart';

/// Settings / help / privacy chevron row.
class AppSettingsTile extends StatelessWidget {
  const AppSettingsTile({
    super.key,
    required this.title,
    required this.onTap,
    this.showChevron = true,
  });

  final String title;
  final VoidCallback onTap;
  final bool showChevron;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: Row(
          children: [
            Expanded(
              child: Text(
                title,
                style: const TextStyle(
                  color: AppColors.textPrimary,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            if (showChevron)
              const Icon(
                Icons.chevron_right_rounded,
                color: AppColors.textSecondary,
                size: 22,
              ),
          ],
        ),
      ),
    );
  }
}
