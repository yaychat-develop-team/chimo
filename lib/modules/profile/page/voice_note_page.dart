import 'dart:async';
import 'dart:io';
import 'dart:math' as math;

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:record/record.dart';

import '../../../common/utils/app_audio_playback.dart';
import '../../../common/constants/app_assets.dart';
import '../../../common/theme/app_colors.dart';
import '../../../common/theme/app_text.dart';
import '../../../common/utils/app_log.dart';
import '../../../common/widgets/app_image.dart';
import '../model/voice_note_result.dart';
import '../../../app/app_jumper.dart';
import '../../../common/utils/time_fmt.dart';
import '../../../common/utils/app_toast.dart';
import '../../../common/widgets/app_scaffold.dart';

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

  String get _timeLabel => TimeFmt.duration(_seconds);

  void _deleteFile(String? path) {
    final p = path?.trim() ?? '';
    if (p.isEmpty) return;
    try {
      final f = File(p);
      if (f.existsSync()) f.deleteSync();
    } catch (_) {
      // 录音临时文件删不掉不影响功能。
    }
  }

  Future<void> _stopRecorderIfNeeded({required bool deleteFile}) async {
    try {
      if (await _recorder.isRecording()) {
        final path = await _recorder.stop();
        if (path != null && path.isNotEmpty) _voicePath = path;
      }
    } catch (error, stack) {
      // 停止录音失败 = 这段语音签名保不下来（与两个输入栏同处理）。
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
      AppLog.w('Start profile voice failed', error: error);
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
      AppLog.w('Stop profile voice failed', error: error);
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
      AppLog.w('Preview profile voice failed', error: error);
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
    AppJumper.back(
      result: VoiceNoteResult(path: path, seconds: seconds),
    );
  }

  @override
  Widget build(BuildContext context) {
    final bottom = MediaQuery.paddingOf(context).bottom;
    final isPreview = _phase == _VoicePhase.preview;

    return ChimoScaffold(
      backgroundColor: Colors.black,
      backdrop: AppImage(
        AppAssets.recordBg,
        fit: BoxFit.cover,
        alignment: Alignment.topCenter,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
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
                color: AppColors.textGrayCF,
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
              color: AppColors.textSecondary,
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
                        child: AppImage(
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
                        child: AppImage(
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
              _VoicePhase.preview =>
                _previewPlaying ? 'Playing…' : 'Click to preview.',
            },
            textAlign: TextAlign.center,
            style: AppText.body,
          ),
          SizedBox(height: 40 + bottom),
        ],
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
            color: AppColors.warningGold,
            shape: const CircleBorder(),
            child: InkWell(
              customBorder: const CircleBorder(),
              onTap: onTap,
              child: SizedBox(
                width: 88,
                height: 88,
                child: Center(
                  child: switch (phase) {
                    _VoicePhase.idle || _VoicePhase.recording => AppImage(
                      AppAssets.audioRecordIcon,
                      width: 36,
                      height: 36,
                      fit: BoxFit.contain,
                    ),
                    _VoicePhase.preview => AppImage(
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
      color: AppColors.tagBackground,
      shape: const CircleBorder(),
      child: InkWell(
        customBorder: const CircleBorder(),
        onTap: onTap,
        child: SizedBox(width: 56, height: 56, child: Center(child: child)),
      ),
    );
  }
}
