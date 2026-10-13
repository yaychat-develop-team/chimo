import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../common/constants/app_assets.dart';
import '../../../common/extensions/wire_view.dart';
import '../../../common/theme/app_colors.dart';
import '../logic/popular_tribes_logic.dart';
import '../../../common/widgets/app_gradient_button.dart';
import '../../../common/widgets/skip_button.dart';
import '../../../common/widgets/app_scaffold.dart';
import '../../../common/widgets/app_image.dart';

class _TribeOption {
  const _TribeOption({
    required this.id,
    required this.name,
    required this.subtitle,
    required this.avatarAsset,
    this.avatarUrl,
  });

  final String id;
  final String name;
  final String subtitle;
  final String avatarAsset;
  final String? avatarUrl;
}

/// 注册流程：按所选行业调用 `/chat/group/listByType`（forya），
/// 未选行业时 typeList 为空表示全部；失败时回退 `/chat/group/list`。
class PopularTribesPage extends StatefulWidget {
  const PopularTribesPage({super.key, this.typeList = ''});

  /// 逗号分隔的行业 type（来自上一页勾选）。
  final String typeList;

  @override
  State<PopularTribesPage> createState() => _PopularTribesPageState();
}

class _PopularTribesPageState extends State<PopularTribesPage> {
  late final PopularTribesLogic logic;

  @override
  void initState() {
    super.initState();
    logic = Get.put(PopularTribesLogic(typeList: widget.typeList.trim()));
  }

  @override
  void dispose() {
    Get.delete<PopularTribesLogic>();
    super.dispose();
  }

  List<_TribeOption> get _tribes => [
    for (final g in logic.groups)
      if (g.gid.trim().isNotEmpty)
        _TribeOption(
          id: g.gid,
          name: g.name.trim().isEmpty ? 'Tribe' : g.name.trim(),
          subtitle: g.type.trim().isNotEmpty ? g.type.trim() : g.desc.trim(),
          avatarAsset: AppAssets.avatarPlace,
          avatarUrl: g.avatar.trim().isEmpty ? null : g.avatar,
        ),
  ];

  @override
  Widget build(BuildContext context) {
    final bottom = MediaQuery.paddingOf(context).bottom;

    return Obx(
      () => ChimoScaffold(
        backgroundColor: AppColors.backgroundDeep,
        circledBack: true,
        backEnabled: !logic.submitting.value,
        trailing: SkipButton(
          enabled: !logic.submitting.value,
          onPressed: () => logic.continueHome(),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Padding(
              padding: EdgeInsets.fromLTRB(30, 16, 30, 16),
              child: Text(
                'Popular Tribes',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 26,
                  fontWeight: FontWeight.w700,
                  height: 1.5,
                ),
              ),
            ),
            Expanded(
              child: logic.loading.value
                  ? const Center(
                      child: CircularProgressIndicator(color: AppColors.accentLimeBright),
                    )
                  : logic.error.value != null && _tribes.isEmpty
                  ? Center(
                      child: Padding(
                        padding: const EdgeInsets.all(24),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              logic.error.value!,
                              textAlign: TextAlign.center,
                              style: const TextStyle(color: AppColors.textSecondary, fontSize: 14),
                            ),
                            const SizedBox(height: 12),
                            TextButton(
                              onPressed: () => unawaited(logic.load()),
                              child: const Text('Retry'),
                            ),
                          ],
                        ),
                      ),
                    )
                  : _tribes.isEmpty
                  ? const Center(
                      child: Text(
                        'No tribes available',
                        style: TextStyle(color: AppColors.textSecondary, fontSize: 14),
                      ),
                    )
                  : LayoutBuilder(
                      builder: (context, constraints) {
                        const cardW = 150.0;
                        const cardH = 105.0;
                        const avatarHang = 18.0;
                        const tileH = cardH + avatarHang;
                        const gapX = 15.0;
                        final sidePad = ((constraints.maxWidth - cardW * 2 - gapX) / 2).clamp(
                          12.0,
                          30.0,
                        );

                        return GridView.builder(
                          padding: EdgeInsets.fromLTRB(sidePad, 8, sidePad, 12),
                          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: 38,
                            crossAxisSpacing: gapX,
                            mainAxisExtent: tileH,
                          ),
                          itemCount: _tribes.length,
                          itemBuilder: (context, index) {
                            final tribe = _tribes[index];
                            final selected = logic.selected.contains(tribe.id);
                            return _TribeCard(
                              tribe: tribe,
                              selected: selected,
                              onTap: () => logic.toggle(tribe.id),
                            );
                          },
                        );
                      },
                    ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(30, 8, 30, bottom + 16),
              child: AppGradientButton(
                label: logic.submitting.value ? 'Please wait…' : 'Next Step',
                onTap: logic.submitting.value ? null : () => logic.continueHome(joinSelected: true),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _TribeCard extends StatelessWidget {
  const _TribeCard({required this.tribe, required this.selected, required this.onTap});

  final _TribeOption tribe;
  final bool selected;
  final VoidCallback onTap;

  static const double cardW = 150;
  static const double cardH = 105;
  static const double avatarSize = 60;
  static const double avatarHang = 18;
  static const double checkSize = 20;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: SizedBox(
        width: cardW,
        height: cardH + avatarHang,
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Positioned(
              top: avatarHang,
              left: 0,
              width: cardW,
              height: cardH,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(18),
                  color: AppColors.surfaceInput,
                  image: AppImage.decorationImage(AppAssets.homeMyGroupBg, fit: BoxFit.cover),
                ),
              ),
            ),
            Positioned(
              top: avatarHang + 14,
              right: 14,
              child: Container(
                width: checkSize,
                height: checkSize,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: selected ? AppColors.promoBannerGradient : null,
                  color: selected ? null : AppColors.surfaceInput,
                  border: selected ? null : Border.all(color: AppColors.textGray5A, width: 1.5),
                ),
                child: selected
                    ? const Icon(Icons.check, size: 12, color: AppColors.promoText)
                    : null,
              ),
            ),
            Positioned(
              top: 0,
              left: 16,
              child: Container(
                width: avatarSize,
                height: avatarSize,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(14),
                  color: AppColors.tagBackground,
                ),
                clipBehavior: Clip.antiAlias,
                child: AppImage(
                  tribe.avatarUrl,
                  fallbackAsset: tribe.avatarAsset,
                  fit: BoxFit.cover,
                  fadeIn: Duration.zero,
                ),
              ),
            ),
            Positioned(
              left: 16,
              right: 40,
              top: avatarHang + 44,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    tribe.name,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      height: 23 / 14,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    tribe.subtitle,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: Colors.white.withValues(alpha: 0.55),
                      fontSize: 11,
                      height: 18 / 11,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
