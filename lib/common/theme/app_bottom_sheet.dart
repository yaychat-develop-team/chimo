import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'app_colors.dart';

/// 底部弹层一项：居中文案，可选警示色。
class AppSheetAction {
  const AppSheetAction({
    required this.label,
    required this.onTap,
    this.destructive = false,
    this.color,
  });

  final String label;
  final VoidCallback onTap;

  /// 为 true 时使用 [AppColors.badge]（如 Report）。
  final bool destructive;

  /// 覆盖文字颜色；优先于 [destructive]。
  final Color? color;
}

/// 全局底部弹层。自定义内容用 [show]，操作菜单用 [actions]。
abstract final class AppBottomSheet {
  /// 底部弹层。被关掉时返回 `null`。
  static Future<T?> show<T>({
    required Widget child,
    Color backgroundColor = Colors.transparent,
    Color barrierColor = const Color(0x8C000000),
    bool isScrollControlled = false,
    bool enableDrag = true,
    ShapeBorder? shape,
  }) async {
    return await Get.bottomSheet<T>(
      child,
      backgroundColor: backgroundColor,
      barrierColor: barrierColor,
      isScrollControlled: isScrollControlled,
      enableDrag: enableDrag,
      shape: shape,
    );
  }

  /// 操作菜单：顶圆角 28、贴底铺满，点遮罩关闭。
  static Future<T?> actions<T>({required List<AppSheetAction> Function() buildItems}) {
    return show<T>(child: _ActionSheet(items: buildItems()));
  }
}

class _ActionSheet extends StatelessWidget {
  const _ActionSheet({required this.items});

  final List<AppSheetAction> items;

  static const Color _bg = AppColors.surfaceSheet;
  static const double _topRadius = 28;
  static const double _tileHeight = 48;
  static const double _tileGap = 8;

  @override
  Widget build(BuildContext context) {
    final bottom = MediaQuery.paddingOf(context).bottom;

    return DecoratedBox(
      decoration: const BoxDecoration(
        color: _bg,
        borderRadius: BorderRadius.vertical(top: Radius.circular(_topRadius)),
      ),
      child: Padding(
        padding: EdgeInsets.only(top: 28, bottom: 28 + bottom),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          spacing: _tileGap,
          children: items.map((item) => _ActionTile(item: item)).toList(),
        ),
      ),
    );
  }
}

class _ActionTile extends StatelessWidget {
  const _ActionTile({required this.item});

  final AppSheetAction item;

  @override
  Widget build(BuildContext context) {
    final color = item.color ?? (item.destructive ? AppColors.badge : AppColors.textPrimary);

    return InkWell(
      onTap: item.onTap,
      child: SizedBox(
        height: _ActionSheet._tileHeight,
        width: double.infinity,
        child: Center(
          child: Text(
            item.label,
            style: TextStyle(color: color, fontSize: 17, fontWeight: FontWeight.w500),
          ),
        ),
      ),
    );
  }
}
