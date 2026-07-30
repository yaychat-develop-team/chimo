import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../core/constants/app_assets.dart';
import '../../core/theme/app_colors.dart';
import '../shell/main_tab_shell.dart';

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

/// 注册流程：选择热门 Tribes。
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

  void _goMain() {
    Navigator.of(context).pushAndRemoveUntil(
      PageRouteBuilder<void>(
        pageBuilder: (_, _, _) => const MainTabShell(),
        transitionsBuilder: (_, animation, _, child) {
          return FadeTransition(opacity: animation, child: child);
        },
        transitionDuration: const Duration(milliseconds: 420),
      ),
      (_) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    final bottom = MediaQuery.paddingOf(context).bottom;

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(8, 4, 12, 0),
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () => Navigator.of(context).maybePop(),
                      style: IconButton.styleFrom(
                        backgroundColor: const Color(0xFF1C1C1E),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        minimumSize: const Size(36, 36),
                        fixedSize: const Size(36, 36),
                        padding: EdgeInsets.zero,
                      ),
                      icon: SvgPicture.asset(
                        AppAssets.backArrow,
                        width: 18,
                        height: 18,
                        colorFilter: const ColorFilter.mode(
                          Colors.white,
                          BlendMode.srcIn,
                        ),
                      ),
                    ),
                    const Spacer(),
                    TextButton(
                      onPressed: _goMain,
                      style: TextButton.styleFrom(
                        foregroundColor: AppColors.textSecondary,
                        textStyle: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      child: const Text('Skip'),
                    ),
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.fromLTRB(20, 12, 20, 16),
                child: Text(
                  'Popular Tribes',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 28,
                    fontWeight: FontWeight.w800,
                    height: 1.15,
                  ),
                ),
              ),
              Expanded(
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    const cardW = 150.0;
                    const cardH = 105.0;
                    const avatarHang = 30.0;
                    const tileH = cardH + avatarHang;
                    const gapX = 22.0;
                    final sidePad =
                        ((constraints.maxWidth - cardW * 2 - gapX) / 2)
                            .clamp(12.0, 30.0);

                    return GridView.builder(
                      padding: EdgeInsets.fromLTRB(sidePad, 8, sidePad, 12),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 20,
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
                padding: EdgeInsets.fromLTRB(20, 8, 20, bottom + 16),
                child: SizedBox(
                  height: 52,
                  child: FilledButton(
                    onPressed: _goMain,
                    style: FilledButton.styleFrom(
                      backgroundColor: AppColors.primaryBright,
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
  static const double avatarHang = 30;
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
            // 卡片底：150×105，头像下沉半高。
            Positioned(
              top: avatarHang,
              left: 0,
              width: cardW,
              height: cardH,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(18),
                  image: const DecorationImage(
                    image: AssetImage(AppAssets.homeMyGroupBg),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            // 选中勾：卡片右上 20×20。
            Positioned(
              top: avatarHang + 10,
              right: 10,
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 180),
                width: checkSize,
                height: checkSize,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color:
                      selected ? AppColors.primaryBright : Colors.transparent,
                  border: Border.all(
                    color: selected
                        ? AppColors.primaryBright
                        : const Color(0xFF5A5A5E),
                    width: 1.5,
                  ),
                ),
                child: selected
                    ? const Icon(Icons.check, size: 12, color: Colors.white)
                    : null,
              ),
            ),
            // 头像 60×60，一半悬在卡片上方。
            Positioned(
              top: 0,
              left: 12,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(14),
                child: Image.asset(
                  tribe.avatarAsset,
                  width: avatarSize,
                  height: avatarSize,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            // 标题 + 副标题：头像下方左侧。
            Positioned(
              left: 12,
              right: 36,
              top: avatarHang + avatarHang + 8,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    tribe.name,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.w700,
                      height: 1.2,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    tribe.subtitle,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      color: AppColors.textSecondary,
                      fontSize: 12,
                      height: 1.2,
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
