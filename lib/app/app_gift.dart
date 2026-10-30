import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../common/utils/app_toast.dart';
import '../modules/room/model/room_gift_receiver.dart';
import '../modules/room/page/widgets/room_gift_sheet.dart';
import '../modules/room/service/room_service.dart';
import 'app_jumper.dart';

export '../modules/room/page/widgets/room_gift_sheet.dart' show GiftSendResult;

/// 送礼场景。对齐 joyride `GiftScene`：
/// - [chat] 私聊工具栏：同一面板，成功回传 [GiftSendResult] 插气泡
/// - [room] 房间底栏 / 房间资料卡：带 channelId，飞麦 + SEND_GIFT 特效
/// - [profile] 个人页 / 通用资料卡：不在房用同一面板；在房则升为 [room]
enum AppGiftScene { chat, room, profile }

/// 统一送礼入口。聊天 / 资料卡 / 房间共用 [RoomGiftSheet]。
abstract final class AppGift {
  static bool get inRoom {
    final service = RoomService.findOrNull();
    return service != null && service.inRoom.value;
  }

  /// 打开送礼面板。
  ///
  /// [popCurrent]：对齐 joyride 房间资料卡 — 先关资料卡再开礼物层。
  static Future<GiftSendResult?> show(
    BuildContext? context, {
    required AppGiftScene scene,
    String receiverUid = '',
    String receiverName = '',
    String receiverAvatar = '',
    bool popCurrent = false,
  }) async {
    if (popCurrent) {
      AppJumper.back();
      await Future<void>.delayed(Duration.zero);
    }
    final ctx = Get.context ?? context;
    if (ctx == null || !ctx.mounted) return null;

    final useRoom = scene == AppGiftScene.room || (scene == AppGiftScene.profile && inRoom);
    if (useRoom) {
      if (!inRoom) {
        AppToast.info('Not in a room');
        return null;
      }
      await showRoomGiftSheet(
        ctx,
        preferredUid: receiverUid,
        preferredName: receiverName,
        preferredAvatar: receiverAvatar,
      );
      return null;
    }

    // 私聊 / 站外资料卡：同一 Cosmic 面板，rid=0、无 channelId、不展示 To 栏。
    final uid = receiverUid.trim();
    final receivers = <RoomGiftReceiver>[
      if (uid.isNotEmpty && uid != '0')
        RoomGiftReceiver(
          uid: uid,
          name: receiverName.trim().isEmpty ? 'User' : receiverName.trim(),
          avatar: receiverAvatar,
        ),
    ];
    return showModalBottomSheet<GiftSendResult>(
      context: ctx,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      barrierColor: Colors.transparent,
      builder: (_) => RoomGiftSheet(
        rid: 0,
        channelId: '',
        receivers: receivers,
        preferredUid: uid,
        returnResult: scene == AppGiftScene.chat,
      ),
    );
  }
}
