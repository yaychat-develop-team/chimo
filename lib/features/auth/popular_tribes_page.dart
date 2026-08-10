import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

import '../../app/app_router.dart';
import '../../core/auth/auth_session.dart';
import '../../core/constants/app_assets.dart';
import '../../core/network/app_apis.dart';
import '../../core/theme/app_colors.dart';
import '../../core/widgets/app_gradient_button.dart';
import '../../core/widgets/center_toast.dart';
import '../../core/widgets/network_or_asset_avatar.dart';

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

/// 注册流程：从 `/chat/group/listByType`（forya）选取部落 /
/// 回退 `/chat/group/list`，在 Next Step 时加入所选。
class PopularTribesPage extends StatefulWidget {
  const PopularTribesPage({super.key});

  @override
  State<PopularTribesPage> createState() => _PopularTribesPageState();
}

class _PopularTribesPageState extends State<PopularTribesPage> {
  final Set<String> _selected = {};
  List<_TribeOption> _tribes = const [];
  bool _loading = true;
  bool _submitting = false;
  String? _error;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      unawaited(_loadTribes());
    });
  }

  Future<void> _loadTribes() async {
    setState(() {
      _loading = true;
      _error = null;
    });
    try {
      // 对齐 forya SelectTribesPage：listByType（空 typeList = 全部）。
      var res = await AppApis.group.listByType('');
      if ((!res.ok || (res.data?.isEmpty ?? true))) {
        res = await AppApis.group.list(pageNum: 1, pageSize: 50);
      }
      if (!mounted) return;
      if (!res.ok) {
        setState(() {
          _tribes = const [];
          _loading = false;
          _error = res.message.isEmpty ? 'Failed to load tribes' : res.message;
        });
        return;
      }
      final groups = res.data ?? const [];
      setState(() {
        _tribes = [
          for (final g in groups)
            if (g.id.trim().isNotEmpty)
              _TribeOption(
                id: g.id,
                name: g.name.trim().isEmpty ? 'Tribe' : g.name.trim(),
                // Forya 在名称下方展示 GroupInfo.type。
                subtitle: g.category.trim().isNotEmpty
                    ? g.category.trim()
                    : g.description.trim(),
                avatarAsset: g.avatarAsset,
                avatarUrl: g.avatarUrl,
              ),
        ];
        _loading = false;
        _error = null;
      });
    } catch (error) {
      if (!mounted) return;
      setState(() {
        _tribes = const [];
        _loading = false;
        _error = '$error';
      });
    }
  }

  void _toggle(String id) {
    setState(() {
      if (_selected.contains(id)) {
        _selected.remove(id);
      } else {
        _selected.add(id);
      }
    });
  }

  Future<void> _goMain({bool joinSelected = false}) async {
    if (_submitting) return;
    setState(() => _submitting = true);
    try {
      if (joinSelected && _selected.isNotEmpty) {
        final res = await AppApis.group.join(_selected.toList(growable: false));
        if (!mounted) return;
        if (!res.ok) {
          showCenterToast(
            context,
            message: res.message.isEmpty ? 'Join failed' : res.message,
          );
          return;
        }
      }
      await AuthSession.markLoggedIn(method: 'phone');
      if (!mounted) return;
      context.go(AppRoutes.shell);
    } catch (error) {
      if (!mounted) return;
      showCenterToast(context, message: 'Failed: $error');
    } finally {
      if (mounted) setState(() => _submitting = false);
    }
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
                        onTap: _submitting
                            ? null
                            : () => Navigator.of(context).maybePop(),
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
                      onPressed: _submitting
                          ? null
                          : () => unawaited(_goMain()),
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
                child: _loading
                    ? const Center(
                        child: CircularProgressIndicator(
                          color: Color(0xFFB6FF2E),
                        ),
                      )
                    : _error != null && _tribes.isEmpty
                        ? Center(
                            child: Padding(
                              padding: const EdgeInsets.all(24),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    _error!,
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(
                                      color: Color(0xFF9A9A9A),
                                      fontSize: 14,
                                    ),
                                  ),
                                  const SizedBox(height: 12),
                                  TextButton(
                                    onPressed: () => unawaited(_loadTribes()),
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
                                  style: TextStyle(
                                    color: Color(0xFF9A9A9A),
                                    fontSize: 14,
                                  ),
                                ),
                              )
                            : LayoutBuilder(
                                builder: (context, constraints) {
                                  const cardW = 150.0;
                                  const cardH = 105.0;
                                  const avatarHang = 18.0;
                                  const tileH = cardH + avatarHang;
                                  const gapX = 15.0;
                                  final sidePad =
                                      ((constraints.maxWidth -
                                                  cardW * 2 -
                                                  gapX) /
                                              2)
                                          .clamp(12.0, 30.0);

                                  return GridView.builder(
                                    padding: EdgeInsets.fromLTRB(
                                      sidePad,
                                      8,
                                      sidePad,
                                      12,
                                    ),
                                    gridDelegate:
                                        const
                                            SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2,
                                      mainAxisSpacing: 38,
                                      crossAxisSpacing: gapX,
                                      mainAxisExtent: tileH,
                                    ),
                                    itemCount: _tribes.length,
                                    itemBuilder: (context, index) {
                                      final tribe = _tribes[index];
                                      final selected =
                                          _selected.contains(tribe.id);
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
                child: AppGradientButton(
                  label: _submitting ? 'Please wait…' : 'Next Step',
                  onTap: _submitting
                      ? null
                      : () => unawaited(_goMain(joinSelected: true)),
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
                  color: const Color(0xFF1A1A1A),
                  image: const DecorationImage(
                    image: AssetImage(AppAssets.homeMyGroupBg),
                    fit: BoxFit.cover,
                  ),
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
                  color: const Color(0xFF2A2A2A),
                ),
                clipBehavior: Clip.antiAlias,
                child: NetworkOrAssetAvatar(
                  asset: tribe.avatarAsset,
                  url: tribe.avatarUrl,
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
