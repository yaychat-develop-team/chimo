import 'dart:io';
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
///
/// 参考 joyride `JR.img()` 的单入口 + 按来源和扩展名分派的思路，把
/// 网络 / assets / 本地文件 / base64 五种来源，位图 / svg / pag 三种格式
/// 收敛到一个组件里。业务侧只写 `AppImage(src)`，不再关心该用
/// `Image.asset` 还是 `SvgPicture.network`。
///
/// **只传 path 即可**：来源由 [classify] 按前缀判断，格式由 [formatOf] 按扩展名
/// （字节则由 [sniffFormat]）判断，路径先经 [resolve] 规整——相对路径补
/// `assets/images/`，接口返回的 CDN 相对 key 补 [cdnBase]。所以下面这些写法
/// 都能直接显示，不用在调用处 `startsWith('http')` 分支：
///
/// ```dart
/// AppImage('https://cdn.x.com/a.jpg')      // 网络位图
/// AppImage('https://cdn.x.com/a.svg')      // 网络 svg
/// AppImage('assets/images/forya/logo.webp')// 打包资源
/// AppImage('forya/logo.webp')              // 同上，相对路径
/// AppImage('/upload/2026/a.jpg')           // CDN 相对 key（需先配 cdnBase）
/// AppImage('/var/mobile/…/pick.jpg')       // 本地文件
/// AppImage('data:image/png;base64,…')      // 内联数据
/// ```
///
/// 自动判断拿不到依据时（没有扩展名的 CDN 地址、裸字节的 pag），用 [format]
/// 显式指定；不要退回裸 `SvgPicture` / `PAGView`。
///
/// 网络位图由 `extended_image` 承担内存 + 磁盘缓存（替换原
/// `cached_network_image`）；assets / 文件 / 内存位图仍走 Flutter 原生
/// `Image.*`——这几条分支本来就命中框架的 `ImageCache`，换成
/// `ExtendedImage` 只会引入不同的 loadState 行为，没有收益。
///
/// 与参考实现的一处有意偏差：解码尺寸用真实 `devicePixelRatio` 计算
/// （见 [_px]），而不是硬编码 ×3。`.webp` 与参考实现一样套 [RepaintBoundary]。
class AppImage extends StatelessWidget {
  /// 自动识别来源。[src] 可以是网络地址、assets 路径、本地绝对路径或 data URI。
  const AppImage(
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

  /// 强制按网络地址渲染。
  const AppImage.network(
    String url, {
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
    this.semanticLabel,
    this.excludeFromSemantics = false,
    this.repeatCount = -1,
    this.autoPlay = true,
  }) : src = url,
       bytes = null,
       package = null,
       _forcedSource = AppImageSource.network;

  /// 强制按打包资源渲染。优先传 `AppAssets` 常量。
  const AppImage.asset(
    String name, {
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
    this.package,
    this.semanticLabel,
    this.excludeFromSemantics = false,
    this.repeatCount = -1,
    this.autoPlay = true,
  }) : src = name,
       bytes = null,
       placeholder = null,
       fadeIn = Duration.zero,
       fallbackAsset = null,
       _forcedSource = AppImageSource.asset;

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

  /// 头像：[src] 为空或加载失败时回退到 [fallbackAsset]，默认裁成圆形。
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

  /// CDN 域名，例如 `https://cdn.example.com`。
  ///
  /// 接口返回的图片常常是不带域名的相对 key（`/upload/2026/a.jpg`）。配好它之后
  /// `AppImage('/upload/2026/a.jpg')` 会自动补全成完整地址，业务侧不用再手拼域名。
  /// 未配置时 `/` 开头的 src 一律按本地文件处理，与配置前完全一致。
  static String? cdnBase;

  /// 额外的本地文件根前缀。用于把本地绝对路径与 CDN 相对 key 区分开。
  static List<String> extraLocalRoots = const <String>[];

  /// 各平台沙盒根前缀。`path_provider` 在移动端只会返回这些前缀下的路径，
  /// 所以不必在启动时真去查一次目录，也就不用为了识别本地路径做磁盘 IO。
  static const List<String> _fsRoots = <String>[
    // iOS / macOS
    '/var/', '/private/', '/Users/',
    // Android
    '/data/', '/storage/', '/sdcard/',
    // 桌面端与测试
    '/home/', '/tmp/',
  ];

  /// 一次性配置，通常在 `main()` 里调用。
  static void configure({String? cdnBase, List<String>? extraLocalRoots}) {
    if (cdnBase != null) AppImage.cdnBase = cdnBase;
    if (extraLocalRoots != null) AppImage.extraLocalRoots = extraLocalRoots;
  }

  static bool _isLocalPath(String s) =>
      _fsRoots.any(s.startsWith) || extraLocalRoots.any(s.startsWith);

  // ---------- 静态工具 ----------

  /// 把任意写法的 src 规整成能直接加载的地址。这是"只传 path 就能显示"的关键：
  ///
  /// | 传入 | 规整为 |
  /// |---|---|
  /// | `logo.webp` | `assets/images/logo.webp` |
  /// | `forya/logo.webp` | `assets/images/forya/logo.webp` |
  /// | `/upload/a.jpg`（配了 [cdnBase]） | `$cdnBase/upload/a.jpg` |
  /// | `/var/mobile/…/a.jpg` | 原样（本地文件） |
  /// | `http(s)://` `file://` `data:` `assets/` `packages/` | 原样 |
  ///
  /// [forced] 非空表示调用方已用命名构造明确了来源，此时只做 assets 相对路径
  /// 补全，不再改写其他形态——否则 `AppImage.file('/upload/a.jpg')` 会被误拼成
  /// CDN 地址。结果是幂等的，可以重复调用。
  static String resolve(String? src, {AppImageSource? forced}) {
    final s = src?.trim() ?? '';
    if (s.isEmpty) return '';
    switch (forced) {
      case AppImageSource.asset:
        return _assetPath(s);
      case AppImageSource.network:
      case AppImageSource.file:
      case AppImageSource.memory:
        return s;
      case AppImageSource.empty:
      case null:
        break;
    }
    if (s.startsWith('data:') ||
        s.startsWith('http://') ||
        s.startsWith('https://') ||
        s.startsWith('file://')) {
      return s;
    }
    if (s.startsWith('/')) {
      final base = cdnBase?.trim() ?? '';
      if (base.isEmpty || _isLocalPath(s)) return s;
      final root = base.endsWith('/') ? base.substring(0, base.length - 1) : base;
      return '$root$s';
    }
    return _assetPath(s);
  }

  /// 资源路径，对齐 `JR.imagePath`。
  ///
  /// 已是 `assets/...` 或 `packages/...` 时原样返回。相对路径补 `assets/images/`。
  /// 传了 [package] 时写成 `packages/<package>/assets/images/...`，这时不要再把
  /// 同一个 package 交给 `Image.asset(package:)`，否则会套两层。
  static String imagePath(String path, {String? package}) {
    if (path.startsWith('assets/') || path.startsWith('packages/')) return path;
    if (package != null && package.isNotEmpty) {
      return 'packages/$package/assets/images/$path';
    }
    return 'assets/images/$path';
  }

  static String _assetPath(String s) => imagePath(s);

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
  static AppImageSource classify(String? src) {
    final s = resolve(src);
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
      return s.startsWith('data:image/svg+xml') ? AppImageFormat.svg : AppImageFormat.bitmap;
    }
    var path = s;
    try {
      final parsed = Uri.parse(s).path;
      if (parsed.isNotEmpty) path = parsed;
    } on FormatException {
      // 非法 URI 就按原串判扩展名。
    }
    final lower = path.toLowerCase();
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
    final source = classify(s);
    if (source == AppImageSource.empty) return null;

    final fmt = format ?? formatOf(s);
    assert(fmt == AppImageFormat.bitmap, 'AppImage.providerOf 不支持 svg / pag，请直接用 AppImage 组件：$s');
    if (fmt != AppImageFormat.bitmap) return null;

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

  /// 预热到内存缓存。
  static Future<void> precache(
    BuildContext context,
    String? src, {
    int? memWidth,
    int? memHeight,
  }) async {
    final provider = providerOf(src, memWidth: memWidth, memHeight: memHeight);
    if (provider == null) return;
    await precacheImage(provider, context);
  }

  /// 逐条失效：网络图同时清内存和磁盘。
  static Future<void> evict(String? src) async {
    final s = resolve(src);
    if (s.isEmpty) return;
    if (classify(s) == AppImageSource.network) {
      await ExtendedNetworkImageProvider(s, cache: true).evict();
      await clearDiskCachedImage(s);
      return;
    }
    await providerOf(s)?.evict();
  }

  /// 清空图片内存缓存。
  static void clearMemoryCache() => clearMemoryImageCache();

  /// 清空图片磁盘缓存，[olderThan] 只清超过该时长的旧文件。
  static Future<bool> clearDiskCache({Duration? olderThan}) =>
      clearDiskCachedImages(duration: olderThan);

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

  AppImageSource get _source {
    final data = bytes;
    if (data != null) {
      return data.isEmpty ? AppImageSource.empty : AppImageSource.memory;
    }
    final s = src?.trim() ?? '';
    if (s.isEmpty) return AppImageSource.empty;
    return _forcedSource ?? classify(s);
  }

  ColorFilter? get _colorFilter =>
      color == null ? null : ColorFilter.mode(color!, colorBlendMode ?? BlendMode.srcIn);

  Widget get _box => SizedBox(width: width, height: height);

  /// [fallbackAsset] 兜底图。外层已统一裁剪，这里不再重复裁。
  Widget? get _fallback {
    final asset = fallbackAsset;
    if (asset == null || asset.isEmpty) return null;
    return AppImage.asset(
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
        return error ?? _fallback ?? _box;
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

  @override
  Widget build(BuildContext context) {
    final source = _source;
    if (source == AppImageSource.empty) {
      return _decorate(placeholder ?? _fallback ?? _box);
    }

    final path = resolve(src, forced: _forcedSource);
    final data = bytes;
    final fmt = format ?? (data != null ? sniffFormat(data) : formatOf(path));
    var boxFit = _fitFor(fit, centerSlice);
    final (cacheW, cacheH) = memWidth != null || memHeight != null
        ? _singleSide(memWidth, memHeight)
        : _singleSide(_px(context, width), _px(context, height));
    // 参考实现：只缓存 1 倍图时不设 fit，内容会缩得比布局小，这时改成 cover。
    final dpr = MediaQuery.devicePixelRatioOf(context);
    if (centerSlice == null && dpr <= 1 && (cacheW != null || cacheH != null) && boxFit == null) {
      boxFit = BoxFit.cover;
    }
    final webp = fmt == AppImageFormat.bitmap && path.toLowerCase().endsWith('.webp');

    switch (source) {
      case AppImageSource.network:
        return _decorate(_network(path, fmt, boxFit, cacheW, cacheH));
      case AppImageSource.asset:
        return _decorate(_asset(path, fmt, boxFit, cacheW, cacheH), webp: webp);
      case AppImageSource.file:
        return _decorate(_file(_fsPath(path), fmt, boxFit, cacheW, cacheH), webp: webp);
      case AppImageSource.memory:
        return _decorate(_memory(path, fmt, boxFit, cacheW, cacheH));
      case AppImageSource.empty:
        return _decorate(_box);
    }
  }

  Widget _network(String url, AppImageFormat fmt, BoxFit? boxFit, int? cacheW, int? cacheH) {
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

  Widget _asset(String name, AppImageFormat fmt, BoxFit? boxFit, int? cacheW, int? cacheH) {
    assert(
      name.startsWith('assets/') || name.startsWith('packages/') || package != null,
      'AppImage 未能识别来源，已按 assets 处理：$name',
    );
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

  Widget _file(String path, AppImageFormat fmt, BoxFit? boxFit, int? cacheW, int? cacheH) {
    switch (fmt) {
      case AppImageFormat.pag:
        assert(false, 'pag 不支持从本地文件加载，请走 assets 或网络：$path');
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

  Widget _memory(String path, AppImageFormat fmt, BoxFit? boxFit, int? cacheW, int? cacheH) {
    final data = bytes ?? _dataBytes(path);
    if (data == null || data.isEmpty) return error ?? _fallback ?? _box;
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
