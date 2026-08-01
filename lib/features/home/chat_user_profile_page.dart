import 'package:flutter/material.dart';

import '../../core/widgets/app_tip_dialog.dart';
import '../../core/widgets/center_toast.dart';
import '../chats/chat_detail_page.dart';
import '../chats/data/chats_list_controller.dart';
import '../chats/models/chat_conversation.dart';
import '../chats/widgets/gift_bottom_sheet.dart';
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
  bool _following = false;
  bool _blocked = false;

  ChatUserProfile get _profile => widget.profile;

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
        setState(() => _following = !_following);
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
            onTap: () => setState(() => _following = true),
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
    return UserProfileScaffold(
      nickname: _profile.nickname,
      userId: _profile.userId,
      avatarAsset: _profile.avatarAsset,
      isMale: _profile.isMale,
      age: _profile.age,
      zodiac: _profile.zodiac,
      level: _profile.level,
      bio: _profile.bio,
      voiceSeconds: _profile.voiceSeconds,
      momentAssets: _profile.momentAssets,
      giftUnlocked: _profile.giftUnlocked,
      giftTotal: _profile.giftTotal,
      inPartyName: 'Masquerade Ball',
      showMore: true,
      onMore: _openMoreMenu,
      bottomBar: _buildBottomBar(),
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
          DecoratedBox(
            decoration: BoxDecoration(
              color: const Color(0xFF2C2C2E),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                _ProfileMoreItem(
                  label: following ? 'Unfollow' : 'Follow',
                  onTap: () =>
                      Navigator.of(context).pop(_ProfileMoreAction.follow),
                ),
                const Divider(
                  height: 1,
                  thickness: 0.5,
                  color: Color(0xFF3A3A3C),
                ),
                _ProfileMoreItem(
                  label: 'Report',
                  onTap: () =>
                      Navigator.of(context).pop(_ProfileMoreAction.report),
                ),
                const Divider(
                  height: 1,
                  thickness: 0.5,
                  color: Color(0xFF3A3A3C),
                ),
                _ProfileMoreItem(
                  label: blocked ? 'Unblock' : 'Block',
                  onTap: () =>
                      Navigator.of(context).pop(_ProfileMoreAction.block),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          Material(
            color: const Color(0xFF3A3A3C),
            borderRadius: BorderRadius.circular(16),
            child: InkWell(
              borderRadius: BorderRadius.circular(16),
              onTap: () => Navigator.of(context).pop(_ProfileMoreAction.cancel),
              child: const SizedBox(
                height: 56,
                width: double.infinity,
                child: Center(
                  child: Text(
                    'Cancel',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 17,
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

class _ProfileMoreItem extends StatelessWidget {
  const _ProfileMoreItem({required this.label, required this.onTap});

  final String label;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: SizedBox(
        height: 56,
        width: double.infinity,
        child: Center(
          child: Text(
            label,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 17,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }
}
