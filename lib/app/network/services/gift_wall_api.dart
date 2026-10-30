import '../../../common/models/server_client/gift_wall.pb.dart';
import '../http/api_result.dart';
import '../http/http.dart';

/// 礼物墙。对齐 joyride `GiftWallApi`。
class GiftWallApi {
  const GiftWallApi();

  /// 礼物墙预览（资料卡入口）。`GET /gift-wall/list?uid=`
  Future<ApiResult<GiftWallListRsp>> list(int uid) {
    return Http.ins.getAndParse<GiftWallListRsp>(
      '/gift-wall/list',
      query: {'uid': '$uid'},
    );
  }

  /// 礼物墙详情页。`GET /gift-wall/detail?uid=`
  Future<ApiResult<GiftWallDetailRsp>> detail(int uid) {
    return Http.ins.getAndParse<GiftWallDetailRsp>(
      '/gift-wall/detail',
      query: {'uid': '$uid'},
    );
  }
}
