import 'package:chimo/common/utils/chimo.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../app/session_info.dart';
import '../../../common/constants/app_assets.dart';
import '../../../common/models/server_client/honor.pb.dart';
import '../../../common/theme/app_colors.dart';
import '../../../common/widgets/app_pull_refresh.dart';
import '../../../common/widgets/app_scaffold.dart';
import '../logic/my_honor_logic.dart';
import 'honor_detail_page.dart';
import 'manage_honors_page.dart';
import 'widgets/honor_attainable_grid.dart';
import 'widgets/honor_profile_card.dart';
import 'widgets/honor_received_grid.dart';
import 'widgets/honor_tabs.dart';

/// 我的荣誉。UI 对齐设计稿；接口对齐 joyride `/user/honor*`。
class MyHonorPage extends StatefulWidget {
  const MyHonorPage({super.key, int? targetUid}) : targetUid = targetUid ?? 0;

  final int targetUid;

  @override
  State<MyHonorPage> createState() => _MyHonorPageState();
}

class _MyHonorPageState extends State<MyHonorPage> {
  late final int _uid;
  late final MyHonorLogic logic;
  int _tabIndex = 0;

  @override
  void initState() {
    super.initState();
    _uid = widget.targetUid > 0 ? widget.targetUid : SessionInfo.uid;
    logic = MyHonorLogic.put(_uid);
  }

  @override
  void dispose() {
    MyHonorLogic.delete(_uid);
    super.dispose();
  }

  void _openReceived(HonorItem item) {
    final items = logic.activeList.toList(growable: false);
    final index = items.indexWhere((e) => e.hid == item.hid);
    HonorDetailPage.open(
      context: context,
      logic: logic,
      items: items,
      initialIndex: index < 0 ? 0 : index,
      showWear: logic.isMe,
      onManageTap: _onManage,
    );
  }

  void _openAttainable(HonorItem item) {
    final items = logic.targetList.toList(growable: false);
    final index = items.indexWhere((e) => e.hid == item.hid);
    HonorDetailPage.open(
      context: context,
      logic: logic,
      items: items,
      initialIndex: index < 0 ? 0 : index,
      showWear: false,
      fromTarget: true,
    );
  }

  void _onManage() {
    if (!logic.isMe) return;
    ManageHonorsPage.open(logic);
  }

  void _onTabSelected(int index) {
    if (_tabIndex == index) return;
    setState(() => _tabIndex = index);
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    return AppScaffold(
      appBar: AppNavBar(
        title: logic.isMe ? 'My Honor' : 'Honors',
        titleStyle: const TextStyle(
          color: AppColors.white,
          fontSize: 18,
          fontWeight: FontWeight.w700,
        ),
      ),
      backgroundColor: AppColors.black,
      backdrop: Chimo.image(
        AppAssets.honorHomeBg,
        width: width,
        fit: BoxFit.fitWidth,
        alignment: Alignment.topCenter,
      ),
      body: Obx(() {
        if (logic.loading.value && logic.activeList.isEmpty && logic.targetList.isEmpty) {
          return const Center(child: CircularProgressIndicator(color: AppColors.green00FEA8));
        }
        if (logic.error.value.isNotEmpty && logic.activeList.isEmpty && logic.targetList.isEmpty) {
          return Center(
            child: GestureDetector(
              onTap: logic.load,
              child: Text(logic.error.value, style: const TextStyle(color: AppColors.white60)),
            ),
          );
        }

        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Obx(
              () => HonorProfileCard(
                profile: logic.profile.value,
                earnedCount: logic.earnedCount,
                showManage: logic.isMe,
                onManageTap: _onManage,
              ),
            ),
            const SizedBox(height: 8),
            if (logic.isMe)
              HonorTabs(index: _tabIndex, onSelected: _onTabSelected)
            else
              const Padding(
                padding: EdgeInsets.only(top: 4, bottom: 4),
                child: Center(
                  child: Text(
                    'Received',
                    style: TextStyle(
                      color: AppColors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            Expanded(
              child: logic.isMe
                  ? IndexedStack(
                      index: _tabIndex,
                      children: [
                        _ReceivedBody(logic: logic, onTap: _openReceived, showAttainableHint: true),
                        _AttainableBody(logic: logic, onTap: _openAttainable),
                      ],
                    )
                  : _ReceivedBody(logic: logic, onTap: _openReceived, showAttainableHint: false),
            ),
          ],
        );
      }),
    );
  }
}

class _ReceivedBody extends StatelessWidget {
  const _ReceivedBody({required this.logic, required this.onTap, this.showAttainableHint = false});

  final MyHonorLogic logic;
  final ValueChanged<HonorItem> onTap;
  final bool showAttainableHint;

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final items = logic.activeList.toList(growable: false);
      if (items.isEmpty) {
        return AppPullRefresh(
          onRefresh: logic.load,
          accentColor: AppColors.green00FEA8,
          slivers: [
            SliverFillRemaining(
              hasScrollBody: false,
              child: Column(
                children: [
                  const SizedBox(height: 140),
                  const Text(
                    'No Honors Yet',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: AppColors.gray9A9A9A,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  if (showAttainableHint) ...[
                    const SizedBox(height: 8),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 40),
                      child: Text(
                        'Explore Attainable to discover tasks and earn your first Honor!',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: AppColors.white60,
                          fontSize: 13,
                          fontWeight: FontWeight.w400,
                          height: 1.4,
                        ),
                      ),
                    ),
                  ],
                ],
              ),
            ),
          ],
        );
      }
      return HonorReceivedGrid(items: items, onRefresh: logic.load, onTap: onTap);
    });
  }
}

class _AttainableBody extends StatelessWidget {
  const _AttainableBody({required this.logic, required this.onTap});

  final MyHonorLogic logic;
  final ValueChanged<HonorItem> onTap;

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final items = logic.targetList.toList(growable: false);
      if (items.isEmpty) {
        return AppPullRefresh(
          onRefresh: logic.load,
          accentColor: AppColors.green00FEA8,
          slivers: const [
            SliverFillRemaining(
              hasScrollBody: false,
              child: Column(
                children: [
                  SizedBox(height: 140),
                  Text(
                    'No attainable honors',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: AppColors.gray9A9A9A,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      }
      return HonorAttainableGrid(items: items, onRefresh: logic.load, onTap: onTap);
    });
  }
}
