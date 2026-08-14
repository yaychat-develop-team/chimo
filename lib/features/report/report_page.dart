import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../core/network/app_apis.dart';
import '../../core/network/media_upload.dart';
import '../../core/theme/app_colors.dart';
import '../../core/widgets/app_network_image.dart';
import '../../core/widgets/app_page_scaffold.dart';
import '../../core/widgets/center_toast.dart';
import '../profile/edit/photo_pick_sheet.dart';

/// 举报目标：用户或群聊（对齐 forya ReportType）。
enum ReportTargetKind { user, group }

class _ReportImage {
  _ReportImage({
    this.localPath,
    this.remoteUrl,
    this.uploading = false,
  });

  String? localPath;
  String? remoteUrl;
  bool uploading;

  bool get ready =>
      !uploading && (remoteUrl != null && remoteUrl!.trim().isNotEmpty);
}

/// 举报页：选择类型、上传凭证图、填写反馈。
class ReportPage extends StatefulWidget {
  const ReportPage({
    super.key,
    this.reportedId = '',
    this.targetKind = ReportTargetKind.user,
  });

  /// 被举报用户 id 或群（环信）id。
  final String reportedId;

  final ReportTargetKind targetKind;

  @override
  State<ReportPage> createState() => _ReportPageState();
}

class _ReportPageState extends State<ReportPage> {
  static const _types = [
    'Fraud',
    'Politics',
    'Personal transfer',
    'Mess around',
    'Infringement',
    'Private Transfer',
  ];

  static const _maxImages = 4;
  static const _maxFeedbackLength = 500;

  String _selectedType = _types.first;
  final List<_ReportImage> _images = [];
  final TextEditingController _feedbackController = TextEditingController();
  bool _submitting = false;
  bool _picking = false;

  @override
  void dispose() {
    _feedbackController.dispose();
    super.dispose();
  }

  Future<void> _addImage() async {
    if (_picking || _submitting) return;
    if (_images.length >= _maxImages) return;

    final action = await showPhotoPickSheet(context);
    if (!mounted || action == null) return;

    final source = switch (action) {
      PhotoPickAction.takePhoto => ImageSource.camera,
      PhotoPickAction.gallery => ImageSource.gallery,
    };

    setState(() => _picking = true);
    XFile? file;
    try {
      file = await ImagePicker().pickImage(
        source: source,
        imageQuality: 85,
        maxWidth: 1920,
      );
    } catch (_) {
      if (!mounted) return;
      showCenterToast(
        context,
        message: source == ImageSource.camera
            ? 'Camera unavailable. Check app permissions.'
            : 'Gallery unavailable. Check app permissions.',
      );
      setState(() => _picking = false);
      return;
    }
    if (!mounted) return;
    setState(() => _picking = false);
    if (file == null) return;

    if (file.path.toLowerCase().endsWith('.gif')) {
      showCenterToast(context, message: 'GIF uploads are not supported');
      return;
    }

    final item = _ReportImage(localPath: file.path, uploading: true);
    setState(() => _images.add(item));

    final remote = await MediaUpload.uploadFile(file.path);
    if (!mounted) return;

    final index = _images.indexOf(item);
    if (index < 0) return;

    if (remote == null || remote.isEmpty) {
      setState(() => _images.removeAt(index));
      showCenterToast(context, message: 'Image upload failed. Try again.');
      return;
    }

    setState(() {
      _images[index] = _ReportImage(
        localPath: file!.path,
        remoteUrl: remote,
        uploading: false,
      );
    });
  }

  void _removeImage(int index) {
    if (_submitting) return;
    setState(() => _images.removeAt(index));
  }

  Future<void> _submit() async {
    if (_submitting) return;
    final feedback = _feedbackController.text.trim();
    if (feedback.isEmpty) {
      showCenterToast(context, message: 'Please enter feedback');
      return;
    }
    if (_images.any((e) => e.uploading)) {
      showCenterToast(context, message: 'Images are still uploading…');
      return;
    }

    final reportedId = widget.reportedId.trim();
    final imageUrls = [
      for (final img in _images)
        if (img.ready) img.remoteUrl!.trim(),
    ];

    setState(() => _submitting = true);
    try {
      if (reportedId.isNotEmpty) {
        final res = await AppApis.report.submit(
          reportedId: reportedId,
          type: widget.targetKind == ReportTargetKind.group
              ? 'CHANNEL'
              : 'USER',
          reason: _selectedType,
          description: feedback,
          evidenceImages: imageUrls,
        );
        if (!mounted) return;
        if (!res.ok) {
          showCenterToast(
            context,
            message: res.message.isEmpty ? 'Submit failed' : res.message,
          );
          return;
        }
      }
      if (!mounted) return;
      showCenterToast(context, message: 'Report submitted');
      Navigator.of(context).pop();
    } catch (error) {
      if (!mounted) return;
      showCenterToast(context, message: 'Submit failed: $error');
    } finally {
      if (mounted) setState(() => _submitting = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final bottom = MediaQuery.paddingOf(context).bottom;
    final feedbackLen = _feedbackController.text.length;
    final busy = _submitting || _picking;

    return AppPageScaffold(
      title: 'Report',
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: ListView(
              padding: const EdgeInsets.fromLTRB(16, 8, 16, 24),
              children: [
                const Text(
                  'Type',
                  style: TextStyle(
                    color: AppColors.textPrimary,
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 12),
                Wrap(
                  spacing: 10,
                  runSpacing: 10,
                  children: [
                    for (final type in _types)
                      _TypeChip(
                        label: type,
                        selected: type == _selectedType,
                        onTap: busy
                            ? null
                            : () => setState(() => _selectedType = type),
                      ),
                  ],
                ),
                const SizedBox(height: 28),
                Text(
                  'Feedback (${_images.length}/$_maxImages)',
                  style: const TextStyle(
                    color: AppColors.textPrimary,
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 12),
                Wrap(
                  spacing: 10,
                  runSpacing: 10,
                  children: [
                    for (var i = 0; i < _images.length; i++)
                      _ImageThumb(
                        item: _images[i],
                        onRemove: () => _removeImage(i),
                      ),
                    if (_images.length < _maxImages)
                      _AddImageButton(
                        onTap: busy ? null : () => unawaited(_addImage()),
                        loading: _picking,
                      ),
                  ],
                ),
                const SizedBox(height: 28),
                const Text(
                  'Feedback',
                  style: TextStyle(
                    color: AppColors.textPrimary,
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 12),
                _FeedbackField(
                  controller: _feedbackController,
                  maxLength: _maxFeedbackLength,
                  length: feedbackLen,
                  enabled: !_submitting,
                  onChanged: (_) => setState(() {}),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(16, 8, 16, 12 + bottom),
            child: SizedBox(
              height: 52,
              child: Material(
                color: AppColors.primaryBright,
                borderRadius: BorderRadius.circular(26),
                child: InkWell(
                  onTap: busy ? null : () => unawaited(_submit()),
                  borderRadius: BorderRadius.circular(26),
                  child: Center(
                    child: Text(
                      _submitting ? 'Submitting…' : 'Submit',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 17,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _TypeChip extends StatelessWidget {
  const _TypeChip({
    required this.label,
    required this.selected,
    this.onTap,
  });

  final String label;
  final bool selected;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
        decoration: BoxDecoration(
          color: selected ? Colors.white : const Color(0xFF2C2C2E),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Text(
          label,
          style: TextStyle(
            color: selected ? Colors.black : AppColors.textSecondary,
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}

class _AddImageButton extends StatelessWidget {
  const _AddImageButton({this.onTap, this.loading = false});

  final VoidCallback? onTap;
  final bool loading;

  static const double size = 72;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          color: const Color(0xFF2C2C2E),
          borderRadius: BorderRadius.circular(14),
        ),
        child: loading
            ? const Center(
                child: SizedBox(
                  width: 22,
                  height: 22,
                  child: CircularProgressIndicator(strokeWidth: 2),
                ),
              )
            : const Icon(
                Icons.add_rounded,
                color: AppColors.textPrimary,
                size: 32,
              ),
      ),
    );
  }
}

class _ImageThumb extends StatelessWidget {
  const _ImageThumb({required this.item, required this.onRemove});

  final _ReportImage item;
  final VoidCallback onRemove;

  @override
  Widget build(BuildContext context) {
    final local = (item.localPath ?? '').trim();
    final remote = (item.remoteUrl ?? '').trim();

    Widget image;
    if (local.isNotEmpty) {
      image = Image.file(
        File(local),
        width: _AddImageButton.size,
        height: _AddImageButton.size,
        fit: BoxFit.cover,
        errorBuilder: (_, _, _) => const ColoredBox(
          color: Color(0xFF3A3A3C),
          child: Icon(Icons.broken_image_outlined, color: Colors.white54),
        ),
      );
    } else if (remote.isNotEmpty) {
      image = AppNetworkImage(
        remote,
        width: _AddImageButton.size,
        height: _AddImageButton.size,
        fit: BoxFit.cover,
        errorWidget: (_, _, _) => const ColoredBox(
          color: Color(0xFF3A3A3C),
          child: Icon(Icons.broken_image_outlined, color: Colors.white54),
        ),
      );
    } else {
      image = const ColoredBox(color: Color(0xFF3A3A3C));
    }

    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(14),
          child: SizedBox(
            width: _AddImageButton.size,
            height: _AddImageButton.size,
            child: image,
          ),
        ),
        if (item.uploading)
          Positioned.fill(
            child: DecoratedBox(
              decoration: BoxDecoration(
                color: Colors.black54,
                borderRadius: BorderRadius.circular(14),
              ),
              child: const Center(
                child: SizedBox(
                  width: 22,
                  height: 22,
                  child: CircularProgressIndicator(strokeWidth: 2),
                ),
              ),
            ),
          ),
        Positioned(
          top: 4,
          right: 4,
          child: GestureDetector(
            onTap: item.uploading ? null : onRemove,
            child: const DecoratedBox(
              decoration: BoxDecoration(
                color: Colors.black54,
                shape: BoxShape.circle,
              ),
              child: Padding(
                padding: EdgeInsets.all(2),
                child: Icon(Icons.close_rounded, size: 14, color: Colors.white),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _FeedbackField extends StatelessWidget {
  const _FeedbackField({
    required this.controller,
    required this.maxLength,
    required this.length,
    required this.onChanged,
    this.enabled = true,
  });

  final TextEditingController controller;
  final int maxLength;
  final int length;
  final ValueChanged<String> onChanged;
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 160,
      padding: const EdgeInsets.fromLTRB(14, 12, 14, 10),
      decoration: BoxDecoration(
        color: const Color(0xFF2C2C2E),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Stack(
        children: [
          TextField(
            controller: controller,
            onChanged: onChanged,
            enabled: enabled,
            maxLength: maxLength,
            maxLines: null,
            expands: true,
            textAlignVertical: TextAlignVertical.top,
            style: const TextStyle(
              color: AppColors.textPrimary,
              fontSize: 15,
              height: 1.4,
            ),
            cursorColor: AppColors.primaryBright,
            decoration: const InputDecoration(
              border: InputBorder.none,
              isCollapsed: true,
              counterText: '',
              hintText: 'Please enter here',
              hintStyle: TextStyle(
                color: AppColors.textTertiary,
                fontSize: 15,
              ),
            ),
          ),
          Positioned(
            right: 0,
            bottom: 0,
            child: Text(
              '$length/$maxLength',
              style: const TextStyle(
                color: AppColors.textTertiary,
                fontSize: 12,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
