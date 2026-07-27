import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../core/constants/app_assets.dart';
import '../../core/theme/app_colors.dart';
import '../report/report_page.dart';
import 'models/group_item.dart';
import 'widgets/group_level_badge.dart';

/// 小组聊天页：未加入 = 限看 + Join；已加入 = 消息流 + 输入栏。
class GroupDetailsPage extends StatefulWidget {
  const GroupDetailsPage({
    super.key,
    required this.group,
    this.onMembershipChanged,
  });

  final PopularGroupItem group;

  /// 加入状态变化回调（同步首页「我的小组」）。
  final ValueChanged<bool>? onMembershipChanged;

  @override
  State<GroupDetailsPage> createState() => _GroupDetailsPageState();
}

class _GroupDetailsPageState extends State<GroupDetailsPage> {
  late bool _isJoined = widget.group.isJoined;
  bool _descExpanded = false;
  int _tabIndex = 0;

  PopularGroupItem get _group => widget.group;

  void _join() {
    if (_isJoined) return;
    setState(() => _isJoined = true);
    widget.onMembershipChanged?.call(true);
  }

  void _leave() {
    if (!_isJoined) return;
    widget.onMembershipChanged?.call(false);
    Navigator.of(context).pop();
  }

  Future<void> _openMoreMenu() async {
    final action = await showModalBottomSheet<_GroupMoreAction>(
      context: context,
      backgroundColor: Colors.transparent,
      barrierColor: Colors.black.withValues(alpha: 0.55),
      builder: (context) => _GroupMoreSheet(showLeave: _isJoined),
    );
    if (!mounted || action == null) return;

    switch (action) {
      case _GroupMoreAction.report:
        Navigator.of(context).push(
          MaterialPageRoute<void>(builder: (_) => const ReportPage()),
        );
      case _GroupMoreAction.leave:
        _leave();
    }
  }

  @override
  Widget build(BuildContext context) {
    final topPadding = MediaQuery.paddingOf(context).top;
    final bottomPadding = MediaQuery.paddingOf(context).bottom;

    return Scaffold(
      backgroundColor: AppColors.background,
      body: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            height: 260 + topPadding,
            child: ImageFiltered(
              imageFilter: ImageFilter.blur(sigmaX: 18, sigmaY: 18),
              child: Image.asset(
                _group.avatarAsset,
                fit: BoxFit.cover,
                alignment: Alignment.topCenter,
              ),
            ),
          ),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            height: 260 + topPadding,
            child: DecoratedBox(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.black.withValues(alpha: 0.45),
                    AppColors.background,
                  ],
                ),
              ),
            ),
          ),
          Column(
            children: [
              SizedBox(height: topPadding),
              _DetailsAppBar(onMoreTap: _openMoreMenu),
              _ProfileHeader(
                group: _group,
                descExpanded: _descExpanded,
                onToggleDesc: () =>
                    setState(() => _descExpanded = !_descExpanded),
              ),
              if (!_isJoined) const _MemberLimitBanner(),
              Expanded(
                child: _ChatBody(
                  tabIndex: _tabIndex,
                  isJoined: _isJoined,
                  onTabChanged: (i) => setState(() => _tabIndex = i),
                ),
              ),
              if (_isJoined)
                _ChatInputBar(bottomInset: bottomPadding)
              else
                _JoinCommunityBar(
                  bottomInset: bottomPadding,
                  onTap: _join,
                ),
            ],
          ),
        ],
      ),
    );
  }
}

enum _GroupMoreAction { report, leave }

class _DetailsAppBar extends StatelessWidget {
  const _DetailsAppBar({required this.onMoreTap});

  final VoidCallback onMoreTap;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48,
      child: Row(
        children: [
          IconButton(
            onPressed: () => Navigator.of(context).pop(),
            icon: SvgPicture.asset(
              AppAssets.chatBack,
              width: 17,
              height: 7,
            ),
          ),
          const Spacer(),
          IconButton(
            onPressed: onMoreTap,
            icon: Image.asset(
              AppAssets.msgMore,
              width: 22,
              height: 22,
              color: AppColors.textPrimary,
            ),
          ),
        ],
      ),
    );
  }
}

/// 已加入小组：右上角更多弹层（Report / Leave Group）。
class _GroupMoreSheet extends StatelessWidget {
  const _GroupMoreSheet({required this.showLeave});

  final bool showLeave;

  Future<void> _onLeaveTap(BuildContext context) async {
    final confirmed = await _LeaveGroupDialog.show(context);
    if (!context.mounted) return;
    if (confirmed) {
      Navigator.of(context).pop(_GroupMoreAction.leave);
    }
  }

  @override
  Widget build(BuildContext context) {
    final bottom = MediaQuery.paddingOf(context).bottom;

    return DecoratedBox(
      decoration: const BoxDecoration(
        color: Color(0xFF1C1C1E),
        borderRadius: BorderRadius.vertical(top: Radius.circular(28)),
      ),
      child: Padding(
        padding: EdgeInsets.only(top: 28, bottom: 28 + bottom),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _MoreActionTile(
              label: 'Report',
              color: AppColors.badge,
              onTap: () => Navigator.of(context).pop(_GroupMoreAction.report),
            ),
            if (showLeave) ...[
              const SizedBox(height: 8),
              _MoreActionTile(
                label: 'Leave Group',
                color: AppColors.textPrimary,
                onTap: () => _onLeaveTap(context),
              ),
            ],
          ],
        ),
      ),
    );
  }
}

class _MoreActionTile extends StatelessWidget {
  const _MoreActionTile({
    required this.label,
    required this.color,
    required this.onTap,
  });

  final String label;
  final Color color;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: SizedBox(
        height: 48,
        width: double.infinity,
        child: Center(
          child: Text(
            label,
            style: TextStyle(
              color: color,
              fontSize: 17,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }
}

/// 退出小组二次确认。
class _LeaveGroupDialog extends StatelessWidget {
  const _LeaveGroupDialog();

  static Future<bool> show(BuildContext context) async {
    final result = await showDialog<bool>(
      context: context,
      barrierColor: Colors.black.withValues(alpha: 0.55),
      builder: (_) => const _LeaveGroupDialog(),
    );
    return result ?? false;
  }

  @override
  Widget build(BuildContext context) {
    const dividerColor = Color(0xFFE5E5E5);

    return Dialog(
      backgroundColor: Colors.white,
      elevation: 0,
      insetPadding: const EdgeInsets.symmetric(horizontal: 52),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Padding(
            padding: EdgeInsets.fromLTRB(20, 28, 20, 24),
            child: Column(
              children: [
                Text(
                  'Leave this Group?',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 17,
                    fontWeight: FontWeight.w700,
                    height: 1.3,
                  ),
                ),
                SizedBox(height: 6),
                Text(
                  'You will no longer receive updates.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                    height: 1.35,
                  ),
                ),
              ],
            ),
          ),
          const Divider(height: 1, thickness: 1, color: dividerColor),
          SizedBox(
            height: 50,
            child: Row(
              children: [
                Expanded(
                  child: InkWell(
                    onTap: () => Navigator.of(context).pop(false),
                    child: const Center(
                      child: Text(
                        'Cancel',
                        style: TextStyle(
                          color: Color(0xFF8E8E93),
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ),
                const VerticalDivider(
                  width: 1,
                  thickness: 1,
                  color: dividerColor,
                ),
                Expanded(
                  child: InkWell(
                    onTap: () => Navigator.of(context).pop(true),
                    child: const Center(
                      child: Text(
                        'Leave',
                        style: TextStyle(
                          color: AppColors.primaryBright,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _ProfileHeader extends StatelessWidget {
  const _ProfileHeader({
    required this.group,
    required this.descExpanded,
    required this.onToggleDesc,
  });

  final PopularGroupItem group;
  final bool descExpanded;
  final VoidCallback onToggleDesc;

  @override
  Widget build(BuildContext context) {
    final desc = group.description;
    final showToggle = desc.length > 48;
    final visibleDesc = (!descExpanded && showToggle)
        ? '${desc.substring(0, 48).trimRight()}…'
        : desc;

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
                child: Image.asset(
                  group.avatarAsset,
                  width: 72,
                  height: 72,
                  fit: BoxFit.cover,
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
                              color: AppColors.textPrimary,
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
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.tagBackground,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        group.category,
                        style: const TextStyle(
                          color: AppColors.textSecondary,
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        const Icon(
                          Icons.person_outline_rounded,
                          size: 15,
                          color: AppColors.textTertiary,
                        ),
                        const SizedBox(width: 3),
                        Text(
                          '${group.memberCount}',
                          style: const TextStyle(
                            color: AppColors.textTertiary,
                            fontSize: 12,
                          ),
                        ),
                        const SizedBox(width: 12),
                        const Icon(
                          Icons.image_outlined,
                          size: 15,
                          color: AppColors.textTertiary,
                        ),
                        const SizedBox(width: 3),
                        Text(
                          '${group.postCount}',
                          style: const TextStyle(
                            color: AppColors.textTertiary,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Text(
            visibleDesc,
            style: const TextStyle(
              color: AppColors.textSecondary,
              fontSize: 14,
              height: 1.4,
            ),
          ),
          if (showToggle) ...[
            const SizedBox(height: 10),
            Center(
              child: GestureDetector(
                onTap: onToggleDesc,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 14,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        descExpanded ? 'See Less' : 'See More',
                        style: const TextStyle(
                          color: AppColors.textPrimary,
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Icon(
                        descExpanded
                            ? Icons.keyboard_arrow_up_rounded
                            : Icons.keyboard_arrow_down_rounded,
                        color: AppColors.textPrimary,
                        size: 16,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }
}

class _MemberLimitBanner extends StatelessWidget {
  const _MemberLimitBanner();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
      color: const Color(0xFF1A3A28),
      child: const Text(
        'Not a member? Viewing is limited to 10 messages',
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Color(0xFFB8FF6A),
          fontSize: 13,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}

class _ChatBody extends StatelessWidget {
  const _ChatBody({
    required this.tabIndex,
    required this.isJoined,
    required this.onTabChanged,
  });

  final int tabIndex;
  final bool isJoined;
  final ValueChanged<int> onTabChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(22)),
      ),
      clipBehavior: Clip.antiAlias,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 14, 20, 4),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _TabLabel(
                  label: 'Messages',
                  selected: tabIndex == 0,
                  onTap: () => onTabChanged(0),
                ),
                const SizedBox(width: 28),
                _TabLabel(
                  label: 'Photos',
                  selected: tabIndex == 1,
                  onTap: () => onTabChanged(1),
                ),
              ],
            ),
          ),
          Expanded(
            child: tabIndex == 0
                ? _MessagesFeed(isJoined: isJoined)
                : _PhotosPlaceholder(isJoined: isJoined),
          ),
        ],
      ),
    );
  }
}

class _TabLabel extends StatelessWidget {
  const _TabLabel({
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
      child: Column(
        children: [
          Text(
            label,
            style: TextStyle(
              color: selected ? const Color(0xFF111111) : AppColors.textTertiary,
              fontSize: 16,
              fontWeight: selected ? FontWeight.w700 : FontWeight.w500,
            ),
          ),
          const SizedBox(height: 6),
          AnimatedContainer(
            duration: const Duration(milliseconds: 160),
            height: 3,
            width: selected ? 28 : 0,
            decoration: BoxDecoration(
              color: const Color(0xFF1CFF8A),
              borderRadius: BorderRadius.circular(2),
            ),
          ),
        ],
      ),
    );
  }
}

class _MessagesFeed extends StatelessWidget {
  const _MessagesFeed({required this.isJoined});

  final bool isJoined;

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.fromLTRB(16, 12, 16, 20),
      children: [
        const _TimestampLabel('yesterday 6:01 AM'),
        const SizedBox(height: 12),
        const _SelfMessageBubble(text: '1'),
        if (isJoined) ...[
          const SizedBox(height: 20),
          const _TimestampLabel('1:35 AM'),
          const SizedBox(height: 10),
          const _SystemJoinNotice(name: 'P-2083172'),
        ],
      ],
    );
  }
}

class _TimestampLabel extends StatelessWidget {
  const _TimestampLabel(this.text);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.center,
      style: const TextStyle(
        color: AppColors.textTertiary,
        fontSize: 12,
      ),
    );
  }
}

class _SelfMessageBubble extends StatelessWidget {
  const _SelfMessageBubble({required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Flexible(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
            decoration: BoxDecoration(
              color: const Color(0xFFB8FF6A),
              borderRadius: BorderRadius.circular(18),
            ),
            child: Text(
              text,
              style: const TextStyle(
                color: Color(0xFF111111),
                fontSize: 15,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
        const SizedBox(width: 8),
        ClipOval(
          child: Image.asset(
            AppAssets.avatarPlace,
            width: 36,
            height: 36,
            fit: BoxFit.cover,
          ),
        ),
      ],
    );
  }
}

class _SystemJoinNotice extends StatelessWidget {
  const _SystemJoinNotice({required this.name});

  final String name;

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        style: const TextStyle(fontSize: 13, height: 1.3),
        children: [
          TextSpan(
            text: name,
            style: const TextStyle(
              color: Color(0xFF1CFF8A),
              fontWeight: FontWeight.w600,
            ),
          ),
          const TextSpan(
            text: ' joined the community',
            style: TextStyle(
              color: AppColors.textTertiary,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
      textAlign: TextAlign.center,
    );
  }
}

class _PhotosPlaceholder extends StatelessWidget {
  const _PhotosPlaceholder({required this.isJoined});

  final bool isJoined;

  @override
  Widget build(BuildContext context) {
    if (isJoined) {
      return const Center(
        child: Text(
          'No photos yet~',
          style: TextStyle(
            color: AppColors.textTertiary,
            fontSize: 15,
          ),
        ),
      );
    }

    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              AppAssets.groupUnjoinedLock,
              width: 140,
              height: 140,
              fit: BoxFit.contain,
            ),
            const SizedBox(height: 20),
            const Text(
              'Want to see everything?\nJoin the group!',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color(0xFF9A9A9A),
                fontSize: 15,
                fontWeight: FontWeight.w400,
                height: 1.45,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _JoinCommunityBar extends StatelessWidget {
  const _JoinCommunityBar({
    required this.bottomInset,
    required this.onTap,
  });

  final double bottomInset;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: Colors.white,
      child: Padding(
        padding: EdgeInsets.fromLTRB(16, 10, 16, 10 + bottomInset),
        child: Material(
          color: const Color(0xFF1CFF8A),
          borderRadius: BorderRadius.circular(28),
          child: InkWell(
            onTap: onTap,
            borderRadius: BorderRadius.circular(28),
            child: const SizedBox(
              height: 52,
              child: Center(
                child: Text(
                  'Join Community',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 17,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _ChatInputBar extends StatelessWidget {
  const _ChatInputBar({required this.bottomInset});

  final double bottomInset;

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: Colors.white,
      child: Padding(
        padding: EdgeInsets.fromLTRB(12, 8, 12, 8 + bottomInset),
        child: Container(
          height: 48,
          padding: const EdgeInsets.symmetric(horizontal: 12),
          decoration: BoxDecoration(
            color: const Color(0xFFF0F0F0),
            borderRadius: BorderRadius.circular(24),
          ),
          child: Row(
            children: [
              Image.asset(
                AppAssets.inputVoice,
                width: 24,
                height: 24,
                color: const Color(0xFF8A8A8A),
              ),
              const SizedBox(width: 10),
              const Expanded(
                child: Text(
                  'Please type here...',
                  style: TextStyle(
                    color: Color(0xFF9A9A9A),
                    fontSize: 15,
                  ),
                ),
              ),
              Image.asset(
                AppAssets.inputImage,
                width: 24,
                height: 24,
                color: const Color(0xFF8A8A8A),
              ),
              const SizedBox(width: 12),
              Image.asset(
                AppAssets.inputEmoji,
                width: 24,
                height: 24,
                color: const Color(0xFF8A8A8A),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
