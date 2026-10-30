import 'package:chimo/common/theme/app_button.dart';
import 'package:chimo/common/widgets/app_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// 资源整合工具类（间距 / 图片 / 按钮），图片能力委托 [AppImage]。
class Chimo with AppButton {
  Chimo._();
  static final Chimo s = Chimo._();

  /// 间距、颜色容器
  static Widget gap({double? width, double? height, Color? color, double? radius}) {
    return Container(
      height: height?.w,
      width: width?.w,
      decoration: BoxDecoration(color: color, borderRadius: BorderRadius.circular(radius ?? 0)),
    );
  }

  /// 图片加载：SVG、PAG、网络、本地、data URI
  static Widget image(
    String? src, {
    Key? key,
    AppImageFormat? format,
    double? width,
    double? height,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    Color? color,
    BlendMode? colorBlendMode,
    BorderRadius? radius,
    bool circle = false,
    BoxBorder? border,
    Color? borderColor,
    double borderWidth = 1,
    Widget? placeholder,
    Widget? error,
    String? fallbackAsset,
    Duration fadeIn = const Duration(milliseconds: 200),
    int? memWidth,
    int? memHeight,
    double? scale,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = false,
    FilterQuality filterQuality = FilterQuality.low,
    bool repaintBoundary = false,
    String? package,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    int repeatCount = -1,
    bool autoPlay = true,
  }) {
    final w = width?.w;
    final h = height?.w;
    final resolvedBorder =
        border ?? (borderColor != null ? Border.all(color: borderColor, width: borderWidth) : null);

    final image = AppImage.image(
      src ?? '',
      key: resolvedBorder == null ? key : null,
      format: format,
      // 有边框时尺寸交给外层 Container，避免与 border inset 双重约束。
      width: resolvedBorder == null ? w : null,
      height: resolvedBorder == null ? h : null,
      fit: fit,
      alignment: alignment,
      color: color,
      colorBlendMode: colorBlendMode,
      // 有边框时由外层 Container 负责圆角裁剪，避免双重裁剪。
      radius: resolvedBorder == null ? radius : null,
      circle: resolvedBorder == null && circle,
      placeholder: placeholder,
      error: error,
      fallbackAsset: fallbackAsset,
      fadeIn: fadeIn,
      memWidth: memWidth,
      memHeight: memHeight,
      scale: scale,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      filterQuality: filterQuality,
      repaintBoundary: repaintBoundary,
      package: package,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      repeatCount: repeatCount,
      autoPlay: autoPlay,
    );

    if (resolvedBorder == null) return image;

    return Container(
      key: key,
      width: w,
      height: h,
      decoration: BoxDecoration(
        border: resolvedBorder,
        borderRadius: circle ? null : radius,
        shape: circle ? BoxShape.circle : BoxShape.rectangle,
      ),
      clipBehavior: Clip.antiAlias,
      child: image,
    );
  }

  /// 背景图便捷构造
  static DecorationImage? decorationImage(
    String? src, {
    BoxFit fit = BoxFit.cover,
    AlignmentGeometry alignment = Alignment.center,
    Rect? centerSlice,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    bool matchTextDirection = false,
    double scale = 1.0,
    double opacity = 1.0,
    ColorFilter? colorFilter,
    Color? color,
    BlendMode? colorBlendMode,
    int? memWidth,
    int? memHeight,
  }) {
    return AppImage.decorationImage(
      src,
      fit: fit,
      alignment: alignment,
      centerSlice: centerSlice,
      repeat: repeat,
      matchTextDirection: matchTextDirection,
      scale: scale,
      opacity: opacity,
      colorFilter:
          colorFilter ??
          (color != null ? ColorFilter.mode(color, colorBlendMode ?? BlendMode.srcIn) : null),
      memWidth: memWidth,
      memHeight: memHeight,
    );
  }

  static Widget text(
    String text, {
    TextStyle? style,
    TextAlign? textAlign,
    int? maxLines,
    TextOverflow? overflow,
  }) {
    return Text(text, style: style, textAlign: textAlign, maxLines: maxLines, overflow: overflow);
  }
}
