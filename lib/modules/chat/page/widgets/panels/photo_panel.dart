import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:photo_manager/photo_manager.dart';

import '../../../../../common/theme/app_colors.dart';
import '../../../../../common/widgets/app_image.dart';

/// 相册面板：4 列网格（第一格是相机）+ 底部一行（预览 / 系统相册 / 原图 / 发送）。
///
/// 连同两个格子（相机格、照片格）逐字节相同，唯一的差别是私聊那份多一行
/// `// 相机格 + 相册照片。` 的注释。所以这里**没有样式包**：真的没有可差的东西，
/// 硬造一个 `ChatPhotoPanelStyle` 只会让下一个人以为两边有区别。
///
/// 取数、权限、选中顺序、发送都在 `ChatInputBarState` 里，这里只画 + 回调；
/// 选完图之后的落盘走 `MediaPicker`，iOS PHPicker 临时文件那条坑（选完图等几秒
/// 再发会失败）记在 `core/utils/media_picker.dart` 的 `persistToSandbox` 上，
class ChatPhotoPanel extends StatelessWidget {
  const ChatPhotoPanel({
    super.key,
    required this.photos,
    required this.selected,
    required this.originalPhoto,
    required this.loading,
    required this.error,
    required this.bottomInset,
    required this.onTogglePhoto,
    required this.onCamera,
    required this.onPreview,
    required this.onAlbum,
    required this.onToggleOriginal,
    required this.onSend,
    required this.onRetry,
  });

  final List<AssetEntity> photos;

  /// 选择顺序（[photos] 里的下标），格子右上角那个序号就是它的位置 + 1。
  final List<int> selected;
  final bool originalPhoto;
  final bool loading;

  /// 非空 = 没拿到相册（多数是权限没给）：画文案 + 重试 + 去系统相册，不白屏。
  final String? error;
  final double bottomInset;
  final ValueChanged<int> onTogglePhoto;
  final VoidCallback onCamera;
  final VoidCallback onPreview;
  final VoidCallback onAlbum;
  final VoidCallback onToggleOriginal;
  final VoidCallback onSend;
  final VoidCallback onRetry;

  static const Color _green = AppColors.accentLime;

  @override
  Widget build(BuildContext context) {
    final hasSelection = selected.isNotEmpty;
    // 相机格 + 相册照片。
    final itemCount = photos.length + 1;

    return Column(
      children: [
        Expanded(
          child: loading
              ? const Center(
                  child: SizedBox(
                    width: 28,
                    height: 28,
                    child: CircularProgressIndicator(strokeWidth: 2),
                  ),
                )
              : error != null && photos.isEmpty
              ? Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          error!,
                          textAlign: TextAlign.center,
                          style: const TextStyle(color: AppColors.textGray88, fontSize: 13),
                        ),
                        const SizedBox(height: 10),
                        TextButton(onPressed: onRetry, child: const Text('Retry')),
                        TextButton(onPressed: onAlbum, child: const Text('Open system album')),
                      ],
                    ),
                  ),
                )
              : GridView.builder(
                  padding: EdgeInsets.zero,
                  physics: const BouncingScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                    mainAxisSpacing: 2,
                    crossAxisSpacing: 2,
                  ),
                  itemCount: itemCount,
                  itemBuilder: (context, index) {
                    if (index == 0) {
                      return _CameraCell(onTap: onCamera);
                    }
                    final photoIndex = index - 1;
                    final order = selected.indexOf(photoIndex);
                    return _AlbumPhotoCell(
                      entity: photos[photoIndex],
                      order: order < 0 ? null : order + 1,
                      onTap: () => onTogglePhoto(photoIndex),
                    );
                  },
                ),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(16, 10, 16, 8 + bottomInset),
          child: SizedBox(
            height: 44,
            child: Row(
              children: [
                GestureDetector(
                  onTap: hasSelection ? onPreview : null,
                  child: Text(
                    'Preview',
                    style: TextStyle(
                      color: hasSelection ? AppColors.surfaceDark : AppColors.textGrayB0,
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Container(width: 1, height: 14, color: AppColors.textGrayD8),
                const SizedBox(width: 12),
                GestureDetector(
                  onTap: onAlbum,
                  child: const Text(
                    'Album',
                    style: TextStyle(
                      color: AppColors.surfaceDark,
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                const Spacer(),
                GestureDetector(
                  onTap: onToggleOriginal,
                  behavior: HitTestBehavior.opaque,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        width: 18,
                        height: 18,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: originalPhoto ? _green : Colors.transparent,
                          border: originalPhoto
                              ? null
                              : Border.all(color: AppColors.textGrayC8, width: 1.5),
                        ),
                        child: originalPhoto
                            ? const Icon(Icons.check_rounded, size: 13, color: Colors.white)
                            : null,
                      ),
                      const SizedBox(width: 6),
                      const Text(
                        'Original Photo',
                        style: TextStyle(
                          color: AppColors.surfaceDark,
                          fontSize: 13,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 12),
                GestureDetector(
                  onTap: hasSelection ? onSend : null,
                  child: AnimatedOpacity(
                    duration: const Duration(milliseconds: 150),
                    opacity: hasSelection ? 1 : 0.45,
                    child: Container(
                      height: 36,
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: _green,
                        borderRadius: BorderRadius.circular(18),
                      ),
                      child: Text(
                        hasSelection ? 'Send (${selected.length})' : 'Send',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class _CameraCell extends StatelessWidget {
  const _CameraCell({required this.onTap});

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColors.textGrayF5,
      child: InkWell(
        onTap: onTap,
        child: DecoratedBox(
          decoration: BoxDecoration(border: Border.all(color: AppColors.textGrayD8)),
          child: const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.photo_camera_outlined, size: 28, color: AppColors.textGray66),
              SizedBox(height: 4),
              Text(
                'Camera',
                style: TextStyle(
                  color: AppColors.textGray88,
                  fontSize: 11,
                  fontWeight: FontWeight.w500,
                  height: 1,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _AlbumPhotoCell extends StatelessWidget {
  const _AlbumPhotoCell({required this.entity, required this.order, required this.onTap});

  final AssetEntity entity;
  final int? order;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final selected = order != null;

    return GestureDetector(
      onTap: onTap,
      child: Stack(
        fit: StackFit.expand,
        children: [
          FutureBuilder<Uint8List?>(
            future: entity.thumbnailDataWithSize(const ThumbnailSize.square(200), quality: 80),
            builder: (context, snapshot) {
              final bytes = snapshot.data;
              if (bytes == null || bytes.isEmpty) {
                return const ColoredBox(
                  color: AppColors.textGrayE8,
                  child: Center(
                    child: SizedBox(
                      width: 16,
                      height: 16,
                      child: CircularProgressIndicator(strokeWidth: 1.5),
                    ),
                  ),
                );
              }
              // 请求的是 200×200 方图，格子也是方的，换成 contain 会留白、
              // 换成 fill 会拉伸。
              return AppImage.bytes(bytes, fit: BoxFit.cover);
            },
          ),
          if (selected) const ColoredBox(color: AppColors.glowAccentLime),
          Positioned(
            top: 6,
            right: 6,
            child: Container(
              width: 22,
              height: 22,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: selected ? AppColors.accentLime : Colors.black.withValues(alpha: 0.15),
                border: Border.all(
                  color: selected ? AppColors.accentLime : Colors.white,
                  width: 1.5,
                ),
              ),
              child: selected
                  ? Text(
                      '$order',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.w700,
                        height: 1,
                      ),
                    )
                  : null,
            ),
          ),
        ],
      ),
    );
  }
}
