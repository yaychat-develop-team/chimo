import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../logic/report_logic.dart';
import '../../../common/theme/app_colors.dart';
import '../../../common/theme/app_input.dart';
import '../../../common/theme/app_text.dart';
import '../../../common/widgets/app_scaffold.dart';
import '../model/report_target.dart';
import '../../profile/page/widgets/photo_pick_sheet.dart';
import '../../../common/widgets/app_image.dart';
import '../../../app/app_jumper.dart';
import '../../../common/utils/app_toast.dart';

/// 举报页：选择类型、上传凭证图、填写反馈。
class ReportPage extends StatefulWidget {
  const ReportPage({super.key, this.reportedId = '', this.targetKind = ReportTargetKind.user});

  /// 被举报用户 id 或群（环信）id。
  final String reportedId;

  final ReportTargetKind targetKind;

  @override
  State<ReportPage> createState() => _ReportPageState();
}

class _ReportPageState extends State<ReportPage> {
  late final ReportLogic logic;
  final TextEditingController _feedbackController = TextEditingController();

  @override
  void initState() {
    super.initState();
    logic = Get.put(ReportLogic(initialType: ReportLogic.types.first));
  }

  @override
  void dispose() {
    _feedbackController.dispose();
    Get.delete<ReportLogic>();
    super.dispose();
  }

  Future<void> _addImage() async {
    final action = await showPhotoPickSheet(context);
    if (!mounted || action == null) return;
    final message = await logic.addImage(fromCamera: action == PhotoPickAction.takePhoto);
    if (!mounted || message == null) return;
    AppToast.info(message);
  }

  Future<void> _submit() async {
    final result = await logic.submit(
      feedback: _feedbackController.text,
      reportedId: widget.reportedId,
      targetKind: widget.targetKind,
    );
    if (!mounted || result == null) return;
    AppToast.info(result.message);
    if (!result.ok) return;
    AppJumper.back();
    if (mounted) logic.idle();
  }

  @override
  Widget build(BuildContext context) {
    final bottom = MediaQuery.paddingOf(context).bottom;

    return Obx(() {
      final images = logic.images.toList();
      final picking = logic.picking.value;
      final submitting = logic.submitting.value;
      final selectedType = logic.selectedType.value;
      final feedbackLen = logic.feedbackLength.value;
      final busy = submitting || picking;
      return ChimoScaffold(
        title: 'Report',
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: ListView(
                padding: const EdgeInsets.fromLTRB(16, 8, 16, 24),
                children: [
                  const Text('Type', style: AppText.title),
                  const SizedBox(height: 12),
                  Wrap(
                    spacing: 10,
                    runSpacing: 10,
                    children: ReportLogic.types
                        .map(
                          (type) => _TypeChip(
                            label: type,
                            selected: type == selectedType,
                            onTap: busy ? null : () => logic.select(type),
                          ),
                        )
                        .toList(),
                  ),
                  const SizedBox(height: 28),
                  Text(
                    'Feedback (${images.length}/${ReportLogic.maxImages})',
                    style: AppText.title,
                  ),
                  const SizedBox(height: 12),
                  Wrap(
                    spacing: 10,
                    runSpacing: 10,
                    children: [
                      ...images.indexed.map((entry) {
                        final (index, item) = entry;
                        return _ImageThumb(item: item, onRemove: () => logic.removeImage(index));
                      }),
                      if (images.length < ReportLogic.maxImages)
                        _AddImageButton(
                          onTap: busy ? null : () => unawaited(_addImage()),
                          loading: picking,
                        ),
                    ],
                  ),
                  const SizedBox(height: 28),
                  const Text('Feedback', style: AppText.title),
                  const SizedBox(height: 12),
                  _FeedbackField(
                    controller: _feedbackController,
                    maxLength: ReportLogic.maxFeedbackLength,
                    length: feedbackLen,
                    enabled: !submitting,
                    onChanged: logic.onFeedbackChanged,
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
                        submitting ? 'Submitting…' : 'Submit',
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
    });
  }
}

class _TypeChip extends StatelessWidget {
  const _TypeChip({required this.label, required this.selected, this.onTap});

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
          color: selected ? Colors.white : AppColors.surfaceField,
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
          color: AppColors.surfaceField,
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
            : const Icon(Icons.add_rounded, color: AppColors.textPrimary, size: 32),
      ),
    );
  }
}

class _ImageThumb extends StatelessWidget {
  const _ImageThumb({required this.item, required this.onRemove});

  final ReportImage item;
  final VoidCallback onRemove;

  @override
  Widget build(BuildContext context) {
    final local = (item.localPath ?? '').trim();
    final remote = (item.remoteUrl ?? '').trim();

    Widget image;
    if (local.isNotEmpty) {
      image = AppImage.file(
        local,
        width: _AddImageButton.size,
        height: _AddImageButton.size,
        fit: BoxFit.cover,
        error: const ColoredBox(
          color: AppColors.outlineField,
          child: Icon(Icons.broken_image_outlined, color: Colors.white54),
        ),
      );
    } else if (remote.isNotEmpty) {
      image = AppImage(
        remote,
        width: _AddImageButton.size,
        height: _AddImageButton.size,
        fit: BoxFit.cover,
        error: const ColoredBox(
          color: AppColors.outlineField,
          child: Icon(Icons.broken_image_outlined, color: Colors.white54),
        ),
      );
    } else {
      image = const ColoredBox(color: AppColors.outlineField);
    }

    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(14),
          child: SizedBox(width: _AddImageButton.size, height: _AddImageButton.size, child: image),
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
              decoration: BoxDecoration(color: Colors.black54, shape: BoxShape.circle),
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
        color: AppColors.surfaceField,
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
            style: const TextStyle(color: AppColors.textPrimary, fontSize: 15, height: 1.4),
            cursorColor: AppColors.primaryBright,
            decoration: const AppInputDecoration(
              isCollapsed: true,
              counterText: '',
              hintText: 'Please enter here',
              hintStyle: TextStyle(color: AppColors.textTertiary, fontSize: 15),
            ),
          ),
          Positioned(
            right: 0,
            bottom: 0,
            child: Text(
              '$length/$maxLength',
              style: const TextStyle(color: AppColors.textTertiary, fontSize: 12),
            ),
          ),
        ],
      ),
    );
  }
}
