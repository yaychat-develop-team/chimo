import 'package:flutter/material.dart';
import 'package:forya_pag/pag.dart';

/// 全屏 PAG 网络特效遮罩（对齐 forya 个人主页 `PAGView.network`）。
class PagNetworkOverlay extends StatelessWidget {
  const PagNetworkOverlay({
    super.key,
    required this.url,
    this.onAnimationStart,
    this.onAnimationEnd,
    this.repeatCount = PAGView.REPEAT_COUNT_DEFAULT,
  });

  final String url;
  final VoidCallback? onAnimationStart;
  final VoidCallback? onAnimationEnd;
  final int repeatCount;

  @override
  Widget build(BuildContext context) {
    final src = url.trim();
    if (src.isEmpty) return const SizedBox.shrink();

    final size = MediaQuery.sizeOf(context);
    return Positioned.fill(
      child: IgnorePointer(
        child: ColoredBox(
          color: Colors.transparent,
          child: PAGView.network(
            src,
            width: size.width,
            height: size.height,
            initProgress: 0,
            autoPlay: true,
            repeatCount: repeatCount,
            onAnimationStart: onAnimationStart,
            onAnimationEnd: onAnimationEnd,
          ),
        ),
      ),
    );
  }
}
