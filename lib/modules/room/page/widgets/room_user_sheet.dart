import 'package:flutter/material.dart';

import '../../../../app/app_jumper.dart';
import '../../model/mic_seat.dart';

/// 房间资料卡入口。统一走 [AppJumper.showUserProfileSheet]（与弹幕 / 榜单同一弹窗）。
/// 自己：已上麦 → 下麦，未上麦 → 上麦；见 [ChatUserProfileSheet]。
class RoomUserSheet {
  RoomUserSheet._();

  static Future<void> show(
    BuildContext context, {
    required MicSeat seat,
    bool mine = false,
    VoidCallback? onLeave,
  }) {
    return showForUser(
      context,
      uid: '${seat.uid ?? 0}',
      name: seat.name,
      avatar: seat.avatar,
    );
  }

  /// 弹幕头像等：按 uid 打开资料卡。
  static Future<void> showForUser(
    BuildContext context, {
    required String uid,
    String name = '',
    String avatar = '',
    int contribution = 0,
    bool? mine,
    bool? onMic,
    VoidCallback? onLeave,
  }) {
    return AppJumper.showUserProfileSheet(
      uid: uid,
      name: name,
      avatar: avatar,
    );
  }
}
