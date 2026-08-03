import 'dart:async';

import 'package:flutter/material.dart';

import '../../../core/constants/app_assets.dart';
import '../data/banner_dto.dart';

/// Home promo banner carousel (network images with local fallback).
class HomeHeroBanner extends StatefulWidget {
  const HomeHeroBanner({
    super.key,
    this.banners = const [],
    this.fallbackAssets = AppAssets.homeBanners,
    this.autoPlay = true,
    this.autoPlayInterval = const Duration(seconds: 4),
    this.onBannerTap,
  });

  /// Remote banners from `/home_page/main`.
  final List<HomeBannerItem> banners;

  /// Local assets used when API banners are empty.
  final List<String> fallbackAssets;

  final bool autoPlay;
  final Duration autoPlayInterval;
  final ValueChanged<HomeBannerItem>? onBannerTap;

  @override
  State<HomeHeroBanner> createState() => _HomeHeroBannerState();
}

class _HomeHeroBannerState extends State<HomeHeroBanner> {
  PageController? _pageController;
  Timer? _autoPlayTimer;
  List<String> _images = const [];
  bool _useNetwork = false;

  @override
  void initState() {
    super.initState();
    _rebuildPages();
  }

  @override
  void didUpdateWidget(covariant HomeHeroBanner oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.banners != widget.banners ||
        oldWidget.fallbackAssets != widget.fallbackAssets) {
      _rebuildPages(resetController: true);
    }
  }

  void _rebuildPages({bool resetController = false}) {
    final remote = [
      for (final b in widget.banners)
        if (b.imageUrl.trim().isNotEmpty) b.imageUrl.trim(),
    ];
    _useNetwork = remote.isNotEmpty;
    _images = _useNetwork ? remote : widget.fallbackAssets;

    final initial = _images.length <= 1 ? 0 : 1;
    if (resetController || _pageController == null) {
      _pageController?.dispose();
      _pageController = PageController(initialPage: initial);
    }
    _startAutoPlay();
  }

  List<String> get _loopPages {
    if (_images.length <= 1) return _images;
    return [_images.last, ..._images, _images.first];
  }

  @override
  void dispose() {
    _autoPlayTimer?.cancel();
    _pageController?.dispose();
    super.dispose();
  }

  void _startAutoPlay() {
    _autoPlayTimer?.cancel();
    if (!widget.autoPlay || _images.length <= 1) return;
    _autoPlayTimer = Timer.periodic(widget.autoPlayInterval, (_) {
      final controller = _pageController;
      if (!mounted || controller == null || !controller.hasClients) return;
      final next = controller.page!.round() + 1;
      controller.animateToPage(
        next,
        duration: const Duration(milliseconds: 380),
        curve: Curves.easeInOut,
      );
    });
  }

  void _onUserScrollStart() => _autoPlayTimer?.cancel();

  void _onUserScrollEnd() => _startAutoPlay();

  void _onPageChanged(int page) {
    final n = _images.length;
    final controller = _pageController;
    if (n <= 1 || controller == null) return;

    if (page == 0) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (controller.hasClients) controller.jumpToPage(n);
      });
      return;
    }
    if (page == n + 1) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (controller.hasClients) controller.jumpToPage(1);
      });
    }
  }

  int _realIndex(int loopIndex) {
    final n = _images.length;
    if (n <= 1) return 0;
    if (loopIndex == 0) return n - 1;
    if (loopIndex == n + 1) return 0;
    return loopIndex - 1;
  }

  void _onTap(int loopIndex) {
    if (!_useNetwork || widget.banners.isEmpty) return;
    final i = _realIndex(loopIndex).clamp(0, widget.banners.length - 1);
    widget.onBannerTap?.call(widget.banners[i]);
  }

  Widget _image(String src) {
    if (_useNetwork) {
      return Image.network(
        src,
        fit: BoxFit.cover,
        width: double.infinity,
        height: double.infinity,
        errorBuilder: (_, error, stack) => Image.asset(
          AppAssets.homeBanners.first,
          fit: BoxFit.cover,
          width: double.infinity,
          height: double.infinity,
        ),
      );
    }
    return Image.asset(
      src,
      fit: BoxFit.cover,
      width: double.infinity,
      height: double.infinity,
    );
  }

  @override
  Widget build(BuildContext context) {
    final controller = _pageController;
    if (_images.isEmpty || controller == null) {
      return const SizedBox.shrink();
    }

    final pages = _loopPages;

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
              controller: controller,
              scrollDirection: Axis.vertical,
              itemCount: pages.length,
              onPageChanged: _onPageChanged,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () => _onTap(index),
                  child: _image(pages[index]),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
