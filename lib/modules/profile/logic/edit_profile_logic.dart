import 'dart:io';

import 'package:chimo/app/session_info.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../../app/app_jumper.dart';
import '../../../app/chimo_api.dart';
import '../../../app/network/http/media_upload.dart';
import '../../../common/extensions/wire_view.dart';
import '../../../common/utils/media_picker.dart';
import '../../../common/utils/app_log.dart';
import '../../../common/models/server_client/user.pb.dart';
import '../../../common/utils/time_fmt.dart';
import '../../../common/utils/zodiac.dart';

/// 一次「持久化 + 刷新」的结果。
typedef PersistOutcome = ({bool ok, String message});

/// 保存的结果：[saved] 为 true 时由 View 离开页面。
typedef SaveOutcome = ({bool saved, String? message});

/// 编辑资料。对齐 joyride `MinePageEditModel`：改一项就写接口再刷新，不堆本地缓存分支。
class EditProfileLogic extends GetxController {
  EditProfileLogic({this.fromOnboarding = false});

  final bool fromOnboarding;

  static const int maxPhotos = 9;

  final Rx<User> profile = User().obs;
  final RxString signature = ''.obs;
  final RxString nickname = ''.obs;
  final RxString gender = ''.obs;
  final RxString birthday = ''.obs;
  final Rx<int?> height = Rx<int?>(null);
  final Rx<int?> weight = Rx<int?>(null);
  final Rx<int?> voiceSeconds = Rx<int?>(null);
  final Rx<String?> voiceUrl = Rx<String?>(null);
  final Rx<String?> pendingVoicePath = Rx<String?>(null);
  final RxList<String> tags = <String>[].obs;
  final RxList<String> photoPaths = <String>[].obs;
  final RxBool nicknameChangedOnce = false.obs;
  final RxBool loading = true.obs;
  final RxBool saving = false.obs;
  final RxBool albumUploading = false.obs;

  int? _loadedHeight;
  int? _loadedWeight;
  int? _loadedVoiceSeconds;

  /// 写接口中：聚焦刷新让路，避免旧资料盖掉刚提交的值。
  int _writes = 0;
  bool _entered = false;

  int get photoCount => photoPaths.length;

  String get genderLabel => genderDisplayLabel(gender.value);

  /// 生日选择器用的初始日期。
  DateTime get birthdayInitial {
    final parsed = Zodiac.parseBirthday(birthday.value) ?? DateTime(1995, 1, 1);
    final now = DateTime.now();
    return parsed.isAfter(now) ? now : parsed;
  }

  @override
  void onInit() {
    super.onInit();
    loadFromApi();
  }

  void onPageFocused() {
    if (_writes > 0) return;
    if (!_entered) {
      _entered = true;
      return;
    }
    loadFromApi();
  }

  void applyProfile(User p) {
    profile.value = p;
    signature.value = p.personalSignature;
    nickname.value = p.nickname;
    gender.value = normalizeGender(p.gender) ?? '';
    birthday.value = p.birthday;
    height.value = p.height > 0 ? p.height : null;
    weight.value = p.weight > 0 ? p.weight : null;
    voiceSeconds.value = p.voiceDuration > 0 ? p.voiceDuration : null;
    voiceUrl.value = p.voice.trim().isEmpty ? null : p.voice;
    pendingVoicePath.value = null;
    _loadedHeight = height.value;
    _loadedWeight = weight.value;
    _loadedVoiceSeconds = voiceSeconds.value;
    tags.assignAll(p.makeFriendsLabel);
    nicknameChangedOnce.value = false;
    photoPaths.assignAll([
      for (final item in p.picList)
        if (item.content.trim().isNotEmpty) item.content,
    ]);
  }

  bool photoUnderReview(String path) {
    for (final item in profile.value.picList) {
      if (item.content == path) return !item.ok;
    }
    return false;
  }

  Future<void> loadFromApi() async {
    try {
      final res = await ChimoApis.user.profile();
      final parsed = res.data?.user;
      if (parsed != null) applyProfile(parsed);
    } catch (e) {
      AppLog.w('EditProfile load failed: $e');
    } finally {
      loading.value = false;
    }
  }

  User buildResult() {
    final next = profile.value.deepCopy()
      ..nickname = nickname.value
      ..gender = gender.value
      ..birthday = birthday.value
      ..personalSignature = signature.value
      ..height = height.value ?? 0
      ..weight = weight.value ?? 0
      ..voice = voiceSeconds.value == null ? '' : (voiceUrl.value ?? '')
      ..voiceDuration = voiceSeconds.value ?? 0;
    next.makeFriendsLabel
      ..clear()
      ..addAll(tags);
    next.picList
      ..clear()
      ..addAll([
        for (final path in photoPaths) AuditItem(content: path, ok: !photoUnderReview(path)),
      ]);
    return next;
  }

  int get completionPercent {
    var filled = 1; // 头像位始终计 1
    const total = 10;
    if (photoCount > 0) filled++;
    if (signature.value.trim().isNotEmpty) filled++;
    if ((voiceSeconds.value ?? 0) > 0) filled++;
    if (tags.isNotEmpty) filled++;
    if (nickname.value.trim().isNotEmpty) filled++;
    if (gender.value.isNotEmpty) filled++;
    if (birthday.value.trim().isNotEmpty) filled++;
    if (height.value != null) filled++;
    if (weight.value != null) filled++;
    return ((filled / total) * 100).round().clamp(0, 100);
  }

  Map<String, dynamic> buildSaveFields() {
    final fields = <String, dynamic>{
      'nickname': nickname.value.trim(),
      'personalSignature': signature.value.trim(),
    };
    final genderNorm = normalizeGender(gender.value);
    if (genderNorm != null) fields['gender'] = genderNorm;
    final birthdayTrim = birthday.value.trim();
    if (birthdayTrim.isNotEmpty) fields['birthday'] = birthdayTrim;
    if (fromOnboarding) fields['register'] = true;

    if (height.value != null) {
      fields['height'] = height.value;
    } else if (_loadedHeight != null) {
      fields['deleteHeight'] = true;
    }
    if (weight.value != null) {
      fields['weight'] = weight.value;
    } else if (_loadedWeight != null) {
      fields['deleteWeight'] = true;
    }
    if (voiceSeconds.value == null && _loadedVoiceSeconds != null) {
      fields['deleteVoice'] = true;
    }
    return fields;
  }

  Future<SaveOutcome> save() async {
    if (saving.value) return (saved: false, message: null);
    if (fromOnboarding && nickname.value.trim().contains('@')) {
      return (saved: false, message: 'Please set a nickname (not your email)');
    }
    saving.value = true;
    try {
      final fields = buildSaveFields();
      if (voiceSeconds.value != null) {
        final message = await _attachVoice(fields);
        if (message != null) return (saved: false, message: message);
      }
      final res = await ChimoApis.user.update(fields);
      if (!res.ok) {
        return (saved: false, message: res.message.isEmpty ? 'Save failed' : res.message);
      }
      SessionInfo.refreshUserInfo();
      return (saved: true, message: null);
    } catch (error) {
      return (saved: false, message: 'Save failed: $error');
    } finally {
      saving.value = false;
    }
  }

  Future<String?> _attachVoice(Map<String, dynamic> fields) async {
    var voice = (voiceUrl.value ?? '').trim();
    final pending = (pendingVoicePath.value ?? '').trim();
    if (pending.isNotEmpty && !pending.startsWith('http')) {
      final uploaded = await MediaUpload.uploadVoice(pending);
      if (uploaded == null) return 'Voice upload failed';
      voice = uploaded;
      voiceUrl.value = uploaded;
      pendingVoicePath.value = null;
    }
    if (voice.isNotEmpty) {
      fields['voice'] = voice;
      fields['voiceDuration'] = voiceSeconds.value;
    }
    return null;
  }

  /// 对齐 joyride：写接口 → 刷新用户。
  Future<PersistOutcome> persistFields(
    Map<String, dynamic> fields, {
    String successMessage = 'Update successful.',
  }) async {
    _writes++;
    try {
      final res = await ChimoApis.user.update(fields);
      if (!res.ok) {
        return (ok: false, message: res.message.isEmpty ? 'Update failed' : res.message);
      }
      await loadFromApi();
      return (ok: true, message: successMessage);
    } catch (error) {
      return (ok: false, message: 'Update failed: $error');
    } finally {
      _writes--;
    }
  }

  Future<PersistOutcome?> openSignature() async {
    final result = await AppJumper.toEditSignature(initialText: signature.value);
    if (result is PersistOutcome) return result;
    return null;
  }

  Future<PersistOutcome?> openNickname() async {
    final result = await AppJumper.toEditNickname(
      initialText: nickname.value,
      showRules: nicknameChangedOnce.value,
    );
    if (result == null) return null;
    final nick = result.trim();
    if (nick.isEmpty) return null;
    final previous = nickname.value;
    final outcome = await persistFields({'nickname': nick});
    if (outcome.ok && nick != previous) nicknameChangedOnce.value = true;
    return outcome;
  }

  Future<PersistOutcome?> openVoiceNote() async {
    final result = await AppJumper.toEditVoiceNote();
    if (result == null || result.seconds <= 0) return null;
    final uploaded = await MediaUpload.uploadVoice(result.path);
    if (uploaded == null) return (ok: false, message: 'Voice upload failed');
    return persistFields({'voice': uploaded, 'voiceDuration': result.seconds});
  }

  Future<PersistOutcome?> deleteVoiceNote() async {
    return persistFields({'deleteVoice': true}, successMessage: 'Deleted');
  }

  Future<PersistOutcome?> openTags() async {
    await AppJumper.toEditTags(initialSelected: tags.toList());
    return null;
  }

  Future<PersistOutcome?> openHeight() async {
    final result = await AppJumper.toEditBodyMetric(
      title: 'Height',
      unit: 'Inch',
      hint: 'Enter height',
      min: 50,
      max: 100,
      initialValue: height.value,
    );
    if (result == null) return null;
    return persistFields({'height': result});
  }

  Future<PersistOutcome?> openWeight() async {
    final result = await AppJumper.toEditBodyMetric(
      title: 'Weight',
      unit: 'LB',
      hint: 'Enter weight',
      min: 80,
      max: 330,
      initialValue: weight.value,
    );
    if (result == null) return null;
    return persistFields({'weight': result});
  }

  Future<PersistOutcome?> applyGender(String picked) async {
    final normalized = normalizeGender(picked);
    if (normalized == null) return null;
    return persistFields({'gender': normalized});
  }

  Future<PersistOutcome?> applyBirthday(DateTime picked) async {
    return persistFields({'birthday': TimeFmt.isoDate(picked)});
  }

  /// 头像页只回传新 url；对齐 joyride 在 PortraitPage 内写接口。
  Future<void> openAvatar({required String avatarAsset}) async {
    final url = await AppJumper.toEditPicture(
      avatarAsset: avatarAsset,
      avatarUrl: profile.value.shownAvatar,
    );
    if (url == null || url.isEmpty) return;
    applyAvatar(url);
  }

  void applyAvatar(String url) {
    profile.value = profile.value.deepCopy()..avatarAudit = url;
  }

  /// 对齐 joyride `savePicture`：选图 → 上传 → `newPic` → 刷新。
  Future<PersistOutcome?> pickAlbumPhoto({required bool fromCamera}) async {
    if (photoCount >= maxPhotos || albumUploading.value) return null;

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
    if (file == null) return null;
    if (file.path.toLowerCase().endsWith('.gif')) {
      return (ok: false, message: 'GIF uploads are not supported');
    }

    final localPath = await MediaPicker.persistToSandbox(file, folder: 'album_photos');
    if (localPath == null) {
      return (ok: false, message: 'Could not read this photo. Try another one.');
    }
    return uploadAlbumPhoto(localPath);
  }

  Future<PersistOutcome?> uploadAlbumPhoto(String localPath) async {
    albumUploading.value = true;
    try {
      final remote = await MediaUpload.uploadImage(localPath);
      if (remote == null) return (ok: false, message: 'Photo upload failed');
      final res = await ChimoApis.user.update({
        'newPic': [remote],
      });
      if (!res.ok) {
        return (ok: false, message: res.message.isEmpty ? 'Save photo failed' : res.message);
      }
      await loadFromApi();
      return (ok: true, message: 'Photo saved');
    } catch (error) {
      return (ok: false, message: 'Photo upload failed: $error');
    } finally {
      try {
        if (!localPath.startsWith('http')) await File(localPath).delete();
      } catch (_) {}
      albumUploading.value = false;
    }
  }

  /// 对齐 joyride `delPicture`：`delPic` 传当前列表里的 path，一次即可。
  Future<PersistOutcome?> removeAlbumPhoto(int index) async {
    if (index < 0 || index >= photoPaths.length || albumUploading.value) return null;
    final path = photoPaths[index];
    if (photoUnderReview(path)) return null;

    if (!path.startsWith('http') && !path.startsWith('/')) {
      photoPaths.removeAt(index);
      return null;
    }

    albumUploading.value = true;
    try {
      final res = await ChimoApis.user.update({
        'delPic': [path],
      });
      if (!res.ok) {
        return (ok: false, message: res.message.isEmpty ? 'Delete failed' : res.message);
      }
      await loadFromApi();
      return null;
    } catch (error) {
      return (ok: false, message: 'Delete failed: $error');
    } finally {
      albumUploading.value = false;
    }
  }
}
