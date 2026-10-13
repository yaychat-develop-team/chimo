import 'package:flutter/material.dart';

import '../../../../common/models/server_client/group/group.pb.dart';
import '../../../../common/widgets/popular_group_card.dart';
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

  final List<GroupInfo> groups;

  /// Join 按钮回调。
  final ValueChanged<GroupInfo>? onJoinTap;

  /// 整卡点击回调。
  final ValueChanged<GroupInfo>? onGroupTap;

  /// 成员数点击回调。
  final ValueChanged<GroupInfo>? onMembersTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const SectionHeader(title: 'Popular Groups'),
        Column(
          spacing: 12,
          children: groups
              .map(
                (group) => PopularGroupCard(
                  group: group,
                  onJoinTap: onJoinTap == null ? null : () => onJoinTap!(group),
                  onTap: onGroupTap == null ? null : () => onGroupTap!(group),
                  onMembersTap: onMembersTap == null
                      ? null
                      : () => onMembersTap!(group),
                ),
              )
              .toList(),
        ),
        const SizedBox(height: 16),
      ],
    );
  }
}
