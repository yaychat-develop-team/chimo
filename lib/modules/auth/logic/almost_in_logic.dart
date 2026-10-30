import 'dart:math';

import 'package:chimo/app/session_info.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../../app/app_jumper.dart';
import '../../../app/auth/onboarding_state.dart';
import '../../../app/chimo_api.dart';
import '../../../app/network/http/media_upload.dart';
import '../../../common/utils/app_toast.dart';
import '../../../common/utils/media_picker.dart';

/// 引导收尾：头像、上传中、提交中。
///
/// 昵称输入框留在页面。相册 / 相机需要 BuildContext，选图也留在页面。
class AlmostInLogic extends GetxController {
  final RxnString localAvatarPath = RxnString();
  final RxnString remoteAvatarUrl = RxnString();
  final RxBool submitting = false.obs;
  final RxBool uploadingAvatar = false.obs;

  /// 邮箱占位名不拿来预填。
  late final String? savedNickname = _readNickname();

  /// 输入框初值：已有昵称，否则随机占位。
  late final String draftNickname =
      savedNickname ?? 'S·${1000000 + Random().nextInt(9000000)}';

  static String? _readNickname() {
    return SessionInfo.currentUser?.nickname;
  }

  bool get busy => submitting.value || uploadingAvatar.value;

  void skip() {
    if (busy) return;
    OnboardingState.clearDraft();
    AppJumper.toWelcome();
  }

  Future<void> letsGo(String nickname) async {
    if (submitting.value) return;
    final nick = nickname.trim();
    if (nick.isEmpty) {
      AppToast.error('Please enter a nickname');
      return;
    }
    if (nick.contains('@')) {
      AppToast.error('Please choose a nickname (not your email)');
      return;
    }
    if (uploadingAvatar.value) {
      AppToast.error('Avatar is still uploading…');
      return;
    }

    submitting.value = true;
    try {
      final avatar = (remoteAvatarUrl.value ?? '').trim();
      final genderValue = OnboardingState.gender.trim();
      final birthdayValue = OnboardingState.birthday.trim();
      final fields = <String, dynamic>{'nickname': nick, 'register': true};
      if (genderValue.isNotEmpty) fields['gender'] = genderValue;
      if (birthdayValue.isNotEmpty) fields['birthday'] = birthdayValue;
      if (avatar.isNotEmpty) fields['avatarUrl'] = avatar;

      final res = await ChimoApis.user.update(fields);
      if (!res.ok) {
        submitting.value = false;
        AppToast.error(res.message.isEmpty ? 'Unable to update profile' : res.message);
        return;
      }
      SessionInfo.refreshUserInfo();
      OnboardingState.clearDraft();
      AppJumper.toWelcome();
      submitting.value = false;
    } catch (error) {
      submitting.value = false;
      AppToast.error('Unable to update profile: $error');
    }
  }

  Future<void> uploadAvatar({required bool fromCamera}) async {
    if (busy) return;

    final XFile? file;
    try {
      file = fromCamera ? await MediaPicker.takePhoto() : await MediaPicker.pickImage();
    } catch (_) {
      AppToast.error(
        fromCamera
            ? 'Camera unavailable. Check app permissions.'
            : 'Gallery unavailable. Check app permissions.',
      );
      return;
    }
    if (file == null) return;
    if (file.path.toLowerCase().endsWith('.gif')) {
      AppToast.error('GIF uploads are not supported');
      return;
    }

    localAvatarPath.value = file.path;
    uploadingAvatar.value = true;
    final remote = await MediaUpload.uploadImage(file.path);
    if (remote == null || remote.isEmpty) {
      uploadingAvatar.value = false;
      localAvatarPath.value = null;
      AppToast.error('Avatar upload failed. Try again.');
      return;
    }

    final res = await ChimoApis.user.update({'avatarUrl': remote, 'register': true});
    if (!res.ok) {
      uploadingAvatar.value = false;
      localAvatarPath.value = null;
      AppToast.error(res.message.isEmpty ? 'Unable to update avatar' : res.message);
      return;
    }
    remoteAvatarUrl.value = remote;
    localAvatarPath.value = null;
    uploadingAvatar.value = false;
  }
}
