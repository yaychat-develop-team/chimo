import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
    this.historyLoadingRx,
    this.historyHasMoreRx,
    this.allowHistoryLoadMoreRx,
    this.onBlankTap,
    this.onFailedTap,
    this.onMessageLongPress,
    this.onQuoteTap,
    this.messageKeyFor,
    this.banner,
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
  final RxBool? historyLoadingRx;
  final RxBool? historyHasMoreRx;
  final RxBool? allowHistoryLoadMoreRx;
  final VoidCallback? onBlankTap;
  final ValueChanged<int>? onFailedTap;
  final void Function(ChatLine line, Rect anchor)? onMessageLongPress;
  final ValueChanged<String>? onQuoteTap;
  final GlobalKey Function(String msgId)? messageKeyFor;

  /// 白底区顶部（进度条或灰条把手），内部可自带 Obx；拖动手势统一挂在这里。
  final Widget? banner;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          GestureDetector(
            behavior: HitTestBehavior.opaque,
            onVerticalDragUpdate: onHandleDragUpdate,
            onVerticalDragEnd: onHandleDragEnd,
            child: banner ??
                const Padding(
                  padding: EdgeInsets.only(top: 10, bottom: 10),
                  child: Center(
                    child: SizedBox(
                      width: 36,
                      height: 4,
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                          color: AppColors.grayD5D5D5,
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
              historyLoadingRx: historyLoadingRx,
              historyHasMoreRx: historyHasMoreRx,
              allowHistoryLoadMoreRx: allowHistoryLoadMoreRx,
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
