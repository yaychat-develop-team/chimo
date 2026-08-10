import 'package:flutter/material.dart';

import '../../../core/theme/app_colors.dart';
import '../models/me_models.dart';

/// 快捷入口：标题 + 四列网格，42×42 图标。
class MeQuickAccessSection extends StatelessWidget {
  const MeQuickAccessSection({
    super.key,
    required this.items,
    this.onItemTap,
  });

  final List<QuickAccessItem> items;
  final ValueChanged<QuickAccessItem>? onItemTap;

  static const double iconSize = 42;

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
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: items.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
            mainAxisSpacing: 16,
            crossAxisSpacing: 8,
            // 42 icon + spacing + 18 label
            childAspectRatio: 0.85,
          ),
          itemBuilder: (context, index) {
            final item = items[index];
            return _QuickAccessTile(
              item: item,
              onTap: onItemTap == null ? null : () => onItemTap!(item),
            );
          },
        ),
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
