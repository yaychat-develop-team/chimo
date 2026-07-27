import 'package:flutter/material.dart';

import '../../../core/constants/app_assets.dart';
import '../../../core/theme/app_colors.dart';
import '../data/me_mock_data.dart';
import '../models/me_models.dart';
import 'me_profile_header.dart';
import 'me_stats_row.dart';

/// 「我的」页头部整块：气泡背景 + 弧形深色面板 + 头像资料 + 统计。
///
/// 弧线按设计稿：从左侧起，绕过头像底部下凹，再向右轻微下斜。
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
    // 头像大部分压在气泡区，底部落入弧线下凹处。
    const avatarTop = _bubbleHeight - _avatarSize * 0.72;

    return Stack(
      clipBehavior: Clip.none,
      children: [
        // 气泡插画（已裁掉资源自带锯齿深色底）
        SizedBox(
          height: _bubbleHeight + 100,
          width: double.infinity,
          child: Image.asset(
            AppAssets.mineBgTop,
            fit: BoxFit.cover,
            alignment: Alignment.topCenter,
          ),
        ),
        // 平滑弧形深色面板
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
        // 头像 + 昵称
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

/// 设计稿弧线：绕过头像底部下凹，再向右轻微下斜。
class _MePanelCurveClipper extends CustomClipper<Path> {
  const _MePanelCurveClipper();

  @override
  Path getClip(Size size) {
    final w = size.width;
    final h = size.height;
    final path = Path();

    // 左侧起点（相对较高）
    path.moveTo(0, h * 0.16);
    // 进入头像左侧
    path.cubicTo(
      w * 0.04,
      h * 0.16,
      w * 0.08,
      h * 0.18,
      w * 0.12,
      h * 0.28,
    );
    // 绕过头像底部的深凹
    path.cubicTo(
      w * 0.18,
      h * 0.48,
      w * 0.28,
      h * 0.52,
      w * 0.38,
      h * 0.30,
    );
    // 头像右侧抬起后向右缓降
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
