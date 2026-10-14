import 'package:flutter/material.dart';

import '../../../../common/theme/app_colors.dart';

/// 首页内容切换：群组，以及服务端下发的房间 Tab。
class HomeFeedTabs extends StatelessWidget {
  const HomeFeedTabs({
    super.key,
    required this.labels,
    required this.index,
    required this.onSelected,
  });

  final List<String> labels;
  final int index;
  final ValueChanged<int> onSelected;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 44,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        itemCount: labels.length,
        separatorBuilder: (context, index) => const SizedBox(width: 20),
        itemBuilder: (context, i) {
          final selected = i == index;
          return GestureDetector(
            onTap: () => onSelected(i),
            behavior: HitTestBehavior.opaque,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  labels[i],
                  style: TextStyle(
                    color: selected ? AppColors.textPrimary : AppColors.textSecondary,
                    fontSize: 16,
                    fontWeight: selected ? FontWeight.w700 : FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 8),
                Container(
                  height: 2,
                  width: 24,
                  color: selected ? AppColors.primaryBright : Colors.transparent,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
