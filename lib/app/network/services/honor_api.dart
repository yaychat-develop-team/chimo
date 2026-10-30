import 'package:dio/dio.dart';
import 'package:fixnum/fixnum.dart';

import '../../../common/models/server_client/honor.pb.dart';
import '../http/api_result.dart';
import '../http/http.dart';

/// 荣誉。对齐 joyride / yaychat `UserApi`：`/user/honor*`。
class HonorApi {
  const HonorApi();

  /// 对齐 joyride：POST 走 JSON `bizParam`，而非 protobuf 二进制。
  static final _jsonBody = Options(
    headers: {Headers.contentTypeHeader: Headers.jsonContentType},
  );

  /// 他人已获得荣誉。`GET /user/honor?uid=`
  Future<ApiResult<HonorItemListRsp>> list(int uid) {
    return Http.ins.getAndParse<HonorItemListRsp>(
      '/user/honor',
      query: {'uid': '$uid'},
    );
  }

  /// 自己：已获得 + 可达成。`GET /user/honorTarget`
  Future<ApiResult<HonorItemListRsp>> target() {
    return Http.ins.getAndParse<HonorItemListRsp>('/user/honorTarget');
  }

  /// 佩戴 / 取消佩戴。`POST /user/honorWear`
  ///
  /// 与 joyride 一致：`HonorWearReq` + JSON Content-Type →
  /// `{"bizParam":{"hid":"...","wear":true}}`。
  Future<ApiResult<void>> wear({required int hid, required bool wear}) {
    return Http.ins.postAndParse(
      '/user/honorWear',
      data: HonorWearReq(hid: Int64(hid), wear: wear),
      options: _jsonBody,
    );
  }
}
