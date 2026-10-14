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
/// 昵称输入框留在页面。相册 / 相机需要 BuildContext，选图也留在页面，
/// 选完把本地路径交给 [startUpload]。
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
    final failure = await saveProfile(
      nickname: nickname,
      gender: OnboardingState.gender,
      birthday: OnboardingState.birthday,
    );
    if (isClosed) return;
    if (failure != null) {
      AppToast.error(failure);
      return;
    }
    OnboardingState.clearDraft();
    AppJumper.toWelcome();
    idle();
  }

  Future<void> uploadAvatar({required bool fromCamera}) async {
    final message = await pickAndUpload(fromCamera: fromCamera);
    if (isClosed || message == null) return;
    AppToast.error(message);
  }

  void startUpload(String path) {
    localAvatarPath.value = path;
    uploadingAvatar.value = true;
  }

  void cancelUpload() {
    uploadingAvatar.value = false;
    localAvatarPath.value = null;
  }

  /// 选图、上传并写入头像。取消时返回 `null`，失败返回提示文案。
  Future<String?> pickAndUpload({required bool fromCamera}) async {
    if (busy) return null;

    final XFile? file;
    try {
      file = fromCamera ? await MediaPicker.takePhoto() : await MediaPicker.pickImage();
    } catch (_) {
      return fromCamera
          ? 'Camera unavailable. Check app permissions.'
          : 'Gallery unavailable. Check app permissions.';
    }
    if (isClosed || file == null) return null;
    if (file.path.toLowerCase().endsWith('.gif')) {
      return 'GIF uploads are not supported';
    }

    startUpload(file.path);
    final remote = await MediaUpload.uploadImage(file.path);
    if (isClosed) return null;
    if (remote == null || remote.isEmpty) {
      cancelUpload();
      return 'Avatar upload failed. Try again.';
    }

    final failure = await commitAvatar(remote);
    if (failure != null) cancelUpload();
    return failure;
  }

  /// 返回 `null` 表示头像已写入。
  Future<String?> commitAvatar(String remote) async {
    final res = await ChimoApis.user.update({'avatarUrl': remote, 'register': true});
    if (!res.ok) {
      return res.message.isEmpty ? 'Unable to update avatar' : res.message;
    }
    if (isClosed) return null;
    remoteAvatarUrl.value = remote;
    localAvatarPath.value = null;
    uploadingAvatar.value = false;
    return null;
  }

  /// 返回 `null` 表示资料已写入。成功时 [submitting] 保持 true，等页面跳走再 [idle]。
  Future<String?> saveProfile({
    required String nickname,
    required String gender,
    required String birthday,
  }) async {
    if (submitting.value) return null;
    final nick = nickname.trim();
    if (nick.isEmpty) return 'Please enter a nickname';
    if (nick.contains('@')) return 'Please choose a nickname (not your email)';
    if (uploadingAvatar.value) return 'Avatar is still uploading…';

    submitting.value = true;
    try {
      final avatar = (remoteAvatarUrl.value ?? '').trim();
      final genderValue = gender.trim();
      final birthdayValue = birthday.trim();
      final fields = <String, dynamic>{'nickname': nick, 'register': true};
      if (genderValue.isNotEmpty) fields['gender'] = genderValue;
      if (birthdayValue.isNotEmpty) fields['birthday'] = birthdayValue;
      if (avatar.isNotEmpty) fields['avatarUrl'] = avatar;

      final res = await ChimoApis.user.update(fields);
      if (!res.ok) {
        idle();
        return res.message.isEmpty ? 'Unable to update profile' : res.message;
      }
      SessionInfo.refreshUserInfo();
      return null;
    } catch (error) {
      idle();
      return 'Unable to update profile: $error';
    }
  }

  void idle() {
    if (!isClosed) submitting.value = false;
  }
}
