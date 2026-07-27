import 'package:flutter/material.dart';

import '../../core/theme/app_colors.dart';
import '../chats/chats_page.dart';
import '../chats/data/chats_list_controller.dart';
import '../home/home_page.dart';
import '../me/me_page.dart';
import 'models/app_bottom_nav_destination.dart';
import 'models/main_tab.dart';
import 'widgets/app_bottom_nav_bar.dart';

/// 主壳层：承载三个 Tab 页面，底部挂载封装好的导航栏。
class MainTabShell extends StatefulWidget {
  const MainTabShell({super.key});

  @override
  State<MainTabShell> createState() => _MainTabShellState();
}

class _MainTabShellState extends State<MainTabShell> {
  MainTab _currentTab = MainTab.home;

  /// 消息列表状态：未读角标 = 各会话 unread 之和。
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
      // 仅构建当前 Tab；会话状态由 [_chatsController] 在壳层保活。
      body: switch (_currentTab) {
        MainTab.home => const HomePage(),
        MainTab.chats => ChatsPage(controller: _chatsController),
        MainTab.me => const MePage(),
      },
      bottomNavigationBar: AppBottomNavBar(
        currentTab: _currentTab,
        destinations: _destinations,
        onTabSelected: (tab) => setState(() => _currentTab = tab),
      ),
    );
  }
}
