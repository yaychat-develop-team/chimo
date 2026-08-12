import 'dart:async';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';

import '../../app/app_router.dart';
import '../../core/constants/app_assets.dart';
import '../../core/network/app_apis.dart';
import '../../core/theme/app_colors.dart';
import '../../core/widgets/app_gradient_button.dart';
import 'widgets/onboarding_skip_button.dart';

/// 品牌欢迎页 → 点击任意位置进入行业选择（同页形变动画，对齐 forya）。
class WelcomeBrandPage extends StatefulWidget {
  const WelcomeBrandPage({super.key});

  /// 接口失败时的本地兜底（须与服务端 type 文案一致才能筛群）。
  static const List<String> fallbackIndustries = [
    'Tech / IT',
    'Finance/Business',
    'Creative/Design',
    'Medical/Health',
    'Education/Academia',
    'Sales / Marketing',
    'Legal/Public Service',
    'Engineering/Manufacturing',
  ];

  @override
  State<WelcomeBrandPage> createState() => _WelcomeBrandPageState();
}

class _WelcomeBrandPageState extends State<WelcomeBrandPage>
    with SingleTickerProviderStateMixin {
  /// 0 = 品牌欢迎，1 = 行业选择。
  late final AnimationController _progress;
  final Set<String> _selected = {};
  final ScrollController _listController = ScrollController();
  List<String> _industries = List<String>.from(
    WelcomeBrandPage.fallbackIndustries,
  );
  bool _loadingTypes = true;

  @override
  void initState() {
    super.initState();
    _progress = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 420),
    );
    WidgetsBinding.instance.addPostFrameCallback((_) {
      unawaited(_loadIndustries());
    });
  }

  @override
  void dispose() {
    _progress.dispose();
    _listController.dispose();
    super.dispose();
  }

  Future<void> _loadIndustries() async {
    try {
      final res = await AppApis.group.typeList();
      if (!mounted) return;
      final types = res.data ?? const <String>[];
      setState(() {
        if (res.ok && types.isNotEmpty) {
          _industries = types;
        }
        _loadingTypes = false;
      });
    } catch (_) {
      if (!mounted) return;
      setState(() => _loadingTypes = false);
    }
  }

  bool get _expanded => _progress.value >= 0.98;

  void _expandToIndustries() {
    if (_expanded || _progress.isAnimating) return;
    _progress.animateTo(
      1,
      duration: const Duration(milliseconds: 420),
      curve: Curves.easeOutCubic,
    );
  }

  void _toggle(String industry) {
    setState(() {
      if (_selected.contains(industry)) {
        _selected.remove(industry);
      } else {
        _selected.add(industry);
      }
    });
  }

  void _onSkip() {
    context.push(AppRoutes.tribesPath());
  }

  void _onNext() {
    // 对齐 forya：所选行业逗号拼接后交给 listByType。
    final typeList = _selected.join(',');
    context.push(AppRoutes.tribesPath(typeList: typeList));
  }

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context);
    final top = media.padding.top;
    final bottom = media.padding.bottom;
    final size = media.size;

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: Scaffold(
        backgroundColor: const Color(0xFF0A0A14),
        body: AnimatedBuilder(
          animation: _progress,
          builder: (context, _) {
            final t = Curves.easeInOutCubic.transform(_progress.value);
            final logoHeight = lerpDouble(56, 36, t)!;
            final sloganOpacity = (1.0 - t * 1.35).clamp(0.0, 1.0);
            final industryOpacity = ((t - 0.18) / 0.55).clamp(0.0, 1.0);
            // Logo：从垂直居中动画到顶部。
            final logoTop = lerpDouble(
              (size.height - logoHeight) / 2 - 40,
              top + 12,
              t,
            )!;

            return Stack(
              fit: StackFit.expand,
              children: [
                DecoratedBox(
                  decoration: BoxDecoration(
                    gradient: RadialGradient(
                      center: const Alignment(0, -1.05),
                      radius: 1.15,
                      colors: [
                        const Color(0xFF1A3A28).withValues(alpha: 0.85),
                        Colors.transparent,
                      ],
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
                      child: Image.asset(
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
                              child: _loadingTypes
                                  ? const Center(
                                      child: CircularProgressIndicator(
                                        color: Color(0xFFB6FF2E),
                                      ),
                                    )
                                  : ListView.separated(
                                      controller: _listController,
                                      physics: _expanded
                                          ? const BouncingScrollPhysics()
                                          : const NeverScrollableScrollPhysics(),
                                      padding: const EdgeInsets.fromLTRB(
                                        30,
                                        0,
                                        30,
                                        12,
                                      ),
                                      itemCount: _industries.length,
                                      separatorBuilder: (_, _) =>
                                          const SizedBox(height: 10),
                                      itemBuilder: (context, index) {
                                        final industry = _industries[index];
                                        return _IndustryTile(
                                          label: industry,
                                          selected:
                                              _selected.contains(industry),
                                          onTap: () => _toggle(industry),
                                        );
                                      },
                                    ),
                            ),
                            Padding(
                              padding: EdgeInsets.fromLTRB(
                                30,
                                8,
                                30,
                                bottom + 16,
                              ),
                              child: AppGradientButton(
                                label: 'Next Step',
                                onTap: _expanded && !_loadingTypes
                                    ? _onNext
                                    : null,
                                enabled: _expanded && !_loadingTypes,
                              ),
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
                  child: OnboardingSkipButton(onPressed: _onSkip),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

class _IndustryTile extends StatelessWidget {
  const _IndustryTile({
    required this.label,
    required this.selected,
    required this.onTap,
  });

  final String label;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: const Color(0xFF2A2A2A),
      borderRadius: BorderRadius.circular(27),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(27),
        child: SizedBox(
          height: 54,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18),
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
                    border: selected
                        ? null
                        : Border.all(
                            color: const Color(0xFF5A5A5E),
                            width: 1.5,
                          ),
                  ),
                  child: selected
                      ? const Icon(
                          Icons.check,
                          size: 14,
                          color: Color(0xFF232518),
                        )
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
