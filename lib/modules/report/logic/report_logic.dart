import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../../app/chimo_api.dart';
import '../../../app/network/http/media_upload.dart';
import '../../../common/utils/media_picker.dart';
import '../model/report_target.dart';

/// 举报凭证图。上传完成且拿到远程地址后才算 [ready]。
class ReportImage {
  const ReportImage({this.localPath, this.remoteUrl, this.uploading = false});

  final String? localPath;
  final String? remoteUrl;
  final bool uploading;

  bool get ready => !uploading && (remoteUrl?.trim().isNotEmpty ?? false);
}

/// 举报提交结果。已经在提交时返回 `null`，页面不必再提示。
class ReportSubmitResult {
  const ReportSubmitResult({required this.ok, required this.message});

  final bool ok;
  final String message;
}

/// 举报类型、凭证图和提交。
///
/// 拍照 / 相册的底部弹层要 BuildContext，留在页面。选完来源后把
/// [addImage] 的结果交给页面弹 Toast。
class ReportLogic extends GetxController {
  ReportLogic({required String initialType}) : selectedType = initialType.obs;

  static const types = [
    'Fraud',
    'Politics',
    'Personal transfer',
    'Mess around',
    'Infringement',
    'Private Transfer',
  ];

  static const maxImages = 4;
  static const maxFeedbackLength = 500;

  final RxString selectedType;
  final RxBool submitting = false.obs;
  final RxBool picking = false.obs;
  final RxInt feedbackLength = 0.obs;
  final RxList<ReportImage> images = <ReportImage>[].obs;

  void select(String type) => selectedType.value = type;

  void onFeedbackChanged(String value) => feedbackLength.value = value.length;

  /// 返回 `null` 表示已加入或用户取消。非空是给页面的提示。
  Future<String?> addImage({required bool fromCamera}) async {
    if (picking.value || submitting.value) return null;
    if (images.length >= maxImages) return null;

    picking.value = true;
    try {
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

      final pending = ReportImage(localPath: file.path, uploading: true);
      images.add(pending);
      final remote = await MediaUpload.uploadImage(file.path);
      if (isClosed) return null;
      final index = images.indexOf(pending);
      if (index < 0) return null;
      if (remote == null || remote.isEmpty) {
        images.removeAt(index);
        return 'Image upload failed. Try again.';
      }
      images[index] = ReportImage(localPath: file.path, remoteUrl: remote);
      return null;
    } finally {
      if (!isClosed) picking.value = false;
    }
  }

  void removeImage(int index) {
    if (submitting.value) return;
    if (index < 0 || index >= images.length || images[index].uploading) return;
    images.removeAt(index);
  }

  /// 已经在提交时返回 `null`。成功时 [submitting] 保持 true，等页面返回再 [idle]。
  Future<ReportSubmitResult?> submit({
    required String feedback,
    required String reportedId,
    required ReportTargetKind targetKind,
  }) async {
    if (submitting.value) return null;
    final text = feedback.trim();
    if (text.isEmpty) {
      return const ReportSubmitResult(ok: false, message: 'Please enter feedback');
    }
    if (images.any((image) => image.uploading)) {
      return const ReportSubmitResult(ok: false, message: 'Images are still uploading…');
    }

    final id = reportedId.trim();
    if (id.isEmpty) {
      return const ReportSubmitResult(ok: true, message: 'Report submitted');
    }

    submitting.value = true;
    try {
      final urls = [
        for (final image in images)
          if (image.ready) image.remoteUrl!.trim(),
      ];
      final res = await ChimoApis.report.submit(
        reportedId: id,
        type: targetKind == ReportTargetKind.group ? 'CHANNEL' : 'USER',
        reason: selectedType.value,
        description: text,
        evidenceImages: urls,
      );
      if (!res.ok) {
        idle();
        return ReportSubmitResult(
          ok: false,
          message: res.message.isEmpty ? 'Submit failed' : res.message,
        );
      }
      return const ReportSubmitResult(ok: true, message: 'Report submitted');
    } catch (error) {
      idle();
      return ReportSubmitResult(ok: false, message: 'Submit failed: $error');
    }
  }

  void idle() {
    if (!isClosed) submitting.value = false;
  }
}
