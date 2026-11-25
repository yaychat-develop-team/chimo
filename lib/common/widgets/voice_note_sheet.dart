import 'dart:async';
import 'dart:io';
import 'dart:math' as math;

import 'package:audioplayers/audioplayers.dart';
import 'package:chimo/common/utils/chimo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:path_provider/path_provider.dart';
import 'package:record/record.dart';

import '../../app/app_jumper.dart';
import '../constants/app_assets.dart';
import '../models/voice_note_result.dart';
import '../theme/app_bottom_sheet.dart';
import '../theme/app_colors.dart';
import '../utils/app_audio_playback.dart';
import '../utils/app_log.dart';
import '../utils/app_toast.dart';
import '../utils/time_fmt.dart';

enum _VoicePhase { idle, recording, preview }

/// 资料页 / 神秘卡共用的 Voice Note 录制弹层。
class VoiceNoteSheet extends StatefulWidget {
  const VoiceNoteSheet({super.key});

  static const int maxSeconds = 30;

  static Future<VoiceNoteResult?> show() {
    return AppBottomSheet.show<VoiceNoteResult>(
      isScrollControlled: true,
      enableDrag: true,
      child: const VoiceNoteSheet(),
    );
  }

  @override
  State<VoiceNoteSheet> createState() => _VoiceNoteSheetState();
}

class _VoiceNoteSheetState extends State<VoiceNoteSheet> {
  final AudioRecorder _recorder = AudioRecorder();
  final AudioPlayer _player = AudioPlayer();

  _VoicePhase _phase = _VoicePhase.idle;
  int _seconds = 0;
  double _progress = 0;
  DateTime? _startedAt;
  Timer? _timer;
  String? _voicePath;
  bool _previewPlaying = false;
  bool _confirmed = false;
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
    _player.dispose();
    _recorder.dispose();
    if (!_confirmed) _deleteFile(_voicePath);
    super.dispose();
  }

  void _exclusiveStop() {
    _player.stop();
    if (!mounted) {
      _previewPlaying = false;
      return;
    }
    setState(() => _previewPlaying = false);
  }

  String get _timeLabel => TimeFmt.duration(_seconds);

  String get _hintText {
    switch (_phase) {
      case _VoicePhase.idle:
        return 'Click to record';
      case _VoicePhase.recording:
        return 'Recording';
      case _VoicePhase.preview:
        return 'Click to play';
    }
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
    } catch (error, stack) {
      AppLog.w('VoiceNote stop record failed', error: error, stack: stack);
    }
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
        AppToast.error('Microphone permission is required');
        return;
      }
      await _player.stop();
      await _stopRecorderIfNeeded(deleteFile: true);
      final dir = await getTemporaryDirectory();
      final path = '${dir.path}/chimo_voice_note_${DateTime.now().millisecondsSinceEpoch}.m4a';
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
        final elapsed = DateTime.now().difference(_startedAt!).inMilliseconds / 1000;
        if (elapsed >= VoiceNoteSheet.maxSeconds) {
          setState(() {
            _seconds = VoiceNoteSheet.maxSeconds;
            _progress = 1;
          });
          _finishRecording();
          return;
        }
        setState(() {
          _seconds = elapsed.floor();
          _progress = elapsed / VoiceNoteSheet.maxSeconds;
        });
      });
    } catch (error) {
      AppLog.w('Start voice note failed', error: error);
      if (!mounted) return;
      AppToast.error('Could not start recording: $error');
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
      AppLog.w('Stop voice note failed', error: error);
    }
    if (!mounted) return;
    final secs = started == null
        ? _seconds
        : DateTime.now().difference(started).inMilliseconds / 1000;
    final duration = secs.floor().clamp(0, VoiceNoteSheet.maxSeconds);
    setState(() {
      _seconds = duration;
      _progress = duration / VoiceNoteSheet.maxSeconds;
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
      AppLog.w('Preview voice note failed', error: error);
      AppVoiceExclusive.release(_exclusiveStop);
      if (!mounted) return;
      AppToast.error('Preview failed: $error');
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
      AppToast.error('Please record at least 1 second');
      return;
    }
    await _player.stop();
    if (!mounted) return;
    _confirmed = true;
    AppJumper.back(
      result: VoiceNoteResult(path: path, seconds: seconds),
    );
  }

  @override
  Widget build(BuildContext context) {
    final isPreview = _phase == _VoicePhase.preview;

    // 各态共用同一套占位高度，避免录制 ↔ 预览切换时整体上下跳。
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(24.w).copyWith(top: 0),
      decoration: const BoxDecoration(
        color: AppColors.black0F0F0F,
        borderRadius: BorderRadius.vertical(top: Radius.circular(36)),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.topRight,
          colors: [Color(0xFF12382C), Color(0xFF0F0F14), Color(0xFF1A1630)],
          stops: [0.0, 0.45, 1.0],
        ),
      ),
      child: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              height: 66,
              alignment: .center,
              child: const Text(
                'Voice Note',
                style: TextStyle(color: AppColors.white, fontSize: 20, fontWeight: FontWeight.w700),
              ),
            ),
            SizedBox(
              height: 48.w,
              width: double.infinity,
              child: Column(
                mainAxisAlignment: .spaceBetween,
                children: [
                  SizedBox(
                    height: 20.w,
                    child: isPreview
                        ? Chimo.image(
                            AppAssets.voiceWaveLine,
                            width: 60.w,
                            fit: BoxFit.contain,
                            color: AppColors.white,
                          )
                        : null,
                  ),
                  Text(
                    _timeLabel,
                    style: const TextStyle(
                      color: AppColors.white50,
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                      letterSpacing: 1,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 28),
            SizedBox(
              height: _RecordButton.outer,
              child: isPreview
                  ? _PreviewControls(
                      playing: _previewPlaying,
                      onReset: _reset,
                      onPlay: _togglePreview,
                      onConfirm: _confirm,
                    )
                  : _RecordButton(
                      recording: _phase == _VoicePhase.recording,
                      progress: _progress,
                      onTap: _onMainTap,
                    ),
            ),
            const SizedBox(height: 20),
            Text(
              _hintText,
              style: const TextStyle(
                color: AppColors.gray9A9A9A,
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _RecordButton extends StatelessWidget {
  const _RecordButton({required this.recording, required this.progress, required this.onTap});

  final bool recording;
  final double progress;
  final VoidCallback onTap;

  // 与预览态中心钮同径，避免录完瞬间缩小；设计约 68–72。
  static const double outer = 84;
  static const double fill = 70;
  static const Color accent = Color(0xFF00FB8E);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: outer,
      height: outer,
      child: Stack(
        alignment: Alignment.center,
        children: [
          CustomPaint(
            size: const Size(outer, outer),
            painter: _RecordProgressPainter(
              progress: recording ? progress : 0,
              recording: recording,
              fillSize: fill,
            ),
          ),
          Material(
            color: accent,
            shape: const CircleBorder(),
            child: InkWell(
              customBorder: const CircleBorder(),
              onTap: onTap,
              child: SizedBox(
                width: fill,
                height: fill,
                child: Icon(
                  recording ? Icons.graphic_eq_rounded : Icons.mic_none_rounded,
                  color: AppColors.black,
                  size: recording ? 36 : 40,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _PreviewControls extends StatelessWidget {
  const _PreviewControls({
    required this.playing,
    required this.onReset,
    required this.onPlay,
    required this.onConfirm,
  });

  final bool playing;
  final VoidCallback onReset;
  final VoidCallback onPlay;
  final VoidCallback onConfirm;

  static const double _barH = 56;
  static const double _side = 44;
  static const Color _barColor = Color(0xFF323232);

  @override
  Widget build(BuildContext context) {
    const center = _RecordButton.fill;
    // 设计：灰胶囊中间鼓起包住绿钮，绿钮仅略高出胶囊约 5–7。
    return SizedBox(
      height: _RecordButton.outer,
      width: 248,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            width: 248,
            height: _barH,
            decoration: BoxDecoration(
              color: _barColor,
              borderRadius: BorderRadius.circular(_barH / 2),
            ),
          ),
          Container(
            width: center + 6,
            height: center + 6,
            decoration: const BoxDecoration(color: _barColor, shape: BoxShape.circle),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _SideCircleButton(
                size: _side,
                onTap: onReset,
                child: const Icon(Icons.refresh_rounded, color: AppColors.white, size: 22),
              ),
              const SizedBox(width: 28),
              Material(
                color: _RecordButton.accent,
                shape: const CircleBorder(),
                child: InkWell(
                  customBorder: const CircleBorder(),
                  onTap: onPlay,
                  child: SizedBox(
                    width: center,
                    height: center,
                    child: Icon(
                      playing ? Icons.pause_rounded : Icons.play_arrow_rounded,
                      color: AppColors.black,
                      size: playing ? 32 : 36,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 28),
              _SideCircleButton(
                size: _side,
                onTap: onConfirm,
                child: const Icon(Icons.check_rounded, color: AppColors.white, size: 22),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _SideCircleButton extends StatelessWidget {
  const _SideCircleButton({required this.onTap, required this.child, this.size = 44});

  final VoidCallback onTap;
  final Widget child;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: const Color(0xFF3A3A3A),
      shape: const CircleBorder(),
      child: InkWell(
        customBorder: const CircleBorder(),
        onTap: onTap,
        child: SizedBox(
          width: size,
          height: size,
          child: Center(child: child),
        ),
      ),
    );
  }
}

class _RecordProgressPainter extends CustomPainter {
  _RecordProgressPainter({required this.progress, required this.recording, required this.fillSize});

  final double progress;
  final bool recording;
  final double fillSize;

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final fillR = fillSize / 2;
    // 环心相对按钮外沿只外扩 4，避免中间空洞过大。
    final ringR = fillR + 4;

    // 设计：未录制外沿是深灰轨道；录音中同轨道上扫绿色进度。
    final trackColor = AppColors.rgba(255, 255, 255, 0.2);
    final progressColor = AppColors.green00FEA8;
    final track = Paint()
      ..color = trackColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2
      ..strokeCap = StrokeCap.round;
    canvas.drawCircle(center, ringR, track);

    if (!recording) return;
    final sweep = 2 * math.pi * progress.clamp(0.0, 1.0);
    if (sweep <= 0) return;
    final active = Paint()
      ..color = progressColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3
      ..strokeCap = StrokeCap.round;
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: ringR),
      -math.pi / 2,
      sweep,
      false,
      active,
    );
  }

  @override
  bool shouldRepaint(covariant _RecordProgressPainter oldDelegate) {
    return oldDelegate.progress != progress ||
        oldDelegate.recording != recording ||
        oldDelegate.fillSize != fillSize;
  }
}
