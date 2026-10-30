import 'dart:io';
import 'dart:math';
import 'dart:typed_data';

import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:forya_pag/pag.dart';

import '../constants/app_assets.dart';

/// 图片来源。由 [AppImage.classify] 从字符串推断，也可用命名构造强制指定。
enum AppImageSource {
  /// null / 空串 / 全空白：只渲染占位。
  empty,

  /// `http://` `https://` 远程地址。
  network,

  /// 打包资源（`assets/...`、`packages/...`）。
  asset,

  /// `file://` 或以 `/` 开头的本地绝对路径。
  file,

  /// `data:image/...;base64,...` 内联数据，或 [AppImage.bytes] 直接传入的字节。
  memory,
}

/// 图片格式。决定走位图 / svg / pag 哪条渲染分支。
enum AppImageFormat { bitmap, svg, pag }

/// 全 App 唯一的图片入口。
class AppImage extends StatelessWidget {
  /// 自动识别来源。[src] 可以是网络地址、assets 路径、本地绝对路径或 data URI。
  const AppImage.image(
    this.src, {
    super.key,
    this.format,
    this.width,
    this.height,
    this.fit,
    this.alignment = Alignment.center,
    this.color,
    this.colorBlendMode,
    this.radius,
    this.circle = false,
    this.placeholder,
    this.error,
    this.fallbackAsset,
    this.fadeIn = const Duration(milliseconds: 200),
    this.memWidth,
    this.memHeight,
    this.scale,
    this.centerSlice,
    this.matchTextDirection = false,
    this.gaplessPlayback = false,
    this.filterQuality = FilterQuality.low,
    this.repaintBoundary = false,
    this.package,
    this.semanticLabel,
    this.excludeFromSemantics = false,
    this.repeatCount = -1,
    this.autoPlay = true,
  }) : bytes = null,
       _forcedSource = null;

  /// 强制按本地文件渲染。[path] 传文件系统路径（`File.path` 即可）。
  const AppImage.file(
    String path, {
    super.key,
    this.format,
    this.width,
    this.height,
    this.fit,
    this.alignment = Alignment.center,
    this.color,
    this.colorBlendMode,
    this.radius,
    this.circle = false,
    this.error,
    this.memWidth,
    this.memHeight,
    this.scale,
    this.centerSlice,
    this.matchTextDirection = false,
    this.gaplessPlayback = false,
    this.filterQuality = FilterQuality.low,
    this.repaintBoundary = false,
    this.semanticLabel,
    this.excludeFromSemantics = false,
  }) : src = path,
       bytes = null,
       package = null,
       placeholder = null,
       fadeIn = Duration.zero,
       fallbackAsset = null,
       repeatCount = -1,
       autoPlay = true,
       _forcedSource = AppImageSource.file;

  /// 直接渲染内存字节（相册预览、裁剪结果等）。
  const AppImage.bytes(
    Uint8List data, {
    super.key,
    this.format,
    this.width,
    this.height,
    this.fit,
    this.alignment = Alignment.center,
    this.color,
    this.colorBlendMode,
    this.radius,
    this.circle = false,
    this.error,
    this.memWidth,
    this.memHeight,
    this.scale,
    this.centerSlice,
    this.matchTextDirection = false,
    this.gaplessPlayback = true,
    this.filterQuality = FilterQuality.low,
    this.repaintBoundary = false,
    this.semanticLabel,
    this.excludeFromSemantics = false,
  }) : src = null,
       bytes = data,
       package = null,
       placeholder = null,
       fadeIn = Duration.zero,
       fallbackAsset = null,
       repeatCount = -1,
       autoPlay = true,
       _forcedSource = AppImageSource.memory;

  /// 头像：[src] 为空或加载失败时，用 CDN 卡通图 `avatar2.jpg`–`avatar8.jpg`。
  /// 卡通图本身加载失败才回退到 [fallbackAsset]。默认裁成圆形。
  const AppImage.avatar(
    this.src, {
    super.key,
    this.fallbackAsset = AppAssets.defaultAvatar,
    double size = 40,
    this.circle = true,
    this.radius,
    this.fit = BoxFit.cover,
    this.alignment = Alignment.center,
    this.memWidth,
    this.memHeight,
    this.fadeIn = Duration.zero,
    this.filterQuality = FilterQuality.low,
    this.semanticLabel,
    this.excludeFromSemantics = false,
  }) : width = size,
       height = size,
       bytes = null,
       format = null,
       color = null,
       colorBlendMode = null,
       placeholder = null,
       error = null,
       scale = null,
       centerSlice = null,
       matchTextDirection = false,
       gaplessPlayback = false,
       repaintBoundary = false,
       package = null,
       repeatCount = -1,
       autoPlay = true,
       _forcedSource = null;

  /// 图片地址。[AppImage.bytes] 时为 null。
  final String? src;

  /// [AppImage.bytes] 的原始字节。
  final Uint8List? bytes;

  /// 显式指定格式，覆盖 [formatOf] / [sniffFormat] 的自动判断。
  ///
  /// 只在自动判断没有依据时才需要：没有扩展名的 CDN 地址、或裸字节的 pag。
  final AppImageFormat? format;

  /// 加载失败 / 地址为空时回退的本地资源。
  final String? fallbackAsset;

  final double? width;
  final double? height;

  /// 故意不给默认值：各来源的框架默认值不同，统一默认会造成大面积视觉变化。
  final BoxFit? fit;

  final AlignmentGeometry alignment;
  final Color? color;
  final BlendMode? colorBlendMode;

  /// 圆角裁剪。与 [circle] 同时给出时 [circle] 优先。
  final BorderRadius? radius;

  /// 裁成圆形。
  final bool circle;

  /// 网络图加载中的占位。
  final Widget? placeholder;

  /// 加载失败时的兜底，优先级高于 [fallbackAsset]。
  final Widget? error;

  /// 网络图首帧淡入时长，[Duration.zero] 表示不淡入。
  final Duration fadeIn;

  /// 显式指定解码宽高（物理像素）。不传则按 [width] / [height] × dpr 推算。
  final int? memWidth;
  final int? memHeight;

  /// 图片自身的像素密度。assets 传 null 才能正常解析 2.0x / 3.0x 变体。
  final double? scale;

  final Rect? centerSlice;
  final bool matchTextDirection;
  final bool gaplessPlayback;
  final FilterQuality filterQuality;

  /// 是否单独隔离重绘区域。只对大图 / 频繁重绘的场景开启。
  final bool repaintBoundary;

  final String? package;
  final String? semanticLabel;
  final bool excludeFromSemantics;

  /// pag 播放次数，-1 为无限循环。
  final int repeatCount;

  /// pag 是否自动播放。
  final bool autoPlay;

  final AppImageSource? _forcedSource;

  // ---------- 全局配置 ----------

  /// 空头像用的卡通图。对齐 Oumi：`{cdn}/ugc-media/user/default_config/avatar{2-8}.jpg`。
  static String? cartoonAvatarUrl(int index) {
    final root = _cdnRoot;
    if (root == null) return null;
    return '$root/ugc-media/user/default_config/avatar$index.jpg';
  }

  /// CDN 域名，例如 `https://cdn.example.com`。
  ///
  /// 接口返回的图片常常是不带域名的相对 key（`/upload/2026/a.jpg`）。
  /// 配好之后会补成完整地址。未配置时 `/` 开头的 src 按本地文件处理。
  static String? cdnBase;

  static String? get _cdnRoot {
    final base = cdnBase?.trim() ?? '';
    if (base.isEmpty) return null;
    return base.endsWith('/') ? base.substring(0, base.length - 1) : base;
  }

  /// 各平台沙盒根前缀。用来区分本地绝对路径和 CDN 相对 key，不必在启动时查目录。
  static const List<String> _fsRoots = <String>[
    // iOS / macOS
    '/var/', '/private/', '/Users/',
    // Android
    '/data/', '/storage/', '/sdcard/',
    // 桌面端与测试
    '/home/', '/tmp/',
  ];

  static bool _isLocalPath(String s) => _fsRoots.any(s.startsWith);

  // ---------- 静态工具 ----------

  /// 把任意写法的 src 规整成能直接加载的地址。这是"只传 path 就能显示"的关键：
  ///
  /// | 传入 | 规整为 |
  /// |---|---|
  /// | `logo.webp` | `assets/images/logo.webp` |
  /// | `common/logo.webp` | `assets/images/common/logo.webp` |
  /// | `/upload/a.jpg`（配了 [cdnBase]） | `$cdnBase/upload/a.jpg` |
  /// | `/var/mobile/…/a.jpg` | 原样（本地文件） |
  /// | `http(s)://` `file://` `data:` `assets/` `packages/` | 原样 |
  ///
  /// [forced] 为 file / memory 时原样返回，避免 `AppImage.file('/upload/a.jpg')` 被拼成 CDN 地址。
  static String resolve(String? src, {AppImageSource? forced}) {
    final s = src?.trim() ?? '';
    if (s.isEmpty) return '';
    if (forced == AppImageSource.file || forced == AppImageSource.memory) {
      return s;
    }
    if (s.startsWith('data:') ||
        s.startsWith('http://') ||
        s.startsWith('https://') ||
        s.startsWith('file://')) {
      return s;
    }
    if (s.startsWith('/')) {
      final root = _cdnRoot;
      if (root == null || _isLocalPath(s)) return s;
      return '$root$s';
    }
    return _assetPath(s);
  }

  /// 已是 `assets/...` 或 `packages/...` 时原样返回，相对路径补 `assets/images/`。
  static String _assetPath(String s) {
    if (s.startsWith('assets/') || s.startsWith('packages/')) return s;
    return 'assets/images/$s';
  }

  /// 从字节魔数推断格式。[AppImage.bytes] 拿到的是裸字节，没有扩展名可判。
  ///
  /// 只识别 svg：它是 XML 文本，可靠且零误判。pag 的魔数没有公开保证，
  /// 需要时用 [format] 显式指定。
  static AppImageFormat sniffFormat(Uint8List bytes) {
    if (bytes.isEmpty) return AppImageFormat.bitmap;
    final end = bytes.length < 256 ? bytes.length : 256;
    var i = 0;
    if (end >= 3 && bytes[0] == 0xEF && bytes[1] == 0xBB && bytes[2] == 0xBF) {
      i = 3; // UTF-8 BOM
    }
    const blanks = <int>{0x20, 0x09, 0x0A, 0x0D};
    while (i < end && blanks.contains(bytes[i])) {
      i++;
    }
    if (i >= end || bytes[i] != 0x3C) return AppImageFormat.bitmap; // '<'
    final head = String.fromCharCodes(bytes.sublist(i, end)).toLowerCase();
    return head.contains('<svg') ? AppImageFormat.svg : AppImageFormat.bitmap;
  }

  /// 判断来源。先经 [resolve] 规整，保证判断结果与真正加载的地址一致。
  static AppImageSource classify(String? src) => _sourceOf(resolve(src));

  /// [s] 必须已经过 [resolve]。
  static AppImageSource _sourceOf(String s) {
    if (s.isEmpty) return AppImageSource.empty;
    if (s.startsWith('data:')) return AppImageSource.memory;
    if (s.startsWith('http://') || s.startsWith('https://')) {
      return AppImageSource.network;
    }
    if (s.startsWith('file://') || s.startsWith('/')) {
      return AppImageSource.file;
    }
    return AppImageSource.asset;
  }

  /// 按扩展名判断格式。先剥掉 query / fragment，否则 `a.svg?v=2` 会被当成位图。
  static AppImageFormat formatOf(String? src) {
    final s = src?.trim() ?? '';
    if (s.isEmpty) return AppImageFormat.bitmap;
    if (s.startsWith('data:')) {
      return s.startsWith('data:image/svg+xml')
          ? AppImageFormat.svg
          : AppImageFormat.bitmap;
    }
    final parsed = Uri.tryParse(s)?.path;
    final lower = (parsed == null || parsed.isEmpty ? s : parsed).toLowerCase();
    if (lower.endsWith('.svg')) return AppImageFormat.svg;
    if (lower.endsWith('.pag')) return AppImageFormat.pag;
    return AppImageFormat.bitmap;
  }

  /// 拿到 [ImageProvider]，供 `DecorationImage` / `CircleAvatar` 等需要 provider
  /// 的 API 使用。svg / pag 没有 provider，返回 null。
  static ImageProvider<Object>? providerOf(
    String? src, {
    int? memWidth,
    int? memHeight,
    AppImageFormat? format,
  }) {
    final s = resolve(src);
    final source = _sourceOf(s);
    final fmt = format ?? formatOf(s);
    if (source == AppImageSource.empty || fmt != AppImageFormat.bitmap) {
      return null;
    }

    final ImageProvider<Object> base;
    switch (source) {
      case AppImageSource.network:
        base = ExtendedNetworkImageProvider(s, cache: true);
      case AppImageSource.asset:
        base = AssetImage(s);
      case AppImageSource.file:
        base = FileImage(File(_fsPath(s)));
      case AppImageSource.memory:
        final data = _dataBytes(s);
        if (data == null) return null;
        base = MemoryImage(data);
      case AppImageSource.empty:
        return null;
    }
    final (w, h) = _singleSide(memWidth, memHeight);
    return ResizeImage.resizeIfNeeded(w, h, base);
  }

  /// 背景图便捷构造，[src] 为空返回 null。
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
    int? memWidth,
    int? memHeight,
  }) {
    final provider = providerOf(src, memWidth: memWidth, memHeight: memHeight);
    if (provider == null) return null;
    return DecorationImage(
      image: provider,
      fit: _fitFor(fit, centerSlice),
      alignment: alignment,
      centerSlice: centerSlice,
      repeat: repeat,
      matchTextDirection: matchTextDirection,
      scale: scale,
      opacity: opacity,
      colorFilter: colorFilter,
    );
  }

  /// centerSlice 与 `none` / `cover` 语义冲突，参考实现同样强制 `fill`。
  static BoxFit? _fitFor(BoxFit? fit, Rect? centerSlice) {
    if (centerSlice == null) return fit;
    if (fit == null || fit == BoxFit.none || fit == BoxFit.cover) {
      return BoxFit.fill;
    }
    return fit;
  }

  static String _fsPath(String src) {
    final s = src.trim();
    if (!s.startsWith('file://')) return s;
    try {
      return Uri.parse(s).toFilePath();
    } on FormatException {
      return s.substring('file://'.length);
    } on UnsupportedError {
      return s.substring('file://'.length);
    }
  }

  static Uint8List? _dataBytes(String src) {
    try {
      return UriData.parse(src.trim()).contentAsBytes();
    } on FormatException {
      return null;
    }
  }

  /// 逻辑像素 → 物理像素，供解码尺寸使用。
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

  // ---------- 渲染 ----------

  ColorFilter? get _colorFilter => color == null
      ? null
      : ColorFilter.mode(color!, colorBlendMode ?? BlendMode.srcIn);

  Widget get _box => SizedBox(width: width, height: height);

  /// 占位是默认头像资源时，改走 CDN 卡通图，而不是本地剪影。
  bool get _cartoonFallback {
    final asset = fallbackAsset;
    return asset == AppAssets.defaultAvatar ||
        asset == AppAssets.avatarPlace ||
        asset == AppAssets.emptyAvatar;
  }

  Widget _cartoon() {
    return _CartoonAvatar(
      width: width,
      height: height,
      fit: fit ?? BoxFit.cover,
      alignment: alignment,
      filterQuality: filterQuality,
      circle: circle,
      radius: radius,
    );
  }

  /// [fallbackAsset] 兜底图。外层已统一裁剪，这里不再重复裁。
  ///
  /// 直接用 [Image.asset]，不要再套 [AppImage]。webp 资源会强制包一层
  /// [RepaintBoundary]，公屏的 [ShaderMask] 采不到这一层，空头像就会是空白。
  Widget? get _fallback {
    final asset = fallbackAsset;
    if (asset == null || asset.isEmpty) return null;
    return Image.asset(
      asset,
      width: width,
      height: height,
      fit: fit ?? BoxFit.cover,
      alignment: alignment,
      filterQuality: filterQuality,
      excludeFromSemantics: true,
    );
  }

  ImageErrorWidgetBuilder? get _errorBuilder {
    final widget = error ?? _fallback;
    if (widget == null) return null;
    return (_, _, _) => widget;
  }

  SvgErrorWidgetBuilder? get _svgErrorBuilder {
    final widget = error ?? _fallback;
    if (widget == null) return null;
    return (_, _, _) => widget;
  }

  WidgetBuilder? get _svgPlaceholderBuilder {
    final widget = placeholder;
    if (widget == null) return null;
    return (_) => widget;
  }

  Widget? _onLoadState(ExtendedImageState state) {
    switch (state.extendedImageLoadState) {
      case LoadState.loading:
        return placeholder ?? _fallback ?? _box;
      case LoadState.completed:
        if (fadeIn <= Duration.zero) return null;
        return _FadeIn(duration: fadeIn, child: state.completedWidget);
      case LoadState.failed:
        if (error != null) {
          state.returnLoadStateChangedWidget = true;
          return error;
        }
        if (_cartoonFallback) {
          state.returnLoadStateChangedWidget = true;
          return _cartoon();
        }
        return _fallback ?? _box;
    }
  }

  Widget _decorate(Widget child, {bool webp = false}) {
    var result = child;
    // joyride 对 .webp 一律隔离重绘；大图也可以用 [repaintBoundary] 单独打开。
    if (repaintBoundary || webp) result = RepaintBoundary(child: result);
    if (circle) return ClipOval(child: result);
    final borderRadius = radius;
    if (borderRadius != null) {
      return ClipRRect(borderRadius: borderRadius, child: result);
    }
    return result;
  }

  Widget _unresolved() {
    if (placeholder != null) return _decorate(placeholder!);
    if (_cartoonFallback) return _cartoon();
    return _decorate(_fallback ?? _box);
  }

  @override
  Widget build(BuildContext context) {
    final data = bytes;
    if (data != null) {
      if (data.isEmpty) return _unresolved();
      return _loaded(
        context,
        AppImageSource.memory,
        '',
        format ?? sniffFormat(data),
      );
    }

    final path = resolve(src, forced: _forcedSource);
    if (path.isEmpty) return _unresolved();
    final source = _forcedSource ?? _sourceOf(path);
    return _loaded(context, source, path, format ?? formatOf(path));
  }

  Widget _loaded(
    BuildContext context,
    AppImageSource source,
    String path,
    AppImageFormat fmt,
  ) {
    var boxFit = _fitFor(fit, centerSlice);
    final (cacheW, cacheH) = memWidth != null || memHeight != null
        ? _singleSide(memWidth, memHeight)
        : _singleSide(_px(context, width), _px(context, height));
    // 参考实现：只缓存 1 倍图时不设 fit，内容会缩得比布局小，这时改成 cover。
    final dpr = MediaQuery.devicePixelRatioOf(context);
    if (centerSlice == null &&
        dpr <= 1 &&
        (cacheW != null || cacheH != null) &&
        boxFit == null) {
      boxFit = BoxFit.cover;
    }
    final webp =
        fmt == AppImageFormat.bitmap && path.toLowerCase().endsWith('.webp');

    switch (source) {
      case AppImageSource.network:
        return _decorate(_network(path, fmt, boxFit, cacheW, cacheH));
      case AppImageSource.asset:
        return _decorate(_asset(path, fmt, boxFit, cacheW, cacheH), webp: webp);
      case AppImageSource.file:
        return _decorate(
          _file(_fsPath(path), fmt, boxFit, cacheW, cacheH),
          webp: webp,
        );
      case AppImageSource.memory:
        return _decorate(_memory(path, fmt, boxFit, cacheW, cacheH));
      case AppImageSource.empty:
        return _unresolved();
    }
  }

  Widget _network(
    String url,
    AppImageFormat fmt,
    BoxFit? boxFit,
    int? cacheW,
    int? cacheH,
  ) {
    switch (fmt) {
      case AppImageFormat.pag:
        return PAGView.network(
          url,
          width: width,
          height: height,
          autoPlay: autoPlay,
          repeatCount: repeatCount,
        );
      case AppImageFormat.svg:
        return SvgPicture.network(
          url,
          width: width,
          height: height,
          fit: boxFit ?? BoxFit.contain,
          alignment: alignment,
          colorFilter: _colorFilter,
          matchTextDirection: matchTextDirection,
          semanticsLabel: semanticLabel,
          excludeFromSemantics: excludeFromSemantics,
          placeholderBuilder: _svgPlaceholderBuilder,
          errorBuilder: _svgErrorBuilder,
        );
      case AppImageFormat.bitmap:
        return ExtendedImage.network(
          url,
          width: width,
          height: height,
          fit: boxFit,
          alignment: alignment,
          color: color,
          colorBlendMode: colorBlendMode,
          scale: scale ?? 1.0,
          centerSlice: centerSlice,
          matchTextDirection: matchTextDirection,
          gaplessPlayback: gaplessPlayback,
          filterQuality: filterQuality,
          semanticLabel: semanticLabel,
          excludeFromSemantics: excludeFromSemantics,
          cacheWidth: cacheW,
          cacheHeight: cacheH,
          loadStateChanged: _onLoadState,
        );
    }
  }

  Widget _asset(
    String name,
    AppImageFormat fmt,
    BoxFit? boxFit,
    int? cacheW,
    int? cacheH,
  ) {
    switch (fmt) {
      case AppImageFormat.pag:
        return PAGView.asset(
          name,
          package: package,
          width: width,
          height: height,
          autoPlay: autoPlay,
          repeatCount: repeatCount,
        );
      case AppImageFormat.svg:
        return SvgPicture.asset(
          name,
          package: package,
          width: width,
          height: height,
          fit: boxFit ?? BoxFit.contain,
          alignment: alignment,
          colorFilter: _colorFilter,
          matchTextDirection: matchTextDirection,
          semanticsLabel: semanticLabel,
          excludeFromSemantics: excludeFromSemantics,
          placeholderBuilder: _svgPlaceholderBuilder,
          errorBuilder: _svgErrorBuilder,
        );
      case AppImageFormat.bitmap:
        return Image.asset(
          name,
          package: package,
          width: width,
          height: height,
          fit: boxFit,
          alignment: alignment,
          color: color,
          colorBlendMode: colorBlendMode,
          scale: scale,
          centerSlice: centerSlice,
          matchTextDirection: matchTextDirection,
          gaplessPlayback: gaplessPlayback,
          filterQuality: filterQuality,
          cacheWidth: cacheW,
          cacheHeight: cacheH,
          semanticLabel: semanticLabel,
          excludeFromSemantics: excludeFromSemantics,
          errorBuilder: _errorBuilder,
        );
    }
  }

  Widget _file(
    String path,
    AppImageFormat fmt,
    BoxFit? boxFit,
    int? cacheW,
    int? cacheH,
  ) {
    switch (fmt) {
      case AppImageFormat.pag:
        return error ?? _fallback ?? _box;
      case AppImageFormat.svg:
        return SvgPicture.file(
          File(path),
          width: width,
          height: height,
          fit: boxFit ?? BoxFit.contain,
          alignment: alignment,
          colorFilter: _colorFilter,
          matchTextDirection: matchTextDirection,
          semanticsLabel: semanticLabel,
          excludeFromSemantics: excludeFromSemantics,
          placeholderBuilder: _svgPlaceholderBuilder,
          errorBuilder: _svgErrorBuilder,
        );
      case AppImageFormat.bitmap:
        return Image.file(
          File(path),
          width: width,
          height: height,
          fit: boxFit,
          alignment: alignment,
          color: color,
          colorBlendMode: colorBlendMode,
          scale: scale ?? 1.0,
          centerSlice: centerSlice,
          matchTextDirection: matchTextDirection,
          gaplessPlayback: gaplessPlayback,
          filterQuality: filterQuality,
          cacheWidth: cacheW,
          cacheHeight: cacheH,
          semanticLabel: semanticLabel,
          excludeFromSemantics: excludeFromSemantics,
          errorBuilder: _errorBuilder,
        );
    }
  }

  Widget _memory(
    String path,
    AppImageFormat fmt,
    BoxFit? boxFit,
    int? cacheW,
    int? cacheH,
  ) {
    final data = bytes ?? _dataBytes(path);
    if (data == null) return error ?? _fallback ?? _box;
    if (fmt == AppImageFormat.pag) {
      return PAGView.bytes(
        data,
        width: width,
        height: height,
        autoPlay: autoPlay,
        repeatCount: repeatCount,
      );
    }
    if (fmt == AppImageFormat.svg) {
      return SvgPicture.memory(
        data,
        width: width,
        height: height,
        fit: boxFit ?? BoxFit.contain,
        alignment: alignment,
        colorFilter: _colorFilter,
        matchTextDirection: matchTextDirection,
        semanticsLabel: semanticLabel,
        excludeFromSemantics: excludeFromSemantics,
        placeholderBuilder: _svgPlaceholderBuilder,
        errorBuilder: _svgErrorBuilder,
      );
    }
    return Image.memory(
      data,
      width: width,
      height: height,
      fit: boxFit,
      alignment: alignment,
      color: color,
      colorBlendMode: colorBlendMode,
      scale: scale ?? 1.0,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      filterQuality: filterQuality,
      cacheWidth: cacheW,
      cacheHeight: cacheH,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      errorBuilder: _errorBuilder,
    );
  }
}

/// 网络图首帧淡入。[AppImage.fadeIn] 为 [Duration.zero] 时不会用到。
class _FadeIn extends StatefulWidget {
  const _FadeIn({required this.duration, required this.child});

  final Duration duration;
  final Widget child;

  @override
  State<_FadeIn> createState() => _FadeInState();
}

/// 空头像随机一张卡通图，同一个位置重建时不换脸。
class _CartoonAvatar extends StatefulWidget {
  const _CartoonAvatar({
    required this.width,
    required this.height,
    required this.fit,
    required this.alignment,
    required this.filterQuality,
    required this.circle,
    required this.radius,
  });

  final double? width;
  final double? height;
  final BoxFit fit;
  final AlignmentGeometry alignment;
  final FilterQuality filterQuality;
  final bool circle;
  final BorderRadius? radius;

  @override
  State<_CartoonAvatar> createState() => _CartoonAvatarState();
}

class _CartoonAvatarState extends State<_CartoonAvatar> {
  late final int _index = Random().nextInt(7) + 2;

  @override
  Widget build(BuildContext context) {
    final url = AppImage.cartoonAvatarUrl(_index);
    final local = Image.asset(
      AppAssets.defaultAvatar,
      width: widget.width,
      height: widget.height,
      fit: widget.fit,
      alignment: widget.alignment,
      filterQuality: widget.filterQuality,
      excludeFromSemantics: true,
    );
    if (url == null) return local;
    return AppImage.image(
      url,
      width: widget.width,
      height: widget.height,
      fit: widget.fit,
      alignment: widget.alignment,
      filterQuality: widget.filterQuality,
      circle: widget.circle,
      radius: widget.radius,
      fadeIn: Duration.zero,
      error: local,
    );
  }
}

class _FadeInState extends State<_FadeIn> {
  bool _visible = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) setState(() => _visible = true);
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      opacity: _visible ? 1 : 0,
      duration: widget.duration,
      child: widget.child,
    );
  }
}
