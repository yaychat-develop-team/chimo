import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:photo_manager/photo_manager.dart';

import '../../../app/app_jumper.dart';
import '../../../common/utils/text_fmt.dart';
import '../../../common/utils/time_fmt.dart';
import '../../../common/widgets/app_image.dart';
import '../../../common/widgets/app_scaffold.dart';

/// 相册所选照片的全屏滑动预览。
class AlbumSelectionPreviewPage extends StatefulWidget {
  const AlbumSelectionPreviewPage({super.key, required this.entities, this.initialIndex = 0});

  final List<AssetEntity> entities;
  final int initialIndex;

  @override
  State<AlbumSelectionPreviewPage> createState() => _AlbumSelectionPreviewPageState();
}

class _AlbumSelectionPreviewPageState extends State<AlbumSelectionPreviewPage> {
  late final PageController _page;
  late int _index;

  @override
  void initState() {
    super.initState();
    final last = widget.entities.isEmpty ? 0 : widget.entities.length - 1;
    _index = widget.initialIndex.clamp(0, last);
    _page = PageController(initialPage: _index);
  }

  @override
  void dispose() {
    _page.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final total = widget.entities.length;
    final pad = MediaQuery.paddingOf(context);
    final entity = total == 0 ? null : widget.entities[_index];

    return AppScaffold(
      backgroundColor: Colors.black,
      body: Stack(
        fit: StackFit.expand,
        children: [
          if (total == 0)
            const Center(
              child: Text('No photos selected', style: TextStyle(color: Colors.white70)),
            )
          else
            PageView.builder(
              controller: _page,
              itemCount: total,
              onPageChanged: (i) => setState(() => _index = i),
              itemBuilder: (_, i) => InteractiveViewer(
                minScale: 1,
                maxScale: 4,
                child: Center(child: _AssetImage(entity: widget.entities[i])),
              ),
            ),
          Positioned(
            top: pad.top + 4,
            left: 4,
            right: 4,
            child: SizedBox(
              height: 48,
              child: Row(
                children: [
                  IconButton(
                    onPressed: AppJumper.back,
                    icon: const Icon(Icons.close_rounded, color: Colors.white, size: 26),
                  ),
                  Expanded(
                    child: Text(
                      total == 0 ? '' : '${_index + 1}/$total',
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
              child: _InfoBar(key: ValueKey(entity.id), entity: entity, bottomInset: pad.bottom),
            ),
        ],
      ),
    );
  }
}

class _AssetImage extends StatelessWidget {
  const _AssetImage({required this.entity});

  final AssetEntity entity;

  static const _broken = Icon(Icons.broken_image_outlined, color: Colors.white54, size: 48);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<File?>(
      future: entity.file,
      builder: (context, snap) {
        final file = snap.data;
        if (file != null && file.existsSync()) {
          return AppImage.file(file.path, fit: BoxFit.contain, error: _broken);
        }
        return FutureBuilder<Uint8List?>(
          future: entity.thumbnailDataWithSize(const ThumbnailSize(1080, 1080), quality: 90),
          builder: (context, thumb) {
            final bytes = thumb.data;
            if (bytes == null || bytes.isEmpty) {
              return const SizedBox(
                width: 32,
                height: 32,
                child: CircularProgressIndicator(strokeWidth: 2, color: Colors.white54),
              );
            }
            return AppImage.bytes(bytes, fit: BoxFit.contain);
          },
        );
      },
    );
  }
}

class _InfoBar extends StatefulWidget {
  const _InfoBar({super.key, required this.entity, required this.bottomInset});

  final AssetEntity entity;
  final double bottomInset;

  @override
  State<_InfoBar> createState() => _InfoBarState();
}

class _InfoBarState extends State<_InfoBar> {
  late final Future<({String title, String meta})> _future = _load();

  Future<({String title, String meta})> _load() async {
    final rawTitle = widget.entity.title ?? await widget.entity.titleAsync;
    final title = rawTitle.trim();
    final file = await widget.entity.file;
    final parts = <String>[
      if (widget.entity.width > 0 && widget.entity.height > 0)
        '${widget.entity.width} × ${widget.entity.height}',
      if (file != null && file.existsSync()) TextFmt.fileSize(file.lengthSync()),
      if (widget.entity.createDateTime.millisecondsSinceEpoch > 0)
        TimeFmt.isoDateTimeMinute(widget.entity.createDateTime),
    ];
    return (title: title, meta: parts.join('  ·  '));
  }

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Colors.transparent, Colors.black.withValues(alpha: 0.75)],
        ),
      ),
      child: Padding(
        padding: EdgeInsets.fromLTRB(20, 28, 20, 16 + widget.bottomInset),
        child: FutureBuilder(
          future: _future,
          builder: (context, snap) {
            final data = snap.data;
            if (data == null) return const SizedBox.shrink();
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                if (data.title.isNotEmpty)
                  Text(
                    data.title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                if (data.meta.isNotEmpty) ...[
                  const SizedBox(height: 6),
                  Text(
                    data.meta,
                    style: TextStyle(color: Colors.white.withValues(alpha: 0.78), fontSize: 13),
                  ),
                ],
              ],
            );
          },
        ),
      ),
    );
  }
}
