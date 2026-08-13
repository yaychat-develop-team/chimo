import 'package:flutter/material.dart';

import '../../../core/theme/app_colors.dart';
import '../models/me_models.dart';

/// 快捷入口：标题 + 四列网格，42×42 图标。
///
/// 不用 shrinkWrap [GridView]，避免嵌在 Me 页 [ListView] 里时
/// 「内容未撑满视口就拖不动」的手势问题。
class MeQuickAccessSection extends StatelessWidget {
  const MeQuickAccessSection({
    super.key,
    required this.items,
    this.onItemTap,
  });

  final List<QuickAccessItem> items;
  final ValueChanged<QuickAccessItem>? onItemTap;

  static const double iconSize = 42;
  static const int crossAxisCount = 4;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 21,
          child: Text(
            'Quick Access',
            style: TextStyle(
              color: AppColors.textPrimary,
              fontSize: 17,
              fontWeight: FontWeight.w700,
              height: 1.2,
            ),
          ),
        ),
        const SizedBox(height: 16),
        for (var rowStart = 0;
            rowStart < items.length;
            rowStart += crossAxisCount) ...[
          if (rowStart > 0) const SizedBox(height: 16),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              for (var col = 0; col < crossAxisCount; col++)
                Expanded(
                  child: rowStart + col < items.length
                      ? _QuickAccessTile(
                          item: items[rowStart + col],
                          onTap: onItemTap == null
                              ? null
                              : () => onItemTap!(items[rowStart + col]),
                        )
                      : const SizedBox.shrink(),
                ),
            ],
          ),
        ],
      ],
    );
  }
}

class _QuickAccessTile extends StatelessWidget {
  const _QuickAccessTile({required this.item, this.onTap});

  final QuickAccessItem item;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            item.iconAsset,
            width: MeQuickAccessSection.iconSize,
            height: MeQuickAccessSection.iconSize,
            fit: BoxFit.contain,
          ),
          const SizedBox(height: 6),
          SizedBox(
            height: 18,
            child: Text(
              item.label,
              textAlign: TextAlign.center,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                color: AppColors.textSecondary,
                fontSize: 11,
                fontWeight: FontWeight.w400,
                height: 1.2,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
