import 'package:flutter/material.dart';

import '../../core/constants/app_assets.dart';
import '../../core/theme/app_colors.dart';

/// 好友关系页 Tab。
enum FriendsTab { friends, follow, followers }

/// 好友 / 关注 / 粉丝列表页（消息页通讯录入口）。
class FriendsPage extends StatefulWidget {
  const FriendsPage({super.key, this.initialTab = FriendsTab.friends});

  final FriendsTab initialTab;

  @override
  State<FriendsPage> createState() => _FriendsPageState();
}

class _FriendsPageState extends State<FriendsPage> {
  late FriendsTab _tab = widget.initialTab;
  final TextEditingController _searchController = TextEditingController();

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  String get _emptyTitle => switch (_tab) {
        FriendsTab.friends => 'No friends yet~',
        FriendsTab.follow => 'No follows yet~',
        FriendsTab.followers => 'No followers yet~',
      };

  String get _searchHint => switch (_tab) {
        FriendsTab.friends => 'Search for friends',
        FriendsTab.follow => 'Search for follows',
        FriendsTab.followers => 'Search for followers',
      };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _FriendsHeader(
              current: _tab,
              onBack: () => Navigator.of(context).pop(),
              onTabChanged: (tab) => setState(() => _tab = tab),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 8, 16, 0),
              child: _FriendsSearchField(
                controller: _searchController,
                hintText: _searchHint,
              ),
            ),
            Expanded(
              child: _FriendsEmptyState(title: _emptyTitle),
            ),
          ],
        ),
      ),
    );
  }
}

class _FriendsHeader extends StatelessWidget {
  const _FriendsHeader({
    required this.current,
    required this.onBack,
    required this.onTabChanged,
  });

  final FriendsTab current;
  final VoidCallback onBack;
  final ValueChanged<FriendsTab> onTabChanged;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 52,
      child: Row(
        children: [
          IconButton(
            onPressed: onBack,
            icon: const Icon(
              Icons.arrow_back_ios_new_rounded,
              color: AppColors.textPrimary,
              size: 20,
            ),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                for (final tab in FriendsTab.values)
                  _FriendsTabLabel(
                    label: switch (tab) {
                      FriendsTab.friends => 'Friends',
                      FriendsTab.follow => 'Follow',
                      FriendsTab.followers => 'Followers',
                    },
                    selected: current == tab,
                    onTap: () => onTabChanged(tab),
                  ),
              ],
            ),
          ),
          // 与左侧返回按钮对称占位，保证 Tab 视觉居中。
          const SizedBox(width: 48),
        ],
      ),
    );
  }
}

class _FriendsTabLabel extends StatelessWidget {
  const _FriendsTabLabel({
    required this.label,
    required this.selected,
    required this.onTap,
  });

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
                color: selected
                    ? AppColors.primaryBright
                    : AppColors.textSecondary,
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
  const _FriendsSearchField({
    required this.controller,
    required this.hintText,
  });

  final TextEditingController controller;
  final String hintText;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 44,
      padding: const EdgeInsets.symmetric(horizontal: 14),
      decoration: BoxDecoration(
        color: const Color(0xFF1A1A1A),
        borderRadius: BorderRadius.circular(22),
      ),
      child: Row(
        children: [
          Image.asset(
            AppAssets.msgSearch,
            width: 18,
            height: 18,
            color: AppColors.textTertiary,
          ),
          const SizedBox(width: 10),
          Expanded(
            child: TextField(
              controller: controller,
              style: const TextStyle(
                color: AppColors.textPrimary,
                fontSize: 15,
              ),
              cursorColor: AppColors.primaryBright,
              decoration: InputDecoration(
                isDense: true,
                border: InputBorder.none,
                hintText: hintText,
                hintStyle: const TextStyle(
                  color: AppColors.textTertiary,
                  fontSize: 15,
                ),
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
            Image.asset(
              AppAssets.friendsEmpty,
              width: 180,
              fit: BoxFit.contain,
            ),
            const SizedBox(height: 16),
            Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: AppColors.textPrimary,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
