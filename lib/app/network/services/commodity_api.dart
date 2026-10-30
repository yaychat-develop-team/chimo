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

  /// 从背包赠送。
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
    );
  }
}
