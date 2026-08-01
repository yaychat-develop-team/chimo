import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

import '../../app/app_router.dart';
import '../../core/auth/auth_session.dart';
import '../../core/constants/app_assets.dart';
import '../../core/theme/app_colors.dart';

class _TribeOption {
  const _TribeOption({
    required this.id,
    required this.name,
    required this.subtitle,
    required this.avatarAsset,
  });

  final String id;
  final String name;
  final String subtitle;
  final String avatarAsset;
}

/// Registration flow: pick popular tribes.
class PopularTribesPage extends StatefulWidget {
  const PopularTribesPage({super.key});

  static const List<_TribeOption> tribes = [
    _TribeOption(
      id: 'cat',
      name: 'Cat Club',
      subtitle: 'Feline lovers',
      avatarAsset: AppAssets.avatarPlace,
    ),
    _TribeOption(
      id: 'code',
      name: 'Code Crafters',
      subtitle: 'Software Developers',
      avatarAsset: AppAssets.avatarPlace,
    ),
    _TribeOption(
      id: 'food',
      name: 'Foodie Hub',
      subtitle: 'Culinary Creators',
      avatarAsset: AppAssets.avatarPlace,
    ),
    _TribeOption(
      id: 'wellness',
      name: 'Wellness',
      subtitle: 'Holistic living',
      avatarAsset: AppAssets.avatarPlace,
    ),
    _TribeOption(
      id: 'clinical',
      name: 'Clinical Corner',
      subtitle: 'Physicians & Specialists',
      avatarAsset: AppAssets.avatarPlace,
    ),
    _TribeOption(
      id: 'finance',
      name: 'Finance',
      subtitle: 'Financial Pros',
      avatarAsset: AppAssets.avatarPlace,
    ),
    _TribeOption(
      id: 'green',
      name: 'Green Life',
      subtitle: 'Embracing eco-consciousness',
      avatarAsset: AppAssets.avatarPlace,
    ),
    _TribeOption(
      id: 'teachers',
      name: "Teachers' Lounge",
      subtitle: 'Educators & Teachers',
      avatarAsset: AppAssets.avatarPlace,
    ),
  ];

  @override
  State<PopularTribesPage> createState() => _PopularTribesPageState();
}

class _PopularTribesPageState extends State<PopularTribesPage> {
  final Set<String> _selected = {'code', 'clinical', 'finance'};

  void _toggle(String id) {
    setState(() {
      if (_selected.contains(id)) {
        _selected.remove(id);
      } else {
        _selected.add(id);
      }
    });
  }

  Future<void> _goMain() async {
    await AuthSession.markLoggedIn(method: 'phone');
    if (!mounted) return;
    context.go(AppRoutes.shell);
  }

  @override
  Widget build(BuildContext context) {
    final bottom = MediaQuery.paddingOf(context).bottom;

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: Scaffold(
        backgroundColor: const Color(0xFF0A0A14),
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(30, 16, 30, 0),
                child: Row(
                  children: [
                    Material(
                      color: const Color(0xFF2A2A2A),
                      borderRadius: BorderRadius.circular(12),
                      child: InkWell(
                        onTap: () => Navigator.of(context).maybePop(),
                        borderRadius: BorderRadius.circular(12),
                        child: SizedBox(
                          width: 36,
                          height: 36,
                          child: Center(
                            child: SvgPicture.asset(
                              AppAssets.backArrow,
                              width: 7,
                              height: 12,
                              colorFilter: const ColorFilter.mode(
                                Colors.white,
                                BlendMode.srcIn,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const Spacer(),
                    TextButton(
                      onPressed: _goMain,
                      style: TextButton.styleFrom(
                        foregroundColor: AppColors.textSecondary,
                        textStyle: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      child: const Text('Skip'),
                    ),
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.fromLTRB(30, 28, 30, 16),
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
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    const cardW = 150.0;
                    const cardH = 105.0;
                    const avatarHang = 18.0;
                    const tileH = cardH + avatarHang;
                    const gapX = 15.0;
                    final sidePad =
                        ((constraints.maxWidth - cardW * 2 - gapX) / 2)
                            .clamp(12.0, 30.0);

                    return GridView.builder(
                      padding: EdgeInsets.fromLTRB(sidePad, 8, sidePad, 12),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 38,
                        crossAxisSpacing: gapX,
                        mainAxisExtent: tileH,
                      ),
                      itemCount: PopularTribesPage.tribes.length,
                      itemBuilder: (context, index) {
                        final tribe = PopularTribesPage.tribes[index];
                        final selected = _selected.contains(tribe.id);
                        return _TribeCard(
                          tribe: tribe,
                          selected: selected,
                          onTap: () => _toggle(tribe.id),
                        );
                      },
                    );
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(30, 8, 30, bottom + 16),
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    onTap: _goMain,
                    borderRadius: BorderRadius.circular(27),
                    child: Ink(
                      height: 54,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(27),
                        gradient: AppColors.promoBannerGradient,
                      ),
                      child: const Center(
                        child: Text(
                          'Next Step',
                          style: TextStyle(
                            color: AppColors.promoText,
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
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
}

class _TribeCard extends StatelessWidget {
  const _TribeCard({
    required this.tribe,
    required this.selected,
    required this.onTap,
  });

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
                  // Solid fill under the bg art so the card is not see-through.
                  color: const Color(0xFF1A1A1A),
                  image: const DecorationImage(
                    image: AssetImage(AppAssets.homeMyGroupBg),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Positioned(
              // Inset from the 18px corner so the 20 check stays inside the card.
              top: avatarHang + 14,
              right: 14,
              child: Container(
                width: checkSize,
                height: checkSize,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: selected ? AppColors.promoBannerGradient : null,
                  color: selected ? null : const Color(0xFF1A1A1A),
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
                        size: 12,
                        color: Color(0xFF232518),
                      )
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
                  // Opaque under avatar so PNG alpha does not show page through.
                  color: const Color(0xFF2A2A2A),
                ),
                clipBehavior: Clip.antiAlias,
                child: Image.asset(
                  tribe.avatarAsset,
                  width: avatarSize,
                  height: avatarSize,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Positioned(
              left: 16,
              right: 40,
              // Below the 60 avatar; matches design title/subtitle blocks (~23 + gap + 18).
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
