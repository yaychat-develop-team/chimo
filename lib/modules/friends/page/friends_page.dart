import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../app/app_jumper.dart';
import '../../../common/constants/app_assets.dart';
import '../../../common/theme/app_colors.dart';
import '../../../common/theme/app_input.dart';
import '../../../common/theme/app_text.dart';
import '../../../common/widgets/app_back_button.dart';
import '../../../common/widgets/app_image.dart';
import '../../../common/widgets/app_scaffold.dart';
import '../../../common/widgets/gender_age_chip.dart';
import '../model/friends_tab.dart';
import '../logic/friends_logic.dart';
import '../../../common/extensions/wire_view.dart';
import '../../../common/models/server_client/base.pbenum.dart';
import '../../../common/models/server_client/user.pb.dart';

/// 通讯录：好友（互关）/ 关注（我关注的）/ 粉丝（关注我的）。
class FriendsPage extends StatefulWidget {
  const FriendsPage({super.key, this.initialTab = FriendsTab.friends});

  /// 落地 Tab（由 AppJumper 传入）；只影响首帧，之后用户自己切。
  final FriendsTab initialTab;

  @override
  State<FriendsPage> createState() => _FriendsPageState();
}

class _FriendsPageState extends State<FriendsPage> {
  /// 页面自持 Controller：没有现成实例就自己 put、自己收。
  late final FriendsLogic logic;
  bool _ownsController = false;

  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    if (Get.isRegistered<FriendsLogic>()) {
      logic = Get.find<FriendsLogic>();
    } else {
      logic = Get.put(FriendsLogic(initialTab: widget.initialTab));
      _ownsController = true;
    }
    _searchController.addListener(_onSearchChanged);
  }

  @override
  void dispose() {
    _searchController.removeListener(_onSearchChanged);
    _searchController.dispose();
    if (_ownsController && Get.isRegistered<FriendsLogic>()) {
      Get.delete<FriendsLogic>();
    }
    super.dispose();
  }

  void _onSearchChanged() => logic.onSearchChanged(_searchController.text);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => ChimoScaffold(
        loading: logic.loading.value,
        navigation: _FriendsHeader(
          current: logic.tab.value,
          onBack: AppJumper.back,
          onTabChanged: logic.selectTab,
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 8, 16, 0),
              child: _FriendsSearchField(controller: _searchController, hintText: logic.searchHint),
            ),
            Expanded(
              child: RefreshIndicator(
                color: AppColors.primaryBright,
                onRefresh: logic.reload,
                child: Obx(() => _buildList(context)),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildList(BuildContext context) {
    final users = logic.filtered;
    final error = logic.error.value;
    final loading = logic.loading.value;

    if (error != null && users.isEmpty) {
      return ListView(
        physics: const AlwaysScrollableScrollPhysics(),
        children: [
          const SizedBox(height: 120),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                children: [
                  Text(
                    error,
                    textAlign: TextAlign.center,
                    style: const TextStyle(color: AppColors.textSecondary, fontSize: 14),
                  ),
                  const SizedBox(height: 12),
                  TextButton(onPressed: () => unawaited(logic.load()), child: const Text('Retry')),
                ],
              ),
            ),
          ),
        ],
      );
    }
    if (users.isEmpty && !loading) {
      return ListView(
        physics: const AlwaysScrollableScrollPhysics(),
        children: [
          SizedBox(
            height: MediaQuery.sizeOf(context).height * 0.55,
            child: _FriendsEmptyState(title: logic.emptyTitle),
          ),
        ],
      );
    }
    return ListView.separated(
      physics: const AlwaysScrollableScrollPhysics(),
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 24),
      itemCount: users.length,
      separatorBuilder: (_, _) => const SizedBox(height: 18),
      itemBuilder: (context, index) {
        final user = users[index];
        return _FriendTile(
          user: user,
          onTap: () => logic.openProfile(user),
          onChat: () => logic.openChat(user),
          onFollow: user.relationType == RelationType.FAN
              ? () => unawaited(logic.follow(user))
              : null,
        );
      },
    );
  }
}

class _FriendsHeader extends StatelessWidget {
  const _FriendsHeader({required this.current, required this.onBack, required this.onTabChanged});

  final FriendsTab current;
  final VoidCallback onBack;
  final ValueChanged<FriendsTab> onTabChanged;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 52,
      child: Row(
        children: [
          AppBackButton(onPressed: onBack),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: FriendsTab.values.map((tab) {
                final label = switch (tab) {
                  FriendsTab.friends => 'Friends',
                  FriendsTab.follow => 'Follow',
                  FriendsTab.followers => 'Followers',
                };
                return _FriendsTabLabel(
                  label: label,
                  selected: current == tab,
                  onTap: () => onTabChanged(tab),
                );
              }).toList(),
            ),
          ),
          const SizedBox(width: 48),
        ],
      ),
    );
  }
}

class _FriendsTabLabel extends StatelessWidget {
  const _FriendsTabLabel({required this.label, required this.selected, required this.onTap});

  final String label;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              label,
              style: TextStyle(
                color: selected ? AppColors.primaryBright : AppColors.textSecondary,
                fontSize: 17,
                fontWeight: selected ? FontWeight.w700 : FontWeight.w500,
              ),
            ),
            const SizedBox(height: 6),
            AnimatedContainer(
              duration: const Duration(milliseconds: 180),
              height: 3,
              width: selected ? 28 : 0,
              decoration: BoxDecoration(
                color: AppColors.primaryBright,
                borderRadius: BorderRadius.circular(2),
              ),
            ),
          ],
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
        color: AppColors.surfaceInput,
        borderRadius: BorderRadius.circular(22),
      ),
      child: Row(
        children: [
          const AppImage(
            AppAssets.msgSearch,
            width: 18,
            height: 18,
            color: AppColors.textTertiary,
            fit: BoxFit.contain,
          ),
          const SizedBox(width: 10),
          Expanded(
            child: TextField(
              controller: controller,
              style: const TextStyle(color: AppColors.textPrimary, fontSize: 15),
              cursorColor: AppColors.primaryBright,
              decoration: AppInputDecoration(
                isDense: true,
                hintText: hintText,
                hintStyle: const TextStyle(color: AppColors.textTertiary, fontSize: 15),
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
            AppImage(AppAssets.friendsEmpty, width: 180, fit: BoxFit.contain),
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
                    color: AppColors.textSecondary,
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
          color: filled ? AppColors.accentNeon : AppColors.chipGreenDark,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Text(
          label,
          style: TextStyle(
            color: filled ? Colors.black : AppColors.accentNeon,
            fontSize: 14,
            fontWeight: filled ? FontWeight.w800 : FontWeight.w700,
          ),
        ),
      ),
    );
  }
}
