import 'package:flutter/material.dart';

import '../../../../../common/models/server_client/group/group.pb.dart';
import '../../../../../common/theme/app_colors.dart';
import '../../../model/chat_line.dart';
import '../chat_message_list.dart';
import 'group_photos_grid.dart';

/// 群聊那块白底容器：Messages / Photos 两个页签 + 页签下的内容。
class GroupChatBody extends StatelessWidget {
  const GroupChatBody({
    super.key,
    required this.tabIndex,
    required this.isJoined,
    required this.sentMessages,
    required this.photos,
    required this.messagesScroll,
    required this.onTabChanged,
    required this.onPhotoTap,
    required this.onQuoteTap,
    required this.messageKeyFor,
    this.onSenderAvatarTap,
    this.onBlankTap,
    this.onMessageLongPress,
  });

  final int tabIndex;
  final bool isJoined;
  final List<ChatLine> sentMessages;
  final List<GroupPhoto> photos;
  final ScrollController messagesScroll;
  final ValueChanged<int> onTabChanged;
  final ValueChanged<int> onPhotoTap;
  final ValueChanged<String> onQuoteTap;
  final GlobalKey Function(String msgId) messageKeyFor;
  final ValueChanged<ChatLine>? onSenderAvatarTap;
  final VoidCallback? onBlankTap;
  final void Function(ChatLine message, Rect anchor)? onMessageLongPress;

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
            // 群历史走 IM（环信）而不是 REST，而且**只拉一页**：
            // `GroupChatLogic.loadImHistory` 一次 40 条（未加入 10 条），
            // 不存游标、没有第二页。所以这里不传 historyLoading /
            // historyHasMore —— 顶部那个「加载更早」的转圈只有私聊会出现。
            child: tabIndex == 0
                ? ChatMessageList(
                    lines: sentMessages,
                    scrollController: messagesScroll,
                    style: ChatMessageListStyle.group,
                    showSenderName: true,
                    locked: !isJoined,
                    onBlankTap: onBlankTap,
                    onAvatarTap: onSenderAvatarTap,
                    onMessageLongPress: onMessageLongPress,
                    onQuoteTap: onQuoteTap,
                    messageKeyFor: messageKeyFor,
                  )
                : GroupPhotosGrid(
                    isJoined: isJoined,
                    sections: photos,
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
              color: selected ? AppColors.surfaceDark : AppColors.textTertiary,
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
              color: AppColors.accentNeon,
              borderRadius: BorderRadius.circular(2),
            ),
          ),
        ],
      ),
    );
  }
}
