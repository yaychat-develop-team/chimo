import 'package:flutter/material.dart';

import '../models/group_item.dart';
import 'my_group_card.dart';
import 'section_header.dart';

/// 我的群组区块：标题 + 横向滚动卡片。
class MyGroupsSection extends StatelessWidget {
  const MyGroupsSection({
    super.key,
    required this.groups,
    this.onMoreTap,
    this.onGroupTap,
  });

  final List<MyGroupItem> groups;

  /// 「更多」操作点击。
  final VoidCallback? onMoreTap;

  /// 单个群组卡片点击。
  final ValueChanged<MyGroupItem>? onGroupTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SectionHeader(
          title: 'My Groups',
          actionLabel: 'More',
          onActionTap: onMoreTap,
        ),
        SizedBox(
          height: MyGroupCard.totalHeight,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            itemCount: groups.length,
            separatorBuilder: (_, _) => const SizedBox(width: 10),
            itemBuilder: (context, index) {
              final group = groups[index];
              return MyGroupCard(
                group: group,
                onTap: onGroupTap == null ? null : () => onGroupTap!(group),
              );
            },
          ),
        ),
      ],
    );
  }
}
