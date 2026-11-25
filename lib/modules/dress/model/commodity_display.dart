import '../../../common/models/server_client/commodity.pb.dart';

/// 装扮展示文案。对齐设计图 My Frame。
abstract final class CommodityDisplay {
  static const _daySec = 24 * 60 * 60;
  static const _hourSec = 60 * 60;

  /// 物品类型短名（空态 / 状态栏）。
  static String typeNoun(CommodityType type) {
    switch (type) {
      case CommodityType.AVATAR_FRAME:
        return 'Frame';
      case CommodityType.MIC_EFFECT:
        return 'Mic Halo';
      case CommodityType.BUBBLE:
        return 'Chat Bubble';
      case CommodityType.AURA:
        return 'Aura';
      case CommodityType.INFO_CARD:
        return 'Info Card';
      case CommodityType.CAR:
        return 'Mount';
      default:
        return 'Item';
    }
  }

  /// 网格底部时效胶囊：`3 days` / `Permanent`。
  static String cardDateDesc(CommodityItem item) {
    switch (item.state) {
      case CommodityState.IDLE:
        if (item.validityPeriod <= 0) return 'Permanent';
        return _formatShort(item.validityPeriod);
      case CommodityState.USING:
      case CommodityState.ACTIVE:
        final diff = item.expiredTime - DateTime.now().millisecondsSinceEpoch ~/ 1000;
        if (diff < 0) return 'Expired';
        if (diff == 0 && item.validityPeriod <= 0) return 'Permanent';
        return _formatShort(diff);
      case CommodityState.EXPIRED:
        return 'Expired';
      default:
        return '';
    }
  }

  /// 状态栏时效：`Time Left: 1d 18h` / `Duration: 30 days`。
  static String statusTimeText(CommodityItem item) {
    if (item.state == CommodityState.USING || item.state == CommodityState.ACTIVE) {
      final diff = item.expiredTime - DateTime.now().millisecondsSinceEpoch ~/ 1000;
      if (diff < 0) return 'Expired';
      if (diff == 0 && item.validityPeriod <= 0) return 'Permanent';
      return 'Time Left: ${_formatCompact(diff)}';
    }
    if (item.validityPeriod <= 0) return 'Duration: Permanent';
    return 'Duration: ${_formatShort(item.validityPeriod)}';
  }

  /// 空态标题。
  static String emptyTitle(CommodityType? type) {
    return 'No ${type == null ? 'Item' : typeNoun(type)} Equipped';
  }

  /// 空态副文案。
  static String emptySubtitle(CommodityType? type) {
    final noun = (type == null ? 'item' : typeNoun(type)).toLowerCase();
    return 'Choose a $noun from your collection to personalize your profile.';
  }

  static const equippedBadge = 'Equipped';

  /// 主操作按钮：Equip / Unequip。
  static String primaryBtn(CommodityItem item) {
    if (item.state == CommodityState.USING) return 'Unequip';
    if (item.state == CommodityState.EXPIRED) return '';
    return 'Equip';
  }

  static String _formatShort(int seconds) {
    final day = seconds ~/ _daySec;
    final hour = (seconds % _daySec) ~/ _hourSec;
    if (day > 0) return day == 1 ? '1 day' : '$day days';
    if (hour > 0) return hour == 1 ? '1 hour' : '$hour hours';
    return '1 hour';
  }

  static String _formatCompact(int seconds) {
    final day = seconds ~/ _daySec;
    final hour = (seconds % _daySec) ~/ _hourSec;
    if (day <= 0 && hour <= 0) return '1h';
    final parts = <String>[
      if (day > 0) '${day}d',
      if (hour > 0) '${hour}h',
    ];
    return parts.join(' ');
  }
}
