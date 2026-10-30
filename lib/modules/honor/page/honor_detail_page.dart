import 'package:chimo/common/utils/chimo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../common/constants/app_assets.dart';
import '../../../common/models/server_client/honor.pb.dart';
import '../../../common/theme/app_colors.dart';
import '../../../common/utils/app_toast.dart';
import '../logic/honor_display.dart';
import '../logic/my_honor_logic.dart';

/// 荣誉勋章详情：左右滑动切换、Hero、装备。
class HonorDetailPage extends StatefulWidget {
  const HonorDetailPage({
    super.key,
    required this.logic,
    required this.items,
    required this.initialIndex,
    this.showWear = false,
    this.fromTarget = false,
    this.onManageTap,
  });

  final MyHonorLogic logic;
  final List<HonorItem> items;
  final int initialIndex;
  final bool showWear;
  final bool fromTarget;
  final VoidCallback? onManageTap;

  static Future<void> open({
    required BuildContext context,
    required MyHonorLogic logic,
    required List<HonorItem> items,
    required int initialIndex,
    bool showWear = false,
    bool fromTarget = false,
    VoidCallback? onManageTap,
  }) {
    if (items.isEmpty) return Future.value();
    final index = initialIndex.clamp(0, items.length - 1);
    // 不用 FadeTransition：与 Hero 叠用会在落地时再闪一次。
    return Navigator.of(context).push<void>(
      PageRouteBuilder<void>(
        opaque: true,
        transitionDuration: const Duration(milliseconds: 320),
        reverseTransitionDuration: const Duration(milliseconds: 280),
        pageBuilder: (context, animation, secondaryAnimation) {
          return HonorDetailPage(
            logic: logic,
            items: items,
            initialIndex: index,
            showWear: showWear,
            fromTarget: fromTarget,
            onManageTap: onManageTap,
          );
        },
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return child;
        },
      ),
    );
  }

  @override
  State<HonorDetailPage> createState() => _HonorDetailPageState();
}

class _HonorDetailPageState extends State<HonorDetailPage> {
  late final PageController _pageController;
  late int _index;

  @override
  void initState() {
    super.initState();
    _index = widget.initialIndex.clamp(0, widget.items.length - 1);
    _pageController = PageController(initialPage: _index, viewportFraction: 0.62);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  HonorItem get _current {
    final list = _liveItems;
    if (list.isEmpty) return widget.items[_index];
    return list[_index.clamp(0, list.length - 1)];
  }

  /// 佩戴后列表会刷新，按 hid 对齐当前项。
  List<HonorItem> get _liveItems {
    final source = widget.showWear ? widget.logic.activeList : widget.items;
    if (source.isEmpty) return widget.items;
    return List<HonorItem>.from(source);
  }

  void _syncIndexAfterReload() {
    final list = _liveItems;
    if (list.isEmpty) return;
    final hid = _current.hid;
    final next = list.indexWhere((e) => e.hid == hid);
    if (next >= 0 && next != _index) {
      setState(() => _index = next);
      if (_pageController.hasClients) {
        _pageController.jumpToPage(next);
      }
    }
  }

  Future<void> _onEquip() async {
    final item = _current;
    final err = await widget.logic.toggleWear(item);
    if (err != null) {
      AppToast.error(err);
      return;
    }
    if (!mounted) return;
    setState(_syncIndexAfterReload);
  }

  @override
  Widget build(BuildContext context) {
    final showManage = widget.showWear && widget.logic.isMe;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          onPressed: () => Navigator.of(context).maybePop(),
          icon: const Icon(Icons.close, color: AppColors.white),
        ),
        actions: [
          if (showManage)
            TextButton(
              onPressed: widget.onManageTap,
              child: const Text(
                'Manage Honors',
                style: TextStyle(color: AppColors.white, fontSize: 15, fontWeight: FontWeight.w500),
              ),
            ),
        ],
      ),
      extendBodyBehindAppBar: true,
      body: Stack(
        fit: StackFit.expand,
        children: [
          Chimo.image(
            AppAssets.honorDetailBg,
            width: Get.width,
            height: Get.height,
            fit: BoxFit.fill,
          ),

          Column(
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    SizedBox(
                      height: 180.w,
                      width: Get.width,
                      child: PageView.builder(
                        controller: _pageController,
                        itemCount: _liveItems.length,
                        onPageChanged: (i) => setState(() => _index = i),
                        itemBuilder: (context, i) {
                          return AnimatedBuilder(
                            animation: _pageController,
                            builder: (context, child) {
                              var scale = 1.0;
                              if (_pageController.hasClients &&
                                  _pageController.position.haveDimensions) {
                                final page = _pageController.page ?? _index.toDouble();
                                scale = (1 - (page - i).abs() * 0.18).clamp(0.78, 1.0);
                              } else if (i != _index) {
                                scale = 0.82;
                              }
                              return Transform.scale(scale: scale, child: child);
                            },
                            child: _MedalHero(
                              item: _liveItems[i],
                              // 仅当前页挂 Hero，避免 PageView 内同 tag 冲突。
                              enableHero: i == _index,
                              fromTarget: widget.fromTarget,
                            ),
                          );
                        },
                      ),
                    ),
                    Chimo.gap(height: 40.w),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  children: [
                    Chimo.gap(height: 20.w),
                    Obx(() {
                      widget.logic.activeList.length;
                      widget.logic.wearing.value;
                      return _InfoBlock(item: _current);
                    }),
                    Spacer(),
                    if (showManage)
                      Container(
                        height: 52.w,
                        margin: const EdgeInsets.symmetric(horizontal: 40).copyWith(bottom: 120.w),
                        alignment: Alignment.center,
                        child: Obx(() {
                          widget.logic.activeList.length;
                          final item = _current;
                          final valid = HonorDisplay.isValid(item);
                          final busy = widget.logic.wearing.value;
                          return _EquipButton(
                            equipped: item.wear,
                            enabled: valid && !busy,
                            busy: busy,
                            onTap: _onEquip,
                          );
                        }),
                      )
                    else
                      Chimo.gap(height: 52),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );

    // return AppScaffold(
    //   backgroundColor: AppColors.black,
    //   backdrop: AppRes.image(
    //     AppAssets.honorDetailBg,
    //     width: Get.width,
    //     height: Get.height,
    //     fit: BoxFit.fill,
    //   ),
    //   navigation: _TopBar(
    //     showManage: showManage,
    //     onClose: () => Navigator.of(context).maybePop(),
    //     onManage: () {
    //       Navigator.of(context).maybePop();
    //       widget.onManageTap?.call();
    //     },
    //   ),
    //   body: Column(
    //     children: [
    //   Expanded(
    //     child: Container(
    //       // color: Colors.cyanAccent,
    //       child: Column(
    //         mainAxisAlignment: MainAxisAlignment.end,
    //         children: [
    //           SizedBox(
    //             height: 180.w,
    //             width: Get.width,
    //             child: PageView.builder(
    //               controller: _pageController,
    //               itemCount: _liveItems.length,
    //               onPageChanged: (i) => setState(() => _index = i),
    //               itemBuilder: (context, i) {
    //                 return AnimatedBuilder(
    //                   animation: _pageController,
    //                   builder: (context, child) {
    //                     var scale = 1.0;
    //                     if (_pageController.hasClients &&
    //                         _pageController.position.haveDimensions) {
    //                       final page = _pageController.page ?? _index.toDouble();
    //                       scale = (1 - (page - i).abs() * 0.18).clamp(0.78, 1.0);
    //                     } else if (i != _index) {
    //                       scale = 0.82;
    //                     }
    //                     return Transform.scale(scale: scale, child: child);
    //                   },
    //                   child: _MedalHero(
    //                     item: _liveItems[i],
    //                     // 仅当前页挂 Hero，避免 PageView 内同 tag 冲突。
    //                     enableHero: i == _index,
    //                     fromTarget: widget.fromTarget,
    //                   ),
    //                 );
    //               },
    //             ),
    //           ),
    //         ],
    //       ),
    //     ),
    //   ),
    //   Expanded(
    //     child: Column(
    //       children: [
    //         Obx(() {
    //           widget.logic.activeList.length;
    //           widget.logic.wearing.value;
    //           return _InfoBlock(item: _current);
    //         }),
    //         AppRes.gap(height: 70),
    //         if (showManage)
    //           Container(
    //             height: 52.w,
    //             margin: const EdgeInsets.symmetric(horizontal: 40),
    //             alignment: Alignment.center,
    //             child: Obx(() {
    //               widget.logic.activeList.length;
    //               final item = _current;
    //               final valid = HonorDisplay.isValid(item);
    //               final busy = widget.logic.wearing.value;
    //               return _EquipButton(
    //                 equipped: item.wear,
    //                 enabled: valid && !busy,
    //                 busy: busy,
    //                 onTap: _onEquip,
    //               );
    //             }),
    //           )
    //         else
    //           AppRes.gap(height: 52),
    //       ],
    //     ),
    //   ),
    // // ],
    // ),
    // );
  }
}

class _MedalHero extends StatelessWidget {
  const _MedalHero({required this.item, required this.enableHero, required this.fromTarget});

  final HonorItem item;
  final bool enableHero;
  final bool fromTarget;

  @override
  Widget build(BuildContext context) {
    final image = item.image.trim().isNotEmpty ? item.image : item.icon;
    // fadeIn 必须为 0：Hero 落地后若再淡入会产生闪一下。
    Widget child = Chimo.image(
      image,
      width: 200,
      height: 200,
      fit: BoxFit.contain,
      fadeIn: Duration.zero,
      gaplessPlayback: true,
    );
    if (enableHero) {
      child = Hero(
        tag: HonorDisplay.heroTag(item, fromTarget: fromTarget),
        child: Material(type: MaterialType.transparency, child: child),
      );
    }
    return Center(child: child);
  }
}

class _InfoBlock extends StatelessWidget {
  const _InfoBlock({required this.item});

  final HonorItem item;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 164.w,
      padding: const EdgeInsets.symmetric(horizontal: 32),
      child: Column(
        children: [
          Text(
            item.name,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: AppColors.white,
              fontSize: 26,
              fontWeight: FontWeight.w700,
              height: 1.2,
            ),
          ),
          Chimo.gap(height: 12),
          UnconstrainedBox(
            child: Container(
              height: 22.w,
              padding: const EdgeInsets.symmetric(horizontal: 12),
              decoration: BoxDecoration(
                color: AppColors.green00FEA8.withValues(alpha: 0.3),
                borderRadius: BorderRadius.circular(12),
                // gradient: LinearGradient(
                //   colors: [AppColors.rgba(0, 254, 168, 1), AppColors.rgba(0, 248, 117, 1)],
                // ),
              ),
              alignment: Alignment.center,
              child: Text(
                HonorDisplay.durationBadge(item),
                style: TextStyle(
                  color: AppColors.rgba(19, 255, 143, 1),
                  fontSize: 12,
                  fontWeight: FontWeight.w700,
                  height: 1.2,
                ),
              ),
            ),
          ),
          Chimo.gap(height: 14),
          Text(
            item.content,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: AppColors.gray9A9A9A,
              fontSize: 14,
              fontWeight: FontWeight.w400,
              height: 1.4,
            ),
          ),
          Chimo.gap(height: 10),
          Text(
            HonorDisplay.obtainedLabel(item),
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: AppColors.gray6E6E6E,
              fontSize: 13,
              fontWeight: FontWeight.w400,
              height: 1.3,
            ),
          ),
        ],
      ),
    );
  }
}

class _EquipButton extends StatelessWidget {
  const _EquipButton({
    required this.equipped,
    required this.enabled,
    required this.busy,
    required this.onTap,
  });

  final bool equipped;
  final bool enabled;
  final bool busy;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final label = equipped ? 'Equipped' : 'Equip Now';
    if (equipped) {
      return SizedBox(
        width: double.infinity,
        height: 52,
        child: OutlinedButton(
          onPressed: enabled ? onTap : null,
          style: OutlinedButton.styleFrom(
            foregroundColor: AppColors.green00FEA8,
            disabledForegroundColor: AppColors.green00FEA8.withValues(alpha: 0.4),
            side: BorderSide(
              color: enabled
                  ? AppColors.green00FEA8
                  : AppColors.green00FEA8.withValues(alpha: 0.35),
              width: 1.5,
            ),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(28)),
          ),
          child: busy
              ? const SizedBox(
                  width: 20,
                  height: 20,
                  child: CircularProgressIndicator(strokeWidth: 2, color: AppColors.green00FEA8),
                )
              : Text(label, style: const TextStyle(fontSize: 17, fontWeight: FontWeight.w700)),
        ),
      );
    }

    return SizedBox(
      width: double.infinity,
      height: 52,
      child: DecoratedBox(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(28),
          gradient: enabled
              ? const LinearGradient(colors: [AppColors.green00F875, AppColors.green00FEA8])
              : null,
          color: enabled ? null : AppColors.green00FEA8.withValues(alpha: 0.35),
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: enabled ? onTap : null,
            borderRadius: BorderRadius.circular(28),
            child: Center(
              child: busy
                  ? const SizedBox(
                      width: 20,
                      height: 20,
                      child: CircularProgressIndicator(strokeWidth: 2, color: AppColors.black),
                    )
                  : Text(
                      label,
                      style: const TextStyle(
                        color: AppColors.black,
                        fontSize: 17,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
            ),
          ),
        ),
      ),
    );
  }
}
