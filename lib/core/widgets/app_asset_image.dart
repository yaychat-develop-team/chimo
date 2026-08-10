import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../constants/app_assets.dart';

/// 统一本地资源图片：按扩展名选择 [Image.asset] 或 [SvgPicture.asset]。
///
/// 优先使用 [AppAssets] 常量，勿硬编码 `assets/images/...`。
class AppAssetImage extends StatelessWidget {
  const AppAssetImage(
    this.asset, {
    super.key,
    this.width,
    this.height,
    this.fit = BoxFit.contain,
    this.alignment = Alignment.center,
    this.color,
    this.colorBlendMode,
    this.package,
    this.semanticLabel,
    this.excludeFromSemantics = false,
    this.errorBuilder,
  });

  final String asset;
  final double? width;
  final double? height;
  final BoxFit fit;
  final AlignmentGeometry alignment;
  final Color? color;
  final BlendMode? colorBlendMode;
  final String? package;
  final String? semanticLabel;
  final bool excludeFromSemantics;
  final ImageErrorWidgetBuilder? errorBuilder;

  @override
  Widget build(BuildContext context) {
    if (AppAssets.isSvg(asset)) {
      return SvgPicture.asset(
        asset,
        width: width,
        height: height,
        fit: fit,
        alignment: alignment,
        package: package,
        semanticsLabel: semanticLabel,
        excludeFromSemantics: excludeFromSemantics,
        colorFilter: color == null
            ? null
            : ColorFilter.mode(color!, colorBlendMode ?? BlendMode.srcIn),
      );
    }

    return Image.asset(
      asset,
      width: width,
      height: height,
      fit: fit,
      alignment: alignment,
      color: color,
      colorBlendMode: colorBlendMode,
      package: package,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      errorBuilder: errorBuilder,
    );
  }
}
