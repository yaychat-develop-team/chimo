import 'dart:async';
import 'dart:math' as math;

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../common/constants/app_assets.dart';
import '../../../common/theme/app_colors.dart';
import '../../../common/utils/app_audio_playback.dart';
import '../../../common/utils/app_log.dart';
import '../../../common/utils/app_toast.dart';
import '../../../common/utils/chimo.dart';
import '../../../common/widgets/app_image.dart';

/// 神秘卡 CD 头像。对齐 joyride `AudioCdWidget`。
///
/// [compact]：详情页底部缩略图（白底圆角盒）；否则为语音条左侧碟片。
class RevealCardAudioCd extends StatefulWidget {
  const RevealCardAudioCd({
    super.key,
    required this.avatar,
    this.playing = false,
    this.compact = false,
  });

  final String avatar;
  final bool playing;
  final bool compact;

  @override
  State<RevealCardAudioCd> createState() => _RevealCardAudioCdState();
}

class _RevealCardAudioCdState extends State<RevealCardAudioCd>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: const Duration(seconds: 10));
    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) _controller.repeat();
    });
    _syncRotation();
  }

  @override
  void didUpdateWidget(covariant RevealCardAudioCd oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.playing != widget.playing) _syncRotation();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _syncRotation() {
    if (widget.playing) {
      if (!_controller.isAnimating) _controller.forward();
    } else if (_controller.isAnimating) {
      _controller.stop();
    }
  }

  @override
  Widget build(BuildContext context) {
    final disc = widget.compact ? 48.w : 60.w;
    final face = widget.compact ? 20.w : 26.w;
    final body = Stack(
      children: [
        Padding(
          padding: EdgeInsetsDirectional.only(
            end: 6.w,
            start: widget.compact ? 6.w : 0,
          ),
          child: SizedBox(
            width: disc,
            height: disc,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Chimo.image(AppAssets.htCdBg, width: disc, height: disc),
                RotationTransition(
                  turns: _controller,
                  child: AppImage.avatar(widget.avatar, size: face),
                ),
              ],
            ),
          ),
        ),
        PositionedDirectional(
          top: 2.w,
          end: 0,
          child: Chimo.image(
            widget.playing ? AppAssets.htCdPlay : AppAssets.htCdPause,
            width: widget.compact ? 18.w : 24.w,
            fit: BoxFit.fitWidth,
          ),
        ),
      ],
    );
    if (!widget.compact) return body;
    return Container(
      width: 72.w,
      height: 72.w,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: AppColors.white10,
        borderRadius: BorderRadius.circular(12.w),
      ),
      child: body,
    );
  }
}

/// 神秘卡详情「Her voice」播放条。对齐 joyride `CdPlayerWidget`。
class RevealCardCdPlayer extends StatefulWidget {
  const RevealCardCdPlayer({
    super.key,
    required this.url,
    required this.seconds,
    required this.avatar,
  });

  final String url;
  final int seconds;
  final String avatar;

  @override
  State<RevealCardCdPlayer> createState() => _RevealCardCdPlayerState();
}

class _RevealCardCdPlayerState extends State<RevealCardCdPlayer> {
  final AudioPlayer _player = AudioPlayer();
  StreamSubscription<void>? _completeSub;
  StreamSubscription<Duration>? _positionSub;
  var _playing = false;
  var _elapsed = 0;

  late final void Function() _exclusiveStop = _stop;

  @override
  void initState() {
    super.initState();
    _completeSub = _player.onPlayerComplete.listen((_) => _stop(resetOnly: true));
    _positionSub = _player.onPositionChanged.listen((pos) {
      if (!mounted) return;
      setState(() => _elapsed = pos.inSeconds);
    });
  }

  @override
  void dispose() {
    AppVoiceExclusive.release(_exclusiveStop);
    _completeSub?.cancel();
    _positionSub?.cancel();
    _player.dispose();
    super.dispose();
  }

  Future<void> _stop({bool resetOnly = false}) async {
    AppVoiceExclusive.release(_exclusiveStop);
    if (!resetOnly) {
      try {
        await _player.stop();
      } catch (_) {}
    }
    if (!mounted) {
      _playing = false;
      _elapsed = 0;
      return;
    }
    setState(() {
      _playing = false;
      _elapsed = 0;
    });
  }

  Future<void> _toggle() async {
    if (_playing) {
      await _stop();
      return;
    }
    final source = widget.url.trim();
    if (source.isEmpty) {
      AppToast.info('Voice file unavailable');
      return;
    }
    try {
      AppVoiceExclusive.claim(_exclusiveStop);
      await AppAudioPlayback.play(_player, source);
      if (!mounted) return;
      setState(() {
        _playing = true;
        _elapsed = 0;
      });
    } catch (e) {
      AppLog.w('Reveal card voice play failed', error: e);
      AppVoiceExclusive.release(_exclusiveStop);
      if (mounted) AppToast.info('Playback failed');
    }
  }

  @override
  Widget build(BuildContext context) {
    final remain = math.max(0, widget.seconds - _elapsed);
    return GestureDetector(
      onTap: _toggle,
      behavior: HitTestBehavior.opaque,
      child: Padding(
        padding: EdgeInsetsDirectional.only(bottom: 12.w),
        child: Stack(
          alignment: AlignmentDirectional.centerStart,
          children: [
            Container(
              height: 60.w,
              padding: EdgeInsetsDirectional.only(start: 72.w, end: 25.w),
              decoration: ShapeDecoration(
                shape: const StadiumBorder(),
                gradient: LinearGradient(
                  colors: [
                    AppColors.pinkFC5CC6.withValues(alpha: 0.1),
                    AppColors.pinkFC475F.withValues(alpha: 0.1),
                  ],
                ),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Chimo.image(
                    _playing
                        ? AppAssets.htVoicePlayBlackLong
                        : AppAssets.htVoicePauseBlackLong,
                    width: 50.w,
                    fit: BoxFit.fitWidth,
                  ),
                  SizedBox(width: 10.w),
                  ConstrainedBox(
                    constraints: const BoxConstraints(minWidth: 20),
                    child: Text(
                      '$remain"',
                      style: TextStyle(
                        color: AppColors.white,
                        fontSize: 13.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            RevealCardAudioCd(avatar: widget.avatar, playing: _playing),
          ],
        ),
      ),
    );
  }
}
