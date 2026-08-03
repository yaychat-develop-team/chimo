import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';

import '../../core/constants/app_assets.dart';
import '../../core/theme/app_colors.dart';
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
      child: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Column(
            children: [
              SizedBox(
                height: 48,
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
                    const Text(
                      'My Picture',
                      style: TextStyle(
                        color: AppColors.textPrimary,
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: IconButton(
                        onPressed: () => _showMoreSheet(context),
                        icon: const Icon(
                          Icons.more_horiz,
                          color: Colors.white,
                          size: 26,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Center(
                  child: Image.asset(
                    avatarAsset,
                    width: width,
                    height: width,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
