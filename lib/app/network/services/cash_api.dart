import '../../../common/models/server_client/cash.pb.dart';
import '../http/api_gateway.dart';
import '../http/api_result.dart';
import '../http/pb_specs.dart';
import '../network_bootstrap.dart';

/// 钱包 / 礼物现金相关接口。
class CashApi {
  const CashApi();

  Future<ApiResult<UserCash>> balance() {
    return ApiGateway.request(
      () => NetworkBootstrap.client.get(
        '/cash/current',
        unpack: PbSpecs.userCash,
      ),
      map: (res) {
        final data = res.data;
        if (data is! UserCash) return UserCash();
        return data;
      },
    );
  }

  Future<ApiResult<List<CashChargeProductListItem>>> chargeProducts() {
    return ApiGateway.request(
      () => NetworkBootstrap.client.get(
        '/cash/charge/product',
        unpack: PbSpecs.chargeProducts,
      ),
      map: (res) {
        final data = res.data;
        if (data is! CashChargeProductListRsp) return const [];
        return [
          for (final item in data.product)
            if (!item.isCustomPay && item.coin > 0) item,
        ];
      },
    );
  }

  Future<ApiResult<List<CashGoodsItem>>> goods() {
    return ApiGateway.request(
      () => NetworkBootstrap.client.get(
        '/cash/goods',
        unpack: PbSpecs.cashGoods,
      ),
      map: (res) {
        final data = res.data;
        if (data is! CashGoodsRsp) return const [];
        return [for (final item in data.goodsList) if (item.coin > 0) item];
      },
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

  Future<ApiResult<List<ItemInfo>>> giftItems({int version = 1, int rid = 0}) {
    return ApiGateway.request(
      () => NetworkBootstrap.client.get(
        '/cash/item',
        query: {'version': '$version', 'rid': '$rid'},
        unpack: PbSpecs.cashItem,
      ),
      map: (res) {
        final data = res.data;
        if (data is! ItemInfoRsp) return const [];
        return [
          for (final tab in data.itemTab)
            for (final item in tab.item)
              if (item.canBuy) item,
        ];
      },
    );
  }

  Future<ApiResult<void>> sendGift({
    required List<String> receiverIds,
    required String itemId,
    required int count,
    String? channelId,
  }) {
    return ApiGateway.action(
      () => NetworkBootstrap.client.post(
        '/cash/gift',
        bizParam: {
          'receiverId': receiverIds,
          'itemId': itemId,
          'count': count,
          if (channelId != null && channelId.isNotEmpty) 'channel': channelId,
        },
      ),
    );
  }

  Future<ApiResult<CashChargeCreateRsp>> createChargeOrder({
    required String productId,
    required int payItemType,
  }) {
    return ApiGateway.request(
      () => NetworkBootstrap.client.post(
        '/cash/charge/create',
        unpack: PbSpecs.chargeCreate,
        bizParam: {
          'productId': int.tryParse(productId) ?? productId,
          'payItemType': payItemType,
          'v2': true,
        },
      ),
      map: (res) {
        final data = res.data;
        if (data is! CashChargeCreateRsp) return CashChargeCreateRsp();
        return data;
      },
    );
  }

  Future<ApiResult<CashChargeCheckRsp>> verifyReceipt({
    required String orderId,
    required String userId,
    required String extraJson,
  }) {
    return ApiGateway.request(
      () => NetworkBootstrap.client.post(
        '/cash/charge/verify_receipt',
        unpack: PbSpecs.chargeCheck,
        bizParam: {
          'orderId': orderId,
          'userId': userId,
          'extraJson': extraJson,
        },
      ),
      map: (res) {
        final data = res.data;
        if (data is! CashChargeCheckRsp) return CashChargeCheckRsp();
        return data;
      },
    );
  }

  /// 金币消费 / 充值明细。
  Future<ApiResult<List<CashOpHistoryItem>>> opHistory({
    required int pageNum,
    int pageSize = 20,
  }) {
    return ApiGateway.request(() {
      final nowSec = DateTime.now().millisecondsSinceEpoch ~/ 1000;
      return NetworkBootstrap.client.post(
        '/cash/op-history',
        unpack: PbSpecs.cashHistory,
        bizParam: {
          'beginTimestamp': nowSec - 60 * 60 * 24 * 30,
          'endTimestamp': nowSec,
          'pageNum': pageNum,
          'pageSize': pageSize,
        },
      );
    }, map: (res) {
      final data = res.data;
      if (data is! CashOpHistoryRsp) return const [];
      return data.items;
    });
  }
}
