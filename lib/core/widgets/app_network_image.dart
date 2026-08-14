import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

/// 统一网络图：磁盘缓存 + 按显示尺寸限制解码内存（对齐 forya CachedNetworkImage）。
class AppNetworkImage extends StatelessWidget {
  const AppNetworkImage(
    this.url, {
    super.key,
    this.width,
    this.height,
    this.fit = BoxFit.cover,
    this.alignment = Alignment.center,
    this.placeholder,
    this.errorWidget,
    this.fadeInDuration = const Duration(milliseconds: 200),
    this.fadeOutDuration = Duration.zero,
    this.filterQuality = FilterQuality.low,
    this.memCacheWidth,
    this.memCacheHeight,
  });

  final String? url;
  final double? width;
  final double? height;
  final BoxFit fit;
  final Alignment alignment;
  final Widget Function(BuildContext context, String url)? placeholder;
  final Widget Function(BuildContext context, String url, Object error)?
      errorWidget;
  final Duration fadeInDuration;
  final Duration fadeOutDuration;
  final FilterQuality filterQuality;

  /// 显式覆盖自动推算的解码宽/高（逻辑像素，内部会乘 devicePixelRatio）。
  /// 注意：不要同时传两边，否则解码会破坏宽高比导致拉伸。
  final int? memCacheWidth;
  final int? memCacheHeight;

  static int? _px(BuildContext context, double? logical) {
    if (logical == null || logical <= 0 || !logical.isFinite) return null;
    final dpr = MediaQuery.devicePixelRatioOf(context);
    return (logical * dpr).round().clamp(1, 4096);
  }

  /// 只保留单边缓存尺寸，保持原始宽高比。
  static (int?, int?) _singleSide(int? w, int? h) {
    if (w != null && h != null) {
      return w >= h ? (w, null) : (null, h);
    }
    return (w, h);
  }

  @override
  Widget build(BuildContext context) {
    final remote = url?.trim() ?? '';
    if (remote.isEmpty) {
      return errorWidget?.call(context, remote, StateError('empty url')) ??
          SizedBox(width: width, height: height);
    }

    final (int? cacheW, int? cacheH) = _singleSide(
      memCacheWidth ?? _px(context, width),
      memCacheHeight ?? _px(context, height),
    );

    return CachedNetworkImage(
      imageUrl: remote,
      width: width,
      height: height,
      fit: fit,
      alignment: alignment,
      fadeInDuration: fadeInDuration,
      fadeOutDuration: fadeOutDuration,
      filterQuality: filterQuality,
      memCacheWidth: cacheW,
      memCacheHeight: cacheH,
      placeholder: placeholder == null
          ? null
          : (context, url) => placeholder!(context, url),
      errorWidget: errorWidget == null
          ? (context, url, error) => SizedBox(width: width, height: height)
          : (context, url, error) => errorWidget!(context, url, error),
    );
  }
}
