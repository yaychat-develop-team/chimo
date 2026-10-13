import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../app/app_jumper.dart';
import 'app_colors.dart';

/// 按钮排布，对齐 joyride `showColumnDialog` 的 `btnStyle`。
enum DialogLoyoutStyle {
  /// 只有确认。
  confirmOnly,

  /// 左取消，右确认。
  horizontal,

  /// 上确认，下取消。
  vertical,
}

/// 全局确认弹窗：白底圆角卡片，标题、正文、可选配图，按钮纵向排。
///
/// 用 [show] 弹出。点确认回 `true`，点取消或点遮罩回 `false`。
class AppDialog extends StatelessWidget {
  const AppDialog({
    super.key,
    this.title,
    this.content,
    this.image,
    this.contentWidget,
    this.titleColor = Colors.black,
    this.confirmLabel = 'Confirm',
    this.cancelLabel = 'Cancel',
    this.buttons = DialogLoyoutStyle.confirmOnly,
    this.imageHeight = 108,
    this.autoPop = true,
    this.onConfirm,
    this.onCancel,
  });

  /// 弹出纵向卡片。确认回 `true`，取消回 `false`。
  static Future<bool?> show({
    String? title,
    String? content,
    Widget? image,
    Widget? contentWidget,
    Color? titleColor,
    String confirmLabel = 'Confirm',
    String cancelLabel = 'Cancel',
    DialogLoyoutStyle buttons = DialogLoyoutStyle.confirmOnly,
    double imageHeight = 108,
    bool autoPop = true,
    VoidCallback? onConfirm,
    VoidCallback? onCancel,
    bool barrierDismissible = true,
  }) async {
    return await Get.dialog<bool>(
      AppDialog(
        title: title,
        content: content,
        image: image,
        contentWidget: contentWidget,
        titleColor: titleColor ?? Colors.black,
        confirmLabel: confirmLabel,
        cancelLabel: cancelLabel,
        buttons: buttons,
        imageHeight: imageHeight,
        autoPop: autoPop,
        onConfirm: onConfirm,
        onCancel: onCancel,
      ),
      barrierDismissible: barrierDismissible,
      barrierColor: Colors.black.withValues(alpha: 0.55),
    );
  }

  /// 不可关闭的处理中遮罩。结束后用 `AppJumper.backIfPossible()` 关掉。
  static void blockingProgress() {
    Get.dialog<void>(
      const PopScope(
        canPop: false,
        child: Center(
          child: Card(
            child: Padding(padding: EdgeInsets.all(24), child: CircularProgressIndicator()),
          ),
        ),
      ),
      barrierDismissible: false,
    );
  }

  final String? title;
  final String? content;
  final Widget? image;
  final Widget? contentWidget;
  final Color titleColor;
  final String confirmLabel;
  final String cancelLabel;
  final DialogLoyoutStyle buttons;
  final double imageHeight;
  final bool autoPop;
  final VoidCallback? onConfirm;
  final VoidCallback? onCancel;

  @override
  Widget build(BuildContext context) {
    final titleText = title?.trim() ?? '';
    final contentText = content?.trim() ?? '';
    final hasTitle = titleText.isNotEmpty;
    final hasContent = contentText.isNotEmpty;

    return Dialog(
      backgroundColor: Colors.white,
      elevation: 0,
      insetPadding: const EdgeInsets.symmetric(horizontal: 40),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20, 24, 20, 20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (image != null)
              Padding(
                padding: const EdgeInsets.only(bottom: 16),
                child: SizedBox(height: imageHeight, child: image),
              ),
            if (hasTitle)
              Text(
                titleText,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: titleColor,
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  height: 1.2,
                ),
              ),
            if (hasTitle && hasContent) const SizedBox(height: 14),
            if (hasContent)
              Text(
                contentText,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: AppColors.textGray66,
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  height: 1.4,
                ),
              ),
            if (contentWidget != null)
              Padding(padding: const EdgeInsets.only(top: 14), child: contentWidget),
            const SizedBox(height: 22),
            if (buttons == DialogLoyoutStyle.confirmOnly) _confirmButton(),
            if (buttons == DialogLoyoutStyle.horizontal)
              Row(
                children: [
                  Expanded(child: _cancelButton()),
                  const SizedBox(width: 12),
                  Expanded(child: _confirmButton()),
                ],
              ),
            if (buttons == DialogLoyoutStyle.vertical) ...[
              _confirmButton(),
              const SizedBox(height: 12),
              _cancelButton(),
            ],
          ],
        ),
      ),
    );
  }

  Widget _confirmButton() {
    return _DialogButton(
      label: confirmLabel,
      background: Colors.black,
      foreground: Colors.white,
      onTap: () {
        if (autoPop) AppJumper.back(result: true);
        onConfirm?.call();
      },
    );
  }

  Widget _cancelButton() {
    return _DialogButton(
      label: cancelLabel,
      background: AppColors.textGrayF0,
      foreground: AppColors.textGray66,
      onTap: () {
        if (autoPop) AppJumper.back(result: false);
        onCancel?.call();
      },
    );
  }
}

class _DialogButton extends StatelessWidget {
  const _DialogButton({
    required this.label,
    required this.background,
    required this.foreground,
    required this.onTap,
  });

  final String label;
  final Color background;
  final Color foreground;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: background,
      borderRadius: BorderRadius.circular(22),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(22),
        child: SizedBox(
          height: 44,
          width: double.infinity,
          child: Center(
            child: Text(
              label,
              style: TextStyle(color: foreground, fontSize: 15, fontWeight: FontWeight.w600),
            ),
          ),
        ),
      ),
    );
  }
}
