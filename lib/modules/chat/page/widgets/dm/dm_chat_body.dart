import 'package:flutter/material.dart';

import '../../../../../common/theme/app_colors.dart';
import '../../../model/chat_line.dart';
import '../chat_message_list.dart';

/// 私聊那块白底容器：顶部把手 + 消息流。
class DmChatBody extends StatelessWidget {
  const DmChatBody({
    super.key,
    required this.messages,
    required this.peerAvatar,
    required this.messagesScroll,
    required this.onHandleDragUpdate,
    required this.onHandleDragEnd,
    this.peerAvatarUrl,
    this.selfAvatarUrl,
    this.historyLoading = false,
    this.historyHasMore = false,
    this.onBlankTap,
    this.onFailedTap,
    this.onMessageLongPress,
    this.onQuoteTap,
    this.messageKeyFor,
  });

  final List<ChatLine> messages;
  final String peerAvatar;
  final String? peerAvatarUrl;
  final String? selfAvatarUrl;
  final ScrollController messagesScroll;
  final GestureDragUpdateCallback onHandleDragUpdate;
  final GestureDragEndCallback onHandleDragEnd;
  final bool historyLoading;
  final bool historyHasMore;
  final VoidCallback? onBlankTap;
  final ValueChanged<int>? onFailedTap;
  final void Function(ChatLine line, Rect anchor)? onMessageLongPress;
  final ValueChanged<String>? onQuoteTap;
  final GlobalKey Function(String msgId)? messageKeyFor;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
      ),
      clipBehavior: Clip.antiAlias,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          GestureDetector(
            behavior: HitTestBehavior.opaque,
            onVerticalDragUpdate: onHandleDragUpdate,
            onVerticalDragEnd: onHandleDragEnd,
            child: const Padding(
              padding: EdgeInsets.only(top: 10, bottom: 10),
              child: Center(
                child: SizedBox(
                  width: 36,
                  height: 4,
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      color: AppColors.textGrayD8,
                      borderRadius: BorderRadius.all(Radius.circular(2)),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: ChatMessageList(
              lines: messages,
              scrollController: messagesScroll,
              style: ChatMessageListStyle.dm,
              peerAvatar: peerAvatar,
              peerAvatarUrl: peerAvatarUrl,
              selfAvatarUrl: selfAvatarUrl,
              historyLoading: historyLoading,
              historyHasMore: historyHasMore,
              onBlankTap: onBlankTap,
              onRetry: onFailedTap,
              onMessageLongPress: onMessageLongPress,
              onQuoteTap: onQuoteTap,
              messageKeyFor: messageKeyFor,
            ),
          ),
        ],
      ),
    );
  }
}
