import 'package:flutter/material.dart';

/// 共用 Tip 确认弹窗：白色圆角卡片，Cancel / Confirm。
///
/// 一次性文案用 [show]，常见流程用具名预设。
class AppTipDialog extends StatelessWidget {
  const AppTipDialog({
    super.key,
    required this.message,
    this.title = 'Tip',
    this.cancelLabel = 'Cancel',
    this.confirmLabel = 'Confirm',
    this.alertOnly = false,
  });

  final String title;
  final String message;
  final String cancelLabel;
  final String confirmLabel;
  final bool alertOnly;

  /// 显示确认弹窗；用户点 Confirm 时返回 `true`。
  static Future<bool> show(
    BuildContext context, {
    required String message,
    String title = 'Tip',
    String cancelLabel = 'Cancel',
    String confirmLabel = 'Confirm',
  }) async {
    final result = await showDialog<bool>(
      context: context,
      barrierColor: Colors.black.withValues(alpha: 0.55),
      builder: (context) => AppTipDialog(
        title: title,
        message: message,
        cancelLabel: cancelLabel,
        confirmLabel: confirmLabel,
      ),
    );
    return result ?? false;
  }

  /// 仅提示（单 OK），用于仍被屏蔽等场景。
  static Future<void> alert(
    BuildContext context, {
    required String message,
    String title = 'Tip',
    String confirmLabel = 'OK',
  }) {
    return showDialog<void>(
      context: context,
      barrierColor: Colors.black.withValues(alpha: 0.55),
      builder: (context) => AppTipDialog(
        title: title,
        message: message,
        confirmLabel: confirmLabel,
        alertOnly: true,
      ),
    );
  }

  /// 会话列表：滑动删除会话。
  static Future<bool> confirmDeleteConversation(BuildContext context) {
    return show(
      context,
      message: 'Are you sure you want to delete this conversation?',
    );
  }

  /// 私聊 / 资料：拉黑用户。
  static Future<bool> confirmBlockUser(BuildContext context) {
    return show(
      context,
      title: 'Block this user?',
      message: "You won't get any more messages from this user.",
      confirmLabel: 'Block',
    );
  }

  /// 群详情：退出群组。
  static Future<bool> confirmLeaveGroup(BuildContext context) {
    return show(
      context,
      title: 'Leave this Group?',
      message: 'You will no longer receive updates.',
      confirmLabel: 'Leave',
    );
  }

  @override
  Widget build(BuildContext context) {
    final hasMessage = message.trim().isNotEmpty;

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
            Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.w700,
                height: 1.2,
              ),
            ),
            if (hasMessage) ...[
              const SizedBox(height: 14),
              Text(
                message,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Color(0xFF666666),
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  height: 1.4,
                ),
              ),
            ],
            const SizedBox(height: 22),
            if (alertOnly)
              SizedBox(
                width: double.infinity,
                child: _DialogButton(
                  label: confirmLabel,
                  background: Colors.black,
                  foreground: Colors.white,
                  onTap: () =>
                      Navigator.of(context, rootNavigator: true).pop(),
                ),
              )
            else
              Row(
                children: [
                  Expanded(
                    child: _DialogButton(
                      label: cancelLabel,
                      background: const Color(0xFFF0F0F0),
                      foreground: const Color(0xFF666666),
                      onTap: () =>
                          Navigator.of(context, rootNavigator: true).pop(false),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: _DialogButton(
                      label: confirmLabel,
                      background: Colors.black,
                      foreground: Colors.white,
                      onTap: () =>
                          Navigator.of(context, rootNavigator: true).pop(true),
                    ),
                  ),
                ],
              ),
          ],
        ),
      ),
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
          child: Center(
            child: Text(
              label,
              style: TextStyle(
                color: foreground,
                fontSize: 15,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
