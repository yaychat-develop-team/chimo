import 'api_client.dart';

/// One wallet recharge package from `/cash/charge/product` or `/cash/goods`.
class CashChargeProduct {
  const CashChargeProduct({
    required this.coins,
    required this.price,
    this.goodsId = '',
    this.productId = '',
  });

  final int coins;
  final double price;
  final String goodsId;
  final String productId;

  String get priceLabel {
    if (price <= 0) return '—';
    return '\$${price.toStringAsFixed(2)}';
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
