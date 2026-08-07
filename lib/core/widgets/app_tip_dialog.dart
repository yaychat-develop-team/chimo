import 'package:flutter/material.dart';

/// Shared Tip confirm dialog: white rounded card, Cancel / Confirm.
///
/// Use [show] for one-off copy, or the named presets for common flows.
class AppTipDialog extends StatelessWidget {
  const AppTipDialog({
    super.key,
    required this.message,
    this.title = 'Tip',
    this.cancelLabel = 'Cancel',
    this.confirmLabel = 'Confirm',
  });

  final String title;
  final String message;
  final String cancelLabel;
  final String confirmLabel;

  /// Shows the confirm dialog; returns `true` if the user taps Confirm.
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

  /// Chats list: swipe-delete conversation.
  static Future<bool> confirmDeleteConversation(BuildContext context) {
    return show(
      context,
      message: 'Are you sure you want to delete this conversation?',
    );
  }

  /// DM / profile: block user.
  static Future<bool> confirmBlockUser(BuildContext context) {
    return show(
      context,
      title: 'Block this user?',
      message: "You won't get any more messages from this user.",
      confirmLabel: 'Block',
    );
  }

  /// Group details: leave group.
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
