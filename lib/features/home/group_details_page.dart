import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../core/constants/app_assets.dart';
import '../../core/theme/app_colors.dart';
import '../chats/data/chats_list_controller.dart';
import '../chats/models/chat_conversation.dart';
import '../report/report_page.dart';
import 'chat_user_profile_page.dart';
import 'data/group_members_mock_data.dart';
import 'models/chat_user_profile.dart';
import 'models/group_item.dart';
import 'widgets/chat_user_profile_sheet.dart';
import 'widgets/group_level_badge.dart';
import 'widgets/group_members_sheet.dart';

/// Group chat page: not joined = limited view + Join; joined = messages + input.
class GroupDetailsPage extends StatefulWidget {
  const GroupDetailsPage({
    super.key,
    required this.group,
    this.chatsController,
    this.onMembershipChanged,
  });

  final PopularGroupItem group;

  /// On join, add chat session; on leave, update membership only, keep session.
  final ChatsListController? chatsController;

  /// Join-state callback (syncs home My Groups).
  final ValueChanged<bool>? onMembershipChanged;

  @override
  State<GroupDetailsPage> createState() => _GroupDetailsPageState();
}

class _GroupDetailsPageState extends State<GroupDetailsPage> {
  late bool _isJoined = widget.group.isJoined;
  bool _descExpanded = true;
  int _tabIndex = 0;
  final TextEditingController _inputController = TextEditingController();
  final ScrollController _messagesScroll = ScrollController();
  final List<String> _sentMessages = [];
  late final List<String> _photoAssets = [
    _group.avatarAsset,
    AppAssets.personalBg,
    AppAssets.homeRoomBg,
    AppAssets.launchBg,
    AppAssets.genderFemaleImg,
    AppAssets.genderMaleImg,
  ];

  PopularGroupItem get _group => widget.group;

  @override
  void dispose() {
    _inputController.dispose();
    _messagesScroll.dispose();
    super.dispose();
  }

  void _join() {
    if (_isJoined) return;
    setState(() => _isJoined = true);
    final joined = _group.copyWith(isJoined: true);
    widget.chatsController?.joinGroup(joined);
    widget.onMembershipChanged?.call(true);
  }

  void _leave() {
    if (!_isJoined) return;
    setState(() => _isJoined = false);
    // Leaving a group does not delete the chat session.
    widget.chatsController?.leaveGroup(_group.id);
    widget.onMembershipChanged?.call(false);
    Navigator.of(context).pop();
  }

  void _sendMessage([String? raw]) {
    final text = (raw ?? _inputController.text).trim();
    if (text.isEmpty || !_isJoined) return;
    setState(() {
      _sentMessages.add(text);
      _tabIndex = 0;
    });
    _inputController.clear();
    // After swipe-delete, a new message brings the session back to the list.
    widget.chatsController?.onNewMessage(
      id: _group.id,
      title: _group.name,
      avatarAsset: _group.avatarAsset,
      lastMessage: text,
      badge: ChatBadgeType.group,
    );
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!_messagesScroll.hasClients) return;
      _messagesScroll.animateTo(
        _messagesScroll.position.maxScrollExtent,
        duration: const Duration(milliseconds: 240),
        curve: Curves.easeOut,
      );
    });
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

  void _openUserProfile(ChatUserProfile profile) {
    ChatUserProfileSheet.show(
      context,
      profile: profile,
      chatsController: widget.chatsController,
    );
  }

  void _openMembersSheet() {
    GroupMembersSheet.show(
      context,
      onMemberTap: (member) {
        Navigator.of(context).pop();
        WidgetsBinding.instance.addPostFrameCallback((_) {
          if (!mounted) return;
          Navigator.of(context).push(
            MaterialPageRoute<void>(
              builder: (_) => ChatUserProfilePage(
                profile: ChatUserProfile.fromMember(member),
                chatsController: widget.chatsController,
              ),
            ),
          );
        });
      },
    );
  }

  void _openPhotoViewer(int initialIndex) {
    if (!_isJoined || _photoAssets.isEmpty) return;
    Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder: (_) => _GroupPhotoViewerPage(
          photos: _photoAssets,
          initialIndex: initialIndex,
        ),
      ),
    );
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
              _DetailsAppBar(
                group: _group,
                isJoined: _isJoined,
                descExpanded: _descExpanded,
                onMoreTap: _openMoreMenu,
                onToggleDesc: () =>
                    setState(() => _descExpanded = !_descExpanded),
              ),
              AnimatedSize(
                duration: const Duration(milliseconds: 280),
                curve: Curves.easeOutCubic,
                alignment: Alignment.topCenter,
                child: _descExpanded
                    ? _ProfileHeader(
                        group: _group,
                        isJoined: _isJoined,
                        onCollapse: () => setState(() => _descExpanded = false),
                        onMembersTap: _openMembersSheet,
                      )
                    : const SizedBox.shrink(),
              ),
              if (!_isJoined) const _MemberLimitBanner(),
              Expanded(
                child: ColoredBox(
                  color: _isJoined
                      ? AppColors.background
                      : _MemberLimitBanner.color,
                  child: _ChatBody(
                    tabIndex: _tabIndex,
                    isJoined: _isJoined,
                    sentMessages: _sentMessages,
                    photos: _photoAssets,
                    messagesScroll: _messagesScroll,
                    onTabChanged: (i) => setState(() => _tabIndex = i),
                    onPeerAvatarTap: _openUserProfile,
                    onPhotoTap: _openPhotoViewer,
                  ),
                ),
              ),
              if (_isJoined)
                _ChatInputBar(
                  bottomInset: bottomPadding,
                  controller: _inputController,
                  onSend: _sendMessage,
                )
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
  const _DetailsAppBar({
    required this.group,
    required this.isJoined,
    required this.descExpanded,
    required this.onMoreTap,
    required this.onToggleDesc,
  });

  final PopularGroupItem group;
  final bool isJoined;
  final bool descExpanded;
  final VoidCallback onMoreTap;
  final VoidCallback onToggleDesc;

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
          if (!descExpanded) ...[
            Flexible(
              child: Text(
                group.name,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  color: AppColors.textPrimary,
                  fontSize: 17,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            const SizedBox(width: 6),
            GroupLevelBadge(level: group.level),
            const SizedBox(width: 8),
            _DescToggleChip(
              expanded: false,
              joinedStyle: isJoined,
              onTap: onToggleDesc,
            ),
          ],
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

/// Description expand/collapse chip; joined style uses dark green bg + bright green text.
class _DescToggleChip extends StatelessWidget {
  const _DescToggleChip({
    required this.expanded,
    required this.joinedStyle,
    required this.onTap,
  });

  final bool expanded;
  final bool joinedStyle;
  final VoidCallback onTap;

  static const Color _joinedBg = Color(0xFF1A3A28);
  static const Color _joinedFg = Color(0xFFB8FF6A);

  @override
  Widget build(BuildContext context) {
    final bg = joinedStyle
        ? _joinedBg
        : Colors.white.withValues(alpha: 0.12);
    final fg = joinedStyle ? _joinedFg : AppColors.textPrimary;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.fromLTRB(12, 5, 8, 5),
        decoration: BoxDecoration(
          color: bg,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              expanded ? 'See Less' : 'See More',
              style: TextStyle(
                color: fg,
                fontSize: 12,
                fontWeight: FontWeight.w600,
              ),
            ),
            Icon(
              expanded ? Icons.arrow_drop_up : Icons.arrow_drop_down,
              color: fg,
              size: 20,
            ),
          ],
        ),
      ),
    );
  }
}

/// Joined group: top-right more sheet (Report / Leave Group).
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

/// Leave group confirmation dialog.
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
    required this.isJoined,
    required this.onCollapse,
    required this.onMembersTap,
  });

  final PopularGroupItem group;
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
                        borderRadius: BorderRadius.circular(20),
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
                        GestureDetector(
                          onTap: onMembersTap,
                          behavior: HitTestBehavior.opaque,
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Image.asset(
                                AppAssets.homePerson,
                                width: 11,
                                height: 11,
                              ),
                              const SizedBox(width: 3),
                              Text(
                                '${group.memberCount}',
                                style: const TextStyle(
                                  color: AppColors.textTertiary,
                                  fontSize: 11,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 12),
                        Image.asset(
                          AppAssets.homeImg,
                          width: 11,
                          height: 11,
                        ),
                        const SizedBox(width: 3),
                        Text(
                          '${group.postCount}',
                          style: const TextStyle(
                            color: AppColors.textTertiary,
                            fontSize: 11,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Text(
            group.description,
            style: const TextStyle(
              color: AppColors.textSecondary,
              fontSize: 14,
              height: 1.4,
            ),
          ),
          const SizedBox(height: 12),
          Center(
            child: _DescToggleChip(
              expanded: true,
              joinedStyle: isJoined,
              onTap: onCollapse,
            ),
          ),
        ],
      ),
    );
  }
}

class _MemberLimitBanner extends StatelessWidget {
  const _MemberLimitBanner();

  /// Matches the color peeking behind the white rounded panel.
  static const Color color = Color(0xFF1A3A28);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
      decoration: const BoxDecoration(
        color: color,
        borderRadius: BorderRadius.vertical(top: Radius.circular(22)),
      ),
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
    required this.sentMessages,
    required this.photos,
    required this.messagesScroll,
    required this.onTabChanged,
    required this.onPeerAvatarTap,
    required this.onPhotoTap,
  });

  final int tabIndex;
  final bool isJoined;
  final List<String> sentMessages;
  final List<String> photos;
  final ScrollController messagesScroll;
  final ValueChanged<int> onTabChanged;
  final ValueChanged<ChatUserProfile> onPeerAvatarTap;
  final ValueChanged<int> onPhotoTap;

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
                ? _MessagesFeed(
                    isJoined: isJoined,
                    sentMessages: sentMessages,
                    scrollController: messagesScroll,
                    onPeerAvatarTap: onPeerAvatarTap,
                  )
                : _PhotosGrid(
                    isJoined: isJoined,
                    photos: photos,
                    onPhotoTap: onPhotoTap,
                  ),
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
  const _MessagesFeed({
    required this.isJoined,
    required this.sentMessages,
    required this.scrollController,
    required this.onPeerAvatarTap,
  });

  final bool isJoined;
  final List<String> sentMessages;
  final ScrollController scrollController;
  final ValueChanged<ChatUserProfile> onPeerAvatarTap;

  static final _candy = ChatUserProfile.fromMember(
    GroupMembersMockData.members[0],
  );
  static final _priya = ChatUserProfile.fromMember(
    GroupMembersMockData.members[1],
  );

  @override
  Widget build(BuildContext context) {
    return ListView(
      controller: scrollController,
      padding: const EdgeInsets.fromLTRB(16, 12, 16, 20),
      children: [
        const _TimestampLabel('yesterday 6:01 AM'),
        const SizedBox(height: 12),
        _PeerMessageBubble(
          profile: _candy,
          text:
              'Hey everyone! Just managed to set up my new compost bin. Any pro-tips for a beginner? 🥕',
          showAvatar: true,
          onAvatarTap: () => onPeerAvatarTap(_candy),
        ),
        const SizedBox(height: 12),
        _PeerMessageBubble(
          profile: _priya,
          text: "That's awesome!",
          showAvatar: true,
          onAvatarTap: () => onPeerAvatarTap(_priya),
        ),
        if (!isJoined) ...[
          const SizedBox(height: 12),
          _PeerLockedImageBubble(
            profile: _candy,
            imageAsset: AppAssets.homeRoomBg,
            showAvatar: true,
            onAvatarTap: () => onPeerAvatarTap(_candy),
          ),
        ],
        const SizedBox(height: 16),
        const _SelfMessageBubble(text: '1'),
        if (isJoined) ...[
          const SizedBox(height: 16),
          const _TimestampLabel('1:35 AM'),
          const SizedBox(height: 10),
          const _SystemJoinNotice(name: 'P-2083172'),
        ],
        for (var i = 0; i < sentMessages.length; i++) ...[
          SizedBox(height: i == 0 ? 16 : 4),
          _SelfMessageBubble(text: sentMessages[i], showAvatar: i == 0),
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

class _PeerMessageBubble extends StatelessWidget {
  const _PeerMessageBubble({
    required this.profile,
    required this.text,
    required this.showAvatar,
    required this.onAvatarTap,
  });

  final ChatUserProfile profile;
  final String text;
  final bool showAvatar;
  final VoidCallback onAvatarTap;

  static const double _avatar = 40;
  static const double _avatarGap = 10;
  static const double _bubbleMax = 243;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (showAvatar)
          GestureDetector(
            onTap: onAvatarTap,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(
                profile.avatarAsset,
                width: _avatar,
                height: _avatar,
                fit: BoxFit.cover,
              ),
            ),
          )
        else
          const SizedBox(width: _avatar),
        const SizedBox(width: _avatarGap),
        Flexible(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Flexible(
                    child: Text(
                      profile.nickname,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        color: Color(0xFF666666),
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  const SizedBox(width: 4),
                  Image.asset(
                    profile.isMale
                        ? AppAssets.genderMan
                        : AppAssets.genderWoman,
                    width: 14,
                    height: 14,
                  ),
                ],
              ),
              const SizedBox(height: 4),
              ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: _bubbleMax),
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 14,
                  ),
                  decoration: const BoxDecoration(
                    color: Color(0xFFF0F0F0),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(4),
                      topRight: Radius.circular(18),
                      bottomLeft: Radius.circular(18),
                      bottomRight: Radius.circular(18),
                    ),
                  ),
                  child: Text(
                    text,
                    style: const TextStyle(
                      color: Color(0xFF111111),
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      height: 20 / 15,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

/// Not joined: blurred locked image message + Join to view.
class _PeerLockedImageBubble extends StatelessWidget {
  const _PeerLockedImageBubble({
    required this.profile,
    required this.imageAsset,
    required this.showAvatar,
    required this.onAvatarTap,
  });

  final ChatUserProfile profile;
  final String imageAsset;
  final bool showAvatar;
  final VoidCallback onAvatarTap;

  static const double _avatar = 40;
  static const double _avatarGap = 10;
  static const double _size = 180;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (showAvatar)
          GestureDetector(
            onTap: onAvatarTap,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(
                profile.avatarAsset,
                width: _avatar,
                height: _avatar,
                fit: BoxFit.cover,
              ),
            ),
          )
        else
          const SizedBox(width: _avatar),
        const SizedBox(width: _avatarGap),
        Flexible(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Flexible(
                    child: Text(
                      profile.nickname,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        color: Color(0xFF666666),
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  const SizedBox(width: 4),
                  Image.asset(
                    profile.isMale
                        ? AppAssets.genderMan
                        : AppAssets.genderWoman,
                    width: 14,
                    height: 14,
                  ),
                ],
              ),
              const SizedBox(height: 4),
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(4),
                  topRight: Radius.circular(16),
                  bottomLeft: Radius.circular(16),
                  bottomRight: Radius.circular(16),
                ),
                child: SizedBox(
                  width: _size,
                  height: _size,
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      ImageFiltered(
                        imageFilter: ImageFilter.blur(sigmaX: 14, sigmaY: 14),
                        child: Transform.scale(
                          scale: 1.08,
                          child: Image.asset(imageAsset, fit: BoxFit.cover),
                        ),
                      ),
                      Positioned(
                        left: 0,
                        right: 0,
                        bottom: 0,
                        child: ColoredBox(
                          color: Colors.black.withValues(alpha: 0.48),
                          child: SizedBox(
                            height: 40,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SvgPicture.asset(
                                  AppAssets.lockIcon,
                                  width: 13,
                                  height: 14,
                                ),
                                const SizedBox(width: 6),
                                const Text(
                                  'Join to view',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 13,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _SelfMessageBubble extends StatelessWidget {
  const _SelfMessageBubble({required this.text, this.showAvatar = true});

  final String text;
  final bool showAvatar;

  static const double _avatar = 40;
  static const double _avatarGap = 10;
  static const double _bubbleMax = 260;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: _bubbleMax),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
            decoration: const BoxDecoration(
              color: Color(0xFFB8FF6A),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(18),
                topRight: Radius.circular(4),
                bottomLeft: Radius.circular(18),
                bottomRight: Radius.circular(18),
              ),
            ),
            child: Text(
              text,
              style: const TextStyle(
                color: Color(0xFF111111),
                fontSize: 15,
                fontWeight: FontWeight.w500,
                height: 20 / 15,
              ),
            ),
          ),
        ),
        const SizedBox(width: _avatarGap),
        if (showAvatar)
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.asset(
              AppAssets.avatarPlace,
              width: _avatar,
              height: _avatar,
              fit: BoxFit.cover,
            ),
          )
        else
          const SizedBox(width: _avatar),
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

class _PhotosGrid extends StatelessWidget {
  const _PhotosGrid({
    required this.isJoined,
    required this.photos,
    required this.onPhotoTap,
  });

  final bool isJoined;
  final List<String> photos;
  final ValueChanged<int> onPhotoTap;

  @override
  Widget build(BuildContext context) {
    if (isJoined) {
      return GridView.builder(
        padding: const EdgeInsets.fromLTRB(16, 14, 16, 20),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          mainAxisSpacing: 8,
          crossAxisSpacing: 8,
          childAspectRatio: 1,
        ),
        itemCount: photos.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () => onPhotoTap(index),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(
                photos[index],
                fit: BoxFit.cover,
              ),
            ),
          );
        },
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

class _GroupPhotoViewerPage extends StatefulWidget {
  const _GroupPhotoViewerPage({
    required this.photos,
    required this.initialIndex,
  });

  final List<String> photos;
  final int initialIndex;

  @override
  State<_GroupPhotoViewerPage> createState() => _GroupPhotoViewerPageState();
}

class _GroupPhotoViewerPageState extends State<_GroupPhotoViewerPage> {
  late final PageController _pageController = PageController(
    initialPage: widget.initialIndex,
  );
  late int _currentIndex = widget.initialIndex;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final top = MediaQuery.paddingOf(context).top;
    final total = widget.photos.length;

    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          PageView.builder(
            controller: _pageController,
            itemCount: total,
            onPageChanged: (index) => setState(() => _currentIndex = index),
            itemBuilder: (context, index) {
              return InteractiveViewer(
                minScale: 1,
                maxScale: 4,
                child: Center(
                  child: Image.asset(
                    widget.photos[index],
                    fit: BoxFit.contain,
                    errorBuilder: (_, _, _) => const SizedBox.shrink(),
                  ),
                ),
              );
            },
          ),
          Positioned(
            top: top + 4,
            left: 8,
            right: 8,
            child: SizedBox(
              height: 44,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: IconButton(
                      onPressed: () => Navigator.of(context).pop(),
                      icon: SvgPicture.asset(
                        AppAssets.chatBack,
                        width: 17,
                        height: 7,
                      ),
                    ),
                  ),
                  Text(
                    '${_currentIndex + 1}/$total',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
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

class _ChatInputBar extends StatefulWidget {
  const _ChatInputBar({
    required this.bottomInset,
    required this.controller,
    required this.onSend,
  });

  final double bottomInset;
  final TextEditingController controller;
  final ValueChanged<String> onSend;

  @override
  State<_ChatInputBar> createState() => _ChatInputBarState();
}

class _ChatInputBarState extends State<_ChatInputBar> {
  /// Black-bg gray-line asset: use luminance as alpha so `color` won't fill black as solid.
  static const ColorFilter _iconFilter = ColorFilter.matrix(<double>[
    0, 0, 0, 0, 90,
    0, 0, 0, 0, 90,
    0, 0, 0, 0, 90,
    0.333, 0.333, 0.333, 0, 0,
  ]);

  bool get _hasText => widget.controller.text.trim().isNotEmpty;

  @override
  void initState() {
    super.initState();
    widget.controller.addListener(_onTextChanged);
  }

  @override
  void dispose() {
    widget.controller.removeListener(_onTextChanged);
    super.dispose();
  }

  void _onTextChanged() => setState(() {});

  Widget _icon(String asset) {
    return ColorFiltered(
      colorFilter: _iconFilter,
      child: Image.asset(
        asset,
        width: 22,
        height: 22,
        fit: BoxFit.contain,
      ),
    );
  }

  void _submit() => widget.onSend(widget.controller.text);

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: Colors.white,
      child: Padding(
        padding: EdgeInsets.fromLTRB(12, 8, 12, 8 + widget.bottomInset),
        child: Container(
          constraints: const BoxConstraints(minHeight: 48),
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
          decoration: BoxDecoration(
            color: const Color(0xFFF0F0F0),
            borderRadius: BorderRadius.circular(24),
          ),
          child: Row(
            children: [
              _icon(AppAssets.inputVoice),
              const SizedBox(width: 8),
              Expanded(
                child: TextField(
                  controller: widget.controller,
                  minLines: 1,
                  maxLines: 4,
                  textInputAction: TextInputAction.send,
                  onSubmitted: (_) => _submit(),
                  style: const TextStyle(
                    color: Color(0xFF111111),
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                  ),
                  decoration: const InputDecoration(
                    isDense: true,
                    hintText: 'Please type here...',
                    hintStyle: TextStyle(
                      color: Color(0xFF9A9A9A),
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                    ),
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.symmetric(vertical: 10),
                  ),
                ),
              ),
              if (_hasText) ...[
                const SizedBox(width: 4),
                GestureDetector(
                  onTap: _submit,
                  child: Container(
                    width: 32,
                    height: 32,
                    decoration: const BoxDecoration(
                      color: Color(0xFF1CFF8A),
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.arrow_upward_rounded,
                      size: 18,
                      color: Colors.black,
                    ),
                  ),
                ),
              ] else ...[
                _icon(AppAssets.inputImage),
                const SizedBox(width: 10),
                _icon(AppAssets.inputEmoji),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
