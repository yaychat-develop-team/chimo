import 'dart:async';
import 'dart:io';
import 'dart:math' as math;

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:path_provider/path_provider.dart';
import 'package:record/record.dart';

import '../../core/audio/app_audio_playback.dart';
import '../../core/constants/app_assets.dart';

/// 用户确认录音后返回的结果。
class VoiceNoteResult {
  const VoiceNoteResult({required this.path, required this.seconds});

  final String path;
  final int seconds;
}

enum _VoicePhase { idle, recording, preview }

/// 语音签名录制页：麦克风 → 预览 → 确认。
class VoiceNotePage extends StatefulWidget {
  const VoiceNotePage({super.key});

  static const int maxSeconds = 30;

  @override
  State<VoiceNotePage> createState() => _VoiceNotePageState();
}

class _VoiceNotePageState extends State<VoiceNotePage> {
  final AudioRecorder _recorder = AudioRecorder();
  final AudioPlayer _player = AudioPlayer();

  _VoicePhase _phase = _VoicePhase.idle;
  int _seconds = 0;
  double _progress = 0;
  DateTime? _startedAt;
  Timer? _timer;
  String? _voicePath;
  bool _previewPlaying = false;
  StreamSubscription<void>? _playerCompleteSub;

  @override
  void initState() {
    super.initState();
    _playerCompleteSub = _player.onPlayerComplete.listen((_) {
      AppVoiceExclusive.release(_exclusiveStop);
      if (!mounted) return;
      setState(() => _previewPlaying = false);
    });
  }

  @override
  void dispose() {
    AppVoiceExclusive.release(_exclusiveStop);
    _timer?.cancel();
    _playerCompleteSub?.cancel();
    unawaited(_player.dispose());
    unawaited(_recorder.dispose());
    super.dispose();
  }

  void _exclusiveStop() {
    unawaited(_player.stop());
    if (!mounted) {
      _previewPlaying = false;
      return;
    }
    setState(() => _previewPlaying = false);
  }

  String get _timeLabel {
    final m = (_seconds ~/ 60).toString().padLeft(2, '0');
    final s = (_seconds % 60).toString().padLeft(2, '0');
    return '$m:$s';
  }

  void _deleteFile(String? path) {
    final p = path?.trim() ?? '';
    if (p.isEmpty) return;
    try {
      final f = File(p);
      if (f.existsSync()) f.deleteSync();
    } catch (_) {}
  }

  Future<void> _stopRecorderIfNeeded({required bool deleteFile}) async {
    try {
      if (await _recorder.isRecording()) {
        final path = await _recorder.stop();
        if (path != null && path.isNotEmpty) _voicePath = path;
      }
    } catch (_) {}
    if (deleteFile) {
      _deleteFile(_voicePath);
      _voicePath = null;
    }
  }

  Future<void> _start() async {
    try {
      AppVoiceExclusive.stopActive();
      final ok = await _recorder.hasPermission();
      if (!ok) {
        if (!mounted) return;
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Microphone permission is required'),
            behavior: SnackBarBehavior.floating,
          ),
        );
        return;
      }
      await _player.stop();
      await _stopRecorderIfNeeded(deleteFile: true);
      final dir = await getTemporaryDirectory();
      final path =
          '${dir.path}/chimo_profile_voice_${DateTime.now().millisecondsSinceEpoch}.m4a';
      await _recorder.start(
        const RecordConfig(
          encoder: AudioEncoder.aacLc,
          bitRate: 128000,
          sampleRate: 44100,
          numChannels: 1,
        ),
        path: path,
      );
      _voicePath = path;
      _timer?.cancel();
      final started = DateTime.now();
      if (!mounted) return;
      setState(() {
        _phase = _VoicePhase.recording;
        _seconds = 0;
        _progress = 0;
        _startedAt = started;
        _previewPlaying = false;
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
          unawaited(_finishRecording());
          return;
        }
        setState(() {
          _seconds = elapsed.floor();
          _progress = elapsed / VoiceNotePage.maxSeconds;
        });
      });
    } catch (error) {
      debugPrint('Start profile voice failed: $error');
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Could not start recording: $error'),
          behavior: SnackBarBehavior.floating,
        ),
      );
    }
  }

  Future<void> _finishRecording() async {
    _timer?.cancel();
    _timer = null;
    final started = _startedAt;
    _startedAt = null;
    try {
      if (await _recorder.isRecording()) {
        final path = await _recorder.stop();
        if (path != null && path.isNotEmpty) _voicePath = path;
      }
    } catch (error) {
      debugPrint('Stop profile voice failed: $error');
    }
    if (!mounted) return;
    final secs = started == null
        ? _seconds
        : DateTime.now().difference(started).inMilliseconds / 1000;
    final duration = secs.floor().clamp(0, VoiceNotePage.maxSeconds);
    setState(() {
      _seconds = duration;
      _progress = duration / VoiceNotePage.maxSeconds;
      _phase = duration > 0 && (_voicePath?.isNotEmpty ?? false)
          ? _VoicePhase.preview
          : _VoicePhase.idle;
      if (_phase == _VoicePhase.idle) {
        _deleteFile(_voicePath);
        _voicePath = null;
        _progress = 0;
      }
    });
  }

  Future<void> _onMainTap() async {
    switch (_phase) {
      case _VoicePhase.idle:
        await _start();
      case _VoicePhase.recording:
        await _finishRecording();
      case _VoicePhase.preview:
        await _togglePreview();
    }
  }

  Future<void> _togglePreview() async {
    final path = _voicePath;
    if (path == null || path.isEmpty) return;
    try {
      if (_previewPlaying) {
        AppVoiceExclusive.release(_exclusiveStop);
        await _player.stop();
        if (!mounted) return;
        setState(() => _previewPlaying = false);
        return;
      }
      AppVoiceExclusive.claim(_exclusiveStop);
      await AppAudioPlayback.play(_player, path);
      if (!mounted) return;
      setState(() => _previewPlaying = true);
    } catch (error) {
      debugPrint('Preview profile voice failed: $error');
      AppVoiceExclusive.release(_exclusiveStop);
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Preview failed: $error'),
          behavior: SnackBarBehavior.floating,
        ),
      );
    }
  }

  Future<void> _reset() async {
    AppVoiceExclusive.release(_exclusiveStop);
    await _player.stop();
    await _stopRecorderIfNeeded(deleteFile: true);
    _timer?.cancel();
    _timer = null;
    _startedAt = null;
    if (!mounted) return;
    setState(() {
      _phase = _VoicePhase.idle;
      _seconds = 0;
      _progress = 0;
      _voicePath = null;
      _previewPlaying = false;
    });
  }

  Future<void> _confirm() async {
    if (_phase == _VoicePhase.recording) {
      await _finishRecording();
    }
    final seconds = _seconds;
    final path = _voicePath?.trim() ?? '';
    if (seconds < 1 || path.isEmpty) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please record at least 1 second'),
          behavior: SnackBarBehavior.floating,
        ),
      );
      return;
    }
    await _player.stop();
    if (!mounted) return;
    Navigator.of(context).pop(VoiceNoteResult(path: path, seconds: seconds));
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
                                onTap: () => unawaited(_reset()),
                                child: Image.asset(
                                  AppAssets.audioRefreshIcon,
                                  width: 24,
                                  height: 24,
                                  fit: BoxFit.contain,
                                ),
                              )
                            : const SizedBox.shrink(),
                      ),
                      const SizedBox(width: 28),
                      _MainRecordButton(
                        phase: _phase,
                        progress: _progress,
                        previewPlaying: _previewPlaying,
                        onTap: () => unawaited(_onMainTap()),
                      ),
                      const SizedBox(width: 28),
                      SizedBox(
                        width: 56,
                        height: 56,
                        child: isPreview
                            ? _SideActionButton(
                                onTap: () => unawaited(_confirm()),
                                child: Image.asset(
                                  AppAssets.audioFinishIcon,
                                  width: 24,
                                  height: 24,
                                  fit: BoxFit.contain,
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
                      _VoicePhase.preview => _previewPlaying
                          ? 'Playing…'
                          : 'Click to preview.',
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
    required this.previewPlaying,
    required this.onTap,
  });

  final _VoicePhase phase;
  final double progress;
  final bool previewPlaying;
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
                    _VoicePhase.idle || _VoicePhase.recording => Image.asset(
                        AppAssets.audioRecordIcon,
                        width: 36,
                        height: 36,
                        fit: BoxFit.contain,
                      ),
                    _VoicePhase.preview => Image.asset(
                        previewPlaying
                            ? AppAssets.voiceWaveAnim
                            : AppAssets.audioPlayingIcon,
                        width: previewPlaying ? 48 : 36,
                        height: previewPlaying ? 14 : 28,
                        fit: BoxFit.contain,
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
