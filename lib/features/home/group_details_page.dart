import 'dart:async';
import 'dart:io';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../core/constants/app_assets.dart';
import '../../core/network/network_bootstrap.dart';
import '../../core/theme/app_colors.dart';
import '../../core/widgets/app_tip_dialog.dart';
import '../../core/widgets/network_or_asset_avatar.dart';
import '../chats/data/chats_list_controller.dart';
import '../chats/models/chat_conversation.dart';
import '../report/report_page.dart';
import 'chat_user_profile_page.dart';
import 'models/chat_user_profile.dart';
import 'models/group_item.dart';
import 'widgets/group_chat_input_bar.dart';
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
  final List<_OutgoingMessage> _sentMessages = [];
  List<String> _photoAssets = const [];

  PopularGroupItem get _group => widget.group;

  @override
  void initState() {
    super.initState();
    unawaited(_loadPhotos());
  }

  Future<void> _loadPhotos() async {
    try {
      final res = await NetworkBootstrap.api.groupPhotos(_group.id);
      if (!mounted || !res.success) return;
      final urls = _parsePhotoUrls(res.data);
      if (urls.isEmpty) return;
      setState(() => _photoAssets = urls);
    } catch (_) {}
  }

  static List<String> _parsePhotoUrls(Object? data) {
    if (data is! Map) return const [];
    final list = data['groupPhotoList'] ?? data['photoList'] ?? data['list'];
    if (list is! List) return const [];
    final urls = <String>[];
    for (final item in list) {
      if (item is String) {
        final s = item.trim();
        if (s.isNotEmpty) urls.add(s);
        continue;
      }
      if (item is! Map) continue;
      final map = Map<String, dynamic>.from(item);
      final nested = map['photoList'];
      if (nested is List) {
        for (final p in nested) {
          final s = '$p'.trim();
          if (s.isNotEmpty) urls.add(s);
        }
        continue;
      }
      final url =
          '${map['url'] ?? map['photo'] ?? map['img'] ?? map['image'] ?? ''}'
              .trim();
      if (url.isNotEmpty) urls.add(url);
    }
    return urls;
  }

  @override
  void dispose() {
    _inputController.dispose();
    _messagesScroll.dispose();
    super.dispose();
  }

  Future<void> _join() async {
    if (_isJoined) return;
    setState(() => _isJoined = true);
    final joined = _group.copyWith(isJoined: true);
    widget.chatsController?.joinGroup(joined);
    widget.onMembershipChanged?.call(true);
    try {
      final res = await NetworkBootstrap.api.joinGroup([_group.id]);
      if (!mounted) return;
      if (!res.success) {
        setState(() => _isJoined = false);
        widget.chatsController?.leaveGroup(_group.id);
        widget.onMembershipChanged?.call(false);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(res.message.isEmpty ? 'Join failed' : res.message),
            behavior: SnackBarBehavior.floating,
          ),
        );
      }
    } catch (error) {
      if (!mounted) return;
      setState(() => _isJoined = false);
      widget.chatsController?.leaveGroup(_group.id);
      widget.onMembershipChanged?.call(false);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Join failed: $error'),
          behavior: SnackBarBehavior.floating,
        ),
      );
    }
  }

  Future<void> _leave() async {
    if (!_isJoined) return;
    setState(() => _isJoined = false);
    widget.chatsController?.leaveGroup(_group.id);
    widget.onMembershipChanged?.call(false);
    try {
      final res = await NetworkBootstrap.api.leaveGroup(_group.id);
      if (!mounted) return;
      if (!res.success) {
        setState(() => _isJoined = true);
        widget.chatsController?.joinGroup(_group.copyWith(isJoined: true));
        widget.onMembershipChanged?.call(true);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(res.message.isEmpty ? 'Leave failed' : res.message),
            behavior: SnackBarBehavior.floating,
          ),
        );
        return;
      }
      Navigator.of(context).pop();
    } catch (error) {
      if (!mounted) return;
      setState(() => _isJoined = true);
      widget.chatsController?.joinGroup(_group.copyWith(isJoined: true));
      widget.onMembershipChanged?.call(true);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Leave failed: $error'),
          behavior: SnackBarBehavior.floating,
        ),
      );
    }
  }

  void _scrollToBottom() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!_messagesScroll.hasClients) return;
      _messagesScroll.animateTo(
        _messagesScroll.position.maxScrollExtent,
        duration: const Duration(milliseconds: 240),
        curve: Curves.easeOut,
      );
    });
  }

  void _notifyNewMessage(String preview) {
    widget.chatsController?.onNewMessage(
      id: _group.id,
      title: _group.name,
      avatarAsset: _group.avatarAsset,
      lastMessage: preview,
      badge: ChatBadgeType.group,
    );
  }

  void _sendMessage([String? raw]) {
    final text = (raw ?? _inputController.text).trim();
    if (text.isEmpty || !_isJoined) return;
    setState(() {
      _sentMessages.add(_OutgoingMessage.text(text));
      _tabIndex = 0;
    });
    _inputController.clear();
    _notifyNewMessage(text);
    _scrollToBottom();
  }

  void _sendVoice(int seconds) {
    if (!_isJoined || seconds <= 0) return;
    setState(() {
      _sentMessages.add(_OutgoingMessage.voice(seconds));
      _tabIndex = 0;
    });
    _notifyNewMessage('[Voice] ${seconds}s');
    _scrollToBottom();
  }

  void _sendImages(List<String> paths) {
    if (!_isJoined || paths.isEmpty) return;
    final now = DateTime.now();
    setState(() {
      for (final path in paths) {
        _sentMessages.add(_OutgoingMessage.image(path, at: now));
      }
      _tabIndex = 0;
    });
    _notifyNewMessage(paths.length == 1 ? '[Image]' : '[Image] x${paths.length}');
    _scrollToBottom();
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

  void _openMembersSheet() {
    GroupMembersSheet.show(
      context,
      groupId: _group.id,
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
              child: NetworkOrAssetAvatar(
                asset: _group.avatarAsset,
                url: _group.avatarUrl,
                fit: BoxFit.cover,
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
                    onPhotoTap: _openPhotoViewer,
                  ),
                ),
              ),
              if (_isJoined)
                GroupChatInputBar(
                  bottomInset: bottomPadding,
                  controller: _inputController,
                  onSendText: _sendMessage,
                  onSendVoice: _sendVoice,
                  onSendImages: _sendImages,
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
            icon: SvgPicture.asset(
              AppAssets.msgMore,
              width: 22,
              height: 22,
              colorFilter: const ColorFilter.mode(
                AppColors.textPrimary,
                BlendMode.srcIn,
              ),
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
    final confirmed = await AppTipDialog.confirmLeaveGroup(context);
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
                child: NetworkOrAssetAvatar(
                  asset: group.avatarAsset,
                  url: group.avatarUrl,
                  width: 72,
                  height: 72,
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
    required this.onPhotoTap,
  });

  final int tabIndex;
  final bool isJoined;
  final List<_OutgoingMessage> sentMessages;
  final List<String> photos;
  final ScrollController messagesScroll;
  final ValueChanged<int> onTabChanged;
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
  });

  final bool isJoined;
  final List<_OutgoingMessage> sentMessages;
  final ScrollController scrollController;

  @override
  Widget build(BuildContext context) {
    // Group history is IM (EaseMob), not REST. Until SDK is wired, only show
    // messages composed in this session so the feed is never fake layout data.
    if (sentMessages.isEmpty) {
      return ListView(
        controller: scrollController,
        padding: const EdgeInsets.fromLTRB(16, 48, 16, 20),
        children: [
          Text(
            isJoined
                ? 'No messages yet'
                : 'Join the group to chat.\nHistory loads after IM is connected.',
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Color(0xFFAEAEAE),
              fontSize: 14,
              fontWeight: FontWeight.w500,
              height: 1.4,
            ),
          ),
        ],
      );
    }

    return ListView(
      controller: scrollController,
      padding: const EdgeInsets.fromLTRB(16, 12, 16, 20),
      children: [
        for (var i = 0; i < sentMessages.length; i++) ...[
          if (_shouldShowOutgoingTimestamp(sentMessages, i)) ...[
            SizedBox(height: i == 0 ? 0 : 14),
            _TimestampLabel(_formatChatTimestamp(sentMessages[i].sentAt)),
            const SizedBox(height: 10),
          ] else
            SizedBox(height: i == 0 ? 0 : 10),
          _SelfOutgoingBubble(
            message: sentMessages[i],
            showAvatar: i == 0 ||
                sentMessages[i].kind != sentMessages[i - 1].kind,
          ),
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
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: const TextStyle(
          color: Color(0xFFAEAEAE),
          fontSize: 12,
          fontWeight: FontWeight.w400,
          height: 1.2,
        ),
      ),
    );
  }
}


class _OutgoingKind { static const text = 0; static const voice = 1; static const image = 2; }

/// Show a time divider when first message or gap ≥ 5 minutes.
bool _shouldShowOutgoingTimestamp(List<_OutgoingMessage> list, int index) {
  if (index <= 0) return true;
  final prev = list[index - 1].sentAt;
  final curr = list[index].sentAt;
  return curr.difference(prev).abs() >= const Duration(minutes: 5);
}

String _formatChatTimestamp(DateTime time) {
  const months = <String>[
    'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun',
    'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec',
  ];
  final now = DateTime.now();
  final local = time.toLocal();
  final hour24 = local.hour;
  final period = hour24 >= 12 ? 'PM' : 'AM';
  final hour12 = hour24 % 12 == 0 ? 12 : hour24 % 12;
  final minute = local.minute.toString().padLeft(2, '0');
  final clock = '$hour12:$minute $period';

  final today = DateTime(now.year, now.month, now.day);
  final day = DateTime(local.year, local.month, local.day);
  final diffDays = today.difference(day).inDays;

  if (diffDays == 0) return clock;
  if (diffDays == 1) return 'Yesterday $clock';
  return '${months[local.month - 1]} ${local.day} $clock';
}

class _OutgoingMessage {
  const _OutgoingMessage._({
    required this.kind,
    required this.sentAt,
    this.text,
    this.voiceSeconds,
    this.imagePath,
  });

  factory _OutgoingMessage.text(String text, {DateTime? at}) =>
      _OutgoingMessage._(
        kind: _OutgoingKind.text,
        text: text,
        sentAt: at ?? DateTime.now(),
      );

  factory _OutgoingMessage.voice(int seconds, {DateTime? at}) =>
      _OutgoingMessage._(
        kind: _OutgoingKind.voice,
        voiceSeconds: seconds,
        sentAt: at ?? DateTime.now(),
      );

  factory _OutgoingMessage.image(String path, {DateTime? at}) =>
      _OutgoingMessage._(
        kind: _OutgoingKind.image,
        imagePath: path,
        sentAt: at ?? DateTime.now(),
      );

  final int kind;
  final DateTime sentAt;
  final String? text;
  final int? voiceSeconds;
  final String? imagePath;
}

class _SelfOutgoingBubble extends StatelessWidget {
  const _SelfOutgoingBubble({
    required this.message,
    this.showAvatar = true,
  });

  final _OutgoingMessage message;
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
          child: switch (message.kind) {
            _OutgoingKind.voice => _SelfVoiceBubble(
                seconds: message.voiceSeconds ?? 0,
              ),
            _OutgoingKind.image => ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(18),
                  topRight: Radius.circular(4),
                  bottomLeft: Radius.circular(18),
                  bottomRight: Radius.circular(18),
                ),
                child: _OutgoingImage(path: message.imagePath!),
              ),
            _ => Container(
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
                  message.text ?? '',
                  style: const TextStyle(
                    color: Color(0xFF111111),
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    height: 20 / 15,
                  ),
                ),
              ),
          },
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

class _OutgoingImage extends StatelessWidget {
  const _OutgoingImage({required this.path});

  final String path;

  bool get _isAsset => path.startsWith('assets/');

  @override
  Widget build(BuildContext context) {
    final error = Container(
      width: 180,
      height: 180,
      color: const Color(0xFFE8E8E8),
      alignment: Alignment.center,
      child: const Icon(Icons.broken_image_outlined),
    );
    if (_isAsset) {
      return Image.asset(
        path,
        width: 180,
        height: 180,
        fit: BoxFit.cover,
        errorBuilder: (_, _, _) => error,
      );
    }
    return Image.file(
      File(path),
      width: 180,
      height: 180,
      fit: BoxFit.cover,
      errorBuilder: (_, _, _) => error,
    );
  }
}

class _SelfVoiceBubble extends StatefulWidget {
  const _SelfVoiceBubble({required this.seconds});

  final int seconds;

  @override
  State<_SelfVoiceBubble> createState() => _SelfVoiceBubbleState();
}

class _SelfVoiceBubbleState extends State<_SelfVoiceBubble> {
  bool _playing = false;
  int _remaining = 0;
  Timer? _timer;

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void _toggle() {
    if (widget.seconds <= 0) return;
    if (_playing) {
      _timer?.cancel();
      setState(() {
        _playing = false;
        _remaining = 0;
      });
      return;
    }
    setState(() {
      _playing = true;
      _remaining = widget.seconds;
    });
    _timer = Timer.periodic(const Duration(seconds: 1), (t) {
      if (!mounted) {
        t.cancel();
        return;
      }
      if (_remaining <= 1) {
        t.cancel();
        setState(() {
          _playing = false;
          _remaining = 0;
        });
        return;
      }
      setState(() => _remaining -= 1);
    });
  }

  @override
  Widget build(BuildContext context) {
    final sec = _playing ? _remaining : widget.seconds;
    return GestureDetector(
      onTap: _toggle,
      child: Container(
        constraints: BoxConstraints(
          minWidth: 88,
          maxWidth: 88 + (widget.seconds.clamp(1, 60) * 1.6),
        ),
        height: 44,
        padding: const EdgeInsets.symmetric(horizontal: 14),
        decoration: const BoxDecoration(
          color: Color(0xFFB8FF6A),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(18),
            topRight: Radius.circular(4),
            bottomLeft: Radius.circular(18),
            bottomRight: Radius.circular(18),
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              _playing ? Icons.stop_rounded : Icons.play_arrow_rounded,
              size: 22,
              color: const Color(0xFF111111),
            ),
            const SizedBox(width: 6),
            Text(
              '$sec"',
              style: const TextStyle(
                color: Color(0xFF111111),
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
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
              child: _GroupPhotoImage(src: photos[index]),
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
                  child: _GroupPhotoImage(
                    src: widget.photos[index],
                    fit: BoxFit.contain,
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

class _GroupPhotoImage extends StatelessWidget {
  const _GroupPhotoImage({
    required this.src,
    this.fit = BoxFit.cover,
  });

  final String src;
  final BoxFit fit;

  bool get _isNetwork =>
      src.startsWith('http://') || src.startsWith('https://');

  @override
  Widget build(BuildContext context) {
    if (_isNetwork) {
      return Image.network(
        src,
        fit: fit,
        width: double.infinity,
        height: double.infinity,
        errorBuilder: (_, _, _) => const ColoredBox(color: Color(0xFF2C2C2E)),
      );
    }
    return Image.asset(
      src,
      fit: fit,
      errorBuilder: (_, _, _) => const SizedBox.shrink(),
    );
  }
}
