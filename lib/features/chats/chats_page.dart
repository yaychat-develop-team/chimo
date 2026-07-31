import 'package:flutter/material.dart';

import '../../core/constants/app_assets.dart';
import '../../core/theme/app_colors.dart';
import '../../core/widgets/app_tip_dialog.dart';
import '../friends/add_user_page.dart';
import '../friends/friends_page.dart';
import '../home/chat_user_profile_page.dart';
import '../home/group_details_page.dart';
import '../home/models/chat_user_profile.dart';
import '../home/models/group_item.dart';
import 'chat_detail_page.dart';
import 'data/chats_list_controller.dart';
import 'models/chat_conversation.dart';
import 'widgets/chats_app_bar.dart';
import 'widgets/chats_conversation_tile.dart';
import 'widgets/chats_empty_state.dart';
import 'widgets/chats_promo_banner.dart';

/// Chats list: app bar, dismissible promo banner, list or empty state.
class ChatsPage extends StatefulWidget {
  const ChatsPage({super.key, required this.controller});

  /// Shared with shell; unread badge derived from this.
  final ChatsListController controller;

  @override
  State<ChatsPage> createState() => _ChatsPageState();
}

class _ChatsPageState extends State<ChatsPage> {
  bool _showPromo = true;
  final ValueNotifier<String?> _openSwipeId = ValueNotifier<String?>(null);

  ChatsListController get _controller => widget.controller;

  @override
  void initState() {
    super.initState();
    _controller.addListener(_onControllerChanged);
  }

  @override
  void didUpdateWidget(covariant ChatsPage oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.controller != widget.controller) {
      oldWidget.controller.removeListener(_onControllerChanged);
      widget.controller.addListener(_onControllerChanged);
    }
  }

  @override
  void dispose() {
    _controller.removeListener(_onControllerChanged);
    _openSwipeId.dispose();
    super.dispose();
  }

  void _onControllerChanged() {
    if (mounted) setState(() {});
  }

  void _togglePinConversation(ChatConversation item) {
    _controller.togglePin(item.id);
    _openSwipeId.value = null;
  }

  Future<void> _confirmDeleteConversation(ChatConversation item) async {
    final confirmed = await AppTipDialog.show(
      context,
      message: 'Are you sure you want to delete this conversation?',
    );
    if (!confirmed || !mounted) return;
    _controller.delete(item.id);
    _openSwipeId.value = null;
  }

  void _openConversation(ChatConversation item) {
    // Group row → group details; others → DM (same shell, different stream).
    if (item.badge == ChatBadgeType.group) {
      final stillJoined = _controller.isGroupJoined(item.id);
      Navigator.of(context).push(
        MaterialPageRoute<void>(
          builder: (_) => GroupDetailsPage(
            group: PopularGroupItem(
              id: item.id,
              name: item.title,
              category: 'Community',
              description: item.lastMessage,
              avatarAsset: item.avatarAsset,
              memberCount: 128,
              postCount: 36,
              level: 6,
              isJoined: stillJoined,
            ),
            chatsController: _controller,
          ),
        ),
      );
      return;
    }

    Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder: (_) =>
            ChatDetailPage(conversation: item, chatsController: _controller),
      ),
    );
  }

  void _openAvatarProfile(ChatConversation item) {
    // Groups have no profile; avatar tap same as row → group details.
    if (item.badge == ChatBadgeType.group) {
      _openConversation(item);
      return;
    }

    final profile = ChatUserProfile(
      id: item.id,
      nickname: item.title,
      userId: '47571${item.id.hashCode.abs() % 100000}'.padLeft(10, '0'),
      avatarAsset: item.avatarAsset,
      isMale: item.isMale,
      age: 24,
      zodiac: item.zodiac,
      level: 16,
      bio: item.signatureDisplay,
      voiceSeconds: 12,
      momentAssets: item.momentAssets,
    );

    Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder: (_) =>
            ChatUserProfilePage(profile: profile, chatsController: _controller),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final conversations = _controller.visibleConversations;
    final isEmpty = conversations.isEmpty;

    return ColoredBox(
      color: AppColors.background,
      child: DecoratedBox(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(AppAssets.msgBg),
            fit: BoxFit.cover,
            alignment: Alignment.topCenter,
          ),
        ),
        child: SafeArea(
          bottom: false,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ChatsAppBar(
                onContactsTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute<void>(
                      builder: (_) => const FriendsPage(),
                    ),
                  );
                },
                onSearchTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute<void>(
                      builder: (_) => const AddUserPage(),
                    ),
                  );
                },
              ),
              if (_showPromo)
                ChatsPromoBanner(
                  onClose: () => setState(() => _showPromo = false),
                ),
              Expanded(
                child: isEmpty
                    ? const ChatsEmptyState()
                    : NotificationListener<ScrollNotification>(
                        onNotification: (notification) {
                          if (notification is ScrollUpdateNotification &&
                              _openSwipeId.value != null) {
                            _openSwipeId.value = null;
                          }
                          return false;
                        },
                        child: ListView.builder(
                          padding: const EdgeInsets.only(top: 4, bottom: 16),
                          itemCount: conversations.length,
                          itemBuilder: (context, index) {
                            final item = conversations[index];
                            return ChatsConversationTile(
                              key: ValueKey(item.id),
                              conversation: item,
                              openSwipeId: _openSwipeId,
                              onPin: () => _togglePinConversation(item),
                              onDelete: () => _confirmDeleteConversation(item),
                              onTap: () => _openConversation(item),
                              onAvatarTap: () => _openAvatarProfile(item),
                            );
                          },
                        ),
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
