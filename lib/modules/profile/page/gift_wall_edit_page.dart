import 'package:fixnum/fixnum.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../app/chimo_api.dart';
import '../../../common/models/server_client/gift_wall.pb.dart';
import '../../../common/models/server_client/user.pb.dart';
import '../../../common/theme/app_colors.dart';
import '../../../common/utils/app_toast.dart';
import '../../../common/widgets/app_scaffold.dart';
import 'widgets/gift_wall_cells.dart';

/// 编辑礼物橱窗。对齐 joyride `GiftWallEditPage`。
class GiftWallEditPage extends StatefulWidget {
  const GiftWallEditPage({super.key});

  @override
  State<GiftWallEditPage> createState() => _GiftWallEditPageState();
}

class _GiftWallEditPageState extends State<GiftWallEditPage> with SingleTickerProviderStateMixin {
  late final TabController _tabs;
  GiftShowConfigRsp? _data;
  var _loading = true;

  List<GiftItem> get _showcase => _data?.showcaseList ?? const [];
  List<GiftItem> get _vault => _data?.vaultList ?? const [];

  @override
  void initState() {
    super.initState();
    _tabs = TabController(length: 2, vsync: this);
    _load();
  }

  @override
  void dispose() {
    _tabs.dispose();
    super.dispose();
  }

  Future<void> _load() async {
    setState(() => _loading = true);
    final res = await ChimoApis.giftWall.warehouse();
    if (!mounted) return;
    setState(() {
      _loading = false;
      if (res.ok) _data = res.data;
    });
    if (!res.ok) {
      AppToast.error(res.message.isEmpty ? 'Failed' : res.message);
    }
  }

  Future<void> _toggle(int itemId, {required bool add}) async {
    final ids = _showcase.map((e) => e.id).toList();
    if (add) {
      ids.insert(0, Int64(itemId));
    } else {
      ids.removeWhere((e) => e.toInt() == itemId);
    }
    final res = await ChimoApis.giftWall.saveShowList(ids.toSet());
    if (!res.ok) {
      AppToast.error(res.message.isEmpty ? 'Failed' : res.message);
      return;
    }
    await _load();
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      backgroundColor: AppColors.purple14102B,
      appBar: const AppNavBar(title: 'Edit Showcase'),
      body: _loading
          ? const Center(child: CircularProgressIndicator(color: AppColors.green29EEAA))
          : Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.w),
                  child: Container(
                    height: 36.w,
                    decoration: BoxDecoration(
                      color: AppColors.white.withValues(alpha: 0.06),
                      borderRadius: BorderRadius.circular(18.w),
                    ),
                    child: TabBar(
                      controller: _tabs,
                      indicatorSize: TabBarIndicatorSize.tab,
                      dividerColor: AppColors.transparent,
                      indicator: BoxDecoration(
                        borderRadius: BorderRadius.circular(18.w),
                        gradient: AppColors.primaryGradient,
                      ),
                      labelColor: AppColors.black1F2518,
                      unselectedLabelColor: AppColors.white50,
                      labelStyle: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w500),
                      unselectedLabelStyle: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w500),
                      tabs: const [
                        Tab(text: 'Showcase'),
                        Tab(text: 'Vault'),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: TabBarView(
                    controller: _tabs,
                    children: [
                      _grid(
                        _showcase,
                        mode: GiftWallCellMode.showcase,
                        onToggle: (id) => _toggle(id, add: false),
                      ),
                      _grid(
                        _vault,
                        mode: GiftWallCellMode.vault,
                        onToggle: (id) => _toggle(id, add: true),
                      ),
                    ],
                  ),
                ),
              ],
            ),
    );
  }

  Widget _grid(
    List<GiftItem> items, {
    required GiftWallCellMode mode,
    required void Function(int id) onToggle,
  }) {
    if (items.isEmpty) {
      return const Center(
        child: Text('No gifts', style: TextStyle(color: AppColors.white60)),
      );
    }
    return GridView.builder(
      padding: EdgeInsets.fromLTRB(10.w, 20.w, 10.w, 20.w),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        mainAxisSpacing: 3.w,
        crossAxisSpacing: 10.w,
        childAspectRatio: 112 / 162,
      ),
      itemCount: items.length,
      itemBuilder: (_, i) {
        final item = items[i];
        return GiftWallGiftCell(
          item: item,
          mode: mode,
          mine: true,
          onToggle: () => onToggle(item.id.toInt()),
        );
      },
    );
  }
}
