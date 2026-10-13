import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../theme/app_colors.dart';
import '../theme/app_text.dart';
import 'app_log.dart';

/// 全项目唯一的轻提示出口。overlay 从 GetX 取，不需要 `BuildContext`。
///
/// [info] 中性提示，[success] 成功，[error] 失败。
abstract final class AppToast {
  static const _infoDuration = Duration(seconds: 2);
  static const _successDuration = Duration(seconds: 1);
  static const _errorDuration = Duration(seconds: 4);

  static void info(String message, {Duration? duration}) =>
      _show(message, duration ?? _infoDuration);

  static void success(String message, {Duration? duration}) =>
      _show(message, duration ?? _successDuration);

  static void error(String message, {Duration? duration}) =>
      _show(message, duration ?? _errorDuration);

  /// 当前显示中的那一条：新提示会顶掉旧的，避免连续失败时叠一摞。
  static OverlayEntry? _current;
  static Timer? _timer;

  static void _show(String message, Duration duration) {
    final text = message.trim();
    if (text.isEmpty) return;

    // GetMaterialApp 提供 overlay；拿不到就只记日志 ——
    // **不吞掉**，否则「提示没弹出来」永远查不到。
    final overlay = _overlay();
    if (overlay == null) {
      AppLog.w('AppToast dropped (no overlay): $text');
      return;
    }

    _dismiss();
    final entry = OverlayEntry(builder: (_) => _ToastBody(message: text));
    _current = entry;
    overlay.insert(entry);
    _timer = Timer(duration, _dismiss);
  }

  static OverlayState? _overlay() {
    final context = Get.overlayContext ?? Get.context;
    final fromContext = context == null ? null : Overlay.maybeOf(context);
    return fromContext ?? Get.key.currentState?.overlay;
  }

  static void _dismiss() {
    _timer?.cancel();
    _timer = null;
    final entry = _current;
    _current = null;
    if (entry == null) return;
    try {
      entry.remove();
    } catch (error) {
      // overlay 已经随页面销毁：忽略，但别静默。
      AppLog.d('AppToast remove entry failed', error: error);
    }
  }
}

/// 居中胶囊。
class _ToastBody extends StatelessWidget {
  const _ToastBody({required this.message});

  final String message;

  @override
  Widget build(BuildContext context) => IgnorePointer(
    child: Center(
      child: Material(
        color: Colors.transparent,
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 48),
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
          decoration: BoxDecoration(
            color: AppColors.toastBackground,
            borderRadius: BorderRadius.circular(24),
          ),
          child: Text(
            message,
            textAlign: TextAlign.center,
            style: AppText.label,
          ),
        ),
      ),
    ),
  );
}
