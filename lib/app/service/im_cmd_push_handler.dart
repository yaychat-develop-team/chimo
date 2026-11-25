import 'dart:convert';

import 'package:flutter/scheduler.dart';
import 'package:im_flutter_sdk/im_flutter_sdk.dart';
import 'package:protobuf/protobuf.dart';

import '../../common/models/any_parser.dart';
import '../../common/models/server_client/cmd.pb.dart';
import '../../common/models/server_client/couple.pb.dart';
import '../../common/models/server_client/heart_link.pb.dart';
import '../../common/models/server_client/user.pb.dart';
import '../../common/utils/app_log.dart';
import '../../modules/heart_link/widgets/heart_link_invite_notice.dart';
import '../../modules/room/types/romance/widgets/card_flip_widget.dart';
import '../../modules/room/types/romance/widgets/romance_success_dialog.dart';

/// 环信 CMD 推送分发。对齐 joyride `message_notifier.onCmdMessagesReceived`。
abstract final class ImCmdPushHandler {
  static Future<void> handleMessages(List<ChatMessage> messages) async {
    for (final message in messages) {
      await handle(message);
    }
  }

  static Future<void> handle(ChatMessage message) async {
    final body = message.body;
    if (body is! ChatCmdMessageBody) return;
    final action = body.action.trim();
    if (action.isEmpty) return;
    try {
      final decoded = jsonDecode(action);
      if (decoded is! Map) {
        AppLog.w('ImCmdPush action not map: $action');
        return;
      }
      final cmdPush = EaseCmdPush.create()
        ..mergeFromProto3Json(
          decoded,
          ignoreUnknownFields: true,
          typeRegistry: AnyParser.typeRegistry,
        );
      AppLog.d('ImCmdPush type=${cmdPush.type}');
      switch (cmdPush.type) {
        case EaseCmdPushType.HEART_LINK_INVITE:
          final info = _unpack(cmdPush, HeartLinkInfo.create);
          if (info == null) return;
          _runOnUi(() => HeartLinkInviteNotice.showUserInvite(info));
        case EaseCmdPushType.HEART_LINK_INVITE_GS:
          final info = _unpack(cmdPush, HeartLinkInfo.create);
          if (info == null) return;
          _runOnUi(() => HeartLinkInviteNotice.showGsInvite(info));
        case EaseCmdPushType.HEARTIES_LOGIN:
          final info = _unpack(cmdPush, HeartLinkInfo.create);
          if (info == null) return;
          _runOnUi(() => HeartLinkInviteNotice.showOnline(info));
        // 新人房派单邀请暂不处理，Romance 只走私聊触发。
        case EaseCmdPushType.MESS_ROOM_INVITE_GS:
        case EaseCmdPushType.MESS_ROOM_INVITE_USER:
          break;
        case EaseCmdPushType.PICK_GS_CARD:
          final info = _unpack(cmdPush, User.create);
          if (info == null) return;
          _runOnUi(() => RomanceCardFlip.show(info));
        case EaseCmdPushType.UNLOCK_COUPLE_ACTIVITY:
          final info = _unpack(cmdPush, CoupleInfo.create);
          if (info == null) return;
          _runOnUi(() => RomanceSuccessDialog.show(info));
        default:
          break;
      }
    } catch (error) {
      AppLog.w('ImCmdPush handle failed action=$action', error: error);
    }
  }

  static T? _unpack<T extends GeneratedMessage>(EaseCmdPush cmd, T Function() create) {
    if (!cmd.hasContent()) {
      AppLog.w('ImCmdPush missing content type=${cmd.type}');
      return null;
    }
    try {
      final parsed = AnyParser.parse<T>(cmd.content);
      if (parsed != null) return parsed;
    } catch (error) {
      AppLog.d('ImCmdPush AnyParser failed type=${cmd.type}', error: error);
    }
    try {
      return cmd.content.unpackInto(create());
    } catch (error) {
      AppLog.w('ImCmdPush unpackInto failed type=${cmd.type}', error: error);
      return null;
    }
  }

  static void _runOnUi(void Function() action) {
    final phase = SchedulerBinding.instance.schedulerPhase;
    if (phase == SchedulerPhase.idle || phase == SchedulerPhase.postFrameCallbacks) {
      action();
      return;
    }
    SchedulerBinding.instance.addPostFrameCallback((_) => action());
  }
}
