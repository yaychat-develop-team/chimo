import 'package:flutter/material.dart';

import 'app_colors.dart';

/// 重复出现的四档文字。行高或字距用 `copyWith` 补。
abstract final class AppText {
  /// 区块标题、人名。
  static const title = TextStyle(color: AppColors.white, fontSize: 16, fontWeight: FontWeight.w700);

  /// 次要正文。
  static const body = TextStyle(
    color: AppColors.gray9A9A9A,
    fontSize: 14,
    fontWeight: FontWeight.w400,
  );

  /// 表单标签、列表项标题。
  static const label = TextStyle(color: AppColors.white, fontSize: 14, fontWeight: FontWeight.w500);

  /// 输入框里的文字。
  static const field = TextStyle(color: AppColors.white, fontSize: 16, fontWeight: FontWeight.w500);
}
