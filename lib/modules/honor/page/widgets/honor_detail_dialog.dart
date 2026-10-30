import 'package:flutter/material.dart';

import '../../../../common/models/server_client/honor.pb.dart';
import '../../logic/my_honor_logic.dart';
import '../honor_detail_page.dart';

/// 兼容旧入口：转发到全屏 [HonorDetailPage]。
abstract final class HonorDetailDialog {
  static Future<void> show({
    required BuildContext context,
    required HonorItem item,
    required MyHonorLogic logic,
    bool showWear = false,
    bool fromTarget = false,
    List<HonorItem>? items,
    VoidCallback? onManageTap,
  }) {
    final list = items ?? (showWear ? logic.activeList.toList() : [item]);
    final index = list.indexWhere((e) => e.hid == item.hid);
    return HonorDetailPage.open(
      context: context,
      logic: logic,
      items: list.isEmpty ? [item] : list,
      initialIndex: index < 0 ? 0 : index,
      showWear: showWear,
      fromTarget: fromTarget,
      onManageTap: onManageTap,
    );
  }
}
