import 'package:fixnum/fixnum.dart';

import '../models/server_client/base.pbenum.dart';
import '../models/server_client/cash.pb.dart';
import '../models/server_client/common/app.pbenum.dart';
import '../models/server_client/group/group.pb.dart';
import '../models/server_client/user.pb.dart';

/// 归一化为 `male` / `female`；未设置返回 `null`。
String? normalizeGender(String? raw) {
  final g = (raw ?? '').trim().toLowerCase();
  if (g == 'male' || g == 'm' || g == '1' || g == 'man') return 'male';
  if (g == 'female' || g == 'f' || g == '2' || g == 'woman') return 'female';
  return null;
}

/// 展示用 `Male` / `Female`；未知返回空串。
String genderDisplayLabel(String? raw) {
  return switch (normalizeGender(raw)) {
    'male' => 'Male',
    'female' => 'Female',
    _ => '',
  };
}

/// 页面读生成模型时反复用到的换算。字段本身仍在 proto 上。
extension WireUser on User {
  String get uid => id.toString();

  bool get genderKnown => normalizeGender(gender) != null;

  /// 未知性别时按男处理，与历史展示一致。
  bool get male => normalizeGender(gender) != 'female';

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

  /// 对齐 joyride `User.isGsGroupUser`。
  bool get isGsGroupUser => job != Job.BOSS && gsGroupId.toInt() > 0;
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
