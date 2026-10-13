import 'dart:math' as math;

import 'package:flutter/material.dart';

import '../../../../../common/constants/app_assets.dart';
import '../../../../../common/theme/app_colors.dart';
import '../../../../../common/widgets/app_image.dart';

/// 录音相位（原 `_ChatVoicePhase` / `_VoicePhase`）。
///
/// 相位机在 `ChatInputBar` 那边（开录 / 停录 / 试听 / 重录 / 确认），面板只按相位画。
/// **定义在面板这一侧**，这样依赖只有 `chat_input_bar.dart → panels/` 一个方向 ——
/// 面板不用反过来 import 输入栏。
enum ChatVoicePhase { idle, recording, preview }

/// 语音面板两边仅剩的视觉差异。
///
/// | 字段 | `.dm` | `.group` |
/// |---|---|---|
/// | `timeStyle` | 15 w500 + `height 18/15` | 15 w500，**没有 height** |
/// | `labelStyle` | 14 w400 + `height 18/14` | 14（不给字重），**没有 height** |
/// | `iconFit` | `BoxFit.contain` | null |
///
/// `iconFit` 是实打实的尺寸差，不是「顺手加的」：预览态那两个 44×44 侧键里图片槽位
/// 写的是 22×22，而 `Retry.png` 只有 20×18、`Affirm.png` 只有 17×12 ——
/// `contain` 会把它们**放大**到 22×19.8 / 22×15.5，不给 fit 时 [AppImage] 走
/// `BoxFit.scaleDown`（只缩不放）保持原始像素。私聊那两个图标因此比群聊大
/// 约 10% / 29%。主按钮那两张（42×42 / 36×24）都不小于槽位，两种 fit 画出来一样，
/// 所以**只有预览态看得出区别** —— 真机走查要走到试听那一步才看得到。
class ChatVoicePanelStyle {
  const ChatVoicePanelStyle({
    required this.timeStyle,
    required this.labelStyle,
    required this.iconFit,
  });

  /// 计时文案（设计：33×18）。
  final TextStyle timeStyle;

  /// 大按钮下面那行相位文案。
  final TextStyle labelStyle;

  /// 四个图标的 `fit`。null = 用 [AppImage] 的默认行为（`scaleDown`）。
  final BoxFit? iconFit;

  static const ChatVoicePanelStyle dm = ChatVoicePanelStyle(
    timeStyle: TextStyle(
      color: AppColors.textGrayB0,
      fontSize: 15,
      fontWeight: FontWeight.w500,
      height: 18 / 15,
    ),
    labelStyle: TextStyle(
      color: AppColors.textGrayB0,
      fontSize: 14,
      fontWeight: FontWeight.w400,
      height: 18 / 14,
    ),
    iconFit: BoxFit.contain,
  );

  static const ChatVoicePanelStyle group = ChatVoicePanelStyle(
    timeStyle: TextStyle(color: AppColors.textGrayB0, fontSize: 15, fontWeight: FontWeight.w500),
    labelStyle: TextStyle(color: AppColors.textGrayB0, fontSize: 14),
    iconFit: null,
  );
}

/// 语音面板：计时 + 中间大按钮 +（预览态）两侧的重录 / 确认。
///
/// 录音本身（`record` 插件、计时器、试听、临时文件）全在 `ChatInputBarState` 里，
/// 这里只有画和三个回调 —— 面板换成 [StatelessWidget] 的原因就是它没有自己的状态。
class ChatVoicePanel extends StatelessWidget {
  const ChatVoicePanel({
    super.key,
    required this.style,
    required this.timeLabel,
    required this.phase,
    required this.progress,
    required this.onMainTap,
    required this.onReset,
    required this.onConfirm,
  });

  final ChatVoicePanelStyle style;
  final String timeLabel;
  final ChatVoicePhase phase;

  /// 0–1，录制进度（60 秒上限）。
  final double progress;

  /// 中间大按钮：idle → 开录，recording → 停录，preview → 试听。
  final VoidCallback onMainTap;
  final VoidCallback onReset;
  final VoidCallback onConfirm;

  @override
  Widget build(BuildContext context) {
    final isPreview = phase == ChatVoicePhase.preview;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(timeLabel, style: style.timeStyle),
        const SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // 设计：44×44 侧边操作（仅预览）
            SizedBox(
              width: 44,
              height: 44,
              child: isPreview
                  ? _SideButton(
                      onTap: onReset,
                      child: AppImage(
                        AppAssets.audioRefreshIcon,
                        width: 22,
                        height: 22,
                        fit: style.iconFit,
                      ),
                    )
                  : const SizedBox.shrink(),
            ),
            const SizedBox(width: 24),
            _MainButton(phase: phase, progress: progress, iconFit: style.iconFit, onTap: onMainTap),
            const SizedBox(width: 24),
            SizedBox(
              width: 44,
              height: 44,
              child: isPreview
                  ? _SideButton(
                      onTap: onConfirm,
                      child: AppImage(
                        AppAssets.audioFinishIcon,
                        width: 22,
                        height: 22,
                        fit: style.iconFit,
                      ),
                    )
                  : const SizedBox.shrink(),
            ),
          ],
        ),
        const SizedBox(height: 14),
        Text(switch (phase) {
          ChatVoicePhase.idle => 'Click to record',
          ChatVoicePhase.recording => 'Recording',
          ChatVoicePhase.preview => 'Click to play',
        }, style: style.labelStyle),
      ],
    );
  }
}

class _MainButton extends StatelessWidget {
  const _MainButton({
    required this.phase,
    required this.progress,
    required this.iconFit,
    required this.onTap,
  });

  final ChatVoicePhase phase;
  final double progress;
  final BoxFit? iconFit;
  final VoidCallback onTap;

  /// 主控件外径设计尺寸（86×86）。
  static const double _outer = 86;

  /// 内缩黄色填充，使外围圆环仍可见。
  static const double _fill = 78;

  @override
  Widget build(BuildContext context) {
    final isIdle = phase == ChatVoicePhase.idle;
    final isRecording = phase == ChatVoicePhase.recording;
    final fillSize = isIdle ? _outer : _fill;

    return SizedBox(
      width: _outer,
      height: _outer,
      child: Stack(
        alignment: Alignment.center,
        children: [
          if (isRecording)
            CustomPaint(
              size: const Size(_outer, _outer),
              painter: _ProgressPainter(progress: progress),
            )
          else if (phase == ChatVoicePhase.preview)
            CustomPaint(
              size: const Size(_outer, _outer),
              // 预览：仅浅色轨道环（设计白/灰描边）。
              painter: const _ProgressPainter(progress: 0),
            ),
          Material(
            color: AppColors.coinYellow,
            shape: const CircleBorder(),
            child: InkWell(
              customBorder: const CircleBorder(),
              onTap: onTap,
              child: SizedBox(
                width: fillSize,
                height: fillSize,
                child: Center(
                  child: switch (phase) {
                    // 设计：麦克风 42×42
                    ChatVoicePhase.idle || ChatVoicePhase.recording => AppImage(
                      AppAssets.audioRecordIcon,
                      width: 42,
                      height: 42,
                      fit: iconFit,
                    ),
                    // 设计：波形
                    ChatVoicePhase.preview => AppImage(
                      AppAssets.audioPlayingIcon,
                      width: 36,
                      height: 28,
                      fit: iconFit,
                    ),
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _ProgressPainter extends CustomPainter {
  const _ProgressPainter({required this.progress});

  final double progress;

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    const stroke = 3.0;
    final radius = size.width / 2 - stroke / 2;
    // `strokeCap: round`，群聊没给，画出来一模一样，取没给的那支。
    final track = Paint()
      ..color = AppColors.textGrayE8
      ..style = PaintingStyle.stroke
      ..strokeWidth = stroke;
    final active = Paint()
      ..color = AppColors.coinYellow
      ..style = PaintingStyle.stroke
      ..strokeWidth = stroke
      ..strokeCap = StrokeCap.round;

    canvas.drawCircle(center, radius, track);
    final sweep = 2 * math.pi * progress.clamp(0.0, 1.0);
    if (sweep > 0) {
      canvas.drawArc(
        Rect.fromCircle(center: center, radius: radius),
        -math.pi / 2,
        sweep,
        false,
        active,
      );
    }
  }

  @override
  bool shouldRepaint(covariant _ProgressPainter oldDelegate) => oldDelegate.progress != progress;
}

class _SideButton extends StatelessWidget {
  const _SideButton({required this.onTap, required this.child});

  final VoidCallback onTap;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColors.textGrayF0,
      shape: const CircleBorder(),
      child: InkWell(
        customBorder: const CircleBorder(),
        onTap: onTap,
        child: SizedBox(width: 44, height: 44, child: Center(child: child)),
      ),
    );
  }
}
