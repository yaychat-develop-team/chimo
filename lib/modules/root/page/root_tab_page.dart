import 'package:chimo/common/utils/chimo.dart';
import 'package:chimo/modules/root/logic/root_tab_logic.dart';
import 'package:chimo/modules/root/model/root_tab_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../common/theme/app_colors.dart';
import '../../chat/logic/chats_list_logic.dart';
import '../../home/logic/home_logic.dart';
import '../../me/logic/me_logic.dart';

/// 主壳层：承载四个 Tab（Home / Room / Chats / Me）。
///
/// Tab 页是 `const`，`IndexedStack` 重建时 Flutter 认出同一个实例并跳过子树。
/// **别给它们加参数**，一加就退回全量重建。
class RootTabPage extends StatefulWidget {
  const RootTabPage({super.key});

  @override
  State<RootTabPage> createState() => _RootTabPageState();
}

class _RootTabPageState extends State<RootTabPage> {
  late final RootTabLogic logic;

  @override
  void initState() {
    super.initState();
    Get.put(ConversationListLogic(), permanent: true);
    logic = Get.put(RootTabLogic());
    Get.put(HomeLogic());
    Get.put(MeLogic());
  }

  @override
  void dispose() {
    if (Get.isRegistered<HomeLogic>()) Get.delete<HomeLogic>();
    if (Get.isRegistered<MeLogic>()) Get.delete<MeLogic>();
    if (Get.isRegistered<RootTabLogic>()) Get.delete<RootTabLogic>();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // IndexedStack 保活各 Tab，状态（如滚动位置、已加入群组）切换后仍保留。
      body: Obx(() => IndexedStack(index: logic.index.value, children: RootTabLogic.tabPages)),
      // 未读角标是唯一跟着 IM 消息重建的东西（`update(['unread'])`）。
      bottomNavigationBar: GetBuilder<ConversationListLogic>(
        id: 'unread',
        builder: (chats) => Obx(
          () => _RootTabBar(
            index: logic.index.value,
            unread: chats.totalUnread,
            onSelected: logic.select,
          ),
        ),
      ),
    );
  }
}

/// 底部导航栏。内容高度：图标 30 + 间距 4 + 文案 15 + 纵向内边距。
class _RootTabBar extends StatelessWidget {
  const _RootTabBar({required this.index, required this.unread, required this.onSelected});

  final int index;
  final int unread;
  final ValueChanged<int> onSelected;

  static const double barHeight = 62;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.black1C1C1E,
      child: SafeArea(
        child: SizedBox(
          height: barHeight,
          child: Row(
            children: RootTabLogic.tabs.indexed.map((item) {
              final (i, tab) = item;
              return _RootTabItem(
                tab: tab,
                selected: i == index,
                badgeCount: tab.showsUnread ? unread : 0,
                onTap: () => onSelected(i),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}

class _RootTabItem extends StatelessWidget {
  const _RootTabItem({
    required this.tab,
    required this.selected,
    required this.badgeCount,
    required this.onTap,
  });

  final RootTabModel tab;
  final bool selected;
  final int badgeCount;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final labelStyle = TextStyle(
      color: selected ? Colors.white : AppColors.white70,
      fontSize: 10,
      fontWeight: FontWeight.w400,
      height: 1.2,
    );
    Widget label = Text(tab.label, style: labelStyle);
    if (selected) {
      label = ShaderMask(
        blendMode: BlendMode.srcIn,
        shaderCallback: (bounds) => AppColors.primaryGradient.createShader(bounds),
        child: label,
      );
    }

    return Expanded(
      child: InkWell(
        onTap: onTap,
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 30,
              height: 30,
              child: Stack(
                clipBehavior: Clip.none,
                alignment: Alignment.center,
                children: [
                  Chimo.image(
                    selected ? tab.selectedIcon : tab.icon,
                    width: 30,
                    height: 30,
                    fit: BoxFit.contain,
                  ),
                  if (badgeCount > 0)
                    Positioned(
                      top: -4,
                      right: -6,
                      child: _NavBadge(label: badgeCount > 99 ? '99+' : '$badgeCount'),
                    ),
                ],
              ),
            ),
            Chimo.gap(height: 4),
            SizedBox(height: 15, child: label),
          ],
        ),
      ),
    );
  }
}

class _NavBadge extends StatelessWidget {
  const _NavBadge({required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(minWidth: 18, minHeight: 14),
      padding: const EdgeInsets.symmetric(horizontal: 4),
      decoration: BoxDecoration(color: AppColors.redFD4B4B, borderRadius: BorderRadius.circular(8)),
      alignment: Alignment.center,
      child: Text(
        label,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 11,
          fontWeight: FontWeight.w600,
          height: 1.1,
        ),
      ),
    );
  }
}
