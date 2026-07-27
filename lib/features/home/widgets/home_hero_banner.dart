import 'dart:async';

import 'package:flutter/material.dart';

import '../../../core/constants/app_assets.dart';

/// 首页运营 Banner：竖直轮播，2 张图首尾相接循环。
class HomeHeroBanner extends StatefulWidget {
  const HomeHeroBanner({
    super.key,
    this.banners = AppAssets.homeBanners,
    this.autoPlay = true,
    this.autoPlayInterval = const Duration(seconds: 4),
  });

  /// 轮播图片资源列表。
  final List<String> banners;

  /// 是否自动轮播。
  final bool autoPlay;

  /// 自动轮播间隔。
  final Duration autoPlayInterval;

  @override
  State<HomeHeroBanner> createState() => _HomeHeroBannerState();
}

class _HomeHeroBannerState extends State<HomeHeroBanner> {
  late final PageController _pageController;
  Timer? _autoPlayTimer;

  /// 扩展页：`[最后一张, ...真实, 第一张]`，用于无缝首尾相接。
  List<String> get _loopPages {
    final banners = widget.banners;
    if (banners.length <= 1) return banners;
    return [banners.last, ...banners, banners.first];
  }

  @override
  void initState() {
    super.initState();
    // 从真实第一张开始（扩展列表下标 1）。
    final initial = widget.banners.length <= 1 ? 0 : 1;
    _pageController = PageController(initialPage: initial);
    _startAutoPlay();
  }

  @override
  void dispose() {
    _autoPlayTimer?.cancel();
    _pageController.dispose();
    super.dispose();
  }

  void _startAutoPlay() {
    if (!widget.autoPlay || widget.banners.length <= 1) return;
    _autoPlayTimer?.cancel();
    _autoPlayTimer = Timer.periodic(widget.autoPlayInterval, (_) {
      if (!mounted || !_pageController.hasClients) return;
      final next = _pageController.page!.round() + 1;
      _pageController.animateToPage(
        next,
        duration: const Duration(milliseconds: 380),
        curve: Curves.easeInOut,
      );
    });
  }

  void _onUserScrollStart() {
    _autoPlayTimer?.cancel();
  }

  void _onUserScrollEnd() {
    _startAutoPlay();
  }

  /// 滑到两端克隆页时，瞬间跳到对应真实页，视觉上首尾相接。
  void _onPageChanged(int page) {
    final n = widget.banners.length;
    if (n <= 1) return;

    // 扩展：0=末张克隆，1…n=真实，n+1=首张克隆
    if (page == 0) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (_pageController.hasClients) {
          _pageController.jumpToPage(n);
        }
      });
      return;
    }
    if (page == n + 1) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (_pageController.hasClients) {
          _pageController.jumpToPage(1);
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final banners = widget.banners;
    if (banners.isEmpty) return const SizedBox.shrink();

    final pages = _loopPages;

    // 设计稿：宽 343、高 100（左右各 16 边距）。
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: SizedBox(
        height: 100,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: NotificationListener<ScrollNotification>(
            onNotification: (notification) {
              if (notification is ScrollStartNotification &&
                  notification.dragDetails != null) {
                _onUserScrollStart();
              } else if (notification is ScrollEndNotification) {
                _onUserScrollEnd();
              }
              return notification.metrics.axis == Axis.vertical;
            },
            child: PageView.builder(
              controller: _pageController,
              scrollDirection: Axis.vertical,
              itemCount: pages.length,
              onPageChanged: _onPageChanged,
              itemBuilder: (context, index) {
                return Image.asset(
                  pages[index],
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: double.infinity,
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
