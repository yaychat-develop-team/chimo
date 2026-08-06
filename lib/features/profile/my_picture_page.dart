import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

import '../../core/widgets/app_page_scaffold.dart';
import 'photo_pick_sheet.dart';

/// Full-size avatar preview page.
class MyPicturePage extends StatelessWidget {
  const MyPicturePage({super.key, required this.avatarAsset});

  final String avatarAsset;

  Future<void> _showMoreSheet(BuildContext context) async {
    final action = await showPhotoPickSheet(context);
    if (!context.mounted || action == null) return;

    final source = switch (action) {
      PhotoPickAction.takePhoto => ImageSource.camera,
      PhotoPickAction.gallery => ImageSource.gallery,
    };
    final file = await ImagePicker().pickImage(
      source: source,
      imageQuality: 85,
      maxWidth: 1920,
    );
    if (!context.mounted || file == null) return;

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          action == PhotoPickAction.takePhoto
              ? 'Photo captured'
              : 'Photo selected',
        ),
        behavior: SnackBarBehavior.floating,
        duration: const Duration(seconds: 1),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: AppPageScaffold(
        title: 'My Picture',
        backgroundColor: Colors.black,
        trailing: IconButton(
          onPressed: () => _showMoreSheet(context),
          icon: const Icon(
            Icons.more_horiz,
            color: Colors.white,
            size: 26,
          ),
        ),
        body: Center(
          child: Image.asset(
            avatarAsset,
            width: width,
            height: width,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
