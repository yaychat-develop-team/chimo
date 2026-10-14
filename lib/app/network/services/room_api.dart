import 'package:dio/dio.dart';
import 'package:fixnum/fixnum.dart';

import '../../../common/models/server_client/message.pb.dart';
import '../../../common/models/server_client/message_api.pb.dart';
import '../../../common/models/server_client/room/base.pb.dart';
import '../../../common/models/server_client/rtc.pb.dart';
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
      data: {
        'rid': rid,
        if (password.isNotEmpty) 'password': password,
      },
    );
  }

  /// 离开房间
  Future<ApiResult<void>> leaveRoom(int rid) {
    return Http.ins.postAndParse(
      '/room/leave',
      data: {'rid': rid},
    );
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

  Future<ApiResult<void>> downMic(int rid) {
    return _update(ChannelUpdate(channel: Int64(rid), downMic: ChannelDownMic()));
  }

  Future<ApiResult<void>> collect(int rid) {
    return _verb('PUT', '/user-relation/collect/0/$rid');
  }

  Future<ApiResult<void>> uncollect(int rid) {
    return _verb('DELETE', '/user-relation/collect/0/content/$rid');
  }

  Future<ApiResult<void>> sendText(int rid, String text) {
    final chat = ChatContent()..showItem.add(ShowItem(style: ItemStyle.text, text: text));
    return Http.ins.postAndParse(
      '/msg/send-to-room',
      data: SendToRoomReq(toRoomId: Int64(rid), chat: chat),
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
