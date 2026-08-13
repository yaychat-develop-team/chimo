import 'dart:async';

import 'package:flutter/material.dart';

import '../../core/constants/app_assets.dart';
import '../../core/im/im_system_accounts.dart';
import '../../core/network/app_apis.dart';
import '../../core/theme/app_colors.dart';
import '../../core/widgets/app_tip_dialog.dart';
import '../../core/widgets/app_top_loading_bar.dart';
import '../friends/friends_page.dart';
import '../home/chat_user_profile_page.dart';
import '../home/group_details_page.dart';
import '../home/models/chat_user_profile.dart';
import '../home/models/group_item.dart';
import '../me/models/me_models.dart';
import '../profile/edit/edit_profile_page.dart';
import 'chat_detail_page.dart';
import 'data/chats_list_controller.dart';
import 'im_search_page.dart';
import 'models/chat_conversation.dart';
import 'widgets/chats_app_bar.dart';
import 'widgets/chats_conversation_tile.dart';
import 'widgets/chats_empty_state.dart';
import 'widgets/chats_promo_banner.dart';

/// 会话列表：应用栏、可关闭推广横幅、列表或空态。
class ChatsPage extends StatefulWidget {
  const ChatsPage({super.key, required this.controller});

  /// 与壳层共用；未读角标由此推导。
  final ChatsListController controller;

  @override
  State<ChatsPage> createState() => _ChatsPageState();
}

class _ChatsPageState extends State<ChatsPage> {
  bool _showPromo = true;
  bool _promoOpening = false;
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
              category: item.category.isEmpty ? 'Community' : item.category,
              description: item.groupDescription,
              avatarAsset: item.avatarAsset,
              avatarUrl: item.avatarUrl,
              memberCount: item.memberCount,
              postCount: item.postCount,
              level: item.level,
              isJoined: stillJoined,
            ),
            chatsController: _controller,
          ),
        ),
      );
      return;
    }

    // 「新朋友」系统账号 → 通讯录（粉丝），不是空白私聊。
    final em = item.emUserName.isNotEmpty
        ? item.emUserName
        : (item.id.startsWith('sys_')
            ? item.id.substring(4)
            : item.id.startsWith('dm_')
                ? item.id.substring(3)
                : '');
    if (item.isSystem && ImSystemAccounts.isNewFriends(em)) {
      Navigator.of(context).push(
        MaterialPageRoute<void>(
          builder: (_) =>
              const FriendsPage(initialTab: FriendsTab.followers),
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
    if (item.isSystem) return false;
    if (item.id.startsWith('system_') ||
        item.id.startsWith('official_') ||
        item.id.startsWith('sys_')) {
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
    final em = item.emUserName.isNotEmpty
        ? item.emUserName
        : (uid.startsWith('yqdf-') || uid.contains('yqdf') ? uid : '');
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
      emUsername: em,
    );

    Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder: (_) =>
            ChatUserProfilePage(profile: profile, chatsController: _controller),
      ),
    );
  }

  Future<void> _openPromoCompleteProfile() async {
    if (_promoOpening) return;
    _promoOpening = true;
    try {
      MeProfile profile = MeProfile.empty;
      try {
        final res = await AppApis.user.profileOrNull();
        profile = res.data ?? profile;
      } catch (_) {}
      if (!mounted) return;
      await Navigator.of(context).push(
        MaterialPageRoute<void>(
          builder: (_) => EditProfilePage(profile: profile),
        ),
      );
    } finally {
      _promoOpening = false;
    }
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
                      builder: (_) => ImSearchPage(
                        chatsController: _controller,
                      ),
                    ),
                  );
                },
              ),
              if (_showPromo)
                ChatsPromoBanner(
                  onTap: _openPromoCompleteProfile,
                  onClose: () => setState(() => _showPromo = false),
                ),
              if (_controller.loading) const AppTopLoadingBar(),
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
