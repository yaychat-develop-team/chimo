import '../../../features/chats/data/cash_gift_dto.dart';
import '../api_gateway.dart';
import '../api_result.dart';
import '../cash_charge_dto.dart';
import '../cash_op_history_dto.dart';
import '../network_bootstrap.dart';

/// 钱包 / 礼物现金相关接口。
class CashApi {
  const CashApi();

  Future<ApiResult<int>> balance() {
    return ApiGateway.request(
      () => NetworkBootstrap.api.cashCurrent(),
      map: CashGiftDto.parseBalance,
    );
  }

  Future<ApiResult<List<CashChargeProduct>>> chargeProducts() {
    return ApiGateway.request(
      () => NetworkBootstrap.api.cashChargeProducts(),
      map: CashChargeDto.parseChargeProducts,
    );
  }

  Future<ApiResult<List<CashChargeProduct>>> goods() {
    return ApiGateway.request(
      () => NetworkBootstrap.api.cashGoods(),
      map: CashChargeDto.parseGoods,
    );
  }

  /// 充值商品；为空时回退到 goods 目录。
  Future<ApiResult<List<CashChargeProduct>>> rechargeOptions() async {
    final products = await chargeProducts();
    if (!products.ok) return products;
    if (products.data != null && products.data!.isNotEmpty) return products;
    return goods();
  }

  Future<ApiResult<List<CashGiftItem>>> giftItems({
    int version = 1,
    int rid = 0,
  }) {
    return ApiGateway.request(
      () => NetworkBootstrap.api.cashItems(version: version, rid: rid),
      map: CashGiftDto.parseItems,
    );
  }

  Future<ApiResult<void>> sendGift({
    required List<String> receiverIds,
    required String itemId,
    required int count,
    String? channelId,
  }) {
    return ApiGateway.action(
      () => NetworkBootstrap.api.cashGift(
        receiverIds: receiverIds,
        itemId: itemId,
        count: count,
        channelId: channelId,
      ),
    );
  }

  /// 金币消费 / 充值明细。
  Future<ApiResult<List<CashOpHistoryItem>>> opHistory({
    required int pageNum,
    int pageSize = 20,
  }) {
    return ApiGateway.request(
      () => NetworkBootstrap.api.cashOpHistory(
        pageNum: pageNum,
        pageSize: pageSize,
      ),
      map: CashOpHistoryDto.parseItems,
    );
  }
}
