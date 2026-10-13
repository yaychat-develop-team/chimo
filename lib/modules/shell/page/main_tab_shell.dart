import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../common/widgets/app_scaffold.dart';
import '../../chat/page/chats_page.dart';
import '../../chat/logic/chats_list_logic.dart';
import '../../home/page/home_page.dart';
import '../../home/logic/home_logic.dart';
import '../../me/page/me_page.dart';
import '../../me/logic/me_logic.dart';
import '../logic/shell_logic.dart';
import '../model/app_bottom_nav_destination.dart';
import '../model/main_tab.dart';
import 'widgets/app_bottom_nav_bar.dart';

/// 主壳层：承载三个 Tab 页面与底部导航栏。
///
/// 任何一条新消息（未读变化）都会重建整个 `build` —— 而 `IndexedStack` 保活，
/// 三个 Tab 的子树全部跟着重建，IM 密集时持续掉帧。
/// 现在只有两小块会重建：`Obx` 里的 `IndexedStack.index`（切 Tab 时）、
/// `GetBuilder(id: 'unread')` 里的底栏（未读变化时）。
/// 三个 Tab 是 `const`，`IndexedStack` 重建时 Flutter 认出同一个 const 实例，
/// 直接跳过子树 —— **别给它们加参数**，一加就退回全量重建。
class MainTabShell extends StatefulWidget {
  const MainTabShell({super.key});

  @override
  State<MainTabShell> createState() => _MainTabShellState();
}

class _MainTabShellState extends State<MainTabShell> {
  late final ShellLogic logic;

  /// 三个 Tab 是 `IndexedStack` 里的 `const` 子节点，接不了自己的生命周期，
  /// 它们的 logic 只能挂在壳层这一层。
  @override
  void initState() {
    super.initState();
    logic = Get.put(ShellLogic());
    Get.put(HomeLogic());
    Get.put(MeLogic());
  }

  @override
  void dispose() {
    if (Get.isRegistered<HomeLogic>()) Get.delete<HomeLogic>();
    if (Get.isRegistered<MeLogic>()) Get.delete<MeLogic>();
    if (Get.isRegistered<ShellLogic>()) Get.delete<ShellLogic>();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ChimoScaffold(
      showNav: false,
      safeArea: false,
      // IndexedStack 保活各 Tab，状态（如滚动位置、已加入群组）切换后仍保留。
      body: Obx(
        () => IndexedStack(
          index: logic.currentTab.value.index,
          children: const [HomePage(), ChatsPage(), MePage()],
        ),
      ),
      // 未读角标是唯一跟着 IM 消息重建的东西（`update(['unread'])`）。
      bottomNavigationBar: GetBuilder<ChatsListLogic>(
        id: 'unread',
        builder: (chats) => Obx(
          () => AppBottomNavBar(
            currentTab: logic.currentTab.value,
            destinations: [
              const AppBottomNavDestination(tab: MainTab.home),
              AppBottomNavDestination(tab: MainTab.chats, badgeCount: chats.totalUnread),
              const AppBottomNavDestination(tab: MainTab.me),
            ],
            onTabSelected: logic.select,
          ),
        ),
      ),
    );
  }
}
