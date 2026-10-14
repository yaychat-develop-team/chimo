import 'dart:async';
import 'dart:io';

import 'package:chimo/app/session_info.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../../app/app_jumper.dart';
import '../../../app/chimo_api.dart';
import '../../../app/network/http/media_upload.dart';
import '../../../common/utils/media_picker.dart';
import '../../../common/utils/app_log.dart';
import '../../../common/models/server_client/user.pb.dart';
import '../../../common/utils/time_fmt.dart';

/// 一次「持久化 + 刷新」的结果：[ok] 决定后续分支，[message] 是要提示的文案
/// （成功也有文案，比如 “Update successful.”）。
typedef PersistOutcome = ({bool ok, String message});

/// 保存的结果：[saved] 为 true 表示可以离开页面，[message] 非空需要提示。
typedef SaveOutcome = ({bool saved, String? message});

/// 编辑资料页的状态与持久化。
///
/// 抽出来的理由不是「对称」，是这几段逻辑在 `State` 里测不了：
/// 保存时的字段拼装（`delete*` 只在**曾经加载过**的值被清空时才发）、
/// 完成度百分比、相册 URL 的 CDN key 归一化。
///
/// **不 import material**：需要 `BuildContext` 的事
/// （底部弹层、日期选择器、Toast）留在 View 里，
/// 这里的方法把要提示的文案**返回**给 View。
class EditProfileLogic extends GetxController {
  EditProfileLogic({required this.seed, this.fromOnboarding = false});

  /// `EditProfilePage` 构造参数传进来的首帧资料。
  final User seed;

  /// 邮箱注册引导里进来：保存后回首页而不是 pop。
  final bool fromOnboarding;

  static const int maxPhotos = 9;

  /// 服务端存的是 CDN path（forya `content`），JSON 展示时才拼完整 URL。
  static const _cdnHost = 'https://cdn.echimo.com';

  final Rx<User> profile = User().obs;
  final RxString signature = ''.obs;
  final RxString nickname = ''.obs;
  final RxString gender = ''.obs;
  final RxString birthday = ''.obs;
  final Rx<int?> height = Rx<int?>(null);
  final Rx<int?> weight = Rx<int?>(null);
  final Rx<int?> voiceSeconds = Rx<int?>(null);
  final Rx<String?> voiceUrl = Rx<String?>(null);

  /// 本地待上传的录音路径（保存时才上传）。
  final Rx<String?> pendingVoicePath = Rx<String?>(null);
  final RxList<String> tags = <String>[].obs;
  final RxList<String> photoPaths = <String>[].obs;
  final RxBool nicknameChangedOnce = false.obs;
  final RxBool loading = true.obs;
  final RxBool saving = false.obs;
  final RxBool albumUploading = false.obs;

  /// 从接口加载到的值：决定保存时该不该发 `delete*`。
  int? _loadedHeight;

  /// 正在写资料。聚焦回调里的刷新要等这次写完，否则会用旧资料盖掉刚提交的值。
  int _writes = 0;
  int? _loadedWeight;
  int? _loadedVoiceSeconds;

  int get photoCount => photoPaths.length;

  @override
  void onInit() {
    super.onInit();
    applyProfile(seed);
  }

  /// 页面聚焦（首次进入，或从昵称 / 签名等子页返回）。拉一次最新资料。
  void onPageFocused() {
    if (_writes > 0) return;
    unawaited(loadFromApi());
  }

  void applyProfile(User p) {
    profile.value = p;
    signature.value = p.personalSignature;
    nickname.value = p.nickname;
    gender.value = p.gender;
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
        if (_isStoredPic(item.content)) item.content,
    ]);
    AppLog.d('EditProfile picList=${photoPaths.length} $photoPaths');
  }

  bool _isStoredPic(String url) {
    final t = url.trim();
    return t.startsWith('http://') || t.startsWith('https://') || t.startsWith('/');
  }

  /// 相册图还在审核中（`picList.ok == false`）时不能删。
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
    } catch (_) {
      // 刷新失败就保留首帧那份资料。
    } finally {
      loading.value = false;
    }
  }

  /// 回传给上一页的资料（`AppJumper.back(result:)`）。
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

  /// 资料完成度（0–100），给顶部进度用。
  int get completionPercent {
    var filled = 0;
    const total = 10;
    // 本地头像占位始终算一项，和以前非空的 avatarAsset 一样。
    filled++;
    if (photoCount > 0) filled++;
    if (signature.value.trim().isNotEmpty) filled++;
    if ((voiceSeconds.value ?? 0) > 0) filled++;
    if (tags.isNotEmpty) filled++;
    if (nickname.value.trim().isNotEmpty) filled++;
    if (gender.value.trim().isNotEmpty) filled++;
    if (birthday.value.trim().isNotEmpty) filled++;
    if (height.value != null) filled++;
    if (weight.value != null) filled++;
    return ((filled / total) * 100).round().clamp(0, 100);
  }

  /// 保存时发给 `/user/info` 的字段。
  ///
  /// 两条容易写错、也是单测的重点：
  /// 1. **性别 / 生日为空就不发** —— 发了会把默认值（Male / 1995）写进服务端；
  /// 2. **`delete*` 只在「曾经从接口加载到值、现在被清空」时才发** ——
  ///    从来没设置过的字段不该发删除。
  ///
  /// 语音是唯一需要先上传的字段，所以不在这里拼（见 [save]）。
  Map<String, dynamic> buildSaveFields() {
    final fields = <String, dynamic>{
      'nickname': nickname.value.trim(),
      'personalSignature': signature.value.trim(),
    };
    final genderTrim = gender.value.trim();
    if (genderTrim.isNotEmpty) {
      fields['gender'] = genderTrim.toLowerCase() == 'female' ? 'female' : 'male';
    }
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

  /// 顶部「Save」。[SaveOutcome.saved] 为 true 时由 View 负责离开页面
  /// （引导流程要回首页、普通流程要带结果 pop，那都需要 `BuildContext`）。
  Future<SaveOutcome> save() async {
    if (saving.value) return (saved: false, message: null);
    final nick = nickname.value.trim();
    if (fromOnboarding && nick.contains('@')) {
      // 引导流程允许资料不全，但昵称不能还是邮箱占位。
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

  /// 把语音塞进 [fields]；本地录音先上传。返回错误文案，`null` 表示成功。
  Future<String?> _attachVoice(Map<String, dynamic> fields) async {
    var voice = (voiceUrl.value ?? '').trim();
    final pending = (pendingVoicePath.value ?? '').trim();
    if (pending.isNotEmpty && !pending.startsWith('http://') && !pending.startsWith('https://')) {
      final uploaded = await MediaUpload.uploadVoice(pending);
      if (uploaded == null || uploaded.isEmpty) return 'Voice upload failed';
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

  /// forya 的做法：子页面立刻写 `/user/info`，回来再刷一次。
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

  // 子页面往返
  //
  // 「跳过去 → 拿回传 → 写接口 → 刷新」全程不需要 context，
  // 只有最后那句提示要 View 来做，所以统一返回 PersistOutcome：
  // null = 用户取消、什么都没发生；ok 决定提示时长。

  Future<PersistOutcome?> openSignature() async {
    final result = await AppJumper.toEditSignature(initialText: signature.value);
    // 签名页会先写完接口再返回，这里只把结果交给页面提示。
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
    final local = result.path.trim();
    if (local.isEmpty) return null;
    final uploaded = await MediaUpload.uploadVoice(local);
    if (uploaded == null || uploaded.isEmpty) {
      return (ok: false, message: 'Voice upload failed');
    }
    return persistFields({'voice': uploaded, 'voiceDuration': result.seconds});
  }

  Future<PersistOutcome?> deleteVoiceNote() async {
    if (voiceSeconds.value == null && (voiceUrl.value ?? '').trim().isEmpty) {
      return null;
    }
    return persistFields({'deleteVoice': true}, successMessage: 'Deleted');
  }

  /// 标签页自己就把选择写进去了。返回后页面重新聚焦，由 [onPageFocused] 刷新。
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

  /// 性别由 View 的底部弹层选好后交进来。
  Future<PersistOutcome?> applyGender(String picked) async {
    final normalized = picked.trim().toLowerCase() == 'female' ? 'female' : 'male';
    return persistFields({'gender': normalized});
  }

  /// 生日同理（View 用 CupertinoDatePicker 选）。
  Future<PersistOutcome?> applyBirthday(DateTime picked) async {
    return persistFields({'birthday': TimeFmt.isoDate(picked)});
  }

  /// 头像页回传新的远程 url（`MyPicturePage` 只在换过时回传）。
  void applyAvatar(String url) {
    profile.value = profile.value.deepCopy()..avatarAudit = url;
  }

  // ---------------------------------------------------------------- 相册
  //
  // 底部弹层留在 View。挑图、落盘、上传、写接口在这里。

  /// 选图并写入相册。取消时返回 `null`。
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
    if (isClosed || file == null) return null;
    if (file.path.toLowerCase().endsWith('.gif')) {
      return (ok: false, message: 'GIF uploads are not supported');
    }

    final localPath = await persistPickedPhoto(file);
    if (localPath == null) {
      return (ok: false, message: 'Could not read this photo. Try another one.');
    }
    return uploadAlbumPhoto(localPath);
  }

  /// 选中的图先落进沙盒再上传（iOS PHPicker 临时文件会失效，
  /// 原因见 [MediaPicker.persistToSandbox]）。
  Future<String?> persistPickedPhoto(XFile file) =>
      MediaPicker.persistToSandbox(file, folder: 'album_photos');

  Future<void> deleteLocalFile(String path) async {
    if (path.startsWith('http://') || path.startsWith('https://')) return;
    try {
      final file = File(path);
      if (await file.exists()) await file.delete();
    } catch (_) {
      // 临时文件删不掉不影响功能（系统会回收沙盒临时目录）。
    }
  }

  /// 上传一张相册图并写进 `newPic`。返回要提示的文案（成功也有）。
  Future<PersistOutcome?> uploadAlbumPhoto(String localPath) async {
    if (photoCount >= maxPhotos || albumUploading.value) return null;
    albumUploading.value = true;
    try {
      final remote = await MediaUpload.uploadImage(localPath);
      if (remote == null || remote.isEmpty) {
        return (ok: false, message: 'Photo upload failed');
      }
      final res = await ChimoApis.user.update({
        'newPic': [remote],
      });
      if (!res.ok) {
        return (ok: false, message: res.message.isEmpty ? 'Save photo failed' : res.message);
      }
      if (!photoPaths.contains(remote)) photoPaths.add(remote);
      await loadFromApi();
      return (ok: true, message: 'Photo saved');
    } catch (error) {
      return (ok: false, message: 'Photo upload failed: $error');
    } finally {
      await deleteLocalFile(localPath);
      albumUploading.value = false;
    }
  }

  /// 相册 URL → 服务端存的 key（去掉 CDN 域名，保证以 `/` 开头）。
  String albumStoredKey(String url) {
    var text = url.trim();
    if (text.startsWith(_cdnHost)) {
      text = text.substring(_cdnHost.length);
    } else {
      try {
        final uri = Uri.parse(text);
        if (uri.hasScheme && uri.host.isNotEmpty) text = uri.path;
      } catch (_) {
        // 不是合法 URI（服务端偶尔给相对 key）：按原样当 key 用。
      }
    }
    if (text.isEmpty) return url.trim();
    return text.startsWith('/') ? text : '/$text';
  }

  /// 删相册图。服务端对 key 的形态很挑，所以几种写法轮着试
  /// （原样 URL / 换域名 / 存储 key / 去掉开头的 `/`），每种再试
  /// `delPic` 收数组和收字符串两版。返回要提示的文案。
  Future<PersistOutcome?> removeAlbumPhoto(int index) async {
    if (index < 0 || index >= photoPaths.length || albumUploading.value) {
      return null;
    }
    final path = photoPaths[index];
    // 审核中的图删不掉，服务端会拒。
    if (photoUnderReview(path)) return null;
    if (!path.startsWith('http') && !path.startsWith('/')) {
      photoPaths.removeAt(index);
      await deleteLocalFile(path);
      return null;
    }

    final swapped = path
        .trim()
        .replaceFirst('https://cdn.echimo.com', 'https://cdn.oumiapp.com')
        .replaceFirst('http://cdn.echimo.com', 'http://cdn.oumiapp.com');
    final stored = albumStoredKey(path);
    final keys = <String>{
      path.trim(),
      swapped,
      stored,
      stored.startsWith('/') ? stored.substring(1) : stored,
    }.where((e) => e.isNotEmpty).toList();

    albumUploading.value = true;
    try {
      for (final key in keys) {
        AppLog.d('Album delPic try=$key');
        for (final fields in [
          {
            'delPic': <String>[key],
          },
          {'delPic': key},
        ]) {
          final res = await ChimoApis.user.update(fields);
          if (!res.ok) continue;
          await loadFromApi();
          final still = photoPaths.any(
            (url) => url == path || albumStoredKey(url) == albumStoredKey(path) || url == key,
          );
          if (!still) return null;
        }
      }
      final pending = photoUnderReview(path);
      AppLog.w('Album delete still on server: $path pending=$pending keys=$keys');
      return (
        ok: false,
        message: pending
            ? 'This photo is still under review and cannot be deleted yet.'
            : 'Delete failed',
      );
    } catch (error) {
      return (ok: false, message: 'Delete failed: $error');
    } finally {
      albumUploading.value = false;
    }
  }
}
