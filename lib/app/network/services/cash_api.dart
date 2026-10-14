import '../../../common/models/server_client/cash.pb.dart';
import '../http/api_result.dart';
import '../http/http.dart';

/// 钱包 / 礼物现金相关接口。
class CashApi {
  const CashApi();

  Future<ApiResult<UserCash>> balance() {
    return Http.ins.getAndParse<UserCash>('/cash/current');
  }

  Future<ApiResult<List<CashChargeProductListItem>>> chargeProducts() async {
    final res = await Http.ins.getAndParse<CashChargeProductListRsp>('/cash/charge/product');
    return res.map(
      (data) => [
        for (final item in data.product)
          if (!item.isCustomPay && item.coin > 0) item,
      ],
    );
  }

  Future<ApiResult<List<CashGoodsItem>>> goods() async {
    final res = await Http.ins.getAndParse<CashGoodsRsp>('/cash/goods');
    return res.map(
      (data) => [for (final item in data.goodsList) if (item.coin > 0) item],
    );
  }

  /// 充值商品；为空时把 goods 目录收成同一条商品模型。
  Future<ApiResult<List<CashChargeProductListItem>>> rechargeOptions() async {
    final products = await chargeProducts();
    if (!products.ok) return products;
    if (products.data != null && products.data!.isNotEmpty) return products;
    final catalog = await goods();
    if (!catalog.ok) {
      return ApiResult.fail(catalog.message, code: catalog.code);
    }
    return ApiResult.ok([
      for (final item in catalog.data ?? const <CashGoodsItem>[])
        CashChargeProductListItem(
          coin: item.coin,
          goodsId: item.goodsId,
          cent: item.price,
          name: item.desc,
        ),
    ]);
  }

  Future<ApiResult<List<ItemInfo>>> giftItems({int version = 1, int rid = 0}) async {
    final res = await Http.ins.getAndParse<ItemInfoRsp>(
      '/cash/item',
      query: {'version': '$version', 'rid': '$rid'},
    );
    return res.map(
      (data) => [
        for (final tab in data.itemTab)
          for (final item in tab.item)
            if (item.canBuy) item,
      ],
    );
  }

  Future<ApiResult<void>> sendGift({
    required List<String> receiverIds,
    required String itemId,
    required int count,
    String? channelId,
  }) {
    return Http.ins.postAndParse(
      '/cash/gift',
      data: {
        'receiverId': receiverIds,
        'itemId': itemId,
        'count': count,
        if (channelId != null && channelId.isNotEmpty) 'channel': channelId,
      },
    );
  }

  Future<ApiResult<CashChargeCreateRsp>> createChargeOrder({
    required String productId,
    required int payItemType,
  }) {
    return Http.ins.postAndParse<CashChargeCreateRsp>(
      '/cash/charge/create',
      data: {
        'productId': int.tryParse(productId) ?? productId,
        'payItemType': payItemType,
        'v2': true,
      },
    );
  }

  Future<ApiResult<CashChargeCheckRsp>> verifyReceipt({
    required String orderId,
    required String userId,
    required String extraJson,
  }) {
    return Http.ins.postAndParse<CashChargeCheckRsp>(
      '/cash/charge/verify_receipt',
      data: {
        'orderId': orderId,
        'userId': userId,
        'extraJson': extraJson,
      },
    );
  }

  /// 金币消费 / 充值明细。
  Future<ApiResult<List<CashOpHistoryItem>>> opHistory({
    required int pageNum,
    int pageSize = 20,
  }) async {
    final nowSec = DateTime.now().millisecondsSinceEpoch ~/ 1000;
    final res = await Http.ins.postAndParse<CashOpHistoryRsp>(
      '/cash/op-history',
      data: {
        'beginTimestamp': nowSec - 60 * 60 * 24 * 30,
        'endTimestamp': nowSec,
        'pageNum': pageNum,
        'pageSize': pageSize,
      },
    );
    return res.map((data) => data.items);
  }
}
