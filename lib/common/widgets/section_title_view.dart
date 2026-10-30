import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../theme/app_colors.dart';

/// 区块标题：左侧标题，右侧可选操作（如更多）。
class SectionTitleView extends StatelessWidget {
  const SectionTitleView({super.key, required this.title, this.actionLabel, this.onActionTap});

  /// 区块标题。
  final String title;

  /// 右侧操作文案；为 null 时隐藏。
  final String? actionLabel;

  /// 右侧操作点击回调。
  final VoidCallback? onActionTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.w),
      child: Row(
        children: [
          Expanded(
            child: Text(
              title,
              style: const TextStyle(
                color: AppColors.white,
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
                      color: AppColors.gray9A9A9A,
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                      height: 15 / 13,
                    ),
                  ),
                  const SizedBox(width: 2),
                  const Icon(Icons.chevron_right_rounded, color: AppColors.gray9A9A9A, size: 14),
                ],
              ),
            ),
        ],
      ),
    );
  }
}
