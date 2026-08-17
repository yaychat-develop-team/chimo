import 'dart:async';
import 'dart:math' as math;

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/audio/app_audio_playback.dart';
import '../../../core/constants/app_assets.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/widgets/center_toast.dart';
import '../../../core/widgets/app_network_image.dart';
import '../../../core/widgets/network_or_asset_avatar.dart';
import '../album_photo_viewer_page.dart';

/// Flavor 标签（emoji + 文案）。
class ProfileFlavorTag {
  const ProfileFlavorTag({required this.label, this.emoji = ''});

  final String label;
  final String emoji;

  static const List<ProfileFlavorTag> defaults = [];
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

/// 自己 / 他人资料共用外壳：背景、信息、Moments、Flavor；底部栏由调用方提供。
class UserProfileScaffold extends StatelessWidget {
  const UserProfileScaffold({
    super.key,
    required this.nickname,
    required this.userId,
    required this.avatarAsset,
    required this.isMale,
    required this.age,
    required this.zodiac,
    required this.bio,
    required this.bottomBar,
    this.avatarUrl,
    this.avatarUnderReview = false,
    this.voiceSeconds,
    this.voiceUrl,
    this.vipIconUrl,
    this.momentAssets = const [],
    this.momentUrls = const [],
    this.flavors,
    this.inPartyName,
    this.showMore = false,
    this.showZodiac = true,
    this.showGenderAge = true,
    this.onBack,
    this.onMore,
    this.onInPartyTap,
  });

  final String nickname;
  final String userId;
  final String avatarAsset;
  final String? avatarUrl;
  final bool avatarUnderReview;
  final bool isMale;
  final int age;
  final String zodiac;
  final String bio;

  /// 与编辑资料 Voice Note 一致；无录音时隐藏播放器。
  final int? voiceSeconds;

  /// 真实播放用的远程 URL 或本地路径。
  final String? voiceUrl;

  /// 服务端等级徽章（`icons.smallIcon`）；空 → 隐藏（forya UserLevWidget）。
  final String? vipIconUrl;
  final List<String> momentAssets;
  final List<String> momentUrls;

  /// `null` → 显示默认 mock 标签；空 → 隐藏标签区。
  final List<ProfileFlavorTag>? flavors;

  /// 非 null 时在头像旁显示 “In Party: …” 胶囊。
  final String? inPartyName;
  final bool showMore;

  /// 未设置生日时隐藏星座芯片。
  final bool showZodiac;

  /// 未设置性别时隐藏性别 / 年龄芯片。
  final bool showGenderAge;
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
    final remoteMoments = momentUrls.where((u) => u.trim().isNotEmpty).toList();
    final localMoments = momentAssets.where((u) => u.trim().isNotEmpty).toList();
    final hasRemoteMoments = remoteMoments.isNotEmpty;
    // 对齐编辑资料相册上限（9）；此前硬限制为 4。
    final moments = hasRemoteMoments
        ? remoteMoments.take(9).toList()
        : localMoments.take(9).toList();
    final flavorTags = flavors ?? const <ProfileFlavorTag>[];

    // 设计：头像顶在 y=289；状态栏 44 + 按钮区约 48 → 顶栏下方 spacer。
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
                    // 原 om_personal：仅 start 侧 padding，使语音条可贴右边缘。
                    padding: EdgeInsets.fromLTRB(
                      16,
                      math.max(8, avatarTop),
                      0,
                      24,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 16),
                          child: SizedBox(
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
                                    child: Stack(
                                      fit: StackFit.expand,
                                      children: [
                                        NetworkOrAssetAvatar(
                                          asset: avatarAsset,
                                          url: avatarUrl,
                                        ),
                                        if (avatarUnderReview)
                                          ColoredBox(
                                            color: Colors.black.withValues(
                                              alpha: 0.5,
                                            ),
                                            child: const Center(
                                              child: Text(
                                                'Under review',
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 11,
                                                  height: 1.1,
                                                ),
                                              ),
                                            ),
                                          ),
                                      ],
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
                        ),
                        const SizedBox(height: 16),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.only(right: 8),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      nickname,
                                      maxLines: 1,
                                      softWrap: false,
                                      overflow: TextOverflow.ellipsis,
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
                                    const SizedBox(height: 4),
                                    Wrap(
                                      spacing: 4,
                                      runSpacing: 4,
                                      crossAxisAlignment:
                                          WrapCrossAlignment.center,
                                      children: [
                                        if (showZodiac &&
                                            zodiac.trim().isNotEmpty)
                                          _ProfileChip(
                                            height: 20,
                                            padding: const EdgeInsets.symmetric(
                                              horizontal: 10,
                                            ),
                                            background: Colors.white12,
                                            child: Text(
                                              '${_zodiacEmoji(zodiac)} $zodiac',
                                              style: const TextStyle(
                                                color: Colors.white,
                                                fontSize: 10,
                                                fontWeight: FontWeight.w500,
                                                height: 1,
                                              ),
                                            ),
                                          ),
                                        if (showGenderAge)
                                          _ProfileChip(
                                            height: 16,
                                            padding: const EdgeInsets.fromLTRB(
                                              0,
                                              0,
                                              4,
                                              0,
                                            ),
                                            background: isMale
                                                ? const Color(0xFF0091FF)
                                                : const Color(0xFFFF4D94),
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
                                        if ((vipIconUrl ?? '')
                                            .trim()
                                            .isNotEmpty)
                                          _VipLevelIcon(url: vipIconUrl!.trim()),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            if (voiceSeconds != null &&
                                voiceSeconds! > 0 &&
                                (voiceUrl ?? '').trim().isNotEmpty)
                              _VoiceCard(
                                seconds: voiceSeconds!,
                                source: voiceUrl,
                              ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 16, 16, 8),
                          child: Text(
                            bio,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              height: 20 / 14,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                        if (moments.isNotEmpty) ...[
                          const Padding(
                            padding: EdgeInsets.only(top: 12, bottom: 8),
                            child: Text(
                              'Moments',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                height: 21 / 14,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 89,
                            child: ListView.separated(
                              scrollDirection: Axis.horizontal,
                              padding: const EdgeInsets.only(right: 16),
                              itemCount: moments.length,
                              separatorBuilder: (_, _) =>
                                  const SizedBox(width: 6),
                              itemBuilder: (context, index) {
                                final src = moments[index];
                                return GestureDetector(
                                  onTap: () => AlbumPhotoViewerPage.open(
                                    context,
                                    paths: moments,
                                    initialIndex: index,
                                  ),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: hasRemoteMoments ||
                                            src.startsWith('http')
                                        ? AppNetworkImage(
                                            src,
                                            width: 90,
                                            height: 89,
                                            fit: BoxFit.cover,
                                            errorWidget:
                                                (_, error, stack) =>
                                                    Image.asset(
                                              avatarAsset,
                                              width: 90,
                                              height: 89,
                                              fit: BoxFit.cover,
                                            ),
                                          )
                                        : Image.asset(
                                            src,
                                            width: 90,
                                            height: 89,
                                            fit: BoxFit.cover,
                                          ),
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                        if (flavorTags.isNotEmpty) ...[
                          const Padding(
                            padding: EdgeInsets.only(top: 20, bottom: 8),
                            child: Text(
                              'My Flavor',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                height: 21 / 14,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 16),
                            child: Wrap(
                              spacing: 8,
                              runSpacing: 8,
                              children: [
                                for (final tag in flavorTags)
                                  _FlavorChip(label: tag.label),
                              ],
                            ),
                          ),
                        ],
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

/// 底部栏实心主按钮（编辑资料 / 关注 / 聊天）。
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

/// 底部栏描边按钮。
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

/// 圆形礼物按钮。
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
    // 避免在 Wrap 内用 Container.alignment — 会撑满整行宽度。
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

/// Forya [UserLevWidget]：远程 `icons.smallIcon`，高度 22。
class _VipLevelIcon extends StatelessWidget {
  const _VipLevelIcon({required this.url});

  final String url;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.only(end: 4),
      child: AppNetworkImage(
        url,
        height: 22,
        fit: BoxFit.fitHeight,
        errorWidget: (_, error, stack) => const SizedBox.shrink(),
      ),
    );
  }
}

/// 资料语音条：静态 [AppAssets.voiceWaveLine]；播放时用动态 webp。
class _VoiceCard extends StatefulWidget {
  const _VoiceCard({required this.seconds, this.source});

  final int seconds;
  final String? source;

  @override
  State<_VoiceCard> createState() => _VoiceCardState();
}

class _VoiceCardState extends State<_VoiceCard> {
  bool _playing = false;
  int _remaining = 0;
  Timer? _playTimer;
  final AudioPlayer _player = AudioPlayer();
  StreamSubscription<void>? _completeSub;

  @override
  void initState() {
    super.initState();
    _completeSub = _player.onPlayerComplete.listen((_) {
      unawaited(_stopPlay(resetOnly: true));
    });
  }

  @override
  void didUpdateWidget(covariant _VoiceCard oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.seconds != widget.seconds ||
        oldWidget.source != widget.source) {
      unawaited(_stopPlay());
    }
  }

  @override
  void dispose() {
    AppVoiceExclusive.release(_exclusiveStop);
    _playTimer?.cancel();
    _completeSub?.cancel();
    unawaited(_player.dispose());
    super.dispose();
  }

  void _exclusiveStop() {
    unawaited(_stopPlay());
  }

  Future<void> _stopPlay({bool resetOnly = false}) async {
    _playTimer?.cancel();
    _playTimer = null;
    AppVoiceExclusive.release(_exclusiveStop);
    if (!resetOnly) {
      try {
        await _player.stop();
      } catch (_) {}
    }
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

  Future<void> _togglePlay() async {
    if (widget.seconds <= 0) return;
    if (_playing) {
      await _stopPlay();
      return;
    }
    final source = (widget.source ?? '').trim();
    if (source.isEmpty) {
      showCenterToast(context, message: 'Voice file unavailable');
      return;
    }
    try {
      AppVoiceExclusive.claim(_exclusiveStop);
      await AppAudioPlayback.play(_player, source);
      if (!mounted) return;
      setState(() {
        _playing = true;
        _remaining = widget.seconds;
      });
      _playTimer?.cancel();
      _playTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
        if (!mounted) {
          timer.cancel();
          return;
        }
        if (_remaining <= 1) {
          timer.cancel();
          _playTimer = null;
          unawaited(_stopPlay());
          return;
        }
        setState(() => _remaining -= 1);
      });
    } catch (error) {
      debugPrint('Profile voice play failed: $error');
      AppVoiceExclusive.release(_exclusiveStop);
      if (!mounted) return;
      showCenterToast(context, message: 'Playback failed');
    }
  }

  @override
  Widget build(BuildContext context) {
    final displaySeconds = _playing ? _remaining : widget.seconds;

    // 对齐 forya AudioPlayerWidget（borderEnd: false）— 贴齐屏幕边缘。
    return GestureDetector(
      onTap: () => unawaited(_togglePlay()),
      behavior: HitTestBehavior.opaque,
      child: Container(
        width: 140,
        height: 32,
        padding: const EdgeInsets.symmetric(horizontal: 10),
        alignment: Alignment.center,
        decoration: const BoxDecoration(
          color: Color(0x1FFDF652),
          borderRadius: BorderRadiusDirectional.only(
            topStart: Radius.circular(16),
            bottomStart: Radius.circular(16),
          ),
        ),
        child: Row(
          children: [
            SvgPicture.asset(
              _playing ? AppAssets.voicePauseIcon : AppAssets.voicePlayIcon,
              width: 18,
              height: 18,
            ),
            const SizedBox(width: 6),
            Expanded(
              child: SizedBox(
                height: 14,
                child: _playing
                    ? Image.asset(
                        AppAssets.voiceWaveAnim,
                        fit: BoxFit.contain,
                        alignment: Alignment.centerLeft,
                      )
                    : SvgPicture.asset(
                        AppAssets.voiceWaveLine,
                        height: 10,
                        fit: BoxFit.contain,
                        colorFilter: const ColorFilter.mode(
                          Colors.white70,
                          BlendMode.srcIn,
                        ),
                      ),
              ),
            ),
            const SizedBox(width: 6),
            Text(
              '$displaySeconds"',
              style: const TextStyle(
                color: Colors.white54,
                fontSize: 13,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _FlavorChip extends StatelessWidget {
  const _FlavorChip({required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    // 原 My Flavor 标签仅为文字（无 emoji 前缀）。
    return DecoratedBox(
      decoration: BoxDecoration(
        color: const Color(0x1FFFFFFF),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        child: Text(
          label,
          style: const TextStyle(
            color: Color(0xFFA3A3A3),
            fontSize: 12,
            fontWeight: FontWeight.w400,
            height: 1.2,
          ),
        ),
      ),
    );
  }
}
