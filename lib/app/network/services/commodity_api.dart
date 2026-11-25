import 'package:dio/dio.dart';
import 'package:fixnum/fixnum.dart';

import '../../../common/models/server_client/commodity.pb.dart';
import '../http/api_result.dart';
import '../http/http.dart';

/// 背包 / 装扮物品。
class CommodityApi {
  const CommodityApi();

  /// 礼物面板 Package 列表。`v=1` 含车卡。
  Future<ApiResult<List<CommodityItem>>> bag() async {
    final res = await Http.ins.getAndParse<CommodityListResp>(
      '/commodity/mine/bag',
      query: {'v': '1'},
    );
    return res.map((data) => data.list.toList());
  }

  /// 装扮分类 Tab。对齐 joyride `/commodity/tabs`。
  Future<ApiResult<CommodityTabListResp>> tabs() {
    return Http.ins.getAndParse<CommodityTabListResp>('/commodity/tabs');
  }

  /// 某分类下我的装扮列表。对齐 joyride `/commodity/mine/list`。
  Future<ApiResult<List<CommodityItem>>> mineList({required int typeId}) async {
    final res = await Http.ins.getAndParse<CommodityListResp>(
      '/commodity/mine/list',
      query: {'type_id': '$typeId'},
    );
    return res.map((data) => data.list.toList());
  }

  /// 佩戴。对齐 joyride `/commodity/use`。
  Future<ApiResult<void>> use(Int64 id) {
    return Http.ins.getAndParse('/commodity/use', query: {'id': '$id'});
  }

  /// 取消佩戴。对齐 joyride `/commodity/cancel-use`。
  Future<ApiResult<void>> cancelUse(Int64 id) {
    return Http.ins.getAndParse('/commodity/cancel-use', query: {'id': '$id'});
  }

  /// 从背包赠送。对齐 joyride：请求体走 JSON `bizParam`，响应仍按 protobuf。
  Future<ApiResult<void>> give({
    required List<String> receiverIds,
    required Int64 knapsackId,
    required int count,
    required CommodityType type,
    String channelId = '',
  }) {
    final channel = int.tryParse(channelId.trim()) ?? 0;
    return Http.ins.postAndParse(
      '/commodity/give',
      data: SendCommodityReq(
        receiverId: [
          for (final id in receiverIds) Int64(int.tryParse(id) ?? 0),
        ],
        knapsackId: knapsackId,
        count: count,
        type: type,
        channel: channel > 0 ? Int64(channel) : null,
      ),
      // 覆盖默认 protobuf Content-Type，走拦截器 JSON bizParam 分支。
      options: Options(
        headers: {Headers.contentTypeHeader: Headers.jsonContentType},
      ),
    );
  }
}
