import 'package:flutter/material.dart';

import '../../../../../common/constants/app_assets.dart';
import '../../../../../common/theme/app_colors.dart';
import '../../../../../common/models/server_client/group/group.pb.dart';
import '../../../../../common/widgets/group_level_badge.dart';
import 'group_desc_toggle_chip.dart';
import 'package:chimo/common/utils/chimo.dart';

/// 群资料头部：头像 / 群名 / 分类 / 成员数 / 帖子数 + 三行简介。
class GroupProfileHeader extends StatelessWidget {
  const GroupProfileHeader({
    super.key,
    required this.group,
    required this.isJoined,
    required this.onCollapse,
    required this.onMembersTap,
  });

  final GroupInfo group;
  final bool isJoined;
  final VoidCallback onCollapse;
  final VoidCallback onMembersTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 4, 16, 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Chimo.image(
                  group.avatar,
                  fallbackAsset: AppAssets.avatarPlace,
                  width: 72,
                  height: 72,
                  fit: BoxFit.cover,
                  fadeIn: Duration.zero,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Flexible(
                          child: Text(
                            group.name,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              color: AppColors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                        ),
                        const SizedBox(width: 6),
                        GroupLevelBadge(level: group.level),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                      decoration: BoxDecoration(
                        color: AppColors.black2A2A2A,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        group.type,
                        style: const TextStyle(
                          color: AppColors.gray9A9A9A,
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        GestureDetector(
                          onTap: onMembersTap,
                          behavior: HitTestBehavior.opaque,
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Chimo.image(AppAssets.homePerson, width: 11, height: 11),
                              const SizedBox(width: 3),
                              Text(
                                '${group.memberCount.toInt()}',
                                style: const TextStyle(color: AppColors.gray6E6E6E, fontSize: 11),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 12),
                        Chimo.image(AppAssets.homeImg, width: 11, height: 11),
                        const SizedBox(width: 3),
                        Text(
                          '${group.picCount.toInt()}',
                          style: const TextStyle(color: AppColors.gray6E6E6E, fontSize: 11),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          // forya chat_group_page：简介始终 maxLines: 3；芯片折叠整个头部。
          Text(
            group.desc,
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(color: AppColors.gray9A9A9A, fontSize: 12, height: 1.4),
          ),
          const SizedBox(height: 12),
          Center(
            child: GroupDescToggleChip(expanded: true, joinedStyle: isJoined, onTap: onCollapse),
          ),
        ],
      ),
    );
  }
}
