import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../logic/my_picture_logic.dart';
import '../../../common/widgets/app_scaffold.dart';
import 'widgets/photo_pick_sheet.dart';
import '../../../common/theme/app_colors.dart';
import '../../../common/widgets/app_image.dart';
import '../../../app/app_jumper.dart';
import '../../../common/utils/app_toast.dart';

/// 全尺寸头像预览 / 更换页。
///
/// 头像已更换时 pop 新的远程 [avatarUrl]；否则 pop `null`。
class MyPicturePage extends StatefulWidget {
  const MyPicturePage({super.key, required this.avatarAsset, this.avatarUrl});

  final String avatarAsset;
  final String? avatarUrl;

  @override
  State<MyPicturePage> createState() => _MyPicturePageState();
}

class _MyPicturePageState extends State<MyPicturePage> {
  late final MyPictureLogic logic;

  String? get _avatarUrl => logic.avatarUrl.value;
  String? get _localPath => logic.localPath.value;
  bool get _uploading => logic.uploading.value;
  bool get _changed => logic.changed.value;

  @override
  void initState() {
    super.initState();
    logic = Get.put(MyPictureLogic(avatarUrl: widget.avatarUrl));
  }

  @override
  void dispose() {
    Get.delete<MyPictureLogic>();
    super.dispose();
  }

  void _pop([String? result]) {
    AppJumper.back(result: result);
  }

  Future<void> _showMoreSheet() async {
    final action = await showPhotoPickSheet(context);
    if (!mounted || action == null) return;
    final result = await logic.replace(fromCamera: action == PhotoPickAction.takePhoto);
    if (!mounted || result == null) return;
    if (result.ok) {
      AppToast.success(result.message);
    } else {
      AppToast.error(result.message);
    }
  }

  Widget _buildImage(double size) {
    final local = _localPath;
    if (local != null && local.isNotEmpty) {
      return AppImage.file(local, width: size, height: size, fit: BoxFit.cover);
    }
    final remote = (_avatarUrl ?? '').trim();
    if (remote.isNotEmpty) {
      return AppImage(
        remote,
        width: size,
        height: size,
        fit: BoxFit.cover,
        error: AppImage(widget.avatarAsset, width: size, height: size, fit: BoxFit.cover),
      );
    }
    return AppImage(widget.avatarAsset, width: size, height: size, fit: BoxFit.cover);
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;

    return Obx(
      () => PopScope(
        canPop: false,
        onPopInvokedWithResult: (didPop, _) {
          if (didPop) return;
          _pop(_changed ? _avatarUrl : null);
        },
        child: ChimoScaffold(
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
                      color: AppColors.scrimBlack40,
                      child: Center(child: CircularProgressIndicator(color: Colors.white)),
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
