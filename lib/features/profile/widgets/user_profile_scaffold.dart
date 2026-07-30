import 'dart:async';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/constants/app_assets.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/widgets/center_toast.dart';

/// Flavor 标签（emoji + 文案）。
class ProfileFlavorTag {
  const ProfileFlavorTag({required this.label, this.emoji = ''});

  final String label;
  final String emoji;

  static const List<ProfileFlavorTag> defaults = [
    ProfileFlavorTag(label: 'Open to Flirt', emoji: '😉'),
    ProfileFlavorTag(label: 'Talkative', emoji: '🗣️'),
    ProfileFlavorTag(label: 'Romantic', emoji: '💘'),
    ProfileFlavorTag(label: 'Baking', emoji: '🍰'),
    ProfileFlavorTag(label: 'Foodie', emoji: '🍕'),
  ];
}

/// 个人 / 他人主页共享壳：背景、信息区、Moments、Flavor、Gift Wall；底栏由调用方注入。
class UserProfileScaffold extends StatelessWidget {
  const UserProfileScaffold({
    super.key,
    required this.nickname,
    required this.userId,
    required this.avatarAsset,
    required this.isMale,
    required this.age,
    required this.zodiac,
    required this.level,
    required this.bio,
    required this.bottomBar,
    this.voiceSeconds,
    this.momentAssets = const [],
    this.flavors = const [],
    this.giftUnlocked = 12,
    this.giftTotal = 58,
    this.showMore = false,
    this.onBack,
    this.onMore,
  });

  final String nickname;
  final String userId;
  final String avatarAsset;
  final bool isMale;
  final int age;
  final String zodiac;
  final int level;
  final String bio;

  /// 与编辑资料 Voice Note 一致；无录音时不展示播放条。
  final int? voiceSeconds;
  final List<String> momentAssets;
  final List<ProfileFlavorTag> flavors;
  final int giftUnlocked;
  final int giftTotal;
  final bool showMore;
  final VoidCallback? onBack;
  final VoidCallback? onMore;
  final Widget bottomBar;

  Future<void> _copyId(BuildContext context) async {
    await Clipboard.setData(ClipboardData(text: userId));
    if (!context.mounted) return;
    showCenterToast(context, message: 'Saved to the clipboard');
  }

  @override
  Widget build(BuildContext context) {
    final topPadding = MediaQuery.paddingOf(context).top;
    final bottomPadding = MediaQuery.paddingOf(context).bottom;
    final moments = momentAssets.isEmpty
        ? List<String>.filled(4, avatarAsset)
        : momentAssets;
    final flavorTags =
        flavors.isEmpty ? ProfileFlavorTag.defaults : flavors;

    return Scaffold(
      backgroundColor: AppColors.background,
      body: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            height: 330,
            child: Image.asset(
              AppAssets.personalBg,
              fit: BoxFit.cover,
              alignment: Alignment.topCenter,
            ),
          ),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            height: 380,
            child: DecoratedBox(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.black.withValues(alpha: 0.18),
                    AppColors.background,
                  ],
                ),
              ),
            ),
          ),
          SafeArea(
            bottom: false,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 4, 16, 0),
                  child: Row(
                    children: [
                      _TopCircleButton(
                        onTap: onBack ?? () => Navigator.of(context).pop(),
                        child: SvgPicture.asset(
                          AppAssets.chatBack,
                          width: 17,
                          height: 7,
                        ),
                      ),
                      const Spacer(),
                      if (showMore)
                        _TopCircleButton(
                          onTap: onMore ?? () {},
                          child: const Icon(
                            Icons.more_horiz_rounded,
                            color: Colors.white,
                            size: 22,
                          ),
                        ),
                    ],
                  ),
                ),
                Expanded(
                  child: SingleChildScrollView(
                    padding: EdgeInsets.fromLTRB(16, 160 - topPadding, 16, 24),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 84,
                          height: 84,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.white, width: 2.5),
                          ),
                          child: ClipOval(
                            child: Image.asset(
                              avatarAsset,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        const SizedBox(height: 16),
                        Text(
                          nickname,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        const SizedBox(height: 6),
                        GestureDetector(
                          onTap: () => _copyId(context),
                          behavior: HitTestBehavior.opaque,
                          child: Row(
                            children: [
                              Text(
                                'ID:$userId',
                                style: const TextStyle(
                                  color: Color(0xFFA3A3A3),
                                  fontSize: 13,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              const SizedBox(width: 4),
                              SvgPicture.asset(
                                AppAssets.mineCopy,
                                width: 13,
                                height: 13,
                                colorFilter: const ColorFilter.mode(
                                  Color(0xFFA3A3A3),
                                  BlendMode.srcIn,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 10),
                        Row(
                          children: [
                            _ProfileChip(
                              child: Text(
                                zodiac,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                            const SizedBox(width: 8),
                            _ProfileChip(
                              background: isMale
                                  ? const Color(0xFF4F8BFF)
                                  : const Color(0xFFFF5BA8),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Image.asset(
                                    isMale
                                        ? AppAssets.genderMan
                                        : AppAssets.genderWoman,
                                    width: 12,
                                    height: 12,
                                  ),
                                  const SizedBox(width: 4),
                                  Text(
                                    '$age',
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(width: 8),
                            _ProfileChip(
                              background: const Color(0xFFB24DFF),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  const Icon(
                                    Icons.auto_awesome_rounded,
                                    size: 14,
                                    color: Color(0xFFFFE26C),
                                  ),
                                  const SizedBox(width: 3),
                                  Text(
                                    '$level',
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const Spacer(),
                            if (voiceSeconds != null && voiceSeconds! > 0)
                              _VoiceCard(seconds: voiceSeconds!),
                          ],
                        ),
                        const SizedBox(height: 18),
                        Text(
                          bio,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            height: 1.45,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        const SizedBox(height: 28),
                        const Text(
                          'Moments',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 17,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        const SizedBox(height: 12),
                        Row(
                          children: List.generate(
                            moments.length.clamp(0, 4),
                            (index) => Expanded(
                              child: Padding(
                                padding: EdgeInsets.only(
                                  right: index ==
                                          moments.length.clamp(0, 4) - 1
                                      ? 0
                                      : 8,
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(14),
                                  child: AspectRatio(
                                    aspectRatio: 1,
                                    child: Image.asset(
                                      moments[index],
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 24),
                        const Text(
                          'My Flavor',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 17,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        const SizedBox(height: 12),
                        Wrap(
                          spacing: 10,
                          runSpacing: 10,
                          children: [
                            for (final tag in flavorTags)
                              _FlavorChip(
                                label: tag.label,
                                emoji: tag.emoji,
                              ),
                          ],
                        ),
                        const SizedBox(height: 24),
                        _FullGiftWallCard(
                          unlocked: giftUnlocked,
                          total: giftTotal,
                        ),
                      ],
                    ),
                  ),
                ),
                ColoredBox(
                  color: AppColors.background,
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(
                      16,
                      12,
                      16,
                      12 + bottomPadding,
                    ),
                    child: bottomBar,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

/// 主色实心底栏按钮（Edit Profile / Follow / Chat）。
class ProfilePrimaryAction extends StatelessWidget {
  const ProfilePrimaryAction({
    super.key,
    required this.label,
    required this.onTap,
  });

  final String label;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 54,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: const Color(0xFF1CFF8A),
          borderRadius: BorderRadius.circular(28),
        ),
        child: Text(
          label,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 17,
            fontWeight: FontWeight.w800,
          ),
        ),
      ),
    );
  }
}

/// 描边底栏按钮。
class ProfileOutlineAction extends StatelessWidget {
  const ProfileOutlineAction({
    super.key,
    required this.label,
    required this.onTap,
  });

  final String label;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 54,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(28),
          border: Border.all(color: const Color(0xFF1CFF8A), width: 1.5),
        ),
        child: Text(
          label,
          style: const TextStyle(
            color: Color(0xFF1CFF8A),
            fontSize: 17,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }
}

/// 礼物圆形按钮。
class ProfileGiftAction extends StatelessWidget {
  const ProfileGiftAction({super.key, required this.onTap});

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 56,
        height: 56,
        decoration: BoxDecoration(
          color: const Color(0xFF2A2A2A),
          borderRadius: BorderRadius.circular(28),
        ),
        alignment: Alignment.center,
        child: Image.asset(
          AppAssets.giftIcon,
          width: 28,
          height: 28,
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}

class _TopCircleButton extends StatelessWidget {
  const _TopCircleButton({required this.onTap, required this.child});

  final VoidCallback onTap;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.black.withValues(alpha: 0.28),
      shape: const CircleBorder(),
      child: InkWell(
        onTap: onTap,
        customBorder: const CircleBorder(),
        child: SizedBox(width: 40, height: 40, child: Center(child: child)),
      ),
    );
  }
}

class _ProfileChip extends StatelessWidget {
  const _ProfileChip({
    required this.child,
    this.background = const Color(0xFF3A3A3A),
  });

  final Widget child;
  final Color background;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        color: background,
        borderRadius: BorderRadius.circular(14),
      ),
      child: child,
    );
  }
}

/// 个人主页语音条：静态 [AppAssets.voiceWaveLine]，播放中切换为动态波形。
class _VoiceCard extends StatefulWidget {
  const _VoiceCard({required this.seconds});

  final int seconds;

  @override
  State<_VoiceCard> createState() => _VoiceCardState();
}

class _VoiceCardState extends State<_VoiceCard>
    with SingleTickerProviderStateMixin {
  bool _playing = false;
  int _remaining = 0;
  Timer? _playTimer;
  late final AnimationController _waveController;

  @override
  void initState() {
    super.initState();
    _waveController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 700),
    );
  }

  @override
  void didUpdateWidget(covariant _VoiceCard oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.seconds != widget.seconds) {
      _stopPlay();
    }
  }

  @override
  void dispose() {
    _playTimer?.cancel();
    _waveController.dispose();
    super.dispose();
  }

  void _stopPlay() {
    _playTimer?.cancel();
    _playTimer = null;
    _waveController.stop();
    _waveController.reset();
    if (!mounted) {
      _playing = false;
      _remaining = 0;
      return;
    }
    setState(() {
      _playing = false;
      _remaining = 0;
    });
  }

  void _togglePlay() {
    if (widget.seconds <= 0) return;
    if (_playing) {
      _stopPlay();
      return;
    }
    setState(() {
      _playing = true;
      _remaining = widget.seconds;
    });
    _waveController.repeat();
    _playTimer?.cancel();
    _playTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (!mounted) {
        timer.cancel();
        return;
      }
      if (_remaining <= 1) {
        timer.cancel();
        _playTimer = null;
        _waveController.stop();
        _waveController.reset();
        setState(() {
          _playing = false;
          _remaining = 0;
        });
        return;
      }
      setState(() => _remaining -= 1);
    });
  }

  @override
  Widget build(BuildContext context) {
    final displaySeconds = _playing ? _remaining : widget.seconds;

    return GestureDetector(
      onTap: _togglePlay,
      behavior: HitTestBehavior.opaque,
      child: Container(
        height: 36,
        constraints: const BoxConstraints(minWidth: 120, maxWidth: 168),
        padding: const EdgeInsets.fromLTRB(3, 3, 10, 3),
        decoration: BoxDecoration(
          color: const Color(0xFF2E2E16),
          borderRadius: BorderRadius.circular(18),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 30,
              height: 30,
              decoration: const BoxDecoration(
                color: Color(0xFFFDF652),
                shape: BoxShape.circle,
              ),
              alignment: Alignment.center,
              child: Icon(
                _playing ? Icons.pause_rounded : Icons.play_arrow_rounded,
                color: Colors.black,
                size: 22,
              ),
            ),
            const SizedBox(width: 6),
            SizedBox(
              width: 56,
              height: 14,
              child: _playing
                  ? _AnimatedVoiceWave(animation: _waveController)
                  : SvgPicture.asset(
                      AppAssets.voiceWaveLine,
                      width: 56,
                      height: 14,
                      fit: BoxFit.contain,
                    ),
            ),
            const SizedBox(width: 6),
            Text(
              '$displaySeconds"',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// 播放中动态波形：大部分保持水平线，仅一小段脉冲左右游走。
class _AnimatedVoiceWave extends StatelessWidget {
  const _AnimatedVoiceWave({required this.animation});

  final Animation<double> animation;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animation,
      builder: (context, _) {
        return CustomPaint(
          size: const Size(56, 14),
          painter: _VoiceWavePainter(phase: animation.value * 2 * 3.1415926),
        );
      },
    );
  }
}

class _VoiceWavePainter extends CustomPainter {
  const _VoiceWavePainter({required this.phase});

  final double phase;

  @override
  void paint(Canvas canvas, Size size) {
    final midY = size.height / 2;
    final startX = 3.0;
    final endX = size.width - 3.0;
    final fade = Paint()
      ..shader = LinearGradient(
        colors: [
          Colors.white.withValues(alpha: 0),
          Colors.white,
          Colors.white,
          Colors.white.withValues(alpha: 0),
        ],
        stops: const [0, 0.2, 0.8, 1],
      ).createShader(Offset.zero & size)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.8
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round;
    final travel = (math.sin(phase * 0.9) + 1) / 2;
    final pulseCenter = startX + 12 + (endX - startX - 24) * travel;
    final gapWidth = 3.6;
    final pulseHalfWidth = 6.4;
    final amplitude = 3.2 + math.sin(phase * 1.3) * 0.9;

    final leftSegEnd = pulseCenter - pulseHalfWidth - gapWidth;
    final rightSegStart = pulseCenter + pulseHalfWidth + gapWidth;

    if (leftSegEnd > startX) {
      canvas.drawLine(Offset(startX, midY), Offset(leftSegEnd, midY), fade);
    }
    if (rightSegStart < endX) {
      canvas.drawLine(Offset(rightSegStart, midY), Offset(endX, midY), fade);
    }

    final pulse = Path()
      ..moveTo(pulseCenter - pulseHalfWidth, midY)
      ..lineTo(pulseCenter - 2.2, midY)
      ..lineTo(pulseCenter, midY - amplitude)
      ..lineTo(pulseCenter + 2.6, midY + amplitude * 0.72)
      ..lineTo(pulseCenter + pulseHalfWidth, midY);

    canvas.drawPath(pulse, fade);
  }

  @override
  bool shouldRepaint(covariant _VoiceWavePainter oldDelegate) {
    return oldDelegate.phase != phase;
  }
}

class _FlavorChip extends StatelessWidget {
  const _FlavorChip({required this.label, required this.emoji});

  final String label;
  final String emoji;

  @override
  Widget build(BuildContext context) {
    final text = emoji.isEmpty ? label : '$emoji $label';
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
      decoration: BoxDecoration(
        color: const Color(0xFF2A2A2A),
        borderRadius: BorderRadius.circular(18),
      ),
      child: Text(
        text,
        style: const TextStyle(
          color: Color(0xFFE6E6E6),
          fontSize: 14,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}

class _FullGiftWallCard extends StatelessWidget {
  const _FullGiftWallCard({
    required this.unlocked,
    required this.total,
  });

  final int unlocked;
  final int total;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(14, 12, 10, 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        gradient: const LinearGradient(
          colors: [Color(0xFF2F6BFF), Color(0xFF9B22FF)],
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Gift Wall',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  'Unlocked: $unlocked/$total',
                  style: const TextStyle(
                    color: Colors.white70,
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
          for (final icon in [
            Icons.mail_rounded,
            Icons.favorite_rounded,
            Icons.mood_rounded,
            Icons.cruelty_free_rounded,
          ]) ...[
            Container(
              width: 42,
              height: 42,
              margin: const EdgeInsets.only(left: 8),
              decoration: BoxDecoration(
                color: Colors.white.withValues(alpha: 0.18),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(icon, color: const Color(0xFFFF9D5C), size: 22),
            ),
          ],
          const SizedBox(width: 6),
          Icon(
            Icons.chevron_right_rounded,
            color: Colors.white.withValues(alpha: 0.85),
          ),
        ],
      ),
    );
  }
}
