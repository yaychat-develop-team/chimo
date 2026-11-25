import 'dart:io';
import 'dart:typed_data';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:photo_manager/photo_manager.dart';

import '../../../app/app_jumper.dart';
import '../../../app/chimo_api.dart';
import '../../../app/network/http/media_upload.dart';
import '../../../app/session_info.dart';
import '../../../common/models/server_client/heart_link.pb.dart';
import '../../../common/utils/app_log.dart';
import '../../../common/utils/app_toast.dart';
import '../../../common/utils/media_picker.dart';
import '../../../common/models/voice_note_result.dart';
import '../page/video_preview_page.dart';

/// Reveal Card 编辑。对齐 joyride `EditSecretCardController`。
class EditRevealCardLogic extends GetxController {
  final loading = true.obs;
  final busy = false.obs;
  final video = Rxn<MediaItem>();
  final photos = <MediaItem?>[null, null].obs;
  final audio = Rxn<MediaItem>();
  final emotionalState = ''.obs;
  final occupation = ''.obs;
  final telegram = ''.obs;
  final hobbies = <String>[].obs;

  static const statusOptions = ['Single', 'In Love'];

  String get hobbiesText {
    if (hobbies.isEmpty) return '';
    return '${hobbies.length} selected';
  }

  String statusText(int applyStatus) {
    if (applyStatus == 2) return 'Reviewing';
    if (applyStatus > 2) return 'Review failed';
    return '';
  }

  bool get hasReviewFailed {
    final v = video.value;
    if (v != null && v.url.isNotEmpty && v.applyStatus > 2) return true;
    for (final p in photos) {
      if (p != null && p.url.isNotEmpty && p.applyStatus > 2) return true;
    }
    return false;
  }

  @override
  void onReady() {
    super.onReady();
    _load();
  }

  Future<void> _load() async {
    loading.value = true;
    final result = await ChimoApis.heartLink.queryApply();
    loading.value = false;
    if (!result.ok) {
      if (result.message.isNotEmpty) AppToast.error(result.message);
      return;
    }
    final data = result.data;
    if (data == null) return;
    if (data.hasVideo() && data.video.url.isNotEmpty) {
      video.value = data.video;
    }
    if (data.hasAudio() && data.audio.url.isNotEmpty) {
      audio.value = data.audio;
    }
    final next = <MediaItem?>[null, null];
    for (var i = 0; i < data.photo.length && i < 2; i++) {
      next[i] = data.photo[i];
    }
    photos.assignAll(next);
    emotionalState.value = data.emotionalState;
    occupation.value = data.occupation;
    telegram.value = data.telegram;
    hobbies.assignAll(data.interest);
  }

  Future<void> pickVideo() async {
    final current = video.value;
    // 已有视频：点击预览。对齐 oumi `_clickToUpload` → `JRVideoPlayerWidget.show`。
    if (current != null && current.url.isNotEmpty) {
      await Get.to(() => VideoPreviewPage(url: current.url));
      return;
    }
    final picked = await ImagePicker().pickVideo(
      source: ImageSource.gallery,
      maxDuration: const Duration(seconds: 30),
    );
    if (picked == null) return;
    busy.value = true;
    try {
      // 对齐 oumi 旧实现：先取封面字节并上传 cover，再上传视频。
      final thumb = await _videoThumb(picked.path);
      var coverUrl = '';
      if (thumb.bytes != null && thumb.bytes!.isNotEmpty) {
        coverUrl =
            await MediaUpload.uploadBytes(
              thumb.bytes!,
              sceneCode: MediaUpload.videoScene,
              filename: 'video_cover.jpg',
            ) ??
            '';
      }
      final remote = await MediaUpload.uploadVideo(picked.path);
      if (remote == null || remote.isEmpty) {
        AppToast.error('Upload failed');
        return;
      }
      video.value = MediaItem(
        type: MediaTypeEnum.VIDEO,
        url: remote,
        cover: coverUrl,
        duration: thumb.duration,
      );
    } finally {
      busy.value = false;
    }
  }

  /// 用 photo_manager 取视频封面（对齐 oumi `AssetEntity.thumbnailData`），不新增依赖。
  Future<({Uint8List? bytes, int duration})> _videoThumb(String path) async {
    try {
      final state = await PhotoManager.requestPermissionExtend(
        requestOption: const PermissionRequestOption(
          androidPermission: AndroidPermission(type: RequestType.video, mediaLocation: false),
          iosAccessLevel: IosAccessLevel.readWrite,
        ),
      );
      if (!state.hasAccess) return (bytes: null, duration: 0);

      final matched = await _matchAlbumVideo(path);
      if (matched != null) {
        final bytes = await matched.thumbnailDataWithSize(
          const ThumbnailSize(360, 480),
          quality: 80,
        );
        return (bytes: bytes, duration: matched.duration);
      }

      // 相册匹配失败时临时入库取封面，再删除。对齐旧 AssetPicker 路径的 thumbnailData。
      final entity = await PhotoManager.editor.saveVideo(
        File(path),
        title: 'chimo_ht_${DateTime.now().millisecondsSinceEpoch}',
      );
      try {
        final bytes = await entity.thumbnailDataWithSize(
          const ThumbnailSize(360, 480),
          quality: 80,
        );
        return (bytes: bytes, duration: entity.duration);
      } finally {
        await PhotoManager.editor.deleteWithIds([entity.id]);
      }
    } catch (error) {
      AppLog.w('RevealCard video thumb failed', error: error);
      return (bytes: null, duration: 0);
    }
  }

  Future<AssetEntity?> _matchAlbumVideo(String path) async {
    try {
      final file = File(path);
      if (!file.existsSync()) return null;
      final length = await file.length();
      if (length <= 0) return null;
      final albums = await PhotoManager.getAssetPathList(type: RequestType.video, onlyAll: true);
      if (albums.isEmpty) return null;
      final recent = await albums.first.getAssetListRange(start: 0, end: 40);
      for (final asset in recent) {
        final origin = await asset.originFile ?? await asset.file;
        if (origin == null) continue;
        if (origin.path == path || await origin.length() == length) {
          return asset;
        }
      }
    } catch (error) {
      AppLog.w('RevealCard match album video failed', error: error);
    }
    return null;
  }

  Future<void> pickPhoto(int index) async {
    if (index < 0 || index > 1) return;
    final current = photos[index];
    if (current != null && current.url.isNotEmpty) return;
    final file = await MediaPicker.pickImage();
    if (file == null) return;
    final local = await MediaPicker.persistToSandbox(file);
    if (local == null) {
      AppToast.error('Save failed');
      return;
    }
    busy.value = true;
    try {
      final remote = await MediaUpload.uploadImage(local);
      if (remote == null || remote.isEmpty) {
        AppToast.error('Upload failed');
        return;
      }
      photos[index] = MediaItem(type: MediaTypeEnum.IMAGE, url: remote);
      photos.refresh();
    } finally {
      busy.value = false;
    }
  }

  void clearVideo() => video.value = null;

  void clearPhoto(int index) {
    if (index < 0 || index > 1) return;
    photos[index] = null;
    photos.refresh();
  }

  Future<void> recordVoice() async {
    final result = await AppJumper.toEditVoiceNote();
    if (result is! VoiceNoteResult) return;
    busy.value = true;
    try {
      final remote = await MediaUpload.uploadVoice(result.path);
      if (remote == null || remote.isEmpty) {
        AppToast.error('Upload failed');
        return;
      }
      audio.value = MediaItem(type: MediaTypeEnum.AUDIO, url: remote, duration: result.seconds);
    } finally {
      busy.value = false;
    }
  }

  Future<void> applyStatus(String value) async {
    emotionalState.value = value;
  }

  Future<void> applyOccupation(String value) async {
    occupation.value = value.trim();
  }

  Future<void> applyTelegram(String value) async {
    telegram.value = value.trim();
  }

  Future<void> pickHobbies() async {
    final result = await AppJumper.toEditTags(initialSelected: hobbies.toList());
    if (result is List) {
      hobbies.assignAll(result.map((e) => e.toString()).where((e) => e.isNotEmpty));
    }
  }

  bool validate() {
    if (video.value == null || video.value!.url.isEmpty) {
      AppToast.info('Please upload a video');
      return false;
    }
    if (photos.any((e) => e == null || e.url.isEmpty)) {
      AppToast.info('Please upload 2 photos');
      return false;
    }
    if (audio.value == null || audio.value!.url.isEmpty) {
      AppToast.info('Please record a voice note');
      return false;
    }
    if (emotionalState.value.trim().isEmpty) {
      AppToast.info('Please select status');
      return false;
    }
    if (occupation.value.trim().isEmpty) {
      AppToast.info('Please fill in job');
      return false;
    }
    if (telegram.value.trim().isEmpty) {
      AppToast.info('Please fill in Telegram');
      return false;
    }
    if (hobbies.isEmpty) {
      AppToast.info('Please select hobbies');
      return false;
    }
    return true;
  }

  HeartLinkCard buildPreviewCard() {
    return HeartLinkCard(
      video: video.value,
      photo: photos.whereType<MediaItem>().toList(),
      audio: audio.value,
      emotionalState: emotionalState.value,
      occupation: occupation.value,
      telegram: telegram.value,
      interest: hobbies.toList(),
      user: SessionInfo.currentUser,
    );
  }

  Future<void> preview() async {
    if (!validate()) return;
    await AppJumper.toRevealCardPreview(buildPreviewCard());
  }

  Future<void> upload() async {
    if (!validate() || busy.value) return;
    busy.value = true;
    try {
      final req = HeartLinkCardSaveReq(
        video: video.value,
        photo: photos.whereType<MediaItem>().toList(),
        audio: audio.value,
        emotionalState: emotionalState.value,
        occupation: occupation.value,
        telegram: telegram.value,
        interest: hobbies.toList(),
      );
      final result = await ChimoApis.heartLink.submit(req);
      if (!result.ok) {
        AppToast.error(result.message.isEmpty ? 'Upload failed' : result.message);
        return;
      }
      AppToast.success('Submission successful. Under review.');
      Get.back(result: true);
    } finally {
      busy.value = false;
    }
  }
}
