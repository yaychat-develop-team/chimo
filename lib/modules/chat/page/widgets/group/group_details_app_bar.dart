import 'package:flutter/material.dart';

import '../../../../../common/constants/app_assets.dart';
import '../../../../../common/widgets/app_back_button.dart';
import '../../../../../common/theme/app_colors.dart';
import '../../../../../common/widgets/app_image.dart';
import '../../../../../common/models/server_client/group/group.pb.dart';
import '../../../../../common/widgets/group_level_badge.dart';
import 'group_desc_toggle_chip.dart';

/// 群聊导航栏：返回 / 群名 / 等级 / 简介芯片 / 更多。
///
/// 简介展开时只剩返回与更多两个按钮 —— 群名与等级由下面那块
/// [GroupProfileHeader] 接管（forya 的 `_groupInfoWidget` 就是这么切的）。
class GroupDetailsAppBar extends StatelessWidget {
  const GroupDetailsAppBar({
    super.key,
    required this.group,
    required this.isJoined,
    required this.descExpanded,
    required this.onMoreTap,
    required this.onToggleDesc,
  });

  final GroupInfo group;
  final bool isJoined;
  final bool descExpanded;
  final VoidCallback onMoreTap;
  final VoidCallback onToggleDesc;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48,
      child: Row(
        children: [
          const AppBackButton(),
          if (!descExpanded) ...[
            Flexible(
              child: Text(
                group.name,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  color: AppColors.textPrimary,
                  fontSize: 17,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            const SizedBox(width: 6),
            GroupLevelBadge(level: group.level),
            const SizedBox(width: 8),
            GroupDescToggleChip(expanded: false, joinedStyle: isJoined, onTap: onToggleDesc),
          ],
          const Spacer(),
          IconButton(
            onPressed: onMoreTap,
            icon: AppImage(AppAssets.msgMore, width: 22, height: 22, color: AppColors.textPrimary),
          ),
        ],
      ),
    );
  }
}
