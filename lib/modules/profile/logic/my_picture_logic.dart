import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../../app/chimo_api.dart';
import '../../../app/network/http/media_upload.dart';
import '../../../common/utils/media_picker.dart';

/// 头像预览页：本地预览、上传中、已写回的远程地址。
class MyPictureLogic extends GetxController {
  MyPictureLogic({String? avatarUrl}) : avatarUrl = RxnString(avatarUrl);

  final RxnString avatarUrl;
  final RxnString localPath = RxnString();
  final RxBool uploading = false.obs;
  final RxBool changed = false.obs;

  void startUpload(String path) {
    localPath.value = path;
    uploading.value = true;
  }

  void cancelUpload() {
    uploading.value = false;
    localPath.value = null;
  }

  /// 选图、上传并写回头像。取消时返回 `null`。
  ///
  /// 底部弹层要 BuildContext，留在页面；这里只接收相机或相册。
  Future<({bool ok, String message})?> replace({required bool fromCamera}) async {
    if (uploading.value) return null;

    final XFile? file;
    try {
      file = fromCamera ? await MediaPicker.takePhoto() : await MediaPicker.pickImage();
    } catch (_) {
      return (
        ok: false,
        message: fromCamera
            ? 'Camera unavailable. Check app permissions.'
            : 'Gallery unavailable. Check app permissions.',
      );
    }
    if (isClosed || file == null) return null;
    if (file.path.toLowerCase().endsWith('.gif')) {
      return (ok: false, message: 'GIF uploads are not supported');
    }

    startUpload(file.path);
    final remote = await MediaUpload.uploadImage(file.path);
    if (isClosed) return null;
    if (remote == null || remote.isEmpty) {
      cancelUpload();
      return (ok: false, message: 'Avatar upload failed. Try again.');
    }

    final failure = await commit(remote);
    if (failure != null) {
      cancelUpload();
      return (ok: false, message: failure);
    }
    return (ok: true, message: fromCamera ? 'Photo captured' : 'Photo selected');
  }

  /// 返回 `null` 表示头像已写回。
  Future<String?> commit(String remote) async {
    final res = await ChimoApis.user.update({'avatarUrl': remote});
    if (!res.ok) {
      return res.message.isEmpty ? 'Unable to update avatar' : res.message;
    }
    if (isClosed) return null;
    avatarUrl.value = remote;
    localPath.value = null;
    uploading.value = false;
    changed.value = true;
    return null;
  }
}
