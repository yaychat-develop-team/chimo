import '../../../core/network/api_client.dart';

/// One person who viewed my profile (`/user-relation/viewedBy`).
class VisitRecord {
  const VisitRecord({
    required this.uid,
    required this.nickname,
    required this.avatarUrl,
    required this.lastViewTimestampMs,
    required this.viewCount,
  });

  final String uid;
  final String nickname;
  final String? avatarUrl;

  /// Server timestamp in ms (same as forya ViewedByItem.lastViewTimestamp).
  final int lastViewTimestampMs;
  final int viewCount;

  String get relativeLabel {
    if (lastViewTimestampMs <= 0) return 'Recently';
    final now = DateTime.now().millisecondsSinceEpoch;
    final seconds = ((now - lastViewTimestampMs) / 1000).floor();
    if (seconds < 5) return 'a few seconds';
    if (seconds < 60) return '$seconds seconds';
    if (seconds < 60 * 60) return '${seconds ~/ 60} min';
    if (seconds < 60 * 60 * 24) return '${seconds ~/ (60 * 60)} hours';
    return '${seconds ~/ (60 * 60 * 24)} days';
  }

  String get subtitle =>
      '$relativeLabel visited you · ${_visitCountLabel(viewCount)}';

  static String visitCountLabel(int count) => _visitCountLabel(count);

  static String _visitCountLabel(int count) {
    if (count <= 1) return '1 time';
    return '$count times';
  }
}

abstract final class VisitDto {
  static List<VisitRecord> parseList(ApiResponse res) {
    if (!res.success) return const [];
    final data = res.data;
    if (data is! Map) return const [];
    final raw = data['viewedByList'] ?? data['list'] ?? data['records'];
    if (raw is! List) return const [];

    final out = <VisitRecord>[];
    for (final item in raw) {
      if (item is! Map) continue;
      final uid = '${item['uid'] ?? item['userId'] ?? item['id'] ?? ''}'.trim();
      if (uid.isEmpty || uid == 'null') continue;
      final nick =
          '${item['nickname'] ?? item['nickName'] ?? item['name'] ?? ''}'.trim();
      final avatar = '${item['avatar'] ?? item['avatarUrl'] ?? ''}'.trim();
      final ts = _asInt(
        item['lastViewTimestamp'] ??
            item['lastViewTime'] ??
            item['viewTime'] ??
            item['timestamp'],
      );
      // Some backends return seconds; treat values under year-2001-ms as seconds.
      final tsMs = ts > 0 && ts < 100000000000 ? ts * 1000 : ts;
      final cnt = _asInt(item['viewCnt'] ?? item['viewCount'] ?? item['count']);
      out.add(
        VisitRecord(
          uid: uid,
          nickname: nick.isEmpty ? 'User' : nick,
          avatarUrl: avatar.isEmpty ? null : avatar,
          lastViewTimestampMs: tsMs,
          viewCount: cnt > 0 ? cnt : 1,
        ),
      );
    }
    return out;
  }

  static int _asInt(Object? v) {
    if (v is int) return v;
    if (v is num) return v.toInt();
    return int.tryParse('$v') ?? 0;
  }
}
