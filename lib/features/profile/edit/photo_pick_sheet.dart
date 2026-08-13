import 'package:flutter/material.dart';

import '../../../core/widgets/app_action_bottom_sheet.dart';

/// 相机 / 相册选择器。
enum PhotoPickAction { takePhoto, gallery }

/// 展示拍照 / 从相册选择底部弹层（图二样式，无独立 Cancel）。
Future<PhotoPickAction?> showPhotoPickSheet(BuildContext context) {
  return AppActionBottomSheet.show<PhotoPickAction>(
    context: context,
    buildItems: (sheetContext) => [
      AppActionSheetItem(
        label: 'Take Photo',
        onTap: () =>
            Navigator.pop(sheetContext, PhotoPickAction.takePhoto),
      ),
      AppActionSheetItem(
        label: 'Choose from Gallery',
        onTap: () => Navigator.pop(sheetContext, PhotoPickAction.gallery),
      ),
    ],
  );
}
