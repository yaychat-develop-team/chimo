import 'dart:async';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../core/constants/app_assets.dart';

enum _VoicePhase { idle, recording, preview }

/// 语音签名录制页（UI 模拟）。
class VoiceNotePage extends StatefulWidget {
  const VoiceNotePage({super.key});

  static const int maxSeconds = 30;

  @override
  State<VoiceNotePage> createState() => _VoiceNotePageState();
}

class _VoiceNotePageState extends State<VoiceNotePage> {
  _VoicePhase _phase = _VoicePhase.idle;
  int _seconds = 0;
  double _progress = 0;
  DateTime? _startedAt;
  Timer? _timer;

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  String get _timeLabel {
    final m = (_seconds ~/ 60).toString().padLeft(2, '0');
    final s = (_seconds % 60).toString().padLeft(2, '0');
    return '$m:$s';
  }

  void _start() {
    _timer?.cancel();
    final started = DateTime.now();
    setState(() {
      _phase = _VoicePhase.recording;
      _seconds = 0;
      _progress = 0;
      _startedAt = started;
    });
    _timer = Timer.periodic(const Duration(milliseconds: 50), (_) {
      if (!mounted || _startedAt == null) return;
      final elapsed =
          DateTime.now().difference(_startedAt!).inMilliseconds / 1000;
      if (elapsed >= VoiceNotePage.maxSeconds) {
        setState(() {
          _seconds = VoiceNotePage.maxSeconds;
          _progress = 1;
        });
        _finishRecording();
        return;
      }
      setState(() {
        _seconds = elapsed.floor();
        _progress = elapsed / VoiceNotePage.maxSeconds;
      });
    });
  }

  void _finishRecording() {
    _timer?.cancel();
    _timer = null;
    _startedAt = null;
    if (!mounted) return;
    setState(() {
      _phase = _seconds > 0 ? _VoicePhase.preview : _VoicePhase.idle;
      if (_phase == _VoicePhase.idle) _progress = 0;
    });
  }

  void _onMainTap() {
    switch (_phase) {
      case _VoicePhase.idle:
        _start();
      case _VoicePhase.recording:
        _finishRecording();
      case _VoicePhase.preview:
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Playing preview…'),
            behavior: SnackBarBehavior.floating,
            duration: Duration(seconds: 1),
          ),
        );
    }
  }

  void _reset() {
    _timer?.cancel();
    _timer = null;
    _startedAt = null;
    setState(() {
      _phase = _VoicePhase.idle;
      _seconds = 0;
      _progress = 0;
    });
  }

  void _confirm() {
    Navigator.of(context).pop(_seconds);
  }

  @override
  Widget build(BuildContext context) {
    final bottom = MediaQuery.paddingOf(context).bottom;
    final isPreview = _phase == _VoicePhase.preview;

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Stack(
          fit: StackFit.expand,
          children: [
            Image.asset(
              AppAssets.recordBg,
              fit: BoxFit.cover,
              alignment: Alignment.topCenter,
            ),
            SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: IconButton(
                      onPressed: () => Navigator.of(context).pop(),
                      icon: SvgPicture.asset(
                        AppAssets.chatBack,
                        width: 17,
                        height: 7,
                      ),
                    ),
                  ),
                  const SizedBox(height: 36),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 28),
                    child: Text(
                      'Let your voice share your charm!',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.w700,
                        height: 1.3,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 36),
                    child: Text(
                      'You can:\n'
                      'talk about your hobbies\n'
                      'sing your favorite song\n'
                      'share something fun\n'
                      'read a heartwarming quote\n'
                      '...',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color(0xFFCFCFCF),
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                        height: 1.55,
                      ),
                    ),
                  ),
                  const Spacer(),
                  Text(
                    _timeLabel,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Color(0xFF9A9A9A),
                      fontSize: 28,
                      fontWeight: FontWeight.w500,
                      letterSpacing: 1,
                    ),
                  ),
                  const SizedBox(height: 28),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 56,
                        height: 56,
                        child: isPreview
                            ? _SideActionButton(
                                onTap: _reset,
                                child: SvgPicture.asset(
                                  AppAssets.audioRefreshIcon,
                                  width: 22,
                                  height: 20,
                                ),
                              )
                            : const SizedBox.shrink(),
                      ),
                      const SizedBox(width: 28),
                      _MainRecordButton(
                        phase: _phase,
                        progress: _progress,
                        onTap: _onMainTap,
                      ),
                      const SizedBox(width: 28),
                      SizedBox(
                        width: 56,
                        height: 56,
                        child: isPreview
                            ? _SideActionButton(
                                onTap: _confirm,
                                child: SvgPicture.asset(
                                  AppAssets.audioFinishIcon,
                                  width: 20,
                                  height: 16,
                                ),
                              )
                            : const SizedBox.shrink(),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Text(
                    switch (_phase) {
                      _VoicePhase.idle => 'Click to record.',
                      _VoicePhase.recording => 'Recording',
                      _VoicePhase.preview => 'Click to preview.',
                    },
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Color(0xFF9A9A9A),
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  SizedBox(height: 40 + bottom),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _MainRecordButton extends StatelessWidget {
  const _MainRecordButton({
    required this.phase,
    required this.progress,
    required this.onTap,
  });

  final _VoicePhase phase;
  final double progress;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final isPreview = phase == _VoicePhase.preview;
    final isRecording = phase == _VoicePhase.recording;

    return SizedBox(
      width: 104,
      height: 104,
      child: Stack(
        alignment: Alignment.center,
        children: [
          if (isRecording)
            CustomPaint(
              size: const Size(104, 104),
              painter: _RecordProgressPainter(progress: progress),
            )
          else if (isPreview)
            Container(
              width: 96,
              height: 96,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: Colors.white.withValues(alpha: 0.85),
                  width: 2,
                ),
              ),
            ),
          Material(
            color: const Color(0xFFFFD84D),
            shape: const CircleBorder(),
            child: InkWell(
              customBorder: const CircleBorder(),
              onTap: onTap,
              child: SizedBox(
                width: 88,
                height: 88,
                child: Center(
                  child: switch (phase) {
                    _VoicePhase.idle || _VoicePhase.recording =>
                      SvgPicture.asset(
                        AppAssets.audioRecordIcon,
                        width: 36,
                        height: 36,
                      ),
                    _VoicePhase.preview => SvgPicture.asset(
                        AppAssets.audioPlayingIcon,
                        width: 36,
                        height: 24,
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

class _RecordProgressPainter extends CustomPainter {
  _RecordProgressPainter({required this.progress});

  final double progress;

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 2 - 3;
    final track = Paint()
      ..color = Colors.white.withValues(alpha: 0.2)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3
      ..strokeCap = StrokeCap.round;
    final active = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3
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
  bool shouldRepaint(covariant _RecordProgressPainter oldDelegate) {
    return oldDelegate.progress != progress;
  }
}

class _SideActionButton extends StatelessWidget {
  const _SideActionButton({required this.onTap, required this.child});

  final VoidCallback onTap;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: const Color(0xFF2A2A2A),
      shape: const CircleBorder(),
      child: InkWell(
        customBorder: const CircleBorder(),
        onTap: onTap,
        child: SizedBox(
          width: 56,
          height: 56,
          child: Center(child: child),
        ),
      ),
    );
  }
}
