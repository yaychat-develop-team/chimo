import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:photo_manager/photo_manager.dart';
import '../../../common/widgets/app_image.dart';
import '../../../common/widgets/app_scaffold.dart';
import '../../../app/app_jumper.dart';
import '../../../common/utils/text_fmt.dart';
import '../../../common/utils/time_fmt.dart';

/// 相册所选照片的全屏滑动预览，含基础照片信息。
class AlbumSelectionPreviewPage extends StatefulWidget {
  const AlbumSelectionPreviewPage({
    super.key,
    required this.entities,
    this.initialIndex = 0,
  });

  final List<AssetEntity> entities;
  final int initialIndex;

  @override
  State<AlbumSelectionPreviewPage> createState() =>
      _AlbumSelectionPreviewPageState();
}

class _AlbumSelectionPreviewPageState extends State<AlbumSelectionPreviewPage> {
  late final PageController _pageController;
  late int _index;
  final Map<String, File?> _files = {};
  final Map<String, String?> _titles = {};

  @override
  void initState() {
    super.initState();
    final max = widget.entities.isEmpty ? 0 : widget.entities.length - 1;
    _index = widget.initialIndex.clamp(0, max);
    _pageController = PageController(initialPage: _index);
    for (final e in widget.entities) {
      unawaited(_prefetch(e));
    }
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  Future<void> _prefetch(AssetEntity entity) async {
    try {
      final file = await entity.file;
      final title = entity.title ?? await entity.titleAsync;
      if (!mounted) return;
      setState(() {
        _files[entity.id] = file;
        _titles[entity.id] = title;
      });
    } catch (_) {
      if (!mounted) return;
      setState(() => _files[entity.id] = null);
    }
  }

  String _formatDate(DateTime? dt) {
    if (dt == null) return '';
    // 缺少日期时 photo_manager 的 Epoch 默认值。
    if (dt.millisecondsSinceEpoch <= 0) return '';
    return TimeFmt.isoDateTimeMinute(dt);
  }

  @override
  Widget build(BuildContext context) {
    final total = widget.entities.length;
    final top = MediaQuery.paddingOf(context).top;
    final bottom = MediaQuery.paddingOf(context).bottom;
    final entity = total == 0
        ? null
        : widget.entities[_index.clamp(0, total - 1)];
    final file = entity == null ? null : _files[entity.id];
    final title = entity == null ? null : (_titles[entity.id] ?? entity.title);
    final sizeLabel = file != null && file.existsSync()
        ? TextFmt.fileSize(file.lengthSync())
        : null;
    final infoParts = <String>[
      if (entity != null && entity.width > 0 && entity.height > 0)
        '${entity.width} × ${entity.height}',
      ?sizeLabel,
      if (entity != null) _formatDate(entity.createDateTime),
    ].where((s) => s.trim().isNotEmpty).toList();

    return ChimoScaffold(
      showNav: false,
      safeArea: false,
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          if (total == 0)
            const Center(
              child: Text(
                'No photos selected',
                style: TextStyle(color: Colors.white70),
              ),
            )
          else
            PageView.builder(
              controller: _pageController,
              itemCount: total,
              onPageChanged: (i) => setState(() => _index = i),
              itemBuilder: (context, i) {
                final e = widget.entities[i];
                return InteractiveViewer(
                  minScale: 1,
                  maxScale: 4,
                  child: Center(child: _buildImage(e)),
                );
              },
            ),
          Positioned(
            top: top + 4,
            left: 4,
            right: 4,
            child: SizedBox(
              height: 48,
              child: Row(
                children: [
                  IconButton(
                    onPressed: () => AppJumper.back(),
                    icon: const Icon(
                      Icons.close_rounded,
                      color: Colors.white,
                      size: 26,
                    ),
                  ),
                  Expanded(
                    child: Text(
                      total > 0 ? '${_index + 1}/$total' : '',
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 17,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  const SizedBox(width: 48),
                ],
              ),
            ),
          ),
          if (entity != null)
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.transparent,
                      Colors.black.withValues(alpha: 0.75),
                    ],
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.fromLTRB(20, 28, 20, 16 + bottom),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      if (title != null && title.trim().isNotEmpty)
                        Text(
                          title.trim(),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      if (infoParts.isNotEmpty) ...[
                        const SizedBox(height: 6),
                        Text(
                          infoParts.join('  ·  '),
                          style: TextStyle(
                            color: Colors.white.withValues(alpha: 0.78),
                            fontSize: 13,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ],
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildImage(AssetEntity entity) {
    final file = _files[entity.id];
    if (file != null && file.existsSync()) {
      return AppImage.file(file.path, fit: BoxFit.contain, error: _broken);
    }
    return FutureBuilder<Uint8List?>(
      future: entity.thumbnailDataWithSize(
        const ThumbnailSize(1080, 1080),
        quality: 90,
      ),
      builder: (context, snapshot) {
        final bytes = snapshot.data;
        if (bytes == null || bytes.isEmpty) {
          return const SizedBox(
            width: 32,
            height: 32,
            child: CircularProgressIndicator(
              strokeWidth: 2,
              color: Colors.white54,
            ),
          );
        }
        return AppImage.bytes(bytes, fit: BoxFit.contain);
      },
    );
  }

  static const _broken = Icon(
    Icons.broken_image_outlined,
    color: Colors.white54,
    size: 48,
  );
}
