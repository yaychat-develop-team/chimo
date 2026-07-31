import 'package:flutter/material.dart';

import '../../../core/constants/app_assets.dart';
import '../models/main_tab.dart';

/// Bottom nav icons from tab assets (selected / unselected).
abstract final class MainTabIcons {
  /// Returns the icon for [tab] and selection state.
  static Widget build(MainTab tab, {required bool selected, double size = 30}) {
    final asset = switch (tab) {
      MainTab.home => selected ? AppAssets.tabHomeSelected : AppAssets.tabHome,
      MainTab.chats =>
        selected ? AppAssets.tabChatsSelected : AppAssets.tabChats,
      MainTab.me => selected ? AppAssets.tabMeSelected : AppAssets.tabMe,
    };

    // Assets already include selected/unselected styles; no tinting applied.
    return Image.asset(
      asset,
      width: size,
      height: size,
      fit: BoxFit.contain,
    );
  }
}
