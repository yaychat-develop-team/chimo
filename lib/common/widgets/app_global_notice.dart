import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../theme/app_colors.dart';
import '../utils/app_log.dart';

/// App 根级顶部浮层。对齐 joyride `GlobalNotice`：任意页面可弹，不依赖 RoomPage。
abstract final class AppGlobalNotice {
  static const int heartLinkInviteLevel = 80;
  static const int heartLinkOnlineLevel = 70;

  /// Romance 派单房邀请（与 Heart Link 邀请同级）。
  static const int romanceInviteLevel = 80;

  static OverlayEntry? _entry;
  static Timer? _timer;
  static int _level = 0;

  static bool get isShowing => _entry != null;

  /// [durationSeconds] ≤0 表示不自动关闭。
  static Future<void> show({
    required Widget widget,
    int level = 0,
    int durationSeconds = 0,
    bool dismissOnBarrier = false,
  }) async {
    final overlay = _overlay();
    if (overlay == null) {
      AppLog.w('AppGlobalNotice dropped (no overlay)');
      return;
    }
    if (_entry != null && level < _level) return;

    dismiss();
    _level = level;
    late OverlayEntry entry;
    entry = OverlayEntry(
      builder: (_) => _NoticeHost(
        dismissOnBarrier: dismissOnBarrier,
        onBarrierTap: dismiss,
        child: widget,
      ),
    );
    _entry = entry;
    overlay.insert(entry);
    if (durationSeconds > 0) {
      _timer = Timer(Duration(seconds: durationSeconds), dismiss);
    }
  }

  static void dismiss() {
    _timer?.cancel();
    _timer = null;
    _level = 0;
    final entry = _entry;
    _entry = null;
    if (entry == null) return;
    try {
      entry.remove();
    } catch (error) {
      AppLog.d('AppGlobalNotice remove failed', error: error);
    }
  }

  static OverlayState? _overlay() {
    final context = Get.overlayContext ?? Get.context;
    final fromContext = context == null ? null : Overlay.maybeOf(context, rootOverlay: true);
    return fromContext ?? Get.key.currentState?.overlay;
  }
}

class _NoticeHost extends StatelessWidget {
  const _NoticeHost({
    required this.child,
    required this.dismissOnBarrier,
    required this.onBarrierTap,
  });

  final Widget child;
  final bool dismissOnBarrier;
  final VoidCallback onBarrierTap;

  @override
  Widget build(BuildContext context) {
    final top = MediaQuery.paddingOf(context).top + 12;
    return Material(
      color: AppColors.transparent,
      child: Stack(
        children: [
          if (dismissOnBarrier)
            Positioned.fill(
              child: GestureDetector(
                onTap: onBarrierTap,
                behavior: HitTestBehavior.opaque,
                child: const ColoredBox(color: AppColors.transparent),
              ),
            ),
          Positioned(
            top: top,
            left: 16,
            right: 16,
            child: child,
          ),
        ],
      ),
    );
  }
}
