import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../common/constants/app_assets.dart';
import '../../../common/theme/app_colors.dart';
import '../logic/welcome_brand_logic.dart';
import '../../../common/widgets/app_gradient_button.dart';
import '../../../common/widgets/skip_button.dart';
import '../../../common/widgets/app_image.dart';
import '../../../common/widgets/app_scaffold.dart';

/// 品牌欢迎页 → 点击任意位置进入行业选择（同页形变动画，对齐 forya）。
class WelcomeBrandPage extends StatefulWidget {
  const WelcomeBrandPage({super.key});

  @override
  State<WelcomeBrandPage> createState() => _WelcomeBrandPageState();
}

class _WelcomeBrandPageState extends State<WelcomeBrandPage> with SingleTickerProviderStateMixin {
  /// 0 = 品牌欢迎，1 = 行业选择。
  late final AnimationController _progress;
  late final WelcomeBrandLogic logic;
  final ScrollController _listController = ScrollController();

  @override
  void initState() {
    super.initState();
    logic = Get.put(WelcomeBrandLogic());
    _progress = AnimationController(vsync: this, duration: const Duration(milliseconds: 420));
  }

  @override
  void dispose() {
    _progress.dispose();
    _listController.dispose();
    Get.delete<WelcomeBrandLogic>();
    super.dispose();
  }

  bool get _expanded => _progress.value >= 0.98;

  void _expandToIndustries() {
    if (_expanded || _progress.isAnimating) return;
    _progress.animateTo(1, duration: const Duration(milliseconds: 420), curve: Curves.easeOutCubic);
  }

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context);
    final top = media.padding.top;
    final bottom = media.padding.bottom;
    final size = media.size;

    return ChimoScaffold(
      showNav: false,
      safeArea: false,
      backgroundColor: AppColors.backgroundDeep,
      body: AnimatedBuilder(
        animation: _progress,
        builder: (context, _) {
          final t = Curves.easeInOutCubic.transform(_progress.value);
          final logoHeight = lerpDouble(56, 36, t)!;
          final sloganOpacity = (1.0 - t * 1.35).clamp(0.0, 1.0);
          final industryOpacity = ((t - 0.18) / 0.55).clamp(0.0, 1.0);
          // Logo：从垂直居中动画到顶部。
          final logoTop = lerpDouble((size.height - logoHeight) / 2 - 40, top + 12, t)!;

          return Stack(
            fit: StackFit.expand,
            children: [
              DecoratedBox(
                decoration: BoxDecoration(
                  gradient: RadialGradient(
                    center: const Alignment(0, -1.05),
                    radius: 1.15,
                    colors: [AppColors.chipGreenDark.withValues(alpha: 0.85), Colors.transparent],
                  ),
                ),
              ),
              // 欢迎态：点击任意位置进入行业选择（对齐 forya）。
              if (!_expanded)
                Positioned.fill(
                  child: GestureDetector(
                    behavior: HitTestBehavior.opaque,
                    onTap: _expandToIndustries,
                    child: const SizedBox.expand(),
                  ),
                ),
              // Logo 区域
              Positioned(
                top: logoTop,
                left: 0,
                right: 0,
                child: IgnorePointer(
                  child: Center(
                    child: AppImage(
                      AppAssets.brandTitleLogo,
                      height: logoHeight,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),
              // Slogan（展开时淡出）
              if (sloganOpacity > 0.01)
                Positioned(
                  top: logoTop + logoHeight + 28,
                  left: 36,
                  right: 36,
                  child: IgnorePointer(
                    child: Opacity(
                      opacity: sloganOpacity,
                      child: Transform.translate(
                        offset: Offset(0, -12 * t),
                        child: const Text(
                          'Unvoiced workplace secrets. A\n'
                          'shared experience connects us\n'
                          'instantly!',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            height: 1.45,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              // 行业选择内容
              Positioned(
                top: logoTop + logoHeight + 20,
                left: 0,
                right: 0,
                bottom: 0,
                child: IgnorePointer(
                  ignoring: industryOpacity < 0.55,
                  child: Opacity(
                    opacity: industryOpacity,
                    child: Transform.translate(
                      offset: Offset(0, lerpDouble(72, 0, industryOpacity)!),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 30),
                            child: Text(
                              'Select your Industry/Area of Interest',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                height: 1.5,
                              ),
                            ),
                          ),
                          const SizedBox(height: 28),
                          Expanded(
                            child: Obx(() {
                              final loading = logic.loadingTypes.value;
                              if (loading) {
                                return const Center(
                                  child: CircularProgressIndicator(
                                    color: AppColors.accentLimeBright,
                                  ),
                                );
                              }
                              final industries = logic.industries.toList();
                              final picked = logic.selected.toList();
                              return ListView.separated(
                                controller: _listController,
                                physics: _expanded
                                    ? const BouncingScrollPhysics()
                                    : const NeverScrollableScrollPhysics(),
                                padding: const EdgeInsets.fromLTRB(30, 0, 30, 12),
                                itemCount: industries.length,
                                separatorBuilder: (_, _) => const SizedBox(height: 10),
                                itemBuilder: (context, index) {
                                  final industry = industries[index];
                                  return _IndustryTile(
                                    label: industry,
                                    selected: picked.contains(industry),
                                    onTap: () => logic.toggle(industry),
                                  );
                                },
                              );
                            }),
                          ),
                          Padding(
                            padding: EdgeInsets.fromLTRB(30, 8, 30, bottom + 16),
                            child: Obx(() {
                              final canNext = _expanded && !logic.loadingTypes.value;
                              return AppGradientButton(
                                label: 'Next Step',
                                onTap: canNext ? logic.next : null,
                                enabled: canNext,
                              );
                            }),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              // Skip 置顶，避免被列表挡住（对齐 forya）。
              Positioned(
                top: top + 8,
                right: 18,
                child: SkipButton(onPressed: logic.skip),
              ),
            ],
          );
        },
      ),
    );
  }
}

class _IndustryTile extends StatelessWidget {
  const _IndustryTile({required this.label, required this.selected, required this.onTap});

  final String label;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColors.tagBackground,
      borderRadius: BorderRadius.circular(27),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(27),
        child: SizedBox(
          height: 54,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    label,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                Container(
                  width: 20,
                  height: 20,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: selected ? AppColors.promoBannerGradient : null,
                    border: selected ? null : Border.all(color: AppColors.textGray5A, width: 1.5),
                  ),
                  child: selected
                      ? const Icon(Icons.check, size: 14, color: AppColors.promoText)
                      : null,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
