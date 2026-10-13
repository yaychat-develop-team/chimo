import 'package:fixnum/fixnum.dart';

import '../models/server_client/base.pbenum.dart';
import '../models/server_client/cash.pb.dart';
import '../models/server_client/common/app.pbenum.dart';
import '../models/server_client/group/group.pb.dart';
import '../models/server_client/user.pb.dart';

/// 页面读生成模型时反复用到的换算。字段本身仍在 proto 上。
extension WireUser on User {
  String get uid => id.toString();

  bool get genderKnown {
    switch (gender.toLowerCase()) {
      case 'female':
      case 'f':
      case '2':
      case 'male':
      case 'm':
      case '1':
        return true;
      default:
        return false;
    }
  }

  bool get male {
    switch (gender.toLowerCase()) {
      case 'female':
      case 'f':
      case '2':
        return false;
      default:
        return true;
    }
  }

  List<String> get approvedPics => [
    for (final item in picList)
      if (item.ok && item.content.trim().isNotEmpty) item.content.trim(),
  ];

  String get shownAvatar => avatarAudit.trim().isNotEmpty ? avatarAudit : avatar;

  String? get vipSmallIcon {
    if (!hasIcons() || icons.smallIcon.trim().isEmpty) return null;
    return icons.smallIcon;
  }

  bool get following =>
      relationType == RelationType.FOLLOW || relationType == RelationType.FRIEND;

  bool get online => onlineStatus == 1 && !isHidden;
}

extension WireGroup on GroupInfo {
  /// 路由和环信会话用群 id；没有环信 id 时用数字 id。
  String get gid => emGroupId.isNotEmpty ? emGroupId : id.toString();

  GroupInfo withJoined(bool joined) => deepCopy()..isJoin = joined;
}

int cashCoins(UserCash cash) {
  if (cash.coin > Int64.ZERO) return cash.coin.toInt();
  final show = double.tryParse(cash.showCoin.replaceAll(',', ''));
  return show?.round() ?? 0;
}

String chargePriceLabel(CashChargeProductListItem item) {
  final local = item.localPrice.trim();
  if (local.isNotEmpty) return local;
  final cents = item.cent.toInt();
  if (cents <= 0) return '—';
  return '\$${(cents / 100).toStringAsFixed(2)}';
}

bool versionHasUpdate(UpdateMode mode) =>
    mode == UpdateMode.FORCE_UPDATE || mode == UpdateMode.REMIND;
