import 'package:flutter/material.dart';

import '../theme/app_colors.dart';

/// 底部操作弹层一项（对齐群详情更多菜单：居中文案、可选警示色）。
class AppActionSheetItem {
  const AppActionSheetItem({
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

/// 统一底部操作弹层：顶圆角 28、贴底铺满、无独立 Cancel 块（点遮罩关闭）。
///
/// 视觉对齐群详情更多菜单 / 用户截图「图二」。
class AppActionBottomSheet extends StatelessWidget {
  const AppActionBottomSheet({super.key, required this.items});

  final List<AppActionSheetItem> items;

  static const Color _bg = Color(0xFF1C1C1E);
  static const double _topRadius = 28;
  static const double _tileHeight = 48;
  static const double _tileGap = 8;

  /// 展示操作弹层；在 [buildItems] 内用 [sheetContext] 执行 `Navigator.pop`。
  static Future<T?> show<T>({
    required BuildContext context,
    required List<AppActionSheetItem> Function(BuildContext sheetContext)
        buildItems,
  }) {
    return showModalBottomSheet<T>(
      context: context,
      backgroundColor: Colors.transparent,
      barrierColor: Colors.black.withValues(alpha: 0.55),
      builder: (sheetContext) => AppActionBottomSheet(
        items: buildItems(sheetContext),
      ),
    );
  }

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
          children: [
            for (var i = 0; i < items.length; i++) ...[
              if (i > 0) const SizedBox(height: _tileGap),
              _ActionTile(item: items[i]),
            ],
          ],
        ),
      ),
    );
  }
}

class _ActionTile extends StatelessWidget {
  const _ActionTile({required this.item});

  final AppActionSheetItem item;

  @override
  Widget build(BuildContext context) {
    final color = item.color ??
        (item.destructive ? AppColors.badge : AppColors.textPrimary);

    return InkWell(
      onTap: item.onTap,
      child: SizedBox(
        height: AppActionBottomSheet._tileHeight,
        width: double.infinity,
        child: Center(
          child: Text(
            item.label,
            style: TextStyle(
              color: color,
              fontSize: 17,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }
}
