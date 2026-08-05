import 'package:flutter/material.dart';

import '../../core/theme/app_colors.dart';
import '../chats/data/chats_list_controller.dart';
import 'chat_user_profile_page.dart';
import 'group_details_page.dart';
import 'models/chat_user_profile.dart';
import 'models/group_item.dart';
import 'widgets/group_members_sheet.dart';
import 'widgets/popular_group_card.dart';

/// Joined groups list (Home My Groups → More).
///
/// Same card layout as Popular Groups, without the join / leave control.
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
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(
              height: 48,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: IconButton(
                      onPressed: () => Navigator.of(context).pop(),
                      icon: const Icon(
                        Icons.arrow_back_ios_new_rounded,
                        color: AppColors.textPrimary,
                        size: 20,
                      ),
                    ),
                  ),
                  const Text(
                    'My Groups',
                    style: TextStyle(
                      color: AppColors.textPrimary,
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView.separated(
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
                                : (joined) =>
                                    onMembershipChanged!(group, joined),
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
