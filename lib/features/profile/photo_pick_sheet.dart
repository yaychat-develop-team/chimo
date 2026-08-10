import 'package:flutter/material.dart';

import '../../core/theme/app_colors.dart';

/// 相机 / 相册选择器。
enum PhotoPickAction { takePhoto, gallery }

/// 展示拍照 / 从相册选择 / 取消底部弹层。
Future<PhotoPickAction?> showPhotoPickSheet(BuildContext context) {
  return showModalBottomSheet<PhotoPickAction>(
    context: context,
    backgroundColor: Colors.transparent,
    barrierColor: Colors.black.withValues(alpha: 0.55),
    isScrollControlled: true,
    builder: (sheetContext) {
      return SafeArea(
        child: PhotoPickSheet(
          onTakePhoto: () =>
              Navigator.pop(sheetContext, PhotoPickAction.takePhoto),
          onGallery: () =>
              Navigator.pop(sheetContext, PhotoPickAction.gallery),
          onCancel: () => Navigator.pop(sheetContext),
        ),
      );
    },
  );
}

class PhotoPickSheet extends StatelessWidget {
  const PhotoPickSheet({
    super.key,
    required this.onTakePhoto,
    required this.onGallery,
    required this.onCancel,
  });

  final VoidCallback onTakePhoto;
  final VoidCallback onGallery;
  final VoidCallback onCancel;

  static const Color _card = Color(0xFF1C1C1E);
  static const Color _divider = Color(0xFF2A2A2C);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 0, 16, 12),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Material(
            color: _card,
            borderRadius: BorderRadius.circular(16),
            clipBehavior: Clip.antiAlias,
            child: Column(
              children: [
                _SheetAction(label: 'Take Photo', onTap: onTakePhoto),
                const Divider(height: 1, thickness: 1, color: _divider),
                _SheetAction(label: 'Choose from Gallery', onTap: onGallery),
              ],
            ),
          ),
          const SizedBox(height: 10),
          Material(
            color: _card,
            borderRadius: BorderRadius.circular(16),
            clipBehavior: Clip.antiAlias,
            child: InkWell(
              onTap: onCancel,
              child: const SizedBox(
                height: 52,
                width: double.infinity,
                child: Center(
                  child: Text(
                    'Cancel',
                    style: TextStyle(
                      color: AppColors.textPrimary,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _SheetAction extends StatelessWidget {
  const _SheetAction({required this.label, required this.onTap});

  final String label;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: SizedBox(
        height: 52,
        width: double.infinity,
        child: Center(
          child: Text(
            label,
            style: const TextStyle(
              color: AppColors.textPrimary,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }
}
