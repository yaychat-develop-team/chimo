import 'package:flutter/material.dart';

import '../../../../common/im/im_custom_events.dart';
import '../../../../common/im/im_custom_payload.dart';
import '../../../../common/theme/app_colors.dart';
import '../../model/chat_line.dart';
import 'chat_room_invite_card.dart';

/// 自定义消息气泡分发器。
///
/// 新增类型：在 [ImCustomEvents] / [ImCustomPayload] 注册后，这里加分支即可；
/// 不要把业务卡片逻辑塞进 [ChatMessageList]。
class ChatCustomBubble extends StatelessWidget {
  const ChatCustomBubble({
    super.key,
    required this.line,
  });

  final ChatLine line;

  @override
  Widget build(BuildContext context) {
    final event = line.customEvent;
    if (ImCustomEvents.isRoomInvite(event)) {
      final payload = ImCustomPayload.tryRoomInvite(line.customPayload);
      if (payload != null) {
        return ChatRoomInviteCard(payload: payload, isSelf: line.isSelf);
      }
    }

    // 未知 / 解析失败：降级成灰字，避免空白行。
    final text = line.text.trim().isNotEmpty ? line.text : '[Unsupported message]';
    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 240),
      child: Text(
        text,
        style: const TextStyle(
          color: AppColors.gray9A9A9A,
          fontSize: 13,
          fontWeight: FontWeight.w400,
          height: 1.3,
        ),
      ),
    );
  }
}
