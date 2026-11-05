import 'package:dio/dio.dart';
import 'package:fixnum/fixnum.dart';
import 'package:protobuf/protobuf.dart';

import '../../../common/models/server_client/message.pb.dart';
import '../../../common/models/server_client/message_api.pb.dart';
import '../../../common/models/server_client/mic_tool.pb.dart';
import '../../../common/models/server_client/room/base.pb.dart';
import '../../../common/models/server_client/rtc.pb.dart';
import '../../../common/models/server_client/super_admin.pb.dart';
import '../../../common/models/server_client/user.pb.dart';
import '../http/api_result.dart';
import '../http/http.dart';
import '../http/response_ext.dart';

/// 房间模块相关接口。
class RoomApi {
  const RoomApi();

  /// 房间上锁，需要密码。对齐 joyride `1001410210`。
  static const lockedCode = 1001410210;

  /// JSON 业务体，响应仍按 protobuf 信封解析。
  static final _jsonBody = Options(
    headers: {Headers.contentTypeHeader: Headers.jsonContentType},
  );

  /// 房间检查信息
  Future<ApiResult<RoomCheckItem>> check(int rid) {
    return Http.ins.getAndParse<RoomCheckItem>('/room/check/$rid');
  }

  /// 进入房间
  Future<ApiResult<void>> enterRoom(int rid, {String password = ''}) {
    return Http.ins.postAndParse(
      '/room/enter',
      data: {'rid': rid, if (password.isNotEmpty) 'password': password},
    );
  }

  /// 离开房间
  Future<ApiResult<void>> leaveRoom(int rid) {
    return Http.ins.postAndParse('/room/leave', data: {'rid': rid});
  }

  Future<ApiResult<JoinChannelRsp>> join({
    required int rid,
    String password = '',
    int reconnect = 0,
  }) async {
    final result = await Http.ins.postAndParse<JoinChannelRsp>(
      '/rtc/join-channel',
      data: JoinChannelReq(
        channelId: Int64(rid),
        password: password,
        reconnect: reconnect,
      ),
      options: _jsonBody,
    );
    final channel = result.data?.channel;
    if (result.ok && (channel == null || channel.channelId.toInt() <= 0)) {
      return ApiResult.fail('empty channel', code: result.code);
    }
    return result;
  }

  /// 房间扩展信息（拍卖 / CP / 心动 / 游戏等）。对齐 joyride `RtcApi.getExtInfo`。
  Future<ApiResult<JoinChannelExtendRsp>> joinChannelExt(int rid) {
    return Http.ins.getAndParse<JoinChannelExtendRsp>('/rtc/join-channel-ext?rid=$rid');
  }

  Future<ApiResult<void>> leave(int rid) {
    return Http.ins.postAndParse(
      '/rtc/leave-channel',
      data: LeaveChannelReq(channelId: Int64(rid)),
      options: _jsonBody,
    );
  }

  Future<ApiResult<void>> upMic(int rid, {int? position}) {
    final mic = ChannelUpMic(
      mode: position == null ? UpMicMode.AUTO_MIC : UpMicMode.FIX_POSITION_MIC,
      position: position,
    );
    return _update(ChannelUpdate(channel: Int64(rid), upMic: mic));
  }

  /// 排麦。对齐 joyride `UpMicMode.QUEUE_MIC`。
  Future<ApiResult<void>> queueMic(int rid, QueueType queueType) {
    return _update(
      ChannelUpdate(
        channel: Int64(rid),
        upMic: ChannelUpMic(mode: UpMicMode.QUEUE_MIC, queueType: queueType),
      ),
    );
  }

  /// 取消排麦。
  Future<ApiResult<void>> cancelQueueMic(int rid, QueueType queueType) {
    return _update(
      ChannelUpdate(
        channel: Int64(rid),
        cancelQueueMic: ChannelCancelQueueMic(queueType: queueType),
      ),
    );
  }

  /// 管理员抱上指定麦位。
  Future<ApiResult<void>> grantUpMic({
    required int rid,
    required int uid,
    required int position,
  }) {
    return _update(
      ChannelUpdate(
        channel: Int64(rid),
        grantUpMic: ChannelGrantUpMic(uid: Int64(uid), position: position),
      ),
    );
  }

  /// 管理员抱下麦。
  Future<ApiResult<void>> grantDownMic({required int rid, required int uid}) {
    return _update(
      ChannelUpdate(
        channel: Int64(rid),
        grantDownMic: ChannelGrantDownMic(uid: Int64(uid)),
      ),
    );
  }

  /// 踢出房间。对齐 joyride `ChannelKickUser`。
  Future<ApiResult<void>> kickUser({
    required int rid,
    required int uid,
    required int leaveSeconds,
  }) {
    return _update(
      ChannelUpdate(
        channel: Int64(rid),
        kick: ChannelKickUser(uid: Int64(uid), leaveTimeInSeconds: leaveSeconds),
      ),
    );
  }

  /// 改角色。对齐 joyride `ChannelChangeRole`。
  Future<ApiResult<void>> changeRole({
    required int rid,
    required int uid,
    required RtcUserRole role,
  }) {
    return _update(
      ChannelUpdate(
        channel: Int64(rid),
        changeRole: ChannelChangeRole(uid: Int64(uid), role: role),
      ),
    );
  }

  /// 禁麦。对齐 joyride `ChannelManagerCloseMic`。
  Future<ApiResult<void>> managerCloseMic({required int rid, required int uid}) {
    return _update(
      ChannelUpdate(
        channel: Int64(rid),
        managerCloseMic: ChannelManagerCloseMic(uid: Int64(uid)),
      ),
    );
  }

  /// 取消禁麦。对齐 joyride `ChannelManagerOpenMic`。
  Future<ApiResult<void>> managerOpenMic({required int rid, required int uid}) {
    return _update(
      ChannelUpdate(
        channel: Int64(rid),
        managerOpenMic: ChannelManagerOpenMic(uid: Int64(uid)),
      ),
    );
  }

  /// 禁言。对齐 joyride `ChannelForbidWord`。
  Future<ApiResult<void>> forbidWord({required int rid, required int uid}) {
    return _update(
      ChannelUpdate(
        channel: Int64(rid),
        forbidWord: ChannelForbidWord(uid: Int64(uid)),
      ),
    );
  }

  /// 麦上倒计时。对齐 joyride `POST /rtc/mic_counter/op`。
  Future<ApiResult<void>> micCounter({
    required OpType type,
    required int rid,
    required int uid,
    int seconds = 0,
  }) {
    return Http.ins.postAndParse(
      '/rtc/mic_counter/op',
      data: MicCounterReq(
        opType: type,
        opRid: rid,
        opUid: uid,
        durationSeconds: seconds,
      ),
      options: _jsonBody,
    );
  }

  /// 房间倒计时。对齐 joyride `POST /rtc/room_counter/op`（CP 主持麦）。
  Future<ApiResult<void>> roomCounter({
    required OpType type,
    required int rid,
    int seconds = 0,
  }) {
    return Http.ins.postAndParse(
      '/rtc/room_counter/op',
      data: MicCounterReq(
        opType: type,
        opRid: rid,
        durationSeconds: seconds,
      ),
      options: _jsonBody,
    );
  }

  /// 更新房间字段（公屏 / 礼物统计等）。对齐 joyride `updateChannel` + `ChannelFields`。
  Future<ApiResult<void>> updateFields(int rid, ChannelFields fields) {
    return _update(ChannelUpdate(channel: Int64(rid), fields: fields));
  }

  /// 管理工具权限（含房间密码）。对齐 joyride `GET /rtc/button-permission`。
  Future<ApiResult<ButtonPermissionData>> buttonPermission(int rid) {
    return Http.ins.getAndParse<ButtonPermissionData>(
      '/rtc/button-permission',
      query: {'channelId': '$rid'},
    );
  }

  /// 麦位布局列表。对齐 joyride `GET /rtc/mic-layouts`。
  Future<ApiResult<MicLayoutData>> micLayouts(int rid) {
    return Http.ins.getAndParse<MicLayoutData>(
      '/rtc/mic-layouts',
      query: {'channelId': '$rid'},
    );
  }

  /// 房间背景资源。对齐 joyride `GET /rtc/background-resource`。
  Future<ApiResult<BackgroundData>> backgrounds({
    required RoomType roomType,
    BackgroundType backgroundType = BackgroundType.STATIC,
  }) {
    return Http.ins.getAndParse<BackgroundData>(
      '/rtc/background-resource',
      query: {
        'roomType': roomType.name,
        'backgroundType': backgroundType.name,
      },
    );
  }

  /// 清除打赏统计。对齐 joyride `POST /rtc/mic_score/clear`。
  Future<ApiResult<void>> clearMicScore({required int rid, required int uid}) {
    return Http.ins.postAndParse(
      '/rtc/mic_score/clear',
      data: MicScoreClearReq(rid: Int64(rid), uid: Int64(uid)),
      options: _jsonBody,
    );
  }

  /// 警告指定用户。对齐 joyride `WarnType.SPECIFIC_USER`。
  Future<ApiResult<void>> warnUser({
    required int rid,
    required int uid,
    String reason = '',
  }) {
    return Http.ins.postAndParse(
      '/super_admin/warn',
      data: WarnReq(
        channelId: Int64(rid),
        userId: Int64(uid),
        warnType: WarnType.SPECIFIC_USER,
        reason: reason,
      ),
      options: _jsonBody,
    );
  }

  Future<ApiResult<void>> downMic(int rid) {
    return _update(
      ChannelUpdate(channel: Int64(rid), downMic: ChannelDownMic()),
    );
  }

  Future<ApiResult<void>> collect(int rid) {
    return _verb('PUT', '/user-relation/collect/0/$rid');
  }

  Future<ApiResult<void>> uncollect(int rid) {
    return _verb('DELETE', '/user-relation/collect/0/content/$rid');
  }

  /// 已收藏房间。对齐 joyride `GET /user-relation/collect/0`。
  Future<ApiResult<CollectListRsp>> collectList({int size = 100}) {
    return Http.ins.getAndParse<CollectListRsp>(
      '/user-relation/collect/0',
      query: {'size': '$size'},
    );
  }

  /// 侧栏 Tab。对齐 joyride `GET /rtc/channel-tags`。
  Future<ApiResult<ChannelTagsData>> channelTags() {
    return Http.ins.getAndParse<ChannelTagsData>('/rtc/channel-tags');
  }

  /// 侧栏房间列表。对齐 joyride `GET /rtc/sidebar`。
  Future<ApiResult<RtcSidebarRsp>> sidebar({
    required String tagId,
    int pageNum = 1,
    int pageSize = 20,
    String? snapshotId,
  }) {
    return Http.ins.getAndParse<RtcSidebarRsp>(
      '/rtc/sidebar',
      query: {
        'tagId': tagId,
        'pageNum': '$pageNum',
        'pageSize': '$pageSize',
        'snapshotId': snapshotId ?? '',
      },
    );
  }

  /// 房间用户 / 榜单。对齐 joyride `GET /rtc/channel/{id}/users`。
  /// [scope] 空=在线；`cash_day`/`cash_week`=送礼；`charm_day`/`charm_week`=收礼。
  Future<ApiResult<ChannelUserListRsp>> channelUsers(
    int rid, {
    int offset = 0,
    int count = 50,
    String scope = '',
  }) {
    return Http.ins.getAndParse<ChannelUserListRsp>(
      '/rtc/channel/$rid/users',
      query: {'offset': '$offset', 'count': '$count', 'scope': scope},
    );
  }

  Future<ApiResult<void>> sendText(int rid, String text) {
    return sendShowItems(rid, [ShowItem(style: ItemStyle.text, text: text)]);
  }

  /// 公屏任意 [ShowItem]（文本 / icon / 带 extra 的贴纸）。
  ///
  /// 对齐 joyride `MessageCheckApi.sendToRoom`：JSON + ChatContent TypeRegistry。
  /// `toRoomId` 强制为数字（部分环境对 int64 字符串解析成 0 → 100201002）。
  Future<ApiResult<void>> sendShowItems(int rid, List<ShowItem> items) {
    final chat = ChatContent()..showItem.addAll(items);
    final req = SendToRoomReq(toRoomId: Int64(rid), chat: chat);
    final json = req.toProto3Json(
      typeRegistry: TypeRegistry([
        ChatContent.create(),
        CardChatContent.create(),
      ]),
    );
    if (json is Map) {
      json['toRoomId'] = rid;
    }
    return Http.ins.postAndParse(
      '/msg/send-to-room',
      data: json,
      options: _jsonBody,
    );
  }

  /// 麦上表情。对齐 joyride `RtcApi.sendMicImage` → `POST /rtc/mic_img/show`。
  Future<ApiResult<void>> sendMicImage({
    required int rid,
    required int uid,
    required String url,
    int type = 3,
  }) {
    return Http.ins.postAndParse(
      '/rtc/mic_img/show',
      data: MicImgShowReq(
        rid: Int64(rid),
        uid: Int64(uid),
        type: type,
        url: url,
      ),
      options: _jsonBody,
    );
  }

  /// 房主/接待关闭或打开房间。对齐 joyride `ChannelChangeStatus`。
  Future<ApiResult<void>> changeStatus(int rid, RoomStatusEnum status) {
    return _update(
      ChannelUpdate(
        channel: Int64(rid),
        changeStatus: ChannelChangeStatus(status: status),
      ),
    );
  }

  /// 全员警告。对齐 joyride `POST /super_admin/warn`。
  Future<ApiResult<void>> warnAll(int rid, {String reason = ''}) {
    return Http.ins.postAndParse(
      '/super_admin/warn',
      data: WarnReq(
        channelId: Int64(rid),
        warnType: WarnType.ALL_USER,
        reason: reason,
      ),
      options: _jsonBody,
    );
  }

  Future<ApiResult<void>> _update(ChannelUpdate req) {
    return Http.ins.postAndParse(
      '/rtc/channel/update',
      data: req,
      options: _jsonBody,
    );
  }

  /// 房间 Tab 顶部热门故事。
  Future<ApiResult<HotStoryRsp>> hotStories() {
    return Http.ins.getAndParse<HotStoryRsp>('/rtc/getHotStory');
  }

  Future<ApiResult<void>> _verb(String method, String path) async {
    try {
      final response = await Http.ins.dio.request<List<int>>(
        path,
        options: Options(
          method: method,
          responseType: ResponseType.bytes,
          headers: {Headers.acceptHeader: Http.protobufContentType},
        ),
      );
      return response.asApiResult<void>();
    } catch (error) {
      return ApiResult.fail('$error');
    }
  }
}
