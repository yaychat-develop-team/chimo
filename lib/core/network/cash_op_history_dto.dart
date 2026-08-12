import 'api_client.dart';

/// `/cash/op-history` 单条明细（对齐 forya `CashOpHistoryItem`）。
class CashOpHistoryItem {
  const CashOpHistoryItem({
    required this.id,
    required this.title,
    required this.timestampSec,
    required this.coin,
    required this.type,
    this.itemId = '',
    this.count = 0,
  });

  final String id;
  final String title;

  /// Unix 秒。
  final int timestampSec;
  final String coin;
  final String type;
  final String itemId;
  final int count;

  double get coinValue => double.tryParse(coin.trim()) ?? 0;
}

/// 解析金币流水列表。
abstract final class CashOpHistoryDto {
  static List<CashOpHistoryItem> parseItems(ApiResponse response) {
    if (!response.success) return const [];
    final data = response.data;
    Object? raw = data;
    if (data is Map) {
      raw = data['items'] ?? data['list'] ?? data['records'];
    }
    if (raw is! List) return const [];

    final out = <CashOpHistoryItem>[];
    for (final entry in raw) {
      if (entry is! Map) continue;
      final map = Map<String, dynamic>.from(entry);
      final title = '${map['title'] ?? ''}'.trim();
      final coin = '${map['coin'] ?? ''}'.trim();
      final type = '${map['type'] ?? ''}'.trim();
      final ts = int.tryParse('${map['timestamp'] ?? 0}') ?? 0;
      if (title.isEmpty && coin.isEmpty) continue;
      out.add(
        CashOpHistoryItem(
          id: '${map['id'] ?? ''}',
          title: title.isEmpty ? 'Coins' : title,
          timestampSec: ts,
          coin: coin.isEmpty ? '0' : coin,
          type: type,
          itemId: '${map['itemId'] ?? ''}',
          count: int.tryParse('${map['count'] ?? 0}') ?? 0,
        ),
      );
    }
    return out;
  }
}
