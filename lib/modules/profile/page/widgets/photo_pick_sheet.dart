import 'package:flutter/material.dart';

import '../../../../common/theme/app_bottom_sheet.dart';
import '../../../../app/app_jumper.dart';

/// 相机 / 相册选择器。
enum PhotoPickAction { takePhoto, gallery }

/// 展示拍照 / 从相册选择底部弹层（图二样式，无独立 Cancel）。
Future<PhotoPickAction?> showPhotoPickSheet(BuildContext context) {
  return AppBottomSheet.actions<PhotoPickAction>(
    buildItems: () => [
      AppSheetAction(
        label: 'Take Photo',
        onTap: () => AppJumper.back(result: PhotoPickAction.takePhoto),
      ),
      AppSheetAction(
        label: 'Choose from Gallery',
        onTap: () => AppJumper.back(result: PhotoPickAction.gallery),
      ),
    ],
  );
}
