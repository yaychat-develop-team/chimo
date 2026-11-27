import 'package:flutter/material.dart';

import '../theme/app_colors.dart';
import '../utils/chimo.dart';

/// 列表空态 / 错误态占位。
///
/// - 普通用法：直接当 child（或包在 [Center] / [Expanded] 里）
/// - 下拉列表：用 [asSliver] 填满可滚动视口，方便继续下拉刷新
/// - [icon] 可选：部分页要空数据图，部分页只要文案
class AppEmptyHolder extends StatelessWidget {
  const AppEmptyHolder({
    super.key,
    required this.message,
    this.icon,
    this.iconWidth = 180,
    this.onRetry,
    this.retryLabel = 'Retry',
    this.padding = const EdgeInsets.symmetric(horizontal: 32),
    this.messageStyle = const TextStyle(color: AppColors.gray9A9A9A, fontSize: 14),
  });

  /// 错误态：文案 + Retry。
  const AppEmptyHolder.error({
    super.key,
    required this.message,
    required VoidCallback this.onRetry,
    this.icon,
    this.iconWidth = 180,
    this.retryLabel = 'Retry',
    this.padding = const EdgeInsets.symmetric(horizontal: 32),
    this.messageStyle = const TextStyle(color: AppColors.gray9A9A9A, fontSize: 14),
  });

  /// 空数据态：文案，可选占位图。
  const AppEmptyHolder.empty({
    super.key,
    required this.message,
    this.icon,
    this.iconWidth = 180,
    this.padding = const EdgeInsets.symmetric(horizontal: 32),
    this.messageStyle = const TextStyle(color: AppColors.gray9A9A9A, fontSize: 14),
  }) : onRetry = null,
       retryLabel = 'Retry';

  final String message;
  final String? icon;
  final double iconWidth;
  final VoidCallback? onRetry;
  final String retryLabel;
  final EdgeInsetsGeometry padding;
  final TextStyle messageStyle;

  /// 供 [AppPullRefresh] / CustomScrollView 使用。
  Widget get asSliver => SliverFillRemaining(hasScrollBody: false, child: this);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: padding,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (icon != null) ...[
              Chimo.image(icon!, width: iconWidth, fit: BoxFit.contain),
              const SizedBox(height: 16),
            ],
            Text(message, textAlign: TextAlign.center, style: messageStyle),
            if (onRetry != null) ...[
              const SizedBox(height: 12),
              TextButton(onPressed: onRetry, child: Text(retryLabel)),
            ],
          ],
        ),
      ),
    );
  }
}
