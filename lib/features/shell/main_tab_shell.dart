import 'package:flutter/material.dart';

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

  /// Chats list state: badge count = sum of per-conversation unread counts.
  late final ChatsListController _chatsController;

  @override
  void initState() {
    super.initState();
    _chatsController = ChatsListController()..addListener(_onChatsChanged);
  }

  @override
  void dispose() {
    _chatsController
      ..removeListener(_onChatsChanged)
      ..dispose();
    super.dispose();
  }

  void _onChatsChanged() {
    if (mounted) setState(() {});
  }

  List<AppBottomNavDestination> get _destinations => [
        const AppBottomNavDestination(tab: MainTab.home),
        AppBottomNavDestination(
          tab: MainTab.chats,
          badgeCount: _chatsController.totalUnread,
        ),
        const AppBottomNavDestination(tab: MainTab.me),
      ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      // IndexedStack keeps tabs alive so state (e.g. joined groups) survives tab switches.
      body: IndexedStack(
        index: _currentTab.index,
        children: [
          HomePage(chatsController: _chatsController),
          ChatsPage(controller: _chatsController),
          const MePage(),
        ],
      ),
      bottomNavigationBar: AppBottomNavBar(
        currentTab: _currentTab,
        destinations: _destinations,
        onTabSelected: (tab) => setState(() => _currentTab = tab),
      ),
    );
  }
}
