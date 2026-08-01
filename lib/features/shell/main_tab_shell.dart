import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../core/theme/app_colors.dart';
import '../chats/chats_page.dart';
import '../chats/data/chats_list_controller.dart';
import '../home/home_page.dart';
import '../me/me_page.dart';
import 'models/app_bottom_nav_destination.dart';
import 'models/main_tab.dart';
import 'widgets/app_bottom_nav_bar.dart';

/// Main shell: hosts three tab pages with the bottom nav bar.
class MainTabShell extends StatefulWidget {
  const MainTabShell({super.key});

  @override
  State<MainTabShell> createState() => _MainTabShellState();
}

class _MainTabShellState extends State<MainTabShell> {
  MainTab _currentTab = MainTab.home;

  @override
  Widget build(BuildContext context) {
    final chatsController = context.watch<ChatsListController>();

    final destinations = [
      const AppBottomNavDestination(tab: MainTab.home),
      AppBottomNavDestination(
        tab: MainTab.chats,
        badgeCount: chatsController.totalUnread,
      ),
      const AppBottomNavDestination(tab: MainTab.me),
    ];

    return Scaffold(
      backgroundColor: AppColors.background,
      // IndexedStack keeps tabs alive so state (e.g. joined groups) survives tab switches.
      body: IndexedStack(
        index: _currentTab.index,
        children: [
          HomePage(chatsController: chatsController),
          ChatsPage(controller: chatsController),
          const MePage(),
        ],
      ),
      bottomNavigationBar: AppBottomNavBar(
        currentTab: _currentTab,
        destinations: destinations,
        onTabSelected: (tab) => setState(() => _currentTab = tab),
      ),
    );
  }
}
