import 'dart:async';

import 'package:flutter/material.dart';

import '../../core/network/network_bootstrap.dart';
import '../../core/widgets/app_tip_dialog.dart';
import '../../core/widgets/center_toast.dart';
import '../chats/chat_detail_page.dart';
import '../chats/data/chats_list_controller.dart';
import '../chats/models/chat_conversation.dart';
import '../chats/widgets/gift_bottom_sheet.dart';
import '../me/data/user_dto.dart';
import '../profile/widgets/user_profile_scaffold.dart';
import '../report/report_page.dart';
import 'models/chat_user_profile.dart';

class ChatUserProfilePage extends StatefulWidget {
  const ChatUserProfilePage({
    super.key,
    required this.profile,
    this.chatsController,
  });

  final ChatUserProfile profile;
  final ChatsListController? chatsController;

  @override
  State<ChatUserProfilePage> createState() => _ChatUserProfilePageState();
}

class _ChatUserProfilePageState extends State<ChatUserProfilePage> {
  late ChatUserProfile _profile;
  late bool _following;
  bool _blocked = false;
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    _profile = widget.profile;
    _following = widget.profile.isFollowing;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      unawaited(_loadProfile());
    });
  }

  String get _bioText {
    if (_profile.bio.trim().isNotEmpty) return _profile.bio;
    return _profile.isMale
        ? 'He has not set up his personal signature yet.'
        : 'She has not set up her personal signature yet.';
  }

  List<ProfileFlavorTag>? get _flavors {
    if (_profile.tags.isEmpty) return const [];
    return [
      for (final tag in _profile.tags) ProfileFlavorTag(label: tag),
    ];
  }

  List<String> get _momentUrls {
    if (_profile.momentUrls.isNotEmpty) return _profile.momentUrls;
    final avatar = _profile.avatarUrl;
    if (avatar != null && avatar.isNotEmpty) return [avatar];
    return const [];
  }

  Future<void> _loadProfile() async {
    final uid = _profile.userId.isNotEmpty ? _profile.userId : _profile.id;
    if (uid.isEmpty) {
      setState(() => _loading = false);
      return;
    }
    try {
      final infoRes = await NetworkBootstrap.api.userInfoByUid(uid);
      if (!mounted) return;
      final parsed = UserDto.parseChatProfile(infoRes);
      if (parsed != null) {
        setState(() {
          _profile = parsed.copyWith(
            giftUnlocked: _profile.giftUnlocked,
            giftTotal: _profile.giftTotal,
          );
          _following = parsed.isFollowing;
        });
      }

      final giftRes = await NetworkBootstrap.api.giftWallList(uid);
      if (!mounted) return;
      final data = giftRes.data;
      if (giftRes.success && data is Map) {
        final levelInfo = data['levelInfo'];
        if (levelInfo is Map) {
          setState(() {
            _profile = _profile.copyWith(
              giftUnlocked:
                  int.tryParse('${levelInfo['receiveGift']}') ?? 0,
              giftTotal: int.tryParse('${levelInfo['totalGift']}') ?? 0,
            );
          });
        }
      }
    } catch (_) {
      // Keep seed profile from list if refresh fails.
    } finally {
      if (mounted) setState(() => _loading = false);
    }
  }

  void _openReport() {
    Navigator.of(
      context,
    ).push(MaterialPageRoute<void>(builder: (_) => const ReportPage()));
  }

  void _openChat() {
    final conversation = ChatConversation(
      id: 'dm_${_profile.id}',
      title: _profile.nickname,
      avatarAsset: _profile.avatarAsset,
      lastMessage: '',
      timeLabel: 'Just',
      isMale: _profile.isMale,
      signature: _profile.bio,
      zodiac: _profile.zodiac,
      isFollowing: _following,
      momentAssets: _profile.momentAssets,
    );
    widget.chatsController?.upsertPrivateChat(conversation);
    Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder: (_) => ChatDetailPage(
          conversation: conversation,
          chatsController: widget.chatsController,
        ),
      ),
    );
  }

  Future<void> _toggleFollow() async {
    final uid = _profile.userId.isNotEmpty ? _profile.userId : _profile.id;
    try {
      final res = _following
          ? await NetworkBootstrap.api.unfollowUser(uid)
          : await NetworkBootstrap.api.followUser(uid);
      if (!mounted) return;
      if (!res.success) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              res.message.isEmpty ? 'Action failed' : res.message,
            ),
            behavior: SnackBarBehavior.floating,
          ),
        );
        return;
      }
      setState(() => _following = !_following);
    } catch (error) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Action failed: $error'),
          behavior: SnackBarBehavior.floating,
        ),
      );
    }
  }

  Future<void> _openMoreMenu() async {
    final action = await showModalBottomSheet<_ProfileMoreAction>(
      context: context,
      backgroundColor: Colors.transparent,
      barrierColor: Colors.black.withValues(alpha: 0.55),
      builder: (context) =>
          _ProfileMoreSheet(following: _following, blocked: _blocked),
    );
    if (!mounted || action == null) return;
    switch (action) {
      case _ProfileMoreAction.follow:
        await _toggleFollow();
      case _ProfileMoreAction.report:
        _openReport();
      case _ProfileMoreAction.block:
        await _toggleBlock();
      case _ProfileMoreAction.cancel:
        break;
    }
  }

  Future<void> _toggleBlock() async {
    if (_blocked) {
      setState(() => _blocked = false);
      if (!mounted) return;
      showCenterToast(
        context,
        message: 'The user is removed from the block list.',
      );
      return;
    }

    final confirmed = await AppTipDialog.confirmBlockUser(context);
    if (!mounted || !confirmed) return;
    setState(() {
      _blocked = true;
      _following = false;
    });
    showCenterToast(context, message: 'The other user has been blocked.');
  }

  Widget _buildBottomBar() {
    if (_following) {
      return Row(
        children: [
          Expanded(
            child: ProfilePrimaryAction(label: 'Chat', onTap: _openChat),
          ),
          const SizedBox(width: 10),
          ProfileGiftAction(onTap: () => showGiftBottomSheet(context)),
        ],
      );
    }

    return Row(
      children: [
        Expanded(
          child: ProfilePrimaryAction(
            label: 'Follow',
            onTap: () => unawaited(_toggleFollow()),
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: ProfileOutlineAction(label: 'Chat', onTap: _openChat),
        ),
        const SizedBox(width: 10),
        ProfileGiftAction(onTap: () => showGiftBottomSheet(context)),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        UserProfileScaffold(
          nickname: _profile.nickname.isEmpty ? 'User' : _profile.nickname,
          userId: _profile.userId,
          avatarAsset: _profile.avatarAsset,
          avatarUrl: _profile.avatarUrl,
          isMale: _profile.isMale,
          age: _profile.age,
          zodiac: _profile.zodiac,
          level: _profile.level,
          bio: _bioText,
          voiceSeconds: _profile.voiceSeconds,
          momentUrls: _momentUrls,
          flavors: _flavors,
          giftUnlocked: _profile.giftUnlocked,
          giftTotal: _profile.giftTotal,
          inPartyName: _profile.inPartyName,
          showMore: true,
          onMore: _openMoreMenu,
          bottomBar: _buildBottomBar(),
        ),
        if (_loading)
          const Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: LinearProgressIndicator(
              minHeight: 2,
              color: Color(0xFFB6FF2E),
              backgroundColor: Colors.transparent,
            ),
          ),
      ],
    );
  }
}

enum _ProfileMoreAction { follow, report, block, cancel }

class _ProfileMoreSheet extends StatelessWidget {
  const _ProfileMoreSheet({required this.following, required this.blocked});

  final bool following;
  final bool blocked;

  @override
  Widget build(BuildContext context) {
    final bottom = MediaQuery.paddingOf(context).bottom;

    return Padding(
      padding: EdgeInsets.fromLTRB(12, 0, 12, 12 + bottom),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            decoration: BoxDecoration(
              color: const Color(0xFF2A2A2A),
              borderRadius: BorderRadius.circular(14),
            ),
            child: Column(
              children: [
                _MoreItem(
                  label: following ? 'Unfollow' : 'Follow',
                  onTap: () =>
                      Navigator.pop(context, _ProfileMoreAction.follow),
                ),
                const Divider(height: 1, color: Color(0xFF3A3A3A)),
                _MoreItem(
                  label: 'Report',
                  onTap: () =>
                      Navigator.pop(context, _ProfileMoreAction.report),
                ),
                const Divider(height: 1, color: Color(0xFF3A3A3A)),
                _MoreItem(
                  label: blocked ? 'Unblock' : 'Block',
                  destructive: !blocked,
                  onTap: () =>
                      Navigator.pop(context, _ProfileMoreAction.block),
                ),
              ],
            ),
          ),
          const SizedBox(height: 8),
          Material(
            color: const Color(0xFF2A2A2A),
            borderRadius: BorderRadius.circular(14),
            child: InkWell(
              borderRadius: BorderRadius.circular(14),
              onTap: () => Navigator.pop(context, _ProfileMoreAction.cancel),
              child: const SizedBox(
                height: 52,
                width: double.infinity,
                child: Center(
                  child: Text(
                    'Cancel',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _MoreItem extends StatelessWidget {
  const _MoreItem({
    required this.label,
    required this.onTap,
    this.destructive = false,
  });

  final String label;
  final VoidCallback onTap;
  final bool destructive;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: SizedBox(
        height: 52,
        width: double.infinity,
        child: Center(
          child: Text(
            label,
            style: TextStyle(
              color: destructive ? const Color(0xFFFF5A5A) : Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}
