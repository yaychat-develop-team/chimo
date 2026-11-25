import 'package:im_flutter_sdk/im_flutter_sdk.dart';

import 'conversation_model.dart';

/// IM 搜索命中的一条文本消息。
///
/// 都要用它，私有类跨不了文件。
class ImSearchMsgHit {
  const ImSearchMsgHit({required this.conversation, required this.message, required this.text});

  final ConversationModel conversation;
  final ChatMessage message;
  final String text;
}

/// 按会话聚合后的消息命中（原 `_HistoryHit`）。
class ImSearchConvHit {
  const ImSearchConvHit({required this.conversation, required this.messages});

  final ConversationModel conversation;
  final List<ImSearchMsgHit> messages;
}
