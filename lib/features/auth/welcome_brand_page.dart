import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../core/constants/app_assets.dart';
import '../../core/theme/app_colors.dart';
import 'popular_tribes_page.dart';

/// Brand welcome → swipe up to industry selection (same-page morph animation).
class WelcomeBrandPage extends StatefulWidget {
  const WelcomeBrandPage({super.key});

  static const List<String> industries = [
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
  /// 0 = brand welcome, 1 = industry selection.
  late final AnimationController _progress;
  final Set<String> _selected = {};
  final ScrollController _listController = ScrollController();

  @override
  void initState() {
    super.initState();
    _progress = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 420),
    );
  }

  @override
  void dispose() {
    _progress.dispose();
    _listController.dispose();
    super.dispose();
  }

  bool get _expanded => _progress.value >= 0.98;

  void _onDragUpdate(DragUpdateDetails details) {
    final h = MediaQuery.sizeOf(context).height;
    final delta = -details.delta.dy / (h * 0.42);
    _progress.value = (_progress.value + delta).clamp(0.0, 1.0);
  }

  void _onDragEnd(DragEndDetails details) {
    final velocity = details.primaryVelocity ?? 0;
    final target = (velocity < -500 || _progress.value >= 0.28) ? 1.0 : 0.0;
    _progress.animateTo(
      target,
      duration: const Duration(milliseconds: 380),
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

  void _onNext() {
    Navigator.of(context).push(
      PageRouteBuilder<void>(
        pageBuilder: (_, _, _) => const PopularTribesPage(),
        transitionsBuilder: (_, animation, _, child) {
          return FadeTransition(opacity: animation, child: child);
        },
        transitionDuration: const Duration(milliseconds: 420),
      ),
    );
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
        backgroundColor: Colors.black,
        body: AnimatedBuilder(
          animation: _progress,
          builder: (context, _) {
            final t = Curves.easeInOutCubic.transform(_progress.value);
            final logoHeight = lerpDouble(56, 36, t)!;
            final sloganOpacity = (1.0 - t * 1.35).clamp(0.0, 1.0);
            final industryOpacity = ((t - 0.18) / 0.55).clamp(0.0, 1.0);
            // Logo: animate from vertical center to top.
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
                // Swipe-up gesture layer (hands off to list scroll when expanded).
                if (!_expanded)
                  GestureDetector(
                    behavior: HitTestBehavior.opaque,
                    onVerticalDragUpdate: _onDragUpdate,
                    onVerticalDragEnd: _onDragEnd,
                    child: const SizedBox.expand(),
                  ),
                // Logo
                Positioned(
                  top: logoTop,
                  left: 0,
                  right: 0,
                  child: Center(
                    child: Image.asset(
                      AppAssets.brandTitleLogo,
                      height: logoHeight,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                // Slogan (fades out on swipe up)
                if (sloganOpacity > 0.01)
                  Positioned(
                    top: logoTop + logoHeight + 28,
                    left: 36,
                    right: 36,
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
                // Industry selection content
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
                              padding: EdgeInsets.symmetric(horizontal: 20),
                              child: Text(
                                'Select your Industry/Area of Interest',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w700,
                                  height: 1.25,
                                ),
                              ),
                            ),
                            const SizedBox(height: 20),
                            Expanded(
                              child: NotificationListener<
                                  OverscrollNotification>(
                                onNotification: (n) {
                                  // Pull down at list top collapses back to welcome state.
                                  if (_expanded &&
                                      n.overscroll < 0 &&
                                      (_listController.hasClients &&
                                          _listController.offset <= 0)) {
                                    _progress.animateTo(
                                      0,
                                      duration: const Duration(
                                        milliseconds: 360,
                                      ),
                                      curve: Curves.easeOutCubic,
                                    );
                                    return true;
                                  }
                                  return false;
                                },
                                child: ListView.separated(
                                  controller: _listController,
                                  physics: _expanded
                                      ? const BouncingScrollPhysics()
                                      : const NeverScrollableScrollPhysics(),
                                  padding: const EdgeInsets.fromLTRB(
                                    20,
                                    0,
                                    20,
                                    12,
                                  ),
                                  itemCount:
                                      WelcomeBrandPage.industries.length,
                                  separatorBuilder: (_, _) =>
                                      const SizedBox(height: 12),
                                  itemBuilder: (context, index) {
                                    final industry =
                                        WelcomeBrandPage.industries[index];
                                    return _IndustryTile(
                                      label: industry,
                                      selected: _selected.contains(industry),
                                      onTap: () => _toggle(industry),
                                    );
                                  },
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.fromLTRB(
                                20,
                                8,
                                20,
                                bottom + 16,
                              ),
                              child: SizedBox(
                                height: 52,
                                child: FilledButton(
                                  onPressed: _expanded ? _onNext : null,
                                  style: FilledButton.styleFrom(
                                    backgroundColor: AppColors.primaryBright,
                                    disabledBackgroundColor:
                                        AppColors.primaryBright.withValues(
                                      alpha: 0.45,
                                    ),
                                    foregroundColor: Colors.black,
                                    shape: const StadiumBorder(),
                                    textStyle: const TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  child: const Text('Next Step'),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
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
      color: const Color(0xFF1C1C1E),
      borderRadius: BorderRadius.circular(14),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(14),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 180),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14),
            border: Border.all(
              color: selected ? AppColors.primaryBright : Colors.transparent,
              width: 1.5,
            ),
          ),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  label,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              AnimatedContainer(
                duration: const Duration(milliseconds: 180),
                width: 24,
                height: 24,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: selected ? AppColors.primaryBright : Colors.transparent,
                  border: Border.all(
                    color: selected
                        ? AppColors.primaryBright
                        : const Color(0xFF5A5A5E),
                    width: 1.5,
                  ),
                ),
                child: selected
                    ? const Icon(Icons.check, size: 16, color: Colors.white)
                    : null,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
