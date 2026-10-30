import 'dart:math' as math;

import 'package:flutter/material.dart';

import '../../../../../common/constants/app_assets.dart';
import '../../../../../common/theme/app_colors.dart';
import '../../../../../common/widgets/app_image.dart';
import 'package:chimo/common/utils/chimo.dart';

/// 相位机在 `ChatInputBar` 那边（开录 / 停录 / 试听 / 重录 / 确认），面板只按相位画。
enum ChatVoicePhase { idle, recording, preview }

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
      color: AppColors.grayB0B0B0,
      fontSize: 15,
      fontWeight: FontWeight.w500,
      height: 18 / 15,
    ),
    labelStyle: TextStyle(
      color: AppColors.grayB0B0B0,
      fontSize: 14,
      fontWeight: FontWeight.w400,
      height: 18 / 14,
    ),
    iconFit: BoxFit.contain,
  );

  static const ChatVoicePanelStyle group = ChatVoicePanelStyle(
    timeStyle: TextStyle(color: AppColors.grayB0B0B0, fontSize: 15, fontWeight: FontWeight.w500),
    labelStyle: TextStyle(color: AppColors.grayB0B0B0, fontSize: 14),
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
                      child: Chimo.image(
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
                      child: Chimo.image(
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
            color: AppColors.yellowFFE74F,
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
                    ChatVoicePhase.idle || ChatVoicePhase.recording => Chimo.image(
                      AppAssets.audioRecordIcon,
                      width: 42,
                      height: 42,
                      fit: iconFit,
                    ),
                    // 设计：波形
                    ChatVoicePhase.preview => Chimo.image(
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
      ..color = AppColors.grayE8E8E8
      ..style = PaintingStyle.stroke
      ..strokeWidth = stroke;
    final active = Paint()
      ..color = AppColors.yellowFFE74F
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
      color: AppColors.grayF0F0F0,
      shape: const CircleBorder(),
      child: InkWell(
        customBorder: const CircleBorder(),
        onTap: onTap,
        child: SizedBox(width: 44, height: 44, child: Center(child: child)),
      ),
    );
  }
}
