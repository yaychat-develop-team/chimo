import 'package:flutter/material.dart';

import '../../../core/constants/app_assets.dart';
import '../models/main_tab.dart';

/// 底部导航图标（来自 Tab 资源：选中 / 未选中）。
abstract final class MainTabIcons {
  /// 返回 [tab] 在给定选中状态下的图标。
  static Widget build(MainTab tab, {required bool selected, double size = 30}) {
    final asset = switch (tab) {
      MainTab.home => selected ? AppAssets.tabHomeSelected : AppAssets.tabHome,
      MainTab.chats =>
        selected ? AppAssets.tabChatsSelected : AppAssets.tabChats,
      MainTab.me => selected ? AppAssets.tabMeSelected : AppAssets.tabMe,
    };

    // 资源已含选中/未选中样式；不再额外着色。
    return Image.asset(
      asset,
      width: size,
      height: size,
      fit: BoxFit.contain,
    );
  }
}
