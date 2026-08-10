import '../../../core/network/api_client.dart';

/// `/cash/item` 中的单个礼物 SKU。
class CashGiftItem {
  const CashGiftItem({
    required this.id,
    required this.name,
    required this.price,
    this.iconUrl = '',
    this.canBuy = true,
    this.tabName = '',
  });

  final String id;
  final String name;
  final int price;
  final String iconUrl;
  final bool canBuy;
  final String tabName;
}

/// 解析礼物目录 + 钱包余额。
abstract final class CashGiftDto {
  static int parseBalance(ApiResponse response) {
    if (!response.success) return 0;
    final data = response.data;
    if (data is! Map) return 0;
    final direct = int.tryParse(
      '${data['coin'] ?? data['showCoin'] ?? data['balance'] ?? 0}',
    );
    if (direct != null && direct > 0) return direct;
    // "127969.00"
    final show = '${data['showCoin'] ?? ''}'.replaceAll(',', '');
    final asDouble = double.tryParse(show);
    if (asDouble != null) return asDouble.round();
    final cash = data['userCash'] ?? data['cash'];
    if (cash is Map) {
      return int.tryParse('${cash['coin'] ?? cash['balance'] ?? 0}') ?? 0;
    }
    return int.tryParse('${data['coin'] ?? 0}') ?? 0;
  }

  static List<CashGiftItem> parseItems(ApiResponse response) {
    if (!response.success) return const [];
    final data = response.data;
    if (data is! Map) return const [];
    final tabs = data['itemTab'] ?? data['tabs'] ?? data['list'];
    if (tabs is! List) {
      // 扁平列表回退。
      final flat = data['item'] ?? data['items'];
      if (flat is List) return _parseItemList(flat, tabName: '');
      return const [];
    }

    final out = <CashGiftItem>[];
    for (final tab in tabs) {
      if (tab is! Map) continue;
      final map = Map<String, dynamic>.from(tab);
      final tabName = '${map['name'] ?? ''}'.trim();
      final items = map['item'] ?? map['items'] ?? map['list'];
      if (items is! List) continue;
      out.addAll(_parseItemList(items, tabName: tabName));
    }
    return out;
  }

  static List<CashGiftItem> _parseItemList(
    List list, {
    required String tabName,
  }) {
    final out = <CashGiftItem>[];
    for (final raw in list) {
      if (raw is! Map) continue;
      final map = Map<String, dynamic>.from(raw);
      final id = '${map['id'] ?? ''}'.trim();
      if (id.isEmpty) continue;
      final name = '${map['name'] ?? ''}'.trim();
      if (name.isEmpty) continue;
      final price = int.tryParse('${map['price'] ?? map['cost'] ?? 0}') ?? 0;
      final canBuy = map['canBuy'] != false;
      final icon =
          '${map['icon'] ?? map['iconUrl'] ?? map['img'] ?? ''}'.trim();
      out.add(
        CashGiftItem(
          id: id,
          name: name,
          price: price,
          iconUrl: icon,
          canBuy: canBuy,
          tabName: tabName,
        ),
      );
    }
    return out;
  }
}
