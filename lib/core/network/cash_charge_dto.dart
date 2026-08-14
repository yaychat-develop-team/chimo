import 'api_client.dart';

/// 来自 `/cash/charge/product` 或 `/cash/goods` 的一条钱包充值套餐。
class CashChargeProduct {
  const CashChargeProduct({
    required this.coins,
    required this.price,
    this.goodsId = '',
    this.productId = '',
    this.localPrice = '',
  });

  final int coins;
  final double price;
  /// 商店 SKU（如 `oumi.giap.3`）。
  final String goodsId;
  /// 业务套餐 id，创建订单用。
  final String productId;
  /// 商店本地化价格；有则优先展示。
  final String localPrice;

  String get priceLabel {
    if (localPrice.trim().isNotEmpty) return localPrice.trim();
    if (price <= 0) return '—';
    return '\$${price.toStringAsFixed(2)}';
  }

  CashChargeProduct copyWith({String? localPrice}) {
    return CashChargeProduct(
      coins: coins,
      price: price,
      goodsId: goodsId,
      productId: productId,
      localPrice: localPrice ?? this.localPrice,
    );
  }
}

abstract final class CashChargeDto {
  static List<CashChargeProduct> parseChargeProducts(ApiResponse response) {
    if (!response.success) return const [];
    final data = response.data;
    if (data is! Map) return const [];
    final product = data['product'] ?? data['products'] ?? data['list'];
    if (product is! List) return const [];
    final out = <CashChargeProduct>[];
    for (final item in product) {
      if (item is! Map) continue;
      if (item['isCustomPay'] == true) continue;
      final coins = int.tryParse('${item['coin'] ?? 0}') ?? 0;
      if (coins <= 0) continue;
      out.add(
        CashChargeProduct(
          coins: coins,
          price: _parsePrice(item),
          goodsId: '${item['goodsId'] ?? ''}',
          productId: '${item['id'] ?? ''}',
        ),
      );
    }
    return out;
  }

  static List<CashChargeProduct> parseGoods(ApiResponse response) {
    if (!response.success) return const [];
    final data = response.data;
    if (data is! Map) return const [];
    final list = data['item'] ?? data['items'] ?? data['list'] ?? data['goods'];
    if (list is! List) return const [];
    final out = <CashChargeProduct>[];
    for (final item in list) {
      if (item is! Map) continue;
      final coins = int.tryParse(
            '${item['coin'] ?? item['amount'] ?? item['count'] ?? 0}',
          ) ??
          0;
      if (coins <= 0) continue;
      out.add(
        CashChargeProduct(
          coins: coins,
          price: _parsePrice(item),
          goodsId: '${item['goodsId'] ?? item['id'] ?? ''}',
          productId: '${item['id'] ?? ''}',
        ),
      );
    }
    return out;
  }

  static double _parsePrice(Map item) {
    final local = '${item['localPrice'] ?? item['priceText'] ?? ''}';
    if (local.isNotEmpty) {
      final n = double.tryParse(local.replaceAll(RegExp(r'[^0-9.]'), ''));
      if (n != null && n > 0) return n;
    }
    final price = double.tryParse('${item['price'] ?? ''}');
    if (price != null && price > 0) return price;
    final cent = int.tryParse('${item['cent'] ?? 0}') ?? 0;
    if (cent > 0) return cent / 100.0;
    return 0;
  }
}

class CashChargeVerify {
  const CashChargeVerify({required this.payStatus});

  final String payStatus;

  bool get isSuccess => payStatus == 'SUCCESS' || payStatus == '2';
  bool get isPaying => payStatus == 'PAYING' || payStatus == '1';

  static CashChargeVerify parse(ApiResponse response) {
    final data = response.data;
    if (data is Map) {
      final list = data['item'] ?? data['items'];
      if (list is List && list.isNotEmpty && list.first is Map) {
        return CashChargeVerify(
          payStatus: '${(list.first as Map)['payStatus'] ?? ''}',
        );
      }
      if (data['payStatus'] != null) {
        return CashChargeVerify(payStatus: '${data['payStatus']}');
      }
    }
    return const CashChargeVerify(payStatus: '');
  }
}
