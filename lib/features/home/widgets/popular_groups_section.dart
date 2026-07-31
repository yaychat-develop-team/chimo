import 'package:flutter/material.dart';

import '../models/group_item.dart';
import 'popular_group_card.dart';
import 'section_header.dart';

/// Popular Groups section: header + vertical card list.
class PopularGroupsSection extends StatelessWidget {
  const PopularGroupsSection({
    super.key,
    required this.groups,
    this.onJoinTap,
    this.onGroupTap,
    this.onMembersTap,
  });

  final List<PopularGroupItem> groups;

  /// Join button callback.
  final ValueChanged<PopularGroupItem>? onJoinTap;

  /// Whole card tap callback.
  final ValueChanged<PopularGroupItem>? onGroupTap;

  /// Member count tap callback.
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
          // Card spacing (skip after last item)
          if (i != groups.length - 1) const SizedBox(height: 12),
        ],
        const SizedBox(height: 16),
      ],
    );
  }
}
