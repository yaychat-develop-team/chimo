/// 环信 CUSTOM 消息 `event` 常量。
///
/// 对齐 joyride `CusTomMessage`。新增自定义消息类型时：
/// 1. 在这里加常量；
/// 2. 在 [ImCustomPayload] 里加解析；
/// 3. 在 `ChatCustomBubble` 里加 UI 分支。
abstract final class ImCustomEvents {
  /// 客户端直发的房间邀请（老协议，扁平 params）。
  static const String roomInvite = 'im_room_invite_message';

  /// 服务端代发的房间邀请（`/user/invite` → content JSON）。
  static const String roomInviteV2 = 'RoomInvite';

  static const String sendGift = 'SendGift';
  static const String follow = 'im_follow_message';
  static const String recall = 'im_recall_message';
  static const String recallAlt = 'recallMessage';
  static const String joinGroup = 'JoinGroupMessage';

  /// Heart Link 用户邀请（增长/匹配）。
  static const String heartLinkInvite = 'heart_link_invite';

  /// Heart Link 嘉宾邀请（Host 邀 GS）。
  static const String heartLinkInviteGs = 'heart_link_invite_gs';

  /// 是否为房间邀请（V1 / V2）。
  static bool isRoomInvite(String event) =>
      event == roomInvite || event == roomInviteV2;

  static bool isHeartLinkInvite(String event) =>
      event == heartLinkInvite || event == heartLinkInviteGs;
}
