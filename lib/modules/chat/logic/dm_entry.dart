import 'package:get/get.dart';

import '../../../app/app_jumper.dart';
import '../model/chat_conversation.dart';
import 'chats_list_logic.dart';

abstract final class DmEntry {
  /// [closeCurrent] 为真时先关掉当前弹层再跳（弹层里的入口要这么做）。
  static void open(ChatConversation conversation, {bool closeCurrent = false}) {
    Get.find<ChatsListLogic>().upsertPrivateChat(conversation);
    if (closeCurrent) AppJumper.back();
    AppJumper.toChat(conversation.id, preview: conversation);
  }
}
