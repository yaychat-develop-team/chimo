import 'package:flutter/material.dart';

import '../models/group_item.dart';
import 'popular_group_card.dart';
import 'section_header.dart';

/// Popular Groups 区块：标题 + 纵向卡片列表。
class PopularGroupsSection extends StatelessWidget {
  const PopularGroupsSection({
    super.key,
    required this.groups,
    this.onJoinTap,
    this.onGroupTap,
    this.onMembersTap,
  });

  final List<PopularGroupItem> groups;

  /// Join 按钮回调。
  final ValueChanged<PopularGroupItem>? onJoinTap;

  /// 整卡点击回调。
  final ValueChanged<PopularGroupItem>? onGroupTap;

  /// 成员数点击回调。
  final ValueChanged<PopularGroupItem>? onMembersTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const SectionHeader(title: 'Popular Groups'),
        for (var i = 0; i < groups.length; i++) ...[
          PopularGroupCard(
            group: groups[i],
            onJoinTap:
                onJoinTap == null ? null : () => onJoinTap!(groups[i]),
            onTap: onGroupTap == null ? null : () => onGroupTap!(groups[i]),
            onMembersTap: onMembersTap == null
                ? null
                : () => onMembersTap!(groups[i]),
          ),
          // 卡片间距（最后一项后跳过）
          if (i != groups.length - 1) const SizedBox(height: 12),
        ],
        const SizedBox(height: 16),
      ],
    );
  }
}
