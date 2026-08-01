import 'dart:async';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/constants/app_assets.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/widgets/center_toast.dart';

/// Flavor tag (emoji + label).
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

String _zodiacEmoji(String zodiac) {
  final key = zodiac.toLowerCase();
  if (key.contains('capricorn')) return '♑';
  if (key.contains('aquarius')) return '♒';
  if (key.contains('pisces')) return '♓';
  if (key.contains('aries')) return '♈';
  if (key.contains('taurus')) return '♉';
  if (key.contains('gemini')) return '♊';
  if (key.contains('cancer')) return '♋';
  if (key.contains('leo')) return '♌';
  if (key.contains('virgo')) return '♍';
  if (key.contains('libra')) return '♎';
  if (key.contains('scorpio')) return '♏';
  if (key.contains('sagittarius')) return '♐';
  return '✨';
}

/// Shared shell for own / other profiles: background, info, Moments, Flavor, Gift Wall; caller supplies bottom bar.
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
    this.inPartyName,
    this.showMore = false,
    this.onBack,
    this.onMore,
    this.onInPartyTap,
  });

  final String nickname;
  final String userId;
  final String avatarAsset;
  final bool isMale;
  final int age;
  final String zodiac;
  final int level;
  final String bio;

  /// Matches Edit Profile Voice Note; hides player when no recording.
  final int? voiceSeconds;
  final List<String> momentAssets;
  final List<ProfileFlavorTag> flavors;
  final int giftUnlocked;
  final int giftTotal;

  /// When non-null, shows the “In Party: …” pill next to the avatar.
  final String? inPartyName;
  final bool showMore;
  final VoidCallback? onBack;
  final VoidCallback? onMore;
  final VoidCallback? onInPartyTap;
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
        : momentAssets.take(4).toList();
    final flavorTags =
        flavors.isEmpty ? ProfileFlavorTag.defaults : flavors;

    // Design: avatar top at y=289; status 44 + button area ~48 → spacer below top bar.
    final avatarTop = 289.0 - topPadding - 48;

    return Scaffold(
      backgroundColor: const Color(0xFF0A0A14),
      body: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            height: 360,
            child: Image.asset(
              AppAssets.personalBg,
              fit: BoxFit.cover,
              alignment: Alignment.topCenter,
            ),
          ),
          Positioned(
            top: 280,
            left: 0,
            right: 0,
            height: 100,
            child: DecoratedBox(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.transparent,
                    const Color(0xFF0A0A14).withValues(alpha: 0.85),
                    const Color(0xFF0A0A14),
                  ],
                ),
              ),
            ),
          ),
          SafeArea(
            bottom: false,
            child: Column(
              children: [
                SizedBox(
                  height: 48,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Row(
                      children: [
                        _TopCircleButton(
                          onTap: onBack ?? () => Navigator.of(context).pop(),
                          child: SvgPicture.asset(
                            AppAssets.chatBack,
                            width: 7,
                            height: 12,
                            colorFilter: const ColorFilter.mode(
                              Colors.white,
                              BlendMode.srcIn,
                            ),
                          ),
                        ),
                        const Spacer(),
                        if (showMore)
                          _TopCircleButton(
                            onTap: onMore ?? () {},
                            child: const Icon(
                              Icons.more_horiz_rounded,
                              color: Colors.white,
                              size: 20,
                            ),
                          ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: SingleChildScrollView(
                    padding: EdgeInsets.fromLTRB(
                      16,
                      math.max(8, avatarTop),
                      16,
                      24,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 72,
                          width: double.infinity,
                          child: Stack(
                            clipBehavior: Clip.none,
                            children: [
                              Container(
                                width: 72,
                                height: 72,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    color: Colors.white,
                                    width: 2,
                                  ),
                                ),
                                child: ClipOval(
                                  child: Image.asset(
                                    avatarAsset,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              if (inPartyName != null &&
                                  inPartyName!.trim().isNotEmpty)
                                Positioned(
                                  left: 52,
                                  right: 0,
                                  bottom: 5,
                                  child: _InPartyBanner(
                                    title: inPartyName!,
                                    onTap: onInPartyTap,
                                  ),
                                ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 16),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    nickname,
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600,
                                      height: 27 / 18,
                                    ),
                                  ),
                                  const SizedBox(height: 2),
                                  GestureDetector(
                                    onTap: () => _copyId(context),
                                    behavior: HitTestBehavior.opaque,
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Text(
                                          'ID:$userId',
                                          style: const TextStyle(
                                            color: Color(0xFFA3A3A3),
                                            fontSize: 12,
                                            fontWeight: FontWeight.w400,
                                            height: 18 / 12,
                                          ),
                                        ),
                                        const SizedBox(width: 6),
                                        SvgPicture.asset(
                                          AppAssets.mineCopy,
                                          width: 10,
                                          height: 10,
                                          colorFilter: const ColorFilter.mode(
                                            Color(0xFFA3A3A3),
                                            BlendMode.srcIn,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  Wrap(
                                    spacing: 6,
                                    runSpacing: 6,
                                    children: [
                                      _ProfileChip(
                                        height: 16,
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 8,
                                        ),
                                        child: Text(
                                          '${_zodiacEmoji(zodiac)} $zodiac',
                                          style: const TextStyle(
                                            color: Colors.white,
                                            fontSize: 11,
                                            fontWeight: FontWeight.w500,
                                            height: 1,
                                          ),
                                        ),
                                      ),
                                      _ProfileChip(
                                        height: 16,
                                        padding: const EdgeInsets.fromLTRB(
                                          3,
                                          0,
                                          6,
                                          0,
                                        ),
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
                                              width: 16,
                                              height: 16,
                                            ),
                                            const SizedBox(width: 2),
                                            Text(
                                              '$age',
                                              style: const TextStyle(
                                                color: Colors.white,
                                                fontSize: 11,
                                                fontWeight: FontWeight.w600,
                                                height: 1,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      _LevelChip(level: level),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            if (voiceSeconds != null && voiceSeconds! > 0) ...[
                              const SizedBox(width: 8),
                              Padding(
                                padding: const EdgeInsets.only(top: 4),
                                child: _VoiceCard(seconds: voiceSeconds!),
                              ),
                            ],
                          ],
                        ),
                        const SizedBox(height: 16),
                        Text(
                          bio,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 13,
                            height: 20 / 13,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        const SizedBox(height: 28),
                        const Text(
                          'Moments',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            height: 21 / 14,
                          ),
                        ),
                        const SizedBox(height: 8),
                        SizedBox(
                          height: 89,
                          child: ListView.separated(
                            scrollDirection: Axis.horizontal,
                            itemCount: moments.length,
                            separatorBuilder: (_, _) =>
                                const SizedBox(width: 6),
                            itemBuilder: (context, index) {
                              return ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image.asset(
                                  moments[index],
                                  width: 90,
                                  height: 89,
                                  fit: BoxFit.cover,
                                ),
                              );
                            },
                          ),
                        ),
                        const SizedBox(height: 28),
                        const Text(
                          'My Flavor',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            height: 21 / 14,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Wrap(
                          spacing: 8,
                          runSpacing: 8,
                          children: [
                            for (final tag in flavorTags)
                              _FlavorChip(
                                label: tag.label,
                                emoji: tag.emoji,
                              ),
                          ],
                        ),
                        const SizedBox(height: 28),
                        _FullGiftWallCard(
                          unlocked: giftUnlocked,
                          total: giftTotal,
                        ),
                      ],
                    ),
                  ),
                ),
                ColoredBox(
                  color: const Color(0xFF0A0A14),
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(
                      16,
                      8,
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

/// Primary solid bottom-bar button (Edit Profile / Follow / Chat).
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
        height: 48,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          gradient: AppColors.promoBannerGradient,
          borderRadius: BorderRadius.circular(24),
        ),
        child: Text(
          label,
          style: const TextStyle(
            color: AppColors.promoText,
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}

/// Outlined bottom-bar button.
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
        height: 48,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: const Color(0xFF1C1C1E),
          borderRadius: BorderRadius.circular(24),
          border: Border.all(color: AppColors.accentLime, width: 1),
        ),
        child: Text(
          label,
          style: const TextStyle(
            color: AppColors.accentLime,
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}

/// Circular gift button.
class ProfileGiftAction extends StatelessWidget {
  const ProfileGiftAction({super.key, required this.onTap});

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 48,
        height: 48,
        decoration: BoxDecoration(
          color: const Color(0xFF1C1C1E),
          borderRadius: BorderRadius.circular(24),
        ),
        alignment: Alignment.center,
        child: Image.asset(
          AppAssets.giftIcon,
          width: 30,
          height: 30,
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
      color: Colors.black.withValues(alpha: 0.35),
      borderRadius: BorderRadius.circular(18),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(18),
        child: SizedBox(width: 36, height: 36, child: Center(child: child)),
      ),
    );
  }
}

class _InPartyBanner extends StatelessWidget {
  const _InPartyBanner({required this.title, this.onTap});

  final String title;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap ?? () {},
        borderRadius: BorderRadius.circular(15),
        child: Ink(
          height: 30,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            gradient: const LinearGradient(
              colors: [Color(0xFF2A1F4D), Color(0xFF1A1430)],
            ),
            border: Border.all(
              color: Colors.white.withValues(alpha: 0.12),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              children: [
                Icon(
                  Icons.graphic_eq_rounded,
                  size: 12,
                  color: AppColors.accentLime,
                ),
                const SizedBox(width: 6),
                Expanded(
                  child: Text(
                    'In Party: $title',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 11,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                SvgPicture.asset(
                  AppAssets.mineArrow,
                  width: 5,
                  height: 8,
                  colorFilter: ColorFilter.mode(
                    Colors.white.withValues(alpha: 0.85),
                    BlendMode.srcIn,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _ProfileChip extends StatelessWidget {
  const _ProfileChip({
    required this.child,
    this.background = const Color(0xFF3A3A3A),
    this.height = 22,
    this.padding = const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
  });

  final Widget child;
  final Color background;
  final double height;
  final EdgeInsetsGeometry padding;

  @override
  Widget build(BuildContext context) {
    // Avoid Container.alignment inside Wrap — it expands to full row width.
    return DecoratedBox(
      decoration: BoxDecoration(
        color: background,
        borderRadius: BorderRadius.circular(height / 2),
      ),
      child: Padding(
        padding: padding,
        child: SizedBox(
          height: height,
          child: Align(
            alignment: Alignment.center,
            widthFactor: 1,
            child: child,
          ),
        ),
      ),
    );
  }
}

class _LevelChip extends StatelessWidget {
  const _LevelChip({required this.level});

  final int level;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 22,
      padding: const EdgeInsets.only(right: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(11),
        gradient: const LinearGradient(
          colors: [Color(0xFF9B6BFF), Color(0xFF6B4EFF)],
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            AppAssets.levelBadgeHero,
            width: 22,
            height: 22,
            fit: BoxFit.cover,
          ),
          const SizedBox(width: 2),
          Text(
            '$level',
            style: const TextStyle(
              color: Colors.white,
              fontSize: 11,
              fontWeight: FontWeight.w700,
              height: 1,
            ),
          ),
        ],
      ),
    );
  }
}

/// Profile voice bar: static [AppAssets.voiceWaveLine]; switches to animated wave while playing.
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
        width: 108,
        height: 28,
        padding: const EdgeInsets.fromLTRB(2, 2, 8, 2),
        decoration: BoxDecoration(
          color: const Color(0xFF2E2E16),
          borderRadius: BorderRadius.circular(14),
        ),
        child: Row(
          children: [
            Container(
              width: 24,
              height: 24,
              decoration: const BoxDecoration(
                color: Color(0xFFFDF652),
                shape: BoxShape.circle,
              ),
              alignment: Alignment.center,
              child: Icon(
                _playing ? Icons.pause_rounded : Icons.play_arrow_rounded,
                color: Colors.black,
                size: 16,
              ),
            ),
            const SizedBox(width: 4),
            Expanded(
              child: SizedBox(
                height: 8,
                child: _playing
                    ? _AnimatedVoiceWave(animation: _waveController)
                    : SvgPicture.asset(
                        AppAssets.voiceWaveLine,
                        height: 8,
                        fit: BoxFit.contain,
                      ),
              ),
            ),
            const SizedBox(width: 4),
            Text(
              '$displaySeconds"',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 12,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// Animated wave while playing: mostly flat line with a short pulse moving left/right.
class _AnimatedVoiceWave extends StatelessWidget {
  const _AnimatedVoiceWave({required this.animation});

  final Animation<double> animation;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animation,
      builder: (context, _) {
        return CustomPaint(
          size: const Size(44, 8),
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
    final startX = 2.0;
    final endX = size.width - 2.0;
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
      ..strokeWidth = 1.4
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round;
    final travel = (math.sin(phase * 0.9) + 1) / 2;
    final pulseCenter = startX + 8 + (endX - startX - 16) * travel;
    const gapWidth = 2.4;
    const pulseHalfWidth = 4.8;
    final amplitude = 2.4 + math.sin(phase * 1.3) * 0.6;

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
      ..lineTo(pulseCenter - 1.6, midY)
      ..lineTo(pulseCenter, midY - amplitude)
      ..lineTo(pulseCenter + 2.0, midY + amplitude * 0.72)
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
    return DecoratedBox(
      decoration: BoxDecoration(
        color: const Color(0xFF2A2A2A),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 7),
        child: Text(
          text,
          style: const TextStyle(
            color: Color(0xFFE6E6E6),
            fontSize: 12,
            fontWeight: FontWeight.w500,
            height: 1.2,
          ),
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

  static const _giftAssets = [
    AppAssets.giftIcon,
    AppAssets.levelMask1,
    AppAssets.levelMask3,
    AppAssets.levelMask4,
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 54,
      padding: const EdgeInsets.fromLTRB(12, 4, 8, 4),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        gradient: const LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: [Color(0xFF2F6BFF), Color(0xFF9B22FF)],
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Gift Wall',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                    height: 20 / 13,
                  ),
                ),
                Text(
                  'Unlocked: $unlocked/$total',
                  style: TextStyle(
                    color: Colors.white.withValues(alpha: 0.7),
                    fontSize: 11,
                    fontWeight: FontWeight.w400,
                    height: 17 / 11,
                  ),
                ),
              ],
            ),
          ),
          for (final asset in _giftAssets) ...[
            Container(
              width: 46,
              height: 46,
              margin: const EdgeInsets.only(left: 2),
              alignment: Alignment.center,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.asset(
                  asset,
                  width: 36,
                  height: 36,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ],
          SvgPicture.asset(
            AppAssets.mineArrow,
            width: 5,
            height: 8,
            colorFilter: ColorFilter.mode(
              Colors.white.withValues(alpha: 0.85),
              BlendMode.srcIn,
            ),
          ),
        ],
      ),
    );
  }
}
