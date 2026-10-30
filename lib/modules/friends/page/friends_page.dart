import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../app/app_jumper.dart';
import '../../../common/constants/app_assets.dart';
import '../../../common/theme/app_colors.dart';
import '../../../common/theme/app_input.dart';
import '../../../common/theme/app_text.dart';
import 'package:chimo/common/utils/chimo.dart';
import '../../../common/widgets/app_pull_refresh.dart';
import '../../../common/widgets/app_scaffold.dart';
import '../../../common/widgets/gender_age_chip.dart';
import '../logic/friends_logic.dart';
import '../../../common/extensions/wire_view.dart';
import '../../../common/models/server_client/base.pbenum.dart';
import '../../../common/models/server_client/user.pb.dart';
import 'package:chimo/common/widgets/app_image.dart';

/// 通讯录：好友（互关）/ 关注（我关注的）/ 粉丝（关注我的）。
class FriendsPage extends GetView<FriendsLogic> {
  const FriendsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => AppScaffold(
        appBar: _FriendsHeader(
          current: controller.tabIndex.value,
          onBack: AppJumper.back,
          onTabChanged: controller.selectTab,
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 8, 16, 0),
              child: _FriendsSearchField(
                controller: controller.input,
                hintText: FriendsLogic.tabs[controller.tabIndex.value].searchHint,
              ),
            ),
            Expanded(child: Obx(_buildList)),
          ],
        ),
      ),
    );
  }

  Widget _buildList() {
    final users = controller.users.toList();
    final error = controller.error.value;
    final loading = controller.loading.value;

    final Widget sliver;
    if (error != null && users.isEmpty) {
      sliver = SliverFillRemaining(
        hasScrollBody: false,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(24, 120, 24, 24),
          child: Column(
            children: [
              Text(
                error,
                textAlign: TextAlign.center,
                style: const TextStyle(color: AppColors.gray9A9A9A, fontSize: 14),
              ),
              const SizedBox(height: 12),
              TextButton(onPressed: () => unawaited(controller.load()), child: const Text('Retry')),
            ],
          ),
        ),
      );
    } else if (users.isEmpty && !loading) {
      sliver = SliverFillRemaining(
        hasScrollBody: false,
        child: _FriendsEmptyState(title: FriendsLogic.tabs[controller.tabIndex.value].emptyTitle),
      );
    } else {
      sliver = SliverPadding(
        padding: const EdgeInsets.fromLTRB(16, 16, 16, 24),
        sliver: SliverList.separated(
          itemCount: users.length,
          separatorBuilder: (_, _) => Chimo.gap(height: 10),
          itemBuilder: (context, index) {
            final user = users[index];
            return _FriendTile(
              user: user,
              onTap: () => controller.openProfile(user),
              onChat: () => controller.openChat(user),
              onFollow: user.relationType == RelationType.FAN
                  ? () => unawaited(controller.follow(user))
                  : null,
            );
          },
        ),
      );
    }
    return AppPullRefresh(onRefresh: controller.load, slivers: [sliver]);
  }
}

class _FriendsHeader extends StatelessWidget {
  const _FriendsHeader({required this.current, required this.onBack, required this.onTabChanged});

  final int current;
  final VoidCallback onBack;
  final ValueChanged<int> onTabChanged;

  static const _accent = AppColors.green29EEAA;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DecoratedBox(
        decoration: const BoxDecoration(
          border: Border(bottom: BorderSide(color: AppColors.gray333333, width: 0.5)),
        ),
        child: SizedBox(
          height: 48,
          child: Row(
            children: [
              AppBackButton(onBack: onBack),
              Expanded(
                child: Row(
                  children: FriendsLogic.tabs.indexed.map((entry) {
                    final (index, tab) = entry;
                    return Expanded(
                      child: _FriendsTabLabel(
                        label: tab.label,
                        selected: current == index,
                        accent: _accent,
                        onTap: () => onTabChanged(index),
                      ),
                    );
                  }).toList(),
                ),
              ),
              const SizedBox(width: 48),
            ],
          ),
        ),
      ),
    );
  }
}

class _FriendsTabLabel extends StatelessWidget {
  const _FriendsTabLabel({
    required this.label,
    required this.selected,
    required this.accent,
    required this.onTap,
  });

  final String label;
  final bool selected;
  final Color accent;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(top: 10),
        child: Center(
          child: IntrinsicWidth(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  label,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: selected ? accent : AppColors.gray9A9A9A,
                    fontSize: 16.sp,
                    fontWeight: selected ? FontWeight.w700 : FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 8),
                AnimatedContainer(
                  duration: const Duration(milliseconds: 180),
                  curve: Curves.easeOut,
                  height: 3,
                  decoration: BoxDecoration(
                    color: selected ? accent : Colors.transparent,
                    borderRadius: BorderRadius.circular(1.5),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _FriendsSearchField extends StatelessWidget {
  const _FriendsSearchField({required this.controller, required this.hintText});

  final TextEditingController controller;
  final String hintText;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 44,
      padding: const EdgeInsets.symmetric(horizontal: 14),
      decoration: BoxDecoration(
        color: AppColors.black1C1C1E,
        borderRadius: BorderRadius.circular(22),
      ),
      child: Row(
        children: [
          Chimo.image(
            AppAssets.msgSearch,
            width: 18,
            height: 18,
            color: AppColors.white,
            fit: BoxFit.contain,
          ),
          const SizedBox(width: 10),
          Expanded(
            child: TextField(
              controller: controller,
              style: const TextStyle(color: AppColors.white, fontSize: 15),
              cursorColor: AppColors.green1BBA77,
              decoration: AppInputDecoration(
                isDense: true,
                hintText: hintText,
                hintStyle: const TextStyle(color: AppColors.white36, fontSize: 15),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _FriendsEmptyState extends StatelessWidget {
  const _FriendsEmptyState({required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Chimo.image(AppAssets.friendsEmpty, width: 180, fit: BoxFit.contain),
            const SizedBox(height: 16),
            Text(title, textAlign: TextAlign.center, style: AppText.field),
          ],
        ),
      ),
    );
  }
}

class _FriendTile extends StatelessWidget {
  const _FriendTile({required this.user, required this.onTap, required this.onChat, this.onFollow});

  final User user;
  final VoidCallback onTap;
  final VoidCallback onChat;
  final VoidCallback? onFollow;

  @override
  Widget build(BuildContext context) {
    final showFollow = user.relationType == RelationType.FAN && onFollow != null;

    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 10.w, horizontal: 8.w),
        decoration: BoxDecoration(color: AppColors.white8, borderRadius: BorderRadius.circular(12)),
        child: Row(
          children: [
            AppImage.avatar(user.avatar, fallbackAsset: AppAssets.avatarPlace, size: 52),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Flexible(
                        child: Text(
                          user.nickname,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: AppText.title,
                        ),
                      ),
                      const SizedBox(width: 8),
                      if (user.genderKnown) GenderAgeChip(isMale: user.male, age: user.age),
                    ],
                  ),
                  const SizedBox(height: 6),
                  Text(
                    'ID:${user.uid}',
                    style: const TextStyle(
                      color: AppColors.gray9A9A9A,
                      fontSize: 13,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 10),
            if (showFollow)
              _ActionChip(label: 'Follow', filled: true, onTap: onFollow!)
            else
              _ActionChip(label: 'Chat', filled: false, onTap: onChat),
          ],
        ),
      ),
    );
  }
}

class _ActionChip extends StatelessWidget {
  const _ActionChip({required this.label, required this.filled, required this.onTap});

  final String label;
  final bool filled;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 32,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: filled ? AppColors.green1CFF8A : AppColors.green1A3A28,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Text(
          label,
          style: TextStyle(
            color: filled ? Colors.black : AppColors.green1CFF8A,
            fontSize: 14,
            fontWeight: filled ? FontWeight.w800 : FontWeight.w700,
          ),
        ),
      ),
    );
  }
}
