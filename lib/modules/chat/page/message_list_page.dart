import 'dart:async';

import 'package:chimo/common/widgets/app_image.dart';
import 'package:chimo/common/widgets/app_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';

import '../../../app/app_jumper.dart';
import '../../../common/constants/app_assets.dart';
import '../../../common/theme/app_colors.dart';
import '../../../common/widgets/app_pull_refresh.dart';
import '../../../common/widgets/line_loading_bar.dart';
import '../logic/chats_list_logic.dart';
import 'widgets/chats_app_bar.dart';
import 'widgets/chats_empty_state.dart';
import 'widgets/chats_promo_banner.dart';
import 'widgets/conversation_list_item.dart';

/// 会话列表：应用栏、可关闭推广横幅、列表或空态。
class MessageListPage extends StatefulWidget {
  const MessageListPage({super.key, this.asSheet = false});

  /// 房间内以底部弹窗展示。
  final bool asSheet;

  /// 房间消息入口：底部弹窗样式对齐 Cosmic Lounge 设计稿。
  static Future<void> showAsSheet() {
    if (Get.isRegistered<ConversationListLogic>()) {
      unawaited(Get.find<ConversationListLogic>().refreshFromApi());
    }
    return Get.bottomSheet(
      const MessageListPage(asSheet: true),
      isScrollControlled: true,
      barrierColor: AppColors.black.withValues(alpha: 0.45),
    );
  }

  @override
  State<MessageListPage> createState() => _MessageListPageState();
}

class _MessageListPageState extends State<MessageListPage> {
  bool _showPromo = true;

  bool get _sheet => widget.asSheet;

  @override
  Widget build(BuildContext context) {
    if (_sheet) return _sheetShell(context);
    return _body(context, showPromo: true);
  }

  Widget _sheetShell(BuildContext context) {
    final height = Get.height * 0.8;
    return ClipRRect(
      borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
      child: SizedBox(height: height, child: _body(context, showPromo: false)),
    );
  }

  Widget _body(BuildContext context, {required bool showPromo}) {
    return GetBuilder<ConversationListLogic>(
      builder: (logic) {
        final conversations = logic.visibleConversations;
        final isEmpty = conversations.isEmpty && !logic.loading;

        return AppScaffold(
          backgroundColor: AppColors.black0F0F0F,
          backdrop: _MsgHeaderBg(),
          appBar: ChatsAppBar(
            onContactsTap: () {
              AppJumper.toFriends();
            },
            onSearchTap: () {
              AppJumper.toImSearch();
            },
          ),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              if (showPromo && _showPromo)
                ChatsPromoBanner(
                  onTap: () {
                    logic.openPromoProfile();
                  },
                  onClose: () => setState(() => _showPromo = false),
                ),
              if (logic.loading) const LineLoadingBar(),
              Expanded(
                child: SlidableAutoCloseBehavior(
                  child: AppPullRefresh(
                    onRefresh: logic.refreshFromApi,
                    slivers: [
                      if (isEmpty)
                        SliverFillRemaining(
                          hasScrollBody: false,
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
                                          style: const TextStyle(color: AppColors.gray9A9A9A),
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
                      SliverList.builder(
                        itemCount: conversations.length,
                        itemBuilder: (context, index) {
                          final item = conversations[index];
                          return ConversationListItem(
                            key: ValueKey(item.id),
                            conversation: item,
                            onPin: () => logic.togglePin(item.id),
                            onDelete: () => logic.confirmDelete(item),
                            onTap: () => logic.openConversation(item),
                            onAvatarTap: () => logic.openAvatar(item),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

/// 消息列表顶部光晕。按原图 1024×546 撑开，避免被拉满整屏。
class _MsgHeaderBg extends StatelessWidget {
  const _MsgHeaderBg();

  @override
  Widget build(BuildContext context) {
    return const AspectRatio(
      aspectRatio: 1024 / 546,
      child: AppImage.image(AppAssets.msgBg, fit: BoxFit.fill),
    );
  }
}
