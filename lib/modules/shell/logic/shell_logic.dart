import 'package:get/get.dart';

import '../model/main_tab.dart';

/// 壳层状态：当前 Tab。
class ShellLogic extends GetxController {
  final Rx<MainTab> currentTab = MainTab.home.obs;

  void select(MainTab tab) {
    if (currentTab.value == tab) return;
    currentTab.value = tab;
  }
}
