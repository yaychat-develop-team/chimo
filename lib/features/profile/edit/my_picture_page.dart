import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

import '../../../core/auth/auth_session.dart';
import '../../../core/network/app_apis.dart';
import '../../../core/network/media_upload.dart';
import '../../../core/widgets/app_page_scaffold.dart';
import 'photo_pick_sheet.dart';

/// 全尺寸头像预览 / 更换页。
///
/// 头像已更换时 pop 新的远程 [avatarUrl]；否则 pop `null`。
class MyPicturePage extends StatefulWidget {
  const MyPicturePage({
    super.key,
    required this.avatarAsset,
    this.avatarUrl,
  });

  final String avatarAsset;
  final String? avatarUrl;

  @override
  State<MyPicturePage> createState() => _MyPicturePageState();
}

class _MyPicturePageState extends State<MyPicturePage> {
  late String? _avatarUrl = widget.avatarUrl;
  String? _localPath;
  bool _uploading = false;
  bool _changed = false;

  void _pop([String? result]) {
    Navigator.of(context).pop(result);
  }

  Future<void> _showMoreSheet() async {
    if (_uploading) return;
    final action = await showPhotoPickSheet(context);
    if (!mounted || action == null) return;

    final source = switch (action) {
      PhotoPickAction.takePhoto => ImageSource.camera,
      PhotoPickAction.gallery => ImageSource.gallery,
    };

    XFile? file;
    try {
      file = await ImagePicker().pickImage(
        source: source,
        imageQuality: 85,
        maxWidth: 1920,
      );
    } catch (_) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            source == ImageSource.camera
                ? 'Camera unavailable. Check app permissions.'
                : 'Gallery unavailable. Check app permissions.',
          ),
          behavior: SnackBarBehavior.floating,
        ),
      );
      return;
    }
    if (!mounted || file == null) return;

    if (file.path.toLowerCase().endsWith('.gif')) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('GIF uploads are not supported'),
          behavior: SnackBarBehavior.floating,
        ),
      );
      return;
    }

    setState(() {
      _localPath = file!.path;
      _uploading = true;
    });

    final remote = await MediaUpload.uploadFile(file.path);
    if (!mounted) return;

    if (remote == null || remote.isEmpty) {
      setState(() {
        _uploading = false;
        _localPath = null;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Avatar upload failed. Try again.'),
          behavior: SnackBarBehavior.floating,
        ),
      );
      return;
    }

    final res = await AppApis.user.update({'avatarUrl': remote});
    if (!mounted) return;

    if (!res.ok) {
      setState(() {
        _uploading = false;
        _localPath = null;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            res.message.isEmpty ? 'Unable to update avatar' : res.message,
          ),
          behavior: SnackBarBehavior.floating,
        ),
      );
      return;
    }

    await AuthSession.markLoggedIn(avatarUrl: remote);
    if (!mounted) return;

    setState(() {
      _avatarUrl = remote;
      _localPath = null;
      _uploading = false;
      _changed = true;
    });

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

  Widget _buildImage(double size) {
    final local = _localPath;
    if (local != null && local.isNotEmpty) {
      return Image.file(
        File(local),
        width: size,
        height: size,
        fit: BoxFit.cover,
      );
    }
    final remote = (_avatarUrl ?? '').trim();
    if (remote.isNotEmpty) {
      return Image.network(
        remote,
        width: size,
        height: size,
        fit: BoxFit.cover,
        errorBuilder: (_, error, stackTrace) => Image.asset(
          widget.avatarAsset,
          width: size,
          height: size,
          fit: BoxFit.cover,
        ),
      );
    }
    return Image.asset(
      widget.avatarAsset,
      width: size,
      height: size,
      fit: BoxFit.cover,
    );
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;

    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, _) {
        if (didPop) return;
        _pop(_changed ? _avatarUrl : null);
      },
      child: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: AppPageScaffold(
          title: 'My Picture',
          backgroundColor: Colors.black,
          loading: _uploading,
          onBack: () => _pop(_changed ? _avatarUrl : null),
          trailing: IconButton(
            onPressed: _uploading ? null : _showMoreSheet,
            icon: Icon(
              Icons.more_horiz,
              color: _uploading ? Colors.white38 : Colors.white,
              size: 26,
            ),
          ),
          body: Center(
            child: SizedBox(
              width: width,
              height: width,
              child: Stack(
                fit: StackFit.expand,
                children: [
                  _buildImage(width),
                  if (_uploading)
                    const ColoredBox(
                      color: Color(0x66000000),
                      child: Center(
                        child: CircularProgressIndicator(color: Colors.white),
                      ),
                    ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
