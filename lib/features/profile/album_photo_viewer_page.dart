import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../core/constants/app_assets.dart';
import '../../core/theme/app_colors.dart';

/// Full-screen photo detail with swipe; supports asset paths and file paths.
class AlbumPhotoViewerPage extends StatefulWidget {
  const AlbumPhotoViewerPage({
    super.key,
    required this.paths,
    this.initialIndex = 0,
  });

  final List<String> paths;
  final int initialIndex;

  @override
  State<AlbumPhotoViewerPage> createState() => _AlbumPhotoViewerPageState();
}

class _AlbumPhotoViewerPageState extends State<AlbumPhotoViewerPage> {
  late final PageController _pageController = PageController(
    initialPage: widget.initialIndex.clamp(0, widget.paths.length - 1),
  );
  late int _currentIndex = widget.initialIndex.clamp(0, widget.paths.length - 1);

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
    if (path.startsWith('assets/')) {
      return Image.asset(
        path,
        fit: BoxFit.contain,
        errorBuilder: (_, _, _) => error,
      );
    }
    if (path.startsWith('http://') || path.startsWith('https://')) {
      return Image.network(
        path,
        fit: BoxFit.contain,
        errorBuilder: (_, _, _) => error,
      );
    }
    return Image.file(
      File(path),
      fit: BoxFit.contain,
      errorBuilder: (_, _, _) => error,
    );
  }

  @override
  Widget build(BuildContext context) {
    final total = widget.paths.length;
    final top = MediaQuery.paddingOf(context).top;

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: Scaffold(
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
                      child: IconButton(
                        onPressed: () => Navigator.of(context).pop(),
                        icon: SvgPicture.asset(
                          AppAssets.chatBack,
                          width: 17,
                          height: 7,
                        ),
                      ),
                    ),
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
      ),
    );
  }
}
