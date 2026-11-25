import 'package:fixnum/fixnum.dart';

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

  /// 橱窗 / 仓库。`GET /gift-wall/warehouse/Info`
  Future<ApiResult<GiftShowConfigRsp>> warehouse() {
    return Http.ins.getAndParse<GiftShowConfigRsp>('/gift-wall/warehouse/Info');
  }

  /// 保存展示橱窗。`POST /gift-wall/show-list/save`
  Future<ApiResult<void>> saveShowList(Iterable<Int64> itemIds) {
    final req = GiftShowConfigReq()..itemId.addAll(itemIds);
    return Http.ins.postAndParse('/gift-wall/show-list/save', data: req);
  }

  /// 激活卡片。`POST /gift-wall/active/{itemId}`
  Future<ApiResult<void>> active(int itemId) {
    return Http.ins.postAndParse('/gift-wall/active/$itemId');
  }
}
