import 'dart:async';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../app/app_jumper.dart';
import '../../../../common/constants/app_assets.dart';
import '../../../../common/models/server_client/message.pb.dart';
import '../../../../common/theme/app_colors.dart';
import '../../../../common/utils/app_audio_playback.dart';

/// 新人进房弹窗。`NewbieUserJoinDialog`（音效改本地 AssetSource）。
abstract final class RoomNewbieJoinDialog {
  static bool _showing = false;

  static Future<void> show(RoomUserJoin info) async {
    if (_showing) return;
    _showing = true;
    try {
      await Get.dialog<void>(
        _NewbieJoinBody(info: info),
        barrierDismissible: true,
        barrierColor: AppColors.black.withValues(alpha: 0.7),
      );
    } finally {
      _showing = false;
    }
  }
}

class _NewbieJoinBody extends StatefulWidget {
  const _NewbieJoinBody({required this.info});

  final RoomUserJoin info;

  @override
  State<_NewbieJoinBody> createState() => _NewbieJoinBodyState();
}

class _NewbieJoinBodyState extends State<_NewbieJoinBody> {
  final AudioPlayer _player = AudioPlayer();
  Timer? _timer;
  StreamSubscription<void>? _completeSub;
  var _loopLeft = 10;

  @override
  void initState() {
    super.initState();
    // 对齐 joyride：弹窗出现约 3s 后再播提示音。
    _timer = Timer(const Duration(seconds: 3), _startTipsAudio);
  }

  Future<void> _startTipsAudio() async {
    if (!mounted) return;
    try {
      await AppAudioPlayback.prepare(_player);
      await _player.setReleaseMode(ReleaseMode.stop);
      _completeSub = _player.onPlayerComplete.listen((_) async {
        if (!mounted) return;
        _loopLeft--;
        if (_loopLeft <= 0) return;
        await _player.play(_assetSource);
      });
      await _player.play(_assetSource);
    } catch (_) {
      // 音效失败不影响弹窗。
    }
  }

  /// audioplayers 的 AssetSource 路径不含 `assets/` 前缀。
  Source get _assetSource {
    const full = AppAssets.romanceInviteTipsMp3;
    final path = full.startsWith('assets/') ? full.substring(7) : full;
    return AssetSource(path);
  }

  @override
  void dispose() {
    _timer?.cancel();
    _completeSub?.cancel();
    _player.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final name = widget.info.hasUser() && widget.info.user.nickname.trim().isNotEmpty
        ? widget.info.user.nickname.trim()
        : 'Someone';
    return Dialog(
      backgroundColor: AppColors.white,
      insetPadding: const EdgeInsets.symmetric(horizontal: 48),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20, 24, 20, 20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              'New Guest In',
              style: TextStyle(
                color: AppColors.black1F2518,
                fontSize: 16,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 10),
            Text.rich(
              TextSpan(
                style: const TextStyle(
                  color: AppColors.gray6E6E6E,
                  fontSize: 13,
                  fontWeight: FontWeight.w400,
                  height: 1.35,
                ),
                children: [
                  WidgetSpan(
                    alignment: PlaceholderAlignment.baseline,
                    baseline: TextBaseline.alphabetic,
                    child: ShaderMask(
                      blendMode: BlendMode.srcIn,
                      shaderCallback: (rect) => const LinearGradient(
                        colors: [Color(0xFFFF41FF), Color(0xFF6922FF)],
                      ).createShader(rect),
                      child: Text(
                        name,
                        style: const TextStyle(
                          color: AppColors.white,
                          fontSize: 13,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ),
                  const TextSpan(text: ' is here. Take the mic and\n start the vibe check.'),
                ],
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 24),
            GestureDetector(
              onTap: () => AppJumper.back(),
              child: Container(
                height: 42,
                width: double.infinity,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(22),
                  gradient: AppColors.primaryGradient,
                ),
                child: const Text(
                  'Got it',
                  style: TextStyle(
                    color: AppColors.black1F2518,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
