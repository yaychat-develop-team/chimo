import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../app/app_jumper.dart';
import '../../../common/constants/app_assets.dart';
import '../../../common/theme/app_colors.dart';
import '../../../common/theme/app_input.dart';
import '../../../common/theme/app_text.dart';
import 'package:chimo/common/utils/chimo.dart';
import '../../../common/widgets/app_scaffold.dart';
import '../../../common/widgets/gender_age_chip.dart';
import '../logic/user_search_logic.dart';
import '../model/search_user.dart';

class HomeSearchPage extends GetView<UserSearchLogic> {
  const HomeSearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBar: _buildAppBar(),
      // 整页一个 Obx：原版每次 setState 也是整页重建，收窄反而改了行为。
      body: Obx(() {
        // 提交后显示结果 / 空态 / 加载；清空输入回到 History。
        final showResults = controller.hasSearched.value;
        final result = controller.result.value;
        final editingHistory = controller.editingHistory.value;
        final history = controller.history.toList();

        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            if (showResults)
              Expanded(
                child: controller.searching.value
                    ? const Center(
                        child: SizedBox(
                          width: 28,
                          height: 28,
                          child: CircularProgressIndicator(strokeWidth: 2.4),
                        ),
                      )
                    : result == null
                    ? const _SearchEmptyState()
                    : _UsersResult(
                        user: result,
                        onFollow: () => unawaited(controller.follow(result)),
                        onChat: () => controller.openChat(result),
                        onProfile: () => controller.openProfile(result),
                      ),
              )
            else ...[
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 24, 16, 8),
                child: Row(
                  children: [
                    const Expanded(
                      child: Text(
                        'History',
                        style: TextStyle(
                          color: AppColors.gray9A9A9A,
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    if (editingHistory) ...[
                      GestureDetector(
                        onTap: controller.clearAllHistory,
                        behavior: HitTestBehavior.opaque,
                        child: const Padding(
                          padding: EdgeInsets.symmetric(vertical: 6, horizontal: 4),
                          child: Text('Clear All', style: AppText.body),
                        ),
                      ),
                      Container(
                        width: 1,
                        height: 12,
                        margin: const EdgeInsets.symmetric(horizontal: 10),
                        color: AppColors.gray333333,
                      ),
                      GestureDetector(
                        onTap: controller.exitEditHistory,
                        behavior: HitTestBehavior.opaque,
                        child: const Padding(
                          padding: EdgeInsets.symmetric(vertical: 6, horizontal: 4),
                          child: Text(
                            'Done',
                            style: TextStyle(
                              color: AppColors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ),
                    ] else
                      IconButton(
                        onPressed: history.isEmpty ? null : controller.enterEditHistory,
                        padding: EdgeInsets.zero,
                        constraints: const BoxConstraints(minWidth: 36, minHeight: 36),
                        icon: Chimo.image(
                          AppAssets.msgDelete,
                          width: 22,
                          height: 22,
                          color: history.isEmpty ? AppColors.gray6E6E6E : AppColors.gray9A9A9A,
                        ),
                      ),
                  ],
                ),
              ),
              if (history.isNotEmpty)
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 4, 16, 16),
                  child: Wrap(
                    spacing: 10,
                    runSpacing: 10,
                    children: history
                        .map(
                          (item) => _HistoryChip(
                            label: item,
                            editing: editingHistory,
                            onTap: () => controller.onHistoryTap(item),
                            onDelete: () => controller.removeHistoryItem(item),
                          ),
                        )
                        .toList(),
                  ),
                ),
            ],
          ],
        );
      }),
    );
  }

  Widget _buildAppBar() {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 8, 8, 0),
        child: Row(
          children: [
            Expanded(
              child: Container(
                height: 40,
                padding: const EdgeInsets.symmetric(horizontal: 14),
                decoration: BoxDecoration(
                  color: AppColors.black2A2A2A,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  children: [
                    Chimo.image(
                      AppAssets.msgSearch,
                      width: 16,
                      height: 16,
                      color: AppColors.gray6E6E6E,
                      fit: BoxFit.contain,
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: TextField(
                        controller: controller.input,
                        focusNode: controller.focusNode,
                        keyboardType: TextInputType.number,
                        style: const TextStyle(color: AppColors.white, fontSize: 15),
                        cursorColor: AppColors.green1BBA77,
                        cursorWidth: 1.5,
                        textInputAction: TextInputAction.search,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                          LengthLimitingTextInputFormatter(64),
                        ],
                        onSubmitted: (value) => unawaited(controller.submit(value)),
                        decoration: const AppInputDecoration(
                          isDense: true,
                          hintText: 'Search contacts or mess...',
                          hintStyle: TextStyle(color: AppColors.gray6E6E6E, fontSize: 15),
                        ),
                      ),
                    ),
                    Obx(() {
                      if (!controller.hasText.value) {
                        return const SizedBox.shrink();
                      }
                      return GestureDetector(
                        onTap: controller.clearInput,
                        behavior: HitTestBehavior.opaque,
                        child: const Padding(
                          padding: EdgeInsets.only(left: 6),
                          child: Icon(Icons.cancel_rounded, size: 18, color: AppColors.gray6E6E6E),
                        ),
                      );
                    }),
                  ],
                ),
              ),
            ),
            TextButton(
              onPressed: () => AppJumper.back(),
              style: TextButton.styleFrom(
                foregroundColor: AppColors.white,
                padding: const EdgeInsets.symmetric(horizontal: 12),
                minimumSize: const Size(0, 40),
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              ),
              child: const Text(
                'Cancel',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _SearchEmptyState extends StatelessWidget {
  const _SearchEmptyState();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Chimo.image(AppAssets.emptyNoSearch, width: 220, height: 160, fit: BoxFit.contain),
            const SizedBox(height: 10),
            const Text(
              'Sorry. No relevant content.',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white70, fontSize: 14, fontWeight: FontWeight.w500),
            ),
          ],
        ),
      ),
    );
  }
}

class _UsersResult extends StatelessWidget {
  const _UsersResult({
    required this.user,
    required this.onFollow,
    required this.onChat,
    required this.onProfile,
  });

  final SearchUser user;
  final VoidCallback onFollow;
  final VoidCallback onChat;
  final VoidCallback onProfile;

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.fromLTRB(16, 24, 16, 16),
      children: [
        const Text(
          'Users',
          style: TextStyle(color: AppColors.white, fontSize: 17, fontWeight: FontWeight.w700),
        ),
        const SizedBox(height: 16),
        Row(
          children: [
            GestureDetector(
              onTap: onProfile,
              behavior: HitTestBehavior.opaque,
              child: ClipOval(
                child: Chimo.image(
                  user.avatarUrl,
                  fallbackAsset: user.avatarAsset,
                  width: 52,
                  height: 52,
                  fit: BoxFit.cover,
                  fadeIn: Duration.zero,
                ),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: GestureDetector(
                onTap: onProfile,
                behavior: HitTestBehavior.opaque,
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
                        if (user.hasGender) ...[
                          const SizedBox(width: 8),
                          GenderAgeChip(isMale: user.isMale, age: user.age),
                        ],
                      ],
                    ),
                    const SizedBox(height: 6),
                    Text(
                      'ID:${user.userId}',
                      style: const TextStyle(
                        color: AppColors.gray9A9A9A,
                        fontSize: 13,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            if (user.relation != SearchRelation.self) ...[
              const SizedBox(width: 10),
              if (user.relation == SearchRelation.notFollowing)
                _FollowAction(onTap: onFollow)
              else
                _ChatAction(onTap: onChat),
            ],
          ],
        ),
      ],
    );
  }
}

class _FollowAction extends StatelessWidget {
  const _FollowAction({required this.onTap});

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16),
        child: Ink(
          height: 32,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          decoration: BoxDecoration(
            color: AppColors.green1CFF8A,
            borderRadius: BorderRadius.circular(16),
          ),
          child: const Center(
            child: Text(
              'Follow',
              style: TextStyle(color: Colors.black, fontSize: 14, fontWeight: FontWeight.w800),
            ),
          ),
        ),
      ),
    );
  }
}

class _ChatAction extends StatelessWidget {
  const _ChatAction({required this.onTap});

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16),
        child: Ink(
          height: 32,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          decoration: BoxDecoration(
            color: AppColors.green1A3A28,
            borderRadius: BorderRadius.circular(16),
          ),
          child: const Center(
            child: Text(
              'Chat',
              style: TextStyle(
                color: AppColors.green1CFF8A,
                fontSize: 14,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _HistoryChip extends StatelessWidget {
  const _HistoryChip({
    required this.label,
    required this.editing,
    required this.onTap,
    required this.onDelete,
  });

  final String label;
  final bool editing;
  final VoidCallback onTap;
  final VoidCallback onDelete;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: editing ? null : onTap,
      child: Container(
        padding: EdgeInsets.fromLTRB(14, 8, editing ? 8 : 14, 8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18),
          border: Border.all(color: AppColors.gray333333, width: 1),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(label, style: AppText.label),
            if (editing) ...[
              const SizedBox(width: 6),
              GestureDetector(
                onTap: onDelete,
                behavior: HitTestBehavior.opaque,
                child: const Padding(
                  padding: EdgeInsets.all(2),
                  child: Icon(Icons.close_rounded, size: 14, color: AppColors.gray9A9A9A),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
