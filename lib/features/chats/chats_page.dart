import 'dart:async';

import 'package:flutter/material.dart';

import '../../core/constants/app_assets.dart';
import '../../core/network/network_bootstrap.dart';
import '../../core/theme/app_colors.dart';
import '../../core/widgets/app_tip_dialog.dart';
import '../friends/add_user_page.dart';
import '../friends/friends_page.dart';
import '../home/chat_user_profile_page.dart';
import '../home/group_details_page.dart';
import '../home/models/chat_user_profile.dart';
import '../home/models/group_item.dart';
import '../me/data/me_mock_data.dart';
import '../me/data/user_dto.dart';
import '../me/models/me_models.dart';
import '../profile/edit_profile_page.dart';
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
    WidgetsBinding.instance.addPostFrameCallback((_) {
      unawaited(_controller.refreshFromApi());
    });
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
    final confirmed = await AppTipDialog.confirmDeleteConversation(context);
    if (!confirmed || !mounted) return;
    _controller.delete(item.id);
    _openSwipeId.value = null;
  }

  void _openConversation(ChatConversation item) {
    _controller.markRead(item.id);

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
              avatarUrl: item.avatarUrl,
              memberCount: 0,
              postCount: 0,
              level: 1,
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

  bool _isPeerConversation(ChatConversation item) {
    if (item.badge == ChatBadgeType.group) return false;
    if (item.badge == ChatBadgeType.verified) return false;
    if (item.id.startsWith('system_') || item.id.startsWith('official_')) {
      return false;
    }
    return true;
  }

  void _openAvatarProfile(ChatConversation item) {
    if (!_isPeerConversation(item)) {
      _openConversation(item);
      return;
    }

    final uid = item.id.startsWith('dm_') ? item.id.substring(3) : item.id;
    final profile = ChatUserProfile(
      id: uid,
      nickname: item.title,
      userId: uid,
      avatarAsset: item.avatarAsset,
      avatarUrl: item.avatarUrl,
      isMale: item.isMale,
      age: 0,
      zodiac: item.zodiac,
      level: 1,
      bio: item.signature,
      isFollowing: item.isFollowing,
    );

    Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder: (_) =>
            ChatUserProfilePage(profile: profile, chatsController: _controller),
      ),
    );
  }

  Future<void> _openPromoCompleteProfile() async {
    MeProfile profile = MeMockData.profile;
    try {
      final res = await NetworkBootstrap.api.userInfo();
      profile = UserDto.parseProfile(res) ?? profile;
    } catch (_) {}
    if (!mounted) return;
    await Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder: (_) => EditProfilePage(profile: profile),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final conversations = _controller.visibleConversations;
    final isEmpty = conversations.isEmpty && !_controller.loading;

    return ColoredBox(
      color: AppColors.surface,
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
                  onTap: _openPromoCompleteProfile,
                  onClose: () => setState(() => _showPromo = false),
                ),
              if (_controller.loading)
                const LinearProgressIndicator(
                  minHeight: 2,
                  color: AppColors.primaryBright,
                  backgroundColor: Colors.transparent,
                ),
              Expanded(
                child: RefreshIndicator(
                  color: AppColors.primaryBright,
                  onRefresh: _controller.refreshFromApi,
                  child: isEmpty
                      ? ListView(
                          physics: const AlwaysScrollableScrollPhysics(),
                          children: [
                            SizedBox(
                              height: MediaQuery.sizeOf(context).height * 0.5,
                              child: _controller.loadError != null
                                  ? Center(
                                      child: Padding(
                                        padding: const EdgeInsets.all(24),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Text(
                                              _controller.loadError!,
                                              textAlign: TextAlign.center,
                                              style: const TextStyle(
                                                color: AppColors.textSecondary,
                                              ),
                                            ),
                                            TextButton(
                                              onPressed: () => unawaited(
                                                _controller.refreshFromApi(),
                                              ),
                                              child: const Text('Retry'),
                                            ),
                                          ],
                                        ),
                                      ),
                                    )
                                  : const ChatsEmptyState(),
                            ),
                          ],
                        )
                      : NotificationListener<ScrollNotification>(
                          onNotification: (notification) {
                            if (notification is ScrollUpdateNotification &&
                                _openSwipeId.value != null) {
                              _openSwipeId.value = null;
                            }
                            return false;
                          },
                          child: ListView.builder(
                            physics: const AlwaysScrollableScrollPhysics(),
                            padding: const EdgeInsets.only(top: 4, bottom: 16),
                            itemCount: conversations.length,
                            itemBuilder: (context, index) {
                              final item = conversations[index];
                              return ChatsConversationTile(
                                key: ValueKey(item.id),
                                conversation: item,
                                openSwipeId: _openSwipeId,
                                onPin: () => _togglePinConversation(item),
                                onDelete: () =>
                                    _confirmDeleteConversation(item),
                                onTap: () => _openConversation(item),
                                onAvatarTap: () => _openAvatarProfile(item),
                              );
                            },
                          ),
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
