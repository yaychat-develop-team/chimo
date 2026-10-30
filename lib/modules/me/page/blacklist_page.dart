import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../common/theme/app_colors.dart';
import '../../../common/widgets/app_image.dart';
import '../../../common/widgets/app_pull_refresh.dart';
import '../../../common/widgets/app_scaffold.dart';
import '../logic/blacklist_logic.dart';

/// 黑名单。 [BlacklistLogic] 由路由 binding 注入。
class BlacklistPage extends GetView<BlacklistLogic> {
  const BlacklistPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBar: const AppNavBar(title: 'Blacklist'),
      body: Obx(_buildList),
    );
  }

  Widget _buildList() {
    final users = controller.users.toList();
    final loading = controller.loading.value;

    final Widget sliver;
    if (users.isEmpty && !loading) {
      sliver = const SliverFillRemaining(
        hasScrollBody: false,
        child: Center(
          child: Text(
            'No blocked users',
            style: TextStyle(color: AppColors.gray9A9A9A),
          ),
        ),
      );
    } else {
      sliver = SliverPadding(
        padding: const EdgeInsets.fromLTRB(16, 8, 16, 24),
        sliver: SliverList.separated(
          itemCount: users.length,
          separatorBuilder: (_, _) => const SizedBox(height: 8),
          itemBuilder: (context, index) {
            final user = users[index];
            return _BlacklistTile(
              nickname: user.nickname,
              avatar: user.avatar,
              onUnblock: () =>
                  unawaited(controller.unblock(user.id.toString())),
            );
          },
        ),
      );
    }
    return AppPullRefresh(onRefresh: controller.load, slivers: [sliver]);
  }
}

class _BlacklistTile extends StatelessWidget {
  const _BlacklistTile({
    required this.nickname,
    required this.avatar,
    required this.onUnblock,
  });

  final String nickname;
  final String avatar;
  final VoidCallback onUnblock;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
      decoration: BoxDecoration(
        color: AppColors.black1C1C1E,
        borderRadius: BorderRadius.circular(14),
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 22,
            backgroundColor: AppColors.black2A2A2A,
            backgroundImage: AppImage.providerOf(avatar),
            child: avatar.isEmpty
                ? const Icon(Icons.person, color: AppColors.gray9A9A9A)
                : null,
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              nickname,
              style: const TextStyle(
                color: AppColors.white,
                fontSize: 15,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          TextButton(onPressed: onUnblock, child: const Text('Unblock')),
        ],
      ),
    );
  }
}
