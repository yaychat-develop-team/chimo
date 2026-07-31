import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../constants/app_assets.dart';

/// Unified local asset image: picks [Image.asset] or [SvgPicture.asset] by extension.
///
/// Prefer [AppAssets] constants; do not hardcode `assets/images/...`.
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
