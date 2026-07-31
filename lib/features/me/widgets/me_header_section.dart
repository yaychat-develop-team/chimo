import 'package:flutter/material.dart';

import '../../../core/constants/app_assets.dart';
import '../../../core/theme/app_colors.dart';
import '../data/me_mock_data.dart';
import '../models/me_models.dart';
import 'me_profile_header.dart';
import 'me_stats_row.dart';

/// Me page header: bubble bg, curved panel, avatar, stats.
///
/// Curve per design: dips under avatar, then slopes down right.
class MeHeaderSection extends StatelessWidget {
  const MeHeaderSection({
    super.key,
    this.profile = MeMockData.profile,
    this.stats = MeMockData.stats,
  });

  final MeProfile profile;
  final List<MeStatItem> stats;

  static const double _bubbleHeight = 176;
  static const double _avatarSize = 78;

  @override
  Widget build(BuildContext context) {
    // Avatar overlaps bubble; bottom sits in curve dip.
    const avatarTop = _bubbleHeight - _avatarSize * 0.72;

    return Stack(
      clipBehavior: Clip.none,
      children: [
        // Bubble illustration (asset jagged bottom cropped)
        SizedBox(
          height: _bubbleHeight + 100,
          width: double.infinity,
          child: Image.asset(
            AppAssets.mineBgTop,
            fit: BoxFit.cover,
            alignment: Alignment.topCenter,
          ),
        ),
        // Smooth curved dark panel
        Padding(
          padding: const EdgeInsets.only(top: _bubbleHeight * 0.42),
          child: ClipPath(
            clipper: const _MePanelCurveClipper(),
            child: ColoredBox(
              color: AppColors.background,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(height: _avatarSize * 0.55 + 48),
                  MeStatsRow(stats: stats),
                  const SizedBox(height: 4),
                ],
              ),
            ),
          ),
        ),
        // Avatar + nickname
        Positioned(
          top: avatarTop,
          left: 0,
          right: 0,
          child: MeProfileHeader(profile: profile),
        ),
      ],
    );
  }
}

/// Design curve: dips under avatar, then slopes down right.
class _MePanelCurveClipper extends CustomClipper<Path> {
  const _MePanelCurveClipper();

  @override
  Path getClip(Size size) {
    final w = size.width;
    final h = size.height;
    final path = Path();

    // Left start (relatively high)
    path.moveTo(0, h * 0.16);
    // Into left side of avatar
    path.cubicTo(
      w * 0.04,
      h * 0.16,
      w * 0.08,
      h * 0.18,
      w * 0.12,
      h * 0.28,
    );
    // Deep dip under avatar bottom
    path.cubicTo(
      w * 0.18,
      h * 0.48,
      w * 0.28,
      h * 0.52,
      w * 0.38,
      h * 0.30,
    );
    // Rise past avatar right, then slope down
    path.cubicTo(
      w * 0.48,
      h * 0.14,
      w * 0.62,
      h * 0.18,
      w * 0.78,
      h * 0.24,
    );
    path.cubicTo(
      w * 0.90,
      h * 0.28,
      w * 0.96,
      h * 0.32,
      w,
      h * 0.36,
    );
    path.lineTo(w, h);
    path.lineTo(0, h);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}
