import '../../../common/models/server_client/honor.pb.dart';

/// 荣誉展示文案（有效期 / 奖励天数 / 进度）。
abstract final class HonorDisplay {
  static bool isValid(HonorItem item) {
    if (item.forever) return true;
    return _isAfterNow(item.expireTime.toInt());
  }

  /// Received 副标题：Permanent / Expires in N days / Expired。
  static String receivedStatus(HonorItem item) {
    if (item.forever) return 'Permanent';
    final days = _daysLeft(item.expireTime.toInt());
    if (days == null) return 'Expired';
    if (days <= 0) return 'Expired';
    if (days == 1) return 'Expires in 1 day';
    return 'Expires in $days days';
  }

  /// Attainable 时长标签：Permanent / N days。
  static String rewardTag(HonorItem item) {
    if (item.rewardDays == -1 || item.forever) return 'Permanent';
    if (item.rewardDays <= 0) return 'Permanent';
    return '${item.rewardDays} days';
  }

  static double progress(HonorItem item) {
    final target = item.targetCount;
    if (target <= 0) return 0;
    return (item.currentCount / target).clamp(0.0, 1.0);
  }

  static String progressText(HonorItem item) {
    return '${item.currentCount}/${item.targetCount}';
  }

  static String activationDate(HonorItem item) {
    return _formatYmd(item.firstActiveTime.toInt());
  }

  static String validToDate(HonorItem item) {
    if (item.forever) return 'Permanent';
    return _formatYmd(item.expireTime.toInt());
  }

  /// Hero 标签。列表 ↔ 详情共用；[fromTarget] 区分 Attainable，避免 IndexedStack 双列表同 hid 冲突。
  static String heroTag(HonorItem item, {bool fromTarget = false}) =>
      fromTarget ? 'honor_target_${item.hid}' : 'honor_medal_${item.hid}';

  /// 详情页绿色胶囊：Permanent / N days。
  static String durationBadge(HonorItem item) {
    if (item.forever) return 'Permanent';
    if (item.rewardDays > 0) return '${item.rewardDays} days';
    return receivedStatus(item);
  }

  /// 详情页获得时间：Obtained on Month D, YYYY。
  static String obtainedLabel(HonorItem item) {
    final raw = item.firstActiveTime.toInt();
    if (raw <= 0) return 'Obtained on --';
    final ms = raw < 100000000000 ? raw * 1000 : raw;
    final d = DateTime.fromMillisecondsSinceEpoch(ms);
    const months = [
      'January',
      'February',
      'March',
      'April',
      'May',
      'June',
      'July',
      'August',
      'September',
      'October',
      'November',
      'December',
    ];
    return 'Obtained on ${months[d.month - 1]} ${d.day}, ${d.year}';
  }

  static int? _daysLeft(int millis) {
    if (millis <= 0) return null;
    final ms = millis < 100000000000 ? millis * 1000 : millis;
    final end = DateTime.fromMillisecondsSinceEpoch(ms);
    return end.difference(DateTime.now()).inDays;
  }

  static bool _isAfterNow(int millis) {
    if (millis <= 0) return false;
    final ms = millis < 100000000000 ? millis * 1000 : millis;
    return DateTime.fromMillisecondsSinceEpoch(ms).isAfter(DateTime.now());
  }

  static String _formatYmd(int millis) {
    if (millis <= 0) return '--';
    final ms = millis < 100000000000 ? millis * 1000 : millis;
    final d = DateTime.fromMillisecondsSinceEpoch(ms);
    final m = d.month.toString().padLeft(2, '0');
    final day = d.day.toString().padLeft(2, '0');
    return '${d.year}-$m-$day';
  }
}
