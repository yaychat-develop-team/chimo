import 'dart:ui';

import 'package:flutter/material.dart';

/// 通用毛玻璃容器：裁剪圆角 + 背景高斯模糊 + 半透明底色。
///
/// 高度随 [child] 自适应，不必写死。用于底部弹层、卡片等需要透出下层内容的场景。
class AppBlurBackdrop extends StatelessWidget {
  const AppBlurBackdrop({
    super.key,
    required this.child,
    this.blur = 28,
    this.color,
    this.borderRadius,
    this.border,
    this.width,
    this.height,
    this.padding,
    this.margin,
    this.alignment,
    this.clipBehavior = Clip.antiAlias,
  });

  final Widget child;

  /// 模糊半径，对应 `ImageFilter.blur` 的 sigma。
  final double blur;

  /// 叠在模糊之上的半透明底色；为空则只保留模糊。
  final Color? color;

  final BorderRadius? borderRadius;
  final BoxBorder? border;
  final double? width;
  final double? height;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final AlignmentGeometry? alignment;
  final Clip clipBehavior;

  @override
  Widget build(BuildContext context) {
    final radius = borderRadius;
    Widget body = BackdropFilter(
      filter: ImageFilter.blur(sigmaX: blur, sigmaY: blur),
      child: Container(
        width: width,
        height: height,
        padding: padding,
        alignment: alignment,
        decoration: BoxDecoration(color: color, borderRadius: radius, border: border),
        child: child,
      ),
    );
    if (radius != null) {
      body = ClipRRect(borderRadius: radius, clipBehavior: clipBehavior, child: body);
    } else if (clipBehavior != Clip.none) {
      body = ClipRect(clipBehavior: clipBehavior, child: body);
    }
    if (margin != null) {
      body = Padding(padding: margin!, child: body);
    }
    return body;
  }
}
