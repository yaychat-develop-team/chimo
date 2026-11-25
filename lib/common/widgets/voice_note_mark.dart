import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constants/app_assets.dart';
import '../theme/app_colors.dart';
import '../utils/chimo.dart';

/// 语音标记：黄圆播放 + 音浪 + 时长。Reveal Card / Voice Note 共用。
class VoiceNoteMark extends StatelessWidget {
  const VoiceNoteMark({
    super.key,
    required this.duration,
    this.onTap,
    this.height = 44,
    this.backgroundColor,
    this.borderRadius = 12,
    this.padding = const EdgeInsets.symmetric(horizontal: 12),
  });

  final int duration;
  final VoidCallback? onTap;
  final double height;
  final Color? backgroundColor;
  final double borderRadius;
  final EdgeInsetsGeometry padding;

  @override
  Widget build(BuildContext context) {
    final child = Container(
      height: height,
      padding: padding,
      decoration: BoxDecoration(
        color: backgroundColor ?? AppColors.rgba(253, 246, 82, 0.12),
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            height: 24.w,
            width: 24.w,
            alignment: Alignment.center,
            decoration: const BoxDecoration(color: AppColors.yellowFDE42B, shape: BoxShape.circle),
            child: Chimo.image(AppAssets.voicePlayIcon, width: 14.w, height: 14.w),
          ),
          const SizedBox(width: 8),
          Chimo.image(AppAssets.voiceWaveLine, width: 44.w, height: 8.w, fit: BoxFit.contain),
          const SizedBox(width: 8),
          Text(
            '$duration"',
            style: TextStyle(color: AppColors.white, fontSize: 13.sp, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
    if (onTap == null) return child;
    return GestureDetector(onTap: onTap, behavior: HitTestBehavior.opaque, child: child);
  }
}
