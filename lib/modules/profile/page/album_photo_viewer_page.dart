import 'package:flutter/material.dart';

import '../../../common/theme/app_colors.dart';
import '../../../common/widgets/app_back_button.dart';
import '../../../common/widgets/app_image.dart';
import '../../../common/widgets/app_scaffold.dart';
import '../../../app/app_jumper.dart';

/// 全屏照片详情（可滑动）；支持资源路径与文件路径。
class AlbumPhotoViewerPage extends StatefulWidget {
  const AlbumPhotoViewerPage({
    super.key,
    required this.paths,
    this.initialIndex = 0,
    this.showPageIndicator = true,
  });

  final List<String> paths;
  final int initialIndex;

  /// 为 false 时不显示顶部「1/5」页码（聊天图片预览用）。
  final bool showPageIndicator;

  /// 打开全屏查看器；[paths] 无可用项时为 no-op。
  static Future<void> open(
    BuildContext context, {
    required List<String> paths,
    int initialIndex = 0,
    bool showPageIndicator = true,
  }) {
    final clean = [
      for (final p in paths)
        if (p.trim().isNotEmpty) p.trim(),
    ];
    if (clean.isEmpty) return Future<void>.value();
    final index = initialIndex.clamp(0, clean.length - 1);
    return AppJumper.toAlbumViewer(
      paths: clean,
      initialIndex: index,
      showPageIndicator: showPageIndicator,
    );
  }

  @override
  State<AlbumPhotoViewerPage> createState() => _AlbumPhotoViewerPageState();
}

class _AlbumPhotoViewerPageState extends State<AlbumPhotoViewerPage> {
  late final PageController _pageController = PageController(
    initialPage: widget.initialIndex.clamp(0, widget.paths.length - 1),
  );
  late int _currentIndex = widget.initialIndex.clamp(
    0,
    widget.paths.length - 1,
  );

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  Widget _imageFor(String path) {
    const error = Icon(
      Icons.broken_image_outlined,
      color: Colors.white54,
      size: 48,
    );
    // 来源交给 AppImage 自己判断；这里只剩解码预算的差别：远程原图尺寸不可控，
    // 按屏幕宽封顶，assets 与本地图本就是设备尺寸，保持原始解码，
    // InteractiveViewer 放大时才不会糊。
    final memWidth = AppImage.classify(path) == AppImageSource.network
        ? (MediaQuery.sizeOf(context).width *
                  MediaQuery.devicePixelRatioOf(context))
              .round()
              .clamp(1, 2048)
        : null;
    return AppImage(
      path,
      fit: BoxFit.contain,
      memWidth: memWidth,
      error: error,
    );
  }

  @override
  Widget build(BuildContext context) {
    final total = widget.paths.length;
    final top = MediaQuery.paddingOf(context).top;

    return ChimoScaffold(
      showNav: false,
      safeArea: false,
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          PageView.builder(
            controller: _pageController,
            itemCount: total,
            onPageChanged: (index) => setState(() => _currentIndex = index),
            itemBuilder: (context, index) {
              return InteractiveViewer(
                minScale: 1,
                maxScale: 4,
                child: Center(child: _imageFor(widget.paths[index])),
              );
            },
          ),
          Positioned(
            top: top + 4,
            left: 8,
            right: 8,
            child: SizedBox(
              height: 44,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: const AppBackButton(),
                  ),
                  if (widget.showPageIndicator)
                    Text(
                      total > 1 ? '${_currentIndex + 1}/$total' : 'Photo',
                      style: const TextStyle(
                        color: AppColors.textPrimary,
                        fontSize: 17,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
