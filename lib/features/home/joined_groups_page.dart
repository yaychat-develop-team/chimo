import 'package:flutter/material.dart';

import '../../core/widgets/app_nav_bar.dart';
import '../../core/widgets/app_page_scaffold.dart';
import '../chats/data/chats_list_controller.dart';
import 'chat_user_profile_page.dart';
import 'group_details_page.dart';
import 'models/chat_user_profile.dart';
import 'models/group_item.dart';
import 'widgets/group_members_sheet.dart';
import 'widgets/popular_group_card.dart';

/// 已加入群组列表（首页我的群组 → 更多）。
///
/// 卡片布局与热门群组相同，但不含加入 / 退出控件。
class JoinedGroupsPage extends StatelessWidget {
  const JoinedGroupsPage({
    super.key,
    required this.groups,
    this.chatsController,
    this.onMembershipChanged,
  });

  final List<PopularGroupItem> groups;
  final ChatsListController? chatsController;
  final void Function(PopularGroupItem group, bool joined)? onMembershipChanged;

  void _openMembersSheet(BuildContext context, PopularGroupItem group) {
    GroupMembersSheet.show(
      context,
      groupId: group.id,
      onMemberTap: (member) {
        Navigator.of(context).pop();
        WidgetsBinding.instance.addPostFrameCallback((_) {
          Navigator.of(context).push(
            MaterialPageRoute<void>(
              builder: (_) => ChatUserProfilePage(
                profile: ChatUserProfile.fromMember(member),
                chatsController: chatsController,
              ),
            ),
          );
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return AppPageScaffold(
      title: 'My Groups',
      backIcon: AppNavBackIcon.backArrow,
      body: ListView.separated(
        padding: const EdgeInsets.fromLTRB(0, 8, 0, 24),
        itemCount: groups.length,
        separatorBuilder: (_, _) => const SizedBox(height: 12),
        itemBuilder: (context, index) {
          final group = groups[index];
          return PopularGroupCard(
            group: group,
            showJoinAction: false,
            onMembersTap: () => _openMembersSheet(context, group),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute<void>(
                  builder: (_) => GroupDetailsPage(
                    group: group,
                    chatsController: chatsController,
                    onMembershipChanged: onMembershipChanged == null
                        ? null
                        : (joined) => onMembershipChanged!(group, joined),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
