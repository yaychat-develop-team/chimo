import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:fixnum/fixnum.dart';

import '../../../common/constants/app_assets.dart';
import '../../../common/im/im_system_accounts.dart';
import '../../../common/models/server_client/base.pbenum.dart';
import '../../../common/models/server_client/group/group.pb.dart';
import '../../../common/models/server_client/user.pb.dart';
import '../../../common/theme/app_colors.dart';
import '../../../common/widgets/app_top_loading_bar.dart';
import '../logic/chats_list_logic.dart';
import '../model/chat_conversation.dart';
import 'widgets/chats_app_bar.dart';
import 'widgets/chats_conversation_tile.dart';
import 'widgets/chats_empty_state.dart';
import 'widgets/chats_promo_banner.dart';
import '../../../common/widgets/app_image.dart';
import '../../../app/app_jumper.dart';
import '../../friends/model/friends_tab.dart';
import '../../../common/theme/app_dialog.dart';

/// 会话列表：应用栏、可关闭推广横幅、列表或空态。
class ChatsPage extends StatefulWidget {
  const ChatsPage({super.key});

  @override
  State<ChatsPage> createState() => _ChatsPageState();
}

class _ChatsPageState extends State<ChatsPage> {
  bool _showPromo = true;
  bool _promoOpening = false;
  final ValueNotifier<String?> _openSwipeId = ValueNotifier<String?>(null);

  final ChatsListLogic logic = Get.find<ChatsListLogic>();

  @override
  void initState() {
    super.initState();
    logic.addListener(_onControllerChanged);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      unawaited(logic.refreshFromApi());
    });
  }

  @override
  void dispose() {
    logic.removeListener(_onControllerChanged);
    _openSwipeId.dispose();
    super.dispose();
  }

  void _onControllerChanged() {
    if (mounted) setState(() {});
  }

  void _togglePinConversation(ChatConversation item) {
    logic.togglePin(item.id);
    _openSwipeId.value = null;
  }

  Future<void> _confirmDeleteConversation(ChatConversation item) async {
    final confirmed =
        await AppDialog.show(
          title: 'Tip',
          content: 'Are you sure you want to delete this conversation?',
          buttons: DialogLoyoutStyle.horizontal,
        ) ??
        false;
    if (!confirmed || !mounted) return;
    logic.delete(item.id);
    _openSwipeId.value = null;
  }

  void _openConversation(ChatConversation item) {
    logic.markRead(item.id);

    if (item.badge == ChatBadgeType.group) {
      final stillJoined = logic.isGroupJoined(item.id);
      AppJumper.toGroup(
        item.id,
        preview: GroupInfo(
          emGroupId: item.id,
          name: item.title,
          type: item.category.isEmpty ? 'Community' : item.category,
          desc: item.groupDescription,
          avatar: item.avatarUrl ?? '',
          memberCount: Int64(item.memberCount),
          picCount: Int64(item.postCount),
          level: item.level,
          isJoin: stillJoined,
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
      AppJumper.toFriends(initialTab: FriendsTab.followers);
      return;
    }

    AppJumper.toChat(item.id, preview: item);
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
    final numeric = int.tryParse(uid);
    final profile = User()
      ..nickname = item.title
      ..avatar = item.avatarUrl ?? ''
      ..gender = item.isMale ? 'male' : 'female'
      ..personalSignature = item.signature
      ..emUsername = em.isNotEmpty ? em : (numeric == null ? uid : '')
      ..relationType = item.isFollowing ? RelationType.FOLLOW : RelationType.NONE;
    if (numeric != null && numeric > 0) profile.id = Int64(numeric);

    AppJumper.toProfile(
      numeric != null && numeric > 0 ? numeric.toString() : uid,
      preview: profile,
    );
  }

  Future<void> _openPromoCompleteProfile() async {
    if (_promoOpening) return;
    _promoOpening = true;
    try {
      final profile = await logic.loadOwnProfile();
      if (!mounted) return;
      await AppJumper.toEditProfile(profile: profile);
    } finally {
      _promoOpening = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    final conversations = logic.visibleConversations;
    final isEmpty = conversations.isEmpty && !logic.loading;

    return ColoredBox(
      color: AppColors.surface,
      child: DecoratedBox(
        decoration: BoxDecoration(
          image: AppImage.decorationImage(
            AppAssets.msgBg,
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
                  AppJumper.toFriends();
                },
                onSearchTap: () {
                  AppJumper.toImSearch();
                },
              ),
              if (_showPromo)
                ChatsPromoBanner(
                  onTap: _openPromoCompleteProfile,
                  onClose: () => setState(() => _showPromo = false),
                ),
              if (logic.loading) const AppTopLoadingBar(),
              Expanded(
                child: RefreshIndicator(
                  color: AppColors.primaryBright,
                  onRefresh: logic.refreshFromApi,
                  child: isEmpty
                      ? ListView(
                          physics: const AlwaysScrollableScrollPhysics(),
                          children: [
                            SizedBox(
                              height: MediaQuery.sizeOf(context).height * 0.5,
                              child: logic.loadError != null
                                  ? Center(
                                      child: Padding(
                                        padding: const EdgeInsets.all(24),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Text(
                                              logic.loadError!,
                                              textAlign: TextAlign.center,
                                              style: const TextStyle(
                                                color: AppColors.textSecondary,
                                              ),
                                            ),
                                            TextButton(
                                              onPressed: () => unawaited(logic.refreshFromApi()),
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
                                onDelete: () => _confirmDeleteConversation(item),
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
