import 'dart:async';
import 'dart:math' as math;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../theme/app_colors.dart';

/// 构建复杂列表主体（任意 [Sliver] 组合）。
typedef AppPullSliverBuilder = List<Widget> Function(BuildContext context);

/// 下拉刷新指示器样式。
enum AppPullRefreshStyle {
  /// 圆环进度 → 转圈 → 对勾。
  spinner,

  /// 顶部细进度条（对齐钱包页 [RefreshIndicator] / [AppTopLoadingBar] 观感）。
  bar,
}

/// 通用下拉刷新 / 上拉加载。
///
/// - [AppPullRefreshStyle.spinner]：转圈（默认）
/// - [AppPullRefreshStyle.bar]：顶部进度条（钱包同款）
///
/// List / Grid / 多段自定义 Sliver 共用此组件。
class AppPullRefresh extends StatefulWidget {
  const AppPullRefresh({
    super.key,
    required this.onRefresh,
    required List<Widget> this.slivers,
    this.style = AppPullRefreshStyle.spinner,
    this.header,
    this.topSlivers = const [],
    this.bottomSlivers = const [],
    this.controller,
    this.onLoadMore,
    this.hasMore = false,
    this.loadingMore = false,
    this.showNoMoreFooter = true,
    this.loadMoreThreshold = 240,
    double? refreshTriggerPullDistance,
    double? refreshIndicatorExtent,
    this.physics,
    this.padding,
    this.hintPull = 'Pull down to refresh',
    this.hintRelease = 'Release to refresh',
    this.hintLoading = 'Loading',
    this.hintSuccess = 'Successfully loaded',
    this.accentColor = AppColors.green1BBA77,
    this.hintColor = AppColors.gray6E6E6E,
  }) : sliverBuilder = null,
       refreshTriggerPullDistance =
           refreshTriggerPullDistance ?? (style == AppPullRefreshStyle.bar ? 56.0 : 72.0),
       refreshIndicatorExtent =
           refreshIndicatorExtent ?? (style == AppPullRefreshStyle.bar ? 28.0 : 56.0);

  /// 复杂自定义列表。
  const AppPullRefresh.custom({
    super.key,
    required this.onRefresh,
    required AppPullSliverBuilder this.sliverBuilder,
    this.style = AppPullRefreshStyle.spinner,
    this.header,
    this.topSlivers = const [],
    this.bottomSlivers = const [],
    this.controller,
    this.onLoadMore,
    this.hasMore = false,
    this.loadingMore = false,
    this.showNoMoreFooter = true,
    this.loadMoreThreshold = 240,
    double? refreshTriggerPullDistance,
    double? refreshIndicatorExtent,
    this.physics,
    this.padding,
    this.hintPull = 'Pull down to refresh',
    this.hintRelease = 'Release to refresh',
    this.hintLoading = 'Loading',
    this.hintSuccess = 'Successfully loaded',
    this.accentColor = AppColors.green1BBA77,
    this.hintColor = AppColors.gray6E6E6E,
  }) : slivers = null,
       refreshTriggerPullDistance =
           refreshTriggerPullDistance ?? (style == AppPullRefreshStyle.bar ? 56.0 : 72.0),
       refreshIndicatorExtent =
           refreshIndicatorExtent ?? (style == AppPullRefreshStyle.bar ? 28.0 : 56.0);

  /// 列表样式。
  factory AppPullRefresh.list({
    Key? key,
    required Future<void> Function() onRefresh,
    required int itemCount,
    required NullableIndexedWidgetBuilder itemBuilder,
    AppPullRefreshStyle style = AppPullRefreshStyle.spinner,
    Future<void> Function()? onLoadMore,
    bool hasMore = false,
    bool loadingMore = false,
    bool showNoMoreFooter = true,
    ScrollController? controller,
    Widget? header,
    EdgeInsetsGeometry? padding,
    double loadMoreThreshold = 240,
    Widget? empty,
    Color accentColor = AppColors.green1BBA77,
  }) {
    return AppPullRefresh(
      key: key,
      onRefresh: onRefresh,
      style: style,
      onLoadMore: onLoadMore,
      hasMore: hasMore,
      loadingMore: loadingMore,
      showNoMoreFooter: showNoMoreFooter,
      controller: controller,
      header: header,
      padding: padding,
      loadMoreThreshold: loadMoreThreshold,
      accentColor: accentColor,
      slivers: [
        if (itemCount == 0 && empty != null)
          SliverFillRemaining(hasScrollBody: false, child: empty)
        else
          SliverList(delegate: SliverChildBuilderDelegate(itemBuilder, childCount: itemCount)),
      ],
    );
  }

  /// 网格样式。
  factory AppPullRefresh.grid({
    Key? key,
    required Future<void> Function() onRefresh,
    required int itemCount,
    required NullableIndexedWidgetBuilder itemBuilder,
    required SliverGridDelegate gridDelegate,
    AppPullRefreshStyle style = AppPullRefreshStyle.spinner,
    Future<void> Function()? onLoadMore,
    bool hasMore = false,
    bool loadingMore = false,
    bool showNoMoreFooter = true,
    ScrollController? controller,
    Widget? header,
    EdgeInsetsGeometry? padding,
    double loadMoreThreshold = 240,
    Widget? empty,
    Color accentColor = AppColors.green1BBA77,
  }) {
    return AppPullRefresh(
      key: key,
      onRefresh: onRefresh,
      style: style,
      onLoadMore: onLoadMore,
      hasMore: hasMore,
      loadingMore: loadingMore,
      showNoMoreFooter: showNoMoreFooter,
      controller: controller,
      header: header,
      padding: padding,
      loadMoreThreshold: loadMoreThreshold,
      accentColor: accentColor,
      slivers: [
        if (itemCount == 0 && empty != null)
          SliverFillRemaining(hasScrollBody: false, child: empty)
        else
          SliverGrid(
            gridDelegate: gridDelegate,
            delegate: SliverChildBuilderDelegate(itemBuilder, childCount: itemCount),
          ),
      ],
    );
  }

  final Future<void> Function() onRefresh;
  final List<Widget>? slivers;
  final AppPullSliverBuilder? sliverBuilder;

  /// 指示器样式：转圈 / 进度条。
  final AppPullRefreshStyle style;

  final Widget? header;
  final List<Widget> topSlivers;
  final List<Widget> bottomSlivers;
  final ScrollController? controller;
  final Future<void> Function()? onLoadMore;
  final bool hasMore;
  final bool loadingMore;
  final bool showNoMoreFooter;
  final double loadMoreThreshold;
  final double refreshTriggerPullDistance;
  final double refreshIndicatorExtent;
  final ScrollPhysics? physics;
  final EdgeInsetsGeometry? padding;

  final String hintPull;
  final String hintRelease;
  final String hintLoading;
  final String hintSuccess;
  final Color accentColor;
  final Color hintColor;

  @override
  State<AppPullRefresh> createState() => _AppPullRefreshState();
}

class _AppPullRefreshState extends State<AppPullRefresh> {
  ScrollController? _ownedController;
  bool _loadMoreLocked = false;
  bool _refreshSucceeded = false;

  ScrollController get _controller => widget.controller ?? _ownedController!;

  @override
  void initState() {
    super.initState();
    if (widget.controller == null) {
      _ownedController = ScrollController();
    }
    _controller.addListener(_onScroll);
  }

  @override
  void didUpdateWidget(covariant AppPullRefresh oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.controller != widget.controller) {
      oldWidget.controller?.removeListener(_onScroll);
      _ownedController?.removeListener(_onScroll);
      if (widget.controller == null) {
        _ownedController ??= ScrollController();
      } else {
        _ownedController?.dispose();
        _ownedController = null;
      }
      _controller.addListener(_onScroll);
    }
    if (oldWidget.loadingMore && !widget.loadingMore) {
      _loadMoreLocked = false;
    }
  }

  @override
  void dispose() {
    _controller.removeListener(_onScroll);
    _ownedController?.dispose();
    super.dispose();
  }

  void _onScroll() {
    final onLoadMore = widget.onLoadMore;
    if (onLoadMore == null) return;
    if (!widget.hasMore || widget.loadingMore || _loadMoreLocked) return;
    if (!_controller.hasClients) return;
    final position = _controller.position;
    if (position.pixels < position.maxScrollExtent - widget.loadMoreThreshold) return;
    _loadMoreLocked = true;
    unawaited(onLoadMore());
  }

  Future<void> _handleRefresh() async {
    _refreshSucceeded = false;
    try {
      await widget.onRefresh();
      _refreshSucceeded = true;
      await Future<void>.delayed(const Duration(milliseconds: 480));
    } finally {
      if (mounted) setState(() => _refreshSucceeded = false);
    }
  }

  List<Widget> _bodySlivers(BuildContext context) {
    final built = widget.sliverBuilder?.call(context) ?? widget.slivers ?? const <Widget>[];
    return [...widget.topSlivers, ...built, ...widget.bottomSlivers];
  }

  @override
  Widget build(BuildContext context) {
    final body = _bodySlivers(context);
    final scroll = CustomScrollView(
      controller: _controller,
      physics:
          widget.physics ?? const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
      slivers: [
        CupertinoSliverRefreshControl(
          refreshTriggerPullDistance: widget.refreshTriggerPullDistance,
          refreshIndicatorExtent: widget.refreshIndicatorExtent,
          onRefresh: _handleRefresh,
          builder: _buildRefreshHeader,
        ),
        if (widget.padding != null) _paddedSliver(widget.padding!, body) else ...body,
        if (widget.onLoadMore != null && widget.loadingMore)
          const SliverToBoxAdapter(child: _LoadMoreFooter()),
        if (widget.onLoadMore != null &&
            widget.showNoMoreFooter &&
            !widget.hasMore &&
            !widget.loadingMore)
          const SliverToBoxAdapter(child: _NoMoreFooter()),
      ],
    );

    if (widget.header == null) return scroll;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        widget.header!,
        Expanded(child: scroll),
      ],
    );
  }

  Widget _buildRefreshHeader(
    BuildContext context,
    RefreshIndicatorMode refreshState,
    double pulledExtent,
    double refreshTriggerPullDistance,
    double refreshIndicatorExtent,
  ) {
    final progress = (pulledExtent / refreshTriggerPullDistance).clamp(0.0, 1.0);
    if (widget.style == AppPullRefreshStyle.bar) {
      return _BarRefreshHeader(
        pulledExtent: pulledExtent,
        indicatorExtent: refreshIndicatorExtent,
        progress: progress,
        refreshState: refreshState,
        succeeded: _refreshSucceeded,
        color: widget.accentColor,
      );
    }
    return _SpinnerRefreshHeader(
      pulledExtent: pulledExtent,
      indicatorExtent: refreshIndicatorExtent,
      progress: progress,
      refreshState: refreshState,
      succeeded: _refreshSucceeded,
      accentColor: widget.accentColor,
      hintColor: widget.hintColor,
      hintPull: widget.hintPull,
      hintRelease: widget.hintRelease,
      hintLoading: widget.hintLoading,
      hintSuccess: widget.hintSuccess,
    );
  }
}

Widget _paddedSliver(EdgeInsetsGeometry padding, List<Widget> slivers) {
  if (slivers.isEmpty) {
    return SliverPadding(
      padding: padding,
      sliver: const SliverToBoxAdapter(child: SizedBox.shrink()),
    );
  }
  if (slivers.length == 1) {
    return SliverPadding(padding: padding, sliver: slivers.first);
  }
  return SliverPadding(
    padding: padding,
    sliver: SliverMainAxisGroup(slivers: slivers),
  );
}

/// 进度条样式：下拉填满 → 刷新中 indeterminate → 成功短暂高亮。
class _BarRefreshHeader extends StatelessWidget {
  const _BarRefreshHeader({
    required this.pulledExtent,
    required this.indicatorExtent,
    required this.progress,
    required this.refreshState,
    required this.succeeded,
    required this.color,
  });

  final double pulledExtent;
  final double indicatorExtent;
  final double progress;
  final RefreshIndicatorMode refreshState;
  final bool succeeded;
  final Color color;

  @override
  Widget build(BuildContext context) {
    final refreshing =
        refreshState == RefreshIndicatorMode.refresh || refreshState == RefreshIndicatorMode.done;
    final barValue = refreshing
        ? (succeeded || refreshState == RefreshIndicatorMode.done ? 1.0 : null)
        : progress.clamp(0.05, 1.0);

    return SizedBox(
      height: pulledExtent,
      child: OverflowBox(
        maxHeight: indicatorExtent,
        minHeight: indicatorExtent,
        alignment: Alignment.bottomCenter,
        child: SizedBox(
          height: indicatorExtent,
          child: Opacity(
            opacity: progress.clamp(0.2, 1.0),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                child: LinearProgressIndicator(
                  value: barValue,
                  minHeight: 2,
                  color: color,
                  backgroundColor: Colors.transparent,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

/// 转圈样式：圆环 + 文案。
class _SpinnerRefreshHeader extends StatelessWidget {
  const _SpinnerRefreshHeader({
    required this.pulledExtent,
    required this.indicatorExtent,
    required this.progress,
    required this.refreshState,
    required this.succeeded,
    required this.accentColor,
    required this.hintColor,
    required this.hintPull,
    required this.hintRelease,
    required this.hintLoading,
    required this.hintSuccess,
  });

  final double pulledExtent;
  final double indicatorExtent;
  final double progress;
  final RefreshIndicatorMode refreshState;
  final bool succeeded;
  final Color accentColor;
  final Color hintColor;
  final String hintPull;
  final String hintRelease;
  final String hintLoading;
  final String hintSuccess;

  @override
  Widget build(BuildContext context) {
    final String hint;
    final bool spinning;
    switch (refreshState) {
      case RefreshIndicatorMode.drag:
        hint = hintPull;
        spinning = false;
      case RefreshIndicatorMode.armed:
        hint = hintRelease;
        spinning = false;
      case RefreshIndicatorMode.refresh:
        hint = succeeded ? hintSuccess : hintLoading;
        spinning = !succeeded;
      case RefreshIndicatorMode.done:
        hint = hintSuccess;
        spinning = false;
      case RefreshIndicatorMode.inactive:
        hint = '';
        spinning = false;
    }

    return SizedBox(
      height: pulledExtent,
      child: OverflowBox(
        maxHeight: indicatorExtent,
        minHeight: indicatorExtent,
        alignment: Alignment.bottomCenter,
        child: SizedBox(
          height: indicatorExtent,
          child: Opacity(
            opacity: progress.clamp(0.15, 1.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _RefreshGlyph(
                  progress: progress,
                  spinning: spinning,
                  succeeded: succeeded || refreshState == RefreshIndicatorMode.done,
                  color: accentColor,
                ),
                if (hint.isNotEmpty) ...[
                  const SizedBox(width: 10),
                  AnimatedSwitcher(
                    duration: const Duration(milliseconds: 160),
                    child: Text(
                      hint,
                      key: ValueKey(hint),
                      style: TextStyle(
                        color: hintColor,
                        fontSize: 13,
                        fontWeight: FontWeight.w400,
                        height: 1.2,
                      ),
                    ),
                  ),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _RefreshGlyph extends StatefulWidget {
  const _RefreshGlyph({
    required this.progress,
    required this.spinning,
    required this.succeeded,
    required this.color,
  });

  final double progress;
  final bool spinning;
  final bool succeeded;
  final Color color;

  @override
  State<_RefreshGlyph> createState() => _RefreshGlyphState();
}

class _RefreshGlyphState extends State<_RefreshGlyph> with SingleTickerProviderStateMixin {
  late final AnimationController _spin;

  @override
  void initState() {
    super.initState();
    _spin = AnimationController(vsync: this, duration: const Duration(milliseconds: 900));
    if (widget.spinning) _spin.repeat();
  }

  @override
  void didUpdateWidget(covariant _RefreshGlyph oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.spinning && !_spin.isAnimating) {
      _spin.repeat();
    } else if (!widget.spinning && _spin.isAnimating) {
      _spin.stop();
    }
  }

  @override
  void dispose() {
    _spin.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const size = 18.0;
    if (widget.succeeded) {
      return Icon(Icons.check_rounded, size: size, color: widget.color);
    }
    return AnimatedBuilder(
      animation: _spin,
      builder: (context, child) {
        final angle = widget.spinning ? _spin.value * math.pi * 2 : 0.0;
        return Transform.rotate(
          angle: angle,
          child: CustomPaint(
            size: const Size(size, size),
            painter: _ArcPainter(
              progress: widget.spinning ? 0.7 : widget.progress,
              color: widget.color,
            ),
          ),
        );
      },
    );
  }
}

class _ArcPainter extends CustomPainter {
  _ArcPainter({required this.progress, required this.color});

  final double progress;
  final Color color;

  @override
  void paint(Canvas canvas, Size size) {
    final stroke = Paint()
      ..color = color.withValues(alpha: 0.25)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2
      ..strokeCap = StrokeCap.round;
    final active = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2
      ..strokeCap = StrokeCap.round;

    final rect = Offset.zero & size;
    final inset = rect.deflate(1.5);
    canvas.drawArc(inset, 0, math.pi * 2, false, stroke);
    canvas.drawArc(inset, -math.pi / 2, math.pi * 2 * progress.clamp(0.05, 1.0), false, active);
  }

  @override
  bool shouldRepaint(covariant _ArcPainter oldDelegate) =>
      oldDelegate.progress != progress || oldDelegate.color != color;
}

class _LoadMoreFooter extends StatelessWidget {
  const _LoadMoreFooter();

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.fromLTRB(0, 12, 0, 24),
      child: Center(
        child: SizedBox(
          width: 22,
          height: 22,
          child: CircularProgressIndicator(strokeWidth: 2, color: AppColors.green1BBA77),
        ),
      ),
    );
  }
}

class _NoMoreFooter extends StatelessWidget {
  const _NoMoreFooter();

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.fromLTRB(0, 8, 0, 28),
      child: Center(
        child: Text(
          'No more',
          style: TextStyle(color: AppColors.gray6E6E6E, fontSize: 12, fontWeight: FontWeight.w400),
        ),
      ),
    );
  }
}
