import 'package:chimo/common/utils/chimo.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../app/session_info.dart';
import '../../../common/constants/app_assets.dart';
import '../../../common/extensions/wire_view.dart';
import '../../../common/models/server_client/commodity.pb.dart';
import '../../../common/theme/app_colors.dart';
import '../../../common/widgets/app_image.dart';
import '../../../common/widgets/app_pull_refresh.dart';
import '../../../common/widgets/app_scaffold.dart';
import '../logic/my_frame_logic.dart';
import '../model/commodity_display.dart';
import '../widgets/dress_gift_sheet.dart';
import '../widgets/dress_stars.dart';

/// 我的装扮（My Frame）。设计图：frame_bg / frame_selected_bg。
class MyFramePage extends StatefulWidget {
  const MyFramePage({super.key, this.initIndex = -1});

  final int initIndex;

  @override
  State<MyFramePage> createState() => _MyFramePageState();
}

class _MyFramePageState extends State<MyFramePage> with SingleTickerProviderStateMixin {
  late final MyFrameLogic logic;
  TabController? _tabController;
  Worker? _tabsWorker;

  @override
  void initState() {
    super.initState();
    logic = MyFrameLogic.put(initIndex: widget.initIndex);
    _tabsWorker = ever(logic.tabs, (_) => _syncTabController());
  }

  @override
  void dispose() {
    _tabsWorker?.dispose();
    _tabController?.dispose();
    MyFrameLogic.delete();
    super.dispose();
  }

  void _syncTabController() {
    final len = logic.tabs.length;
    if (len <= 0) {
      _tabController?.dispose();
      _tabController = null;
      if (mounted) setState(() {});
      return;
    }
    final index = logic.tabIndex.value.clamp(0, len - 1);
    final old = _tabController;
    if (old != null && old.length == len) {
      if (old.index != index) old.animateTo(index);
      return;
    }
    old?.dispose();
    _tabController = TabController(length: len, vsync: this, initialIndex: index);
    _tabController!.addListener(() {
      if (_tabController!.indexIsChanging) return;
      logic.onTabChanged(_tabController!.index);
    });
    if (mounted) setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBar: const AppNavBar(
        title: 'My Frame',
        titleStyle: TextStyle(color: AppColors.white, fontSize: 18, fontWeight: FontWeight.w700),
      ),
      backgroundColor: AppColors.black,
      backdrop: Chimo.image(
        AppAssets.dressFrameBg,
        fit: BoxFit.cover,
        alignment: Alignment.topCenter,
      ),
      body: Obx(() {
        if (logic.loading.value && logic.tabs.isEmpty) {
          return const Center(child: CircularProgressIndicator(color: AppColors.green00FEA8));
        }
        if (logic.error.value.isNotEmpty && logic.tabs.isEmpty) {
          return Center(
            child: GestureDetector(
              onTap: () => logic.loadTabs(reset: true),
              child: Text(logic.error.value, style: const TextStyle(color: AppColors.white60)),
            ),
          );
        }
        // tabs / TabController 由 ever + setState 同步；这里只读 loading/error，避免整页被列表刷新拖垮。
        return _FrameBody(logic: logic, controller: _tabController);
      }),
    );
  }
}

class _FrameBody extends StatelessWidget {
  const _FrameBody({required this.logic, required this.controller});

  final MyFrameLogic logic;
  final TabController? controller;

  @override
  Widget build(BuildContext context) {
    final tabs = logic.tabs.toList(growable: false);
    final children = <Widget>[];
    for (final tab in tabs) {
      children.add(_DressGrid(key: ValueKey(tab.id), logic: logic, tab: tab));
    }
    return Column(
      children: [
        if (controller != null) _Tabs(controller: controller!, logic: logic),
        _PreviewBlock(logic: logic),
        SizedBox(height: 10.w),
        Expanded(
          child: controller == null
              ? const SizedBox.shrink()
              : TabBarView(controller: controller, children: children),
        ),
      ],
    );
  }
}

class _Tabs extends StatelessWidget {
  const _Tabs({required this.controller, required this.logic});

  final TabController controller;
  final MyFrameLogic logic;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40.h,
      child: TabBar(
        controller: controller,
        isScrollable: true,
        tabAlignment: TabAlignment.start,
        labelPadding: EdgeInsets.symmetric(horizontal: 14.w),
        labelColor: AppColors.white,
        unselectedLabelColor: AppColors.white50,
        labelStyle: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.w600),
        unselectedLabelStyle: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.w400),
        indicatorSize: TabBarIndicatorSize.label,
        indicator: UnderlineTabIndicator(
          borderSide: BorderSide(width: 2.w, color: AppColors.green00FEA8),
          insets: EdgeInsets.symmetric(horizontal: 4.w),
        ),
        dividerColor: Colors.transparent,
        tabs: logic.tabs.map((t) => Tab(text: t.name)).toList(),
      ),
    );
  }
}

class _PreviewBlock extends StatelessWidget {
  const _PreviewBlock({required this.logic});

  final MyFrameLogic logic;

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final item = logic.selectedItem;
      final tab = logic.currentTab;
      final acting = logic.acting.value;
      return Column(
        children: [
          SizedBox(
            height: 128.w,
            child: Center(child: _previewBody(item)),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(16.w, 4.w, 16.w, 0),
            child: _StatusBar(logic: logic, item: item, type: tab?.type, acting: acting),
          ),
        ],
      );
    });
  }

  Widget _previewBody(CommodityItem? item) {
    final avatarUrl = SessionInfo.currentUser?.shownAvatar ?? '';
    final avatarSize = 76.w;
    final frameSize = 118.w;
    final avatar = AppImage.avatar(avatarUrl, size: avatarSize);

    if (item == null) {
      return SizedBox(
        width: frameSize,
        height: frameSize,
        child: Center(child: avatar),
      );
    }

    switch (item.type) {
      case CommodityType.AVATAR_FRAME:
        return SizedBox(
          width: frameSize,
          height: frameSize,
          child: Stack(
            alignment: Alignment.center,
            children: [
              avatar,
              Chimo.image(item.url, width: frameSize, height: frameSize, fit: BoxFit.contain),
            ],
          ),
        );
      case CommodityType.MIC_EFFECT:
        return SizedBox(
          width: frameSize,
          height: frameSize,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Chimo.image(item.url, width: frameSize, height: frameSize, fit: BoxFit.contain),
              avatar,
            ],
          ),
        );
      case CommodityType.BUBBLE:
        return _BubblePreview(url: item.url, colors: item.colors, text: 'So happy to see you!');
      case CommodityType.AURA:
        return Chimo.image(item.url, width: 70.w, height: 140.w, fit: BoxFit.contain);
      default:
        return Chimo.image(item.url, width: frameSize, height: frameSize, fit: BoxFit.contain);
    }
  }
}

class _StatusBar extends StatelessWidget {
  const _StatusBar({
    required this.logic,
    required this.item,
    required this.type,
    required this.acting,
  });

  final MyFrameLogic logic;
  final CommodityItem? item;
  final CommodityType? type;
  final bool acting;

  @override
  Widget build(BuildContext context) {
    final selected = item;
    if (selected == null) {
      return Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 12.h),
        decoration: BoxDecoration(
          color: AppColors.white10,
          borderRadius: BorderRadius.circular(14.r),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              CommodityDisplay.emptyTitle(type),
              style: TextStyle(
                color: AppColors.white,
                fontSize: 14.sp,
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(height: 4.h),
            Text(
              CommodityDisplay.emptySubtitle(type),
              style: TextStyle(color: AppColors.white50, fontSize: 12.sp),
            ),
          ],
        ),
      );
    }

    final using = selected.state == CommodityState.USING;
    final primary = CommodityDisplay.primaryBtn(selected);

    return Container(
      width: double.infinity,
      padding: EdgeInsets.fromLTRB(12.w, 10.w, 10.w, 10.w),
      decoration: BoxDecoration(
        color: AppColors.white10,
        borderRadius: BorderRadius.circular(14.r),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  using ? 'Equipped: ${selected.name}' : 'Preview: ${selected.name}',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: AppColors.white,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w700,
                    height: 1.2,
                  ),
                ),
                SizedBox(height: 4.w),
                Row(
                  children: [
                    Icon(Icons.access_time_rounded, size: 13.w, color: AppColors.white50),
                    SizedBox(width: 3.w),
                    Flexible(
                      child: Text(
                        CommodityDisplay.statusTimeText(selected),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(color: AppColors.white50, fontSize: 12.sp, height: 1.2),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          if (selected.canSend) ...[
            _OutlineBtn(
              label: 'Gift',
              onTap: () => showDressGiftSheet(logic: logic, item: selected),
            ),
            SizedBox(width: 8.w),
          ],
          if (primary.isNotEmpty)
            _ActionBtn(label: primary, filled: !using, loading: acting, onTap: logic.toggleWear),
        ],
      ),
    );
  }
}

class _OutlineBtn extends StatelessWidget {
  const _OutlineBtn({required this.label, required this.onTap});

  final String label;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 32.h,
        padding: EdgeInsets.symmetric(horizontal: 14.w),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.r),
          border: Border.all(color: AppColors.white50),
        ),
        child: Text(
          label,
          style: TextStyle(color: AppColors.white, fontSize: 13.sp, fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}

class _ActionBtn extends StatelessWidget {
  const _ActionBtn({
    required this.label,
    required this.filled,
    required this.loading,
    required this.onTap,
  });

  final String label;
  final bool filled;
  final bool loading;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: loading ? null : onTap,
      child: Container(
        height: 32.h,
        padding: EdgeInsets.symmetric(horizontal: 14.w),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: filled ? AppColors.green00FEA8 : AppColors.white12,
          borderRadius: BorderRadius.circular(16.r),
          border: filled ? null : Border.all(color: AppColors.white50),
        ),
        child: loading
            ? SizedBox(
                width: 16.w,
                height: 16.w,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  color: filled ? AppColors.black : AppColors.white,
                ),
              )
            : Text(
                label,
                style: TextStyle(
                  color: filled ? AppColors.black : AppColors.white,
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w700,
                ),
              ),
      ),
    );
  }
}

class _BubblePreview extends StatelessWidget {
  const _BubblePreview({required this.url, required this.colors, this.text = 'Hello~'});

  final String url;
  final String colors;
  final String text;

  @override
  Widget build(BuildContext context) {
    final textColor = _parseFirstColor(colors) ?? AppColors.white;
    final skin = url.trim();
    final child = Text(
      text,
      style: TextStyle(color: textColor, fontSize: 13.sp, fontWeight: FontWeight.w400),
    );
    if (skin.isEmpty) {
      return Container(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.w),
        decoration: BoxDecoration(
          color: AppColors.black30,
          borderRadius: BorderRadius.circular(12),
        ),
        child: child,
      );
    }
    return Container(
      constraints: const BoxConstraints(minWidth: 59, minHeight: 46),
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.w),
      decoration: BoxDecoration(
        image: Chimo.decorationImage(
          skin,
          scale: 3,
          centerSlice: const Rect.fromLTWH(28, 22, 1, 1),
          fit: BoxFit.fill,
        ),
      ),
      child: child,
    );
  }

  static Color? _parseFirstColor(String raw) {
    final part = raw.split(',').firstOrNull?.trim() ?? '';
    if (part.isEmpty) return null;
    var hex = part;
    if (hex.startsWith('#')) hex = hex.substring(1);
    if (hex.startsWith('0x') || hex.startsWith('0X')) hex = hex.substring(2);
    if (hex.length == 6) hex = 'FF$hex';
    if (hex.length != 8) return null;
    final value = int.tryParse(hex, radix: 16);
    return value == null ? null : Color(value);
  }
}

class _DressGrid extends StatefulWidget {
  const _DressGrid({super.key, required this.logic, required this.tab});

  final MyFrameLogic logic;
  final CommodityTab tab;

  @override
  State<_DressGrid> createState() => _DressGridState();
}

class _DressGridState extends State<_DressGrid> with AutomaticKeepAliveClientMixin {
  MyFrameLogic get logic => widget.logic;
  CommodityTab get tab => widget.tab;

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    // 对齐 joyride：首载放 initState，不在 Obx build 里排队回调。
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;
      logic.loadList(tab);
    });
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    final isAura = tab.type == CommodityType.AURA;
    return Obx(() {
      final loading = logic.listLoading[tab.id] == true;
      final err = logic.listError[tab.id] ?? '';
      final items = logic.itemsByTab[tab.id];
      final list = items ?? const <CommodityItem>[];
      final selectedId = logic.selectedByTab[tab.id]?.id;

      return AppPullRefresh.custom(
        onRefresh: () => logic.loadList(tab, reset: true),
        showNoMoreFooter: false,
        accentColor: AppColors.green00FEA8,
        padding: EdgeInsets.fromLTRB(12.w, 8.h, 12.w, 16.h),
        sliverBuilder: (_) {
          if (loading && items == null) {
            return [
              const SliverFillRemaining(
                hasScrollBody: false,
                child: Center(child: CupertinoActivityIndicator(color: AppColors.green00FEA8)),
              ),
            ];
          }
          if (list.isEmpty) {
            return [
              SliverFillRemaining(
                hasScrollBody: false,
                child: Center(
                  child: GestureDetector(
                    onTap: () => logic.loadList(tab, reset: true),
                    child: Text(
                      err.isEmpty ? 'No data' : err,
                      style: const TextStyle(color: AppColors.white60),
                    ),
                  ),
                ),
              ),
            ];
          }
          return [
            SliverGrid(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                mainAxisSpacing: 10.w,
                crossAxisSpacing: 10.w,
                mainAxisExtent: isAura ? 204.w : 172.w,
              ),
              delegate: SliverChildBuilderDelegate((context, index) {
                final item = list[index];
                return _DressItem(
                  item: item,
                  selected: item.id == selectedId,
                  isBubble: tab.type == CommodityType.BUBBLE,
                  isAura: isAura,
                  onTap: () => logic.selectItem(tab, item),
                );
              }, childCount: list.length),
            ),
          ];
        },
      );
    });
  }
}

class _DressItem extends StatelessWidget {
  const _DressItem({
    required this.item,
    required this.selected,
    required this.isBubble,
    required this.isAura,
    required this.onTap,
  });

  final CommodityItem item;
  final bool selected;
  final bool isBubble;
  final bool isAura;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final radius = 14.r;
    final dateDesc = CommodityDisplay.cardDateDesc(item);
    return GestureDetector(
      onTap: onTap,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: selected ? null : AppColors.black1C1C1E,
          borderRadius: BorderRadius.circular(radius),
          border: Border.all(color: selected ? AppColors.green00FEA8 : Colors.transparent),
          // 选中用设计图 frame_selected_bg（自带绿边），未选中不用再描边。
          image: selected
              ? const DecorationImage(
                  image: AssetImage(AppAssets.dressFrameSelectedBg),
                  fit: BoxFit.fill,
                )
              : null,
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(radius),
          child: Stack(
            children: [
              // 设计图结构：图 → 名称 → 星级 → 底部时效胶囊。
              Padding(
                padding: EdgeInsets.fromLTRB(6.w, 20.w, 6.w, 8.w),
                child: Column(
                  children: [
                    _imageBody(),
                    SizedBox(height: 4.w),
                    SizedBox(
                      height: 18.w,
                      child: Text(
                        item.name,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: AppColors.white,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w700,
                          height: 1.1,
                        ),
                      ),
                    ),
                    SizedBox(height: 2.w),
                    DressStars(level: item.level, dense: true),
                    if (dateDesc.isNotEmpty) ...[
                      SizedBox(height: 4.w),
                      Container(
                        height: 18.w,
                        padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 2.w),
                        decoration: BoxDecoration(
                          color: AppColors.black50,
                          borderRadius: BorderRadius.circular(10.r),
                        ),
                        child: Text(
                          dateDesc,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            color: AppColors.white70,
                            fontSize: 10.sp,
                            fontWeight: FontWeight.w500,
                            height: 1.2,
                          ),
                        ),
                      ),
                    ],
                  ],
                ),
              ),
              // 设计图：Equipped 为左上角绿色文字（无实心底），可与右上角数量同时出现。
              if (equipped)
                PositionedDirectional(
                  start: 8.w,
                  top: 6.w,
                  child: Text(
                    CommodityDisplay.equippedBadge,
                    style: TextStyle(
                      color: AppColors.green00FEA8,
                      fontSize: 10.sp,
                      fontWeight: FontWeight.w600,
                      height: 1.1,
                    ),
                  ),
                ),
              if (item.num > 1 && !isAura)
                PositionedDirectional(
                  end: 5.w,
                  top: 5.w,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 2.w),
                    decoration: const ShapeDecoration(
                      shape: StadiumBorder(),
                      color: AppColors.black60,
                    ),
                    child: Text(
                      '×${item.num}',
                      style: TextStyle(
                        color: AppColors.white,
                        fontSize: 10.sp,
                        fontWeight: FontWeight.w700,
                        height: 1.1,
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _imageBody() {
    if (isBubble) {
      return Center(
        child: _BubblePreview(url: item.url, colors: item.colors, text: 'Yay'),
      );
    }
    return Center(
      child: Chimo.image(
        item.url,
        width: isAura ? null : 80.w,
        height: isAura ? null : 80.w,
        fit: BoxFit.contain,
      ),
    );
  }

  bool get equipped => item.state == CommodityState.USING;
}
