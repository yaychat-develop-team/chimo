import 'package:flutter/material.dart';

import '../../../common/widgets/app_scaffold.dart';
import '../../../common/extensions/wire_view.dart';
import '../../../common/models/server_client/group/group.pb.dart';
import '../../home/page/widgets/popular_group_card.dart';
import '../../../app/app_jumper.dart';

/// 已加入群组列表（首页我的群组 → 更多）。
class JoinedGroupsPage extends StatelessWidget {
  const JoinedGroupsPage({super.key, required this.groups, this.onMembershipChanged});

  final List<GroupInfo> groups;
  final void Function(GroupInfo group, bool joined)? onMembershipChanged;

  void _openMembersSheet(GroupInfo group) {
    AppJumper.showGroupMembers(
      groupId: group.gid,
      onMemberTap: (member) {
        AppJumper.back();
        WidgetsBinding.instance.addPostFrameCallback((_) {
          AppJumper.toProfile(member.uid, preview: member);
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBar: AppNavBar(title: 'My Groups'),
      body: ListView.separated(
        padding: const EdgeInsets.fromLTRB(0, 8, 0, 24),
        itemCount: groups.length,
        separatorBuilder: (_, _) => const SizedBox(height: 12),
        itemBuilder: (_, index) {
          final group = groups[index];
          return PopularGroupCard(
            group: group,
            showJoinAction: false,
            onMembersTap: () => _openMembersSheet(group),
            onTap: () {
              AppJumper.toGroup(
                group.gid,
                preview: group,
                onMembershipChanged: onMembershipChanged == null
                    ? null
                    : (joined) => onMembershipChanged!(group, joined),
              );
            },
          );
        },
      ),
    );
  }
}
