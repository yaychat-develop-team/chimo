import 'package:flutter/material.dart';

import '../../core/theme/app_colors.dart';

/// 拍照 / 相册选择。
enum PhotoPickAction { takePhoto, gallery }

/// 弹出 Take Photo / Choose from Gallery / Cancel。
Future<PhotoPickAction?> showPhotoPickSheet(BuildContext context) {
  return showModalBottomSheet<PhotoPickAction>(
    context: context,
    backgroundColor: Colors.transparent,
    barrierColor: Colors.black.withValues(alpha: 0.55),
    builder: (_) => const PhotoPickSheet(),
  );
}

class PhotoPickSheet extends StatelessWidget {
  const PhotoPickSheet({super.key});

  static const Color _card = Color(0xFF1C1C1E);
  static const Color _divider = Color(0xFF2A2A2C);

  @override
  Widget build(BuildContext context) {
    final bottom = MediaQuery.paddingOf(context).bottom;

    return Padding(
      padding: EdgeInsets.fromLTRB(16, 0, 16, 12 + bottom),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Material(
            color: _card,
            borderRadius: BorderRadius.circular(16),
            clipBehavior: Clip.antiAlias,
            child: Column(
              children: [
                _SheetAction(
                  label: 'Take Photo',
                  onTap: () =>
                      Navigator.pop(context, PhotoPickAction.takePhoto),
                ),
                const Divider(height: 1, thickness: 1, color: _divider),
                _SheetAction(
                  label: 'Choose from Gallery',
                  onTap: () => Navigator.pop(context, PhotoPickAction.gallery),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          Material(
            color: _card,
            borderRadius: BorderRadius.circular(16),
            clipBehavior: Clip.antiAlias,
            child: InkWell(
              onTap: () => Navigator.pop(context),
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
