import 'package:flutter/material.dart';

import '../../../core/theme/app_colors.dart';

/// 区块标题：左侧标题，右侧可选操作（如更多）。
class SectionHeader extends StatelessWidget {
  const SectionHeader({
    super.key,
    required this.title,
    this.actionLabel,
    this.onActionTap,
  });

  /// 区块标题。
  final String title;

  /// 右侧操作文案；为 null 时隐藏。
  final String? actionLabel;

  /// 右侧操作点击回调。
  final VoidCallback? onActionTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      // Top 0：与 forya 一致，间距由 Banner bottom 24 / 上一区块 bottom 承担。
      padding: const EdgeInsets.fromLTRB(16, 0, 16, 12),
      child: Row(
        children: [
          Expanded(
            child: Text(
              title,
              style: const TextStyle(
                color: AppColors.textPrimary,
                fontSize: 20,
                fontWeight: FontWeight.w700,
                height: 27 / 20,
              ),
            ),
          ),
          if (actionLabel != null)
            GestureDetector(
              onTap: onActionTap,
              behavior: HitTestBehavior.opaque,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    actionLabel!,
                    style: const TextStyle(
                      color: AppColors.textSecondary,
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                      height: 15 / 13,
                    ),
                  ),
                  const SizedBox(width: 2),
                  const Icon(
                    Icons.chevron_right_rounded,
                    color: AppColors.textSecondary,
                    size: 14,
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}
