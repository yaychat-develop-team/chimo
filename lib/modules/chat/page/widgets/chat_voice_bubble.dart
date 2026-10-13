import 'dart:math' as math;

import 'package:flutter/material.dart';

import '../../../../common/theme/app_colors.dart';
import '../../logic/chat_voice_playback.dart';

/// 以私聊实现为基准，两边的差异只剩一个参数：[locked] —— 群聊未加入时点了
/// 不播（私聊不传，默认 false）。
///
/// 长按菜单**不在这里**： 之后两边的长按都由 `ChatMessageList` 在气泡外面
/// 少一条参数）。头像 / 失败感叹号那一行同理，也在 `ChatMessageList` 里。
///
/// 播放逻辑在 [ChatVoicePlayback]（一条气泡一份），这里只剩画和波形动画 ——
/// 波形要 `vsync`，所以 [AnimationController] 留在 widget 里。
class ChatVoiceBubble extends StatefulWidget {
  const ChatVoiceBubble({
    super.key,
    required this.isSelf,
    required this.seconds,
    this.mediaSource = '',
    this.msgId = '',
    this.locked = false,
  });

  final bool isSelf;
  final int seconds;
  final String mediaSource;
  final String msgId;
  final bool locked;

  @override
  State<ChatVoiceBubble> createState() => _ChatVoiceBubbleState();
}

class _ChatVoiceBubbleState extends State<ChatVoiceBubble>
    with SingleTickerProviderStateMixin {
  late final ChatVoicePlayback _playback;
  late final AnimationController _waveController;

  @override
  void initState() {
    super.initState();
    _waveController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 700),
    );
    _playback = ChatVoicePlayback(
      seconds: widget.seconds,
      mediaSource: widget.mediaSource,
      msgId: widget.msgId,
    )..addListener(_onPlaybackChanged);
  }

  @override
  void didUpdateWidget(covariant ChatVoiceBubble oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.seconds != oldWidget.seconds ||
        widget.mediaSource != oldWidget.mediaSource ||
        widget.msgId != oldWidget.msgId) {
      _playback.retarget(
        seconds: widget.seconds,
        mediaSource: widget.mediaSource,
        msgId: widget.msgId,
      );
    }
  }

  @override
  void dispose() {
    _playback.removeListener(_onPlaybackChanged);
    // 状态机先 dispose：它要停播放器、摘全局互斥登记。
    _playback.dispose();
    _waveController.dispose();
    super.dispose();
  }

  /// 波形跟着播放状态走。
  void _onPlaybackChanged() {
    if (!mounted) return;
    if (_playback.playing) {
      if (!_waveController.isAnimating) _waveController.repeat();
    } else {
      _waveController.stop();
      _waveController.reset();
    }
    setState(() {});
  }

  Future<void> _togglePlay() async {
    if (widget.locked) return;
    await _playback.toggle();
  }

  @override
  Widget build(BuildContext context) {
    final isSelf = widget.isSelf;
    final playing = _playback.playing;
    final displaySeconds = playing ? _playback.remaining : widget.seconds;
    final expired = _playback.expired;
    final secs = widget.seconds.clamp(1, 60);

    return GestureDetector(
      onTap: (expired || widget.locked) ? null : _togglePlay,
      behavior: HitTestBehavior.opaque,
      child: Container(
        width: expired ? 140 : (80 + secs * (200 - 80) / 60).clamp(80.0, 200.0),
        height: 40,
        padding: const EdgeInsets.symmetric(horizontal: 12),
        decoration: BoxDecoration(
          color: isSelf ? AppColors.accentLimeSoft : AppColors.textGrayF0,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(isSelf ? 16 : 4),
            topRight: Radius.circular(isSelf ? 4 : 16),
            bottomLeft: const Radius.circular(16),
            bottomRight: const Radius.circular(16),
          ),
        ),
        // 对齐 forya：波形在左，时长在右（spaceBetween）。
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            if (expired)
              const Expanded(
                child: Text(
                  'Voice expired',
                  style: TextStyle(
                    color: AppColors.textGray66,
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              )
            else ...[
              _VoiceBarsIcon(playing: playing, animation: _waveController),
              Text(
                '${displaySeconds > 0 ? displaySeconds : widget.seconds}s',
                style: const TextStyle(
                  color: AppColors.surfaceDark,
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}

/// 设计：语音气泡左侧三条波形；播放时动画。
class _VoiceBarsIcon extends StatelessWidget {
  const _VoiceBarsIcon({this.playing = false, this.animation});

  final bool playing;
  final Animation<double>? animation;

  @override
  Widget build(BuildContext context) {
    if (!playing || animation == null) {
      return const SizedBox(
        width: 16,
        height: 16,
        child: CustomPaint(painter: _VoiceBarsPainter()),
      );
    }
    return AnimatedBuilder(
      animation: animation!,
      builder: (context, _) {
        return SizedBox(
          width: 16,
          height: 16,
          child: CustomPaint(
            painter: _VoiceBarsPainter(
              phase: animation!.value * 2 * math.pi,
              playing: true,
            ),
          ),
        );
      },
    );
  }
}

class _VoiceBarsPainter extends CustomPainter {
  const _VoiceBarsPainter({this.phase = 0, this.playing = false});

  final double phase;
  final bool playing;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = AppColors.surfaceDark
      ..style = PaintingStyle.fill
      ..strokeCap = StrokeCap.round;

    const widths = 2.4;
    final base = [size.height * 0.45, size.height, size.height * 0.62];
    final gap = (size.width - widths * 3) / 2;
    for (var i = 0; i < 3; i++) {
      var h = base[i];
      if (playing) {
        final pulse = 0.55 + 0.45 * ((math.sin(phase + i * 1.7) + 1) / 2);
        h = size.height * (0.28 + 0.72 * pulse * (base[i] / size.height));
      }
      final x = i * (widths + gap);
      final y = (size.height - h) / 2;
      canvas.drawRRect(
        RRect.fromRectAndRadius(
          Rect.fromLTWH(x, y, widths, h),
          const Radius.circular(1.2),
        ),
        paint,
      );
    }
  }

  @override
  bool shouldRepaint(covariant _VoiceBarsPainter oldDelegate) {
    return oldDelegate.phase != phase || oldDelegate.playing != playing;
  }
}
