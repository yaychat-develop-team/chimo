import 'package:dio/dio.dart';
import 'package:fixnum/fixnum.dart';

import '../../../common/models/server_client/room_cp.pb.dart';
import '../../../common/models/server_client/user_realtion.pb.dart';
import '../http/api_result.dart';
import '../http/http.dart';

/// CP 房接口。对齐 joyride `CPApi`。
class CpApi {
  const CpApi();

  static final _jsonBody = Options(
    headers: {Headers.contentTypeHeader: Headers.jsonContentType},
  );

  /// 开启游戏（stage=none）。
  Future<ApiResult<void>> start(int rid) {
    return Http.ins.postAndParse(
      '/room-cp/op',
      data: CpRoomOpReq(roomId: Int64(rid), stage: CPStage.none),
      options: _jsonBody,
    );
  }

  /// 下一阶段；牵手授关系时带 [relationId]。
  Future<ApiResult<void>> next(int rid, CPStage currentStage, {int? relationId}) {
    return Http.ins.postAndParse(
      '/room-cp/op',
      data: CpRoomOpReq(
        roomId: Int64(rid),
        stage: currentStage,
        relationId: relationId,
      ),
      options: _jsonBody,
    );
  }

  /// 手动结束。
  Future<ApiResult<void>> end(int rid) {
    return Http.ins.postAndParse(
      '/room-cp/manual-finish',
      data: CpRoomManualReq(roomId: Int64(rid)),
      options: _jsonBody,
    );
  }

  /// 关系配置。
  Future<ApiResult<CPConfItemResp>> relationConfig() {
    return Http.ins.postAndParse<CPConfItemResp>(
      '/room-cp/relation-config',
      data: CPConfItemReq(),
      options: _jsonBody,
    );
  }

  /// 心动榜。
  Future<ApiResult<CpRoomHeartRankResp>> heartRank() {
    return Http.ins.postAndParse<CpRoomHeartRankResp>(
      '/room-cp/heart-rank',
      data: CpRoomHeartRankReq(),
      options: _jsonBody,
    );
  }
}
