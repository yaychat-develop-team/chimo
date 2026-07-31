import 'dart:async';

import 'package:flutter/material.dart';

import '../../../core/constants/app_assets.dart';

/// Home promo banner: vertical carousel, seamless loop of 2 images.
class HomeHeroBanner extends StatefulWidget {
  const HomeHeroBanner({
    super.key,
    this.banners = AppAssets.homeBanners,
    this.autoPlay = true,
    this.autoPlayInterval = const Duration(seconds: 4),
  });

  /// Carousel image asset list.
  final List<String> banners;

  /// Whether to auto-advance.
  final bool autoPlay;

  /// Auto-advance interval.
  final Duration autoPlayInterval;

  @override
  State<HomeHeroBanner> createState() => _HomeHeroBannerState();
}

class _HomeHeroBannerState extends State<HomeHeroBanner> {
  late final PageController _pageController;
  Timer? _autoPlayTimer;

  /// Extended pages: `[last, ...real, first]` for seamless looping.
  List<String> get _loopPages {
    final banners = widget.banners;
    if (banners.length <= 1) return banners;
    return [banners.last, ...banners, banners.first];
  }

  @override
  void initState() {
    super.initState();
    // Start on the first real page (index 1 in extended list).
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

  /// On clone pages at ends, jump to matching real page for seamless loop.
  void _onPageChanged(int page) {
    final n = widget.banners.length;
    if (n <= 1) return;

    // Extended: 0=last clone, 1…n=real, n+1=first clone
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

    // Design: 343×100 wide (16 horizontal padding each side).
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
