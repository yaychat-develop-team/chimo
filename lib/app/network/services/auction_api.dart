import 'package:dio/dio.dart';
import 'package:fixnum/fixnum.dart';

import '../../../common/models/server_client/auction.pb.dart';
import '../http/api_result.dart';
import '../http/http.dart';

/// 拍卖相关接口。对齐 joyride `AuctionApi`。
///
/// joyride POST 经 HeaderInterceptor 把 GeneratedMessage 转成
/// `{"bizParam":{...}}` JSON，**不是** protobuf 二进制。
class AuctionApi {
  const AuctionApi();

  static final _jsonBody = Options(
    headers: {Headers.contentTypeHeader: Headers.jsonContentType},
  );

  Future<ApiResult<AuctionStartRsp>> start({required int artistId, required int rid}) {
    return Http.ins.postAndParse<AuctionStartRsp>(
      '/auction/start',
      data: AuctionStartReq(artistId: Int64(artistId), channelId: Int64(rid)),
      options: _jsonBody,
    );
  }

  Future<ApiResult<void>> addTime({required int sessionId, required Stage stage}) {
    return Http.ins.postAndParse(
      '/auction/extend/time',
      data: AuctionUpdateReq(auctionSessionId: Int64(sessionId), stage: stage),
      options: _jsonBody,
    );
  }

  Future<ApiResult<void>> nextStage({required int sessionId, required Stage stage}) {
    return Http.ins.postAndParse(
      '/auction/skip/stage',
      data: AuctionUpdateReq(auctionSessionId: Int64(sessionId), stage: stage),
      options: _jsonBody,
    );
  }

  Future<ApiResult<AuctionBidInfo>> bidInfo(int sessionId) {
    return Http.ins.getAndParse<AuctionBidInfo>('/auction/getBidInfo?sessionId=$sessionId');
  }

  Future<ApiResult<void>> bid({required int sessionId, required int amount}) {
    return Http.ins.postAndParse(
      '/auction/bid',
      data: AuctionBidReq(auctionSessionId: Int64(sessionId), bid: Int64(amount)),
      options: _jsonBody,
    );
  }
}
