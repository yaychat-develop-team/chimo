import 'dart:async';
import 'dart:math' as math;

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../common/utils/app_audio_playback.dart';
import '../../../../common/constants/app_assets.dart';
import '../../../../common/theme/app_colors.dart';
import '../../../../common/utils/app_log.dart';
import '../album_photo_viewer_page.dart';
import '../../../../common/widgets/app_pull_refresh.dart';
import '../../../../common/widgets/app_scaffold.dart';
import '../../../../common/utils/app_toast.dart';
import '../../../../common/utils/zodiac.dart';
import 'package:chimo/common/utils/chimo.dart';

/// Flavor 标签（emoji + 文案）。
class ProfileFlavorTag {
  const ProfileFlavorTag({required this.label, this.emoji = ''});

  final String label;
  final String emoji;
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
    required this.onRefresh,
    this.avatarUrl,
    this.avatarUnderReview = false,
    this.voiceSeconds,
    this.voiceUrl,
    this.vipIconUrl,
    this.momentAssets = const [],
    this.momentUrls = const [],
    this.flavors,
    this.showMore = false,
    this.showZodiac = true,
    this.showGenderAge = true,
    this.onBack,
    this.onMore,
    this.partyBanner,
    this.revealBanner,
    this.extraSections = const [],
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

  /// 空列表隐藏标签区。
  final List<ProfileFlavorTag>? flavors;

  final bool showMore;

  /// 未设置生日时隐藏星座芯片。
  final bool showZodiac;

  /// 未设置性别时隐藏性别 / 年龄芯片。
  final bool showGenderAge;
  final VoidCallback? onBack;
  final VoidCallback? onMore;
  final Widget bottomBar;
  final Future<void> Function() onRefresh;

  /// 头像旁 In Party 条（与头像底侧重叠）。
  final Widget? partyBanner;

  /// 个性签名下方 Reveal Card 入口（对齐 joyride `_revealCardWidget`）。
  final Widget? revealBanner;

  /// Flavor 之后追加区块（Relationship / Gift Wall 等）。
  final List<Widget> extraSections;

  Future<void> _copyId(BuildContext context) async {
    await Clipboard.setData(ClipboardData(text: userId));
    if (!context.mounted) return;
    AppToast.info('Saved to the clipboard');
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

    return AppScaffold(
      backgroundColor: AppColors.black111111,
      backdrop: Chimo.image(
        AppAssets.personalBg,
        fit: BoxFit.cover,
        alignment: Alignment.topCenter,
      ),
      appBar: AppNavBar(
        trailing: showMore
            ? IconButton(
                onPressed: onMore ?? () {},
                icon: const Icon(Icons.more_horiz_rounded, color: Colors.white, size: 20),
              )
            : null,
      ),
      body: Column(
        children: [
          Expanded(
            child: AppPullRefresh(
              onRefresh: onRefresh,
              padding: EdgeInsets.fromLTRB(16, math.max(8, avatarTop), 0, 24),
              slivers: [
                SliverToBoxAdapter(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _ProfileAvatarHeader(
                        avatarUrl: avatarUrl,
                        avatarAsset: avatarAsset,
                        avatarUnderReview: avatarUnderReview,
                        partyBanner: partyBanner,
                      ),
                      const SizedBox(height: 16),
                      _ProfileIdentity(
                        nickname: nickname,
                        userId: userId,
                        isMale: isMale,
                        age: age,
                        zodiac: zodiac,
                        showZodiac: showZodiac,
                        showGenderAge: showGenderAge,
                        vipIconUrl: vipIconUrl,
                        voiceSeconds: voiceSeconds,
                        voiceUrl: voiceUrl,
                        onCopyId: () => _copyId(context),
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
                      ?revealBanner,
                      if (moments.isNotEmpty)
                        _ProfileMoments(paths: moments, fallbackAsset: avatarAsset),
                      if (flavorTags.isNotEmpty) _ProfileFlavors(tags: flavorTags),
                      ...extraSections,
                    ],
                  ),
                ),
              ],
            ),
          ),
          ColoredBox(
            color: AppColors.black111111,
            child: Padding(
              padding: EdgeInsets.fromLTRB(16, 8, 16, 12 + bottomPadding),
              child: bottomBar,
            ),
          ),
        ],
      ),
    );
  }
}

class _ProfileAvatarHeader extends StatelessWidget {
  const _ProfileAvatarHeader({
    required this.avatarAsset,
    required this.avatarUnderReview,
    this.avatarUrl,
    this.partyBanner,
  });

  final String avatarAsset;
  final String? avatarUrl;
  final bool avatarUnderReview;
  final Widget? partyBanner;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 72.w,
      child: Stack(
        alignment: Alignment.topLeft,
        children: [
          if (partyBanner != null)
            Positioned(bottom: 0, left: 36.w, right: 0, child: partyBanner!),
          Positioned(
            left: 0,
            top: 0,
            child: Container(
              width: 72.w,
              height: 72.w,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Colors.white, width: 2),
              ),
              child: ClipOval(
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    Chimo.image(
                      avatarUrl,
                      fallbackAsset: avatarAsset,
                      fit: BoxFit.cover,
                      fadeIn: Duration.zero,
                    ),
                    if (avatarUnderReview)
                      ColoredBox(
                        color: Colors.black.withValues(alpha: 0.5),
                        child: const Center(
                          child: Text(
                            'Under review',
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.white, fontSize: 11, height: 1.1),
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _ProfileIdentity extends StatelessWidget {
  const _ProfileIdentity({
    required this.nickname,
    required this.userId,
    required this.isMale,
    required this.age,
    required this.zodiac,
    required this.showZodiac,
    required this.showGenderAge,
    required this.onCopyId,
    this.vipIconUrl,
    this.voiceSeconds,
    this.voiceUrl,
  });

  final String nickname;
  final String userId;
  final bool isMale;
  final int age;
  final String zodiac;
  final bool showZodiac;
  final bool showGenderAge;
  final String? vipIconUrl;
  final int? voiceSeconds;
  final String? voiceUrl;
  final VoidCallback onCopyId;

  @override
  Widget build(BuildContext context) {
    final showVoice =
        voiceSeconds != null && voiceSeconds! > 0 && (voiceUrl ?? '').trim().isNotEmpty;
    final vip = (vipIconUrl ?? '').trim();

    return Row(
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
                  onTap: onCopyId,
                  behavior: HitTestBehavior.opaque,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'ID:$userId',
                        style: const TextStyle(
                          color: AppColors.gray9A9A9A,
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          height: 18 / 12,
                        ),
                      ),
                      const SizedBox(width: 6),
                      Chimo.image(
                        AppAssets.mineCopy,
                        width: 10,
                        height: 10,
                        color: AppColors.gray9A9A9A,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 4),
                Wrap(
                  spacing: 4,
                  runSpacing: 4,
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: [
                    if (showZodiac && zodiac.trim().isNotEmpty)
                      _ProfileChip(
                        height: 20,
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        background: Colors.white12,
                        child: Text(
                          Zodiac.chipLabel(zodiac),
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
                        padding: const EdgeInsets.fromLTRB(0, 0, 4, 0),
                        background: isMale ? AppColors.blue0091FF : AppColors.pinkFF5BA8,
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Chimo.image(
                              isMale ? AppAssets.genderMan : AppAssets.genderWoman,
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
                    if (vip.isNotEmpty) _VipLevelIcon(url: vip),
                  ],
                ),
              ],
            ),
          ),
        ),
        if (showVoice) _VoiceCard(seconds: voiceSeconds!, source: voiceUrl),
      ],
    );
  }
}

class _ProfileMoments extends StatelessWidget {
  const _ProfileMoments({required this.paths, required this.fallbackAsset});

  final List<String> paths;
  final String fallbackAsset;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
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
            itemCount: paths.length,
            separatorBuilder: (_, _) => const SizedBox(width: 6),
            itemBuilder: (context, index) {
              final src = paths[index];
              return GestureDetector(
                onTap: () => AlbumPhotoViewerPage.open(context, paths: paths, initialIndex: index),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Chimo.image(
                    src,
                    width: 90,
                    height: 89,
                    fit: BoxFit.cover,
                    error: Chimo.image(fallbackAsset, width: 90, height: 89, fit: BoxFit.cover),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

class _ProfileFlavors extends StatelessWidget {
  const _ProfileFlavors({required this.tags});

  final List<ProfileFlavorTag> tags;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
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
            children: [for (final tag in tags) _FlavorChip(label: tag.label)],
          ),
        ),
      ],
    );
  }
}

/// 底部栏实心主按钮（编辑资料 / 关注 / 聊天）。
class ProfilePrimaryAction extends StatelessWidget {
  const ProfilePrimaryAction({super.key, required this.label, required this.onTap});

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
          gradient: AppColors.primaryGradient,
          borderRadius: BorderRadius.circular(24),
        ),
        child: Text(
          label,
          style: const TextStyle(
            color: AppColors.black1C1C1E,
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
  const ProfileOutlineAction({super.key, required this.label, required this.onTap});

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
          color: AppColors.black1C1C1E,
          borderRadius: BorderRadius.circular(24),
          border: Border.all(color: AppColors.green00F875, width: 1),
        ),
        child: Text(
          label,
          style: const TextStyle(
            color: AppColors.green00F875,
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
          color: AppColors.black1C1C1E,
          borderRadius: BorderRadius.circular(24),
        ),
        alignment: Alignment.center,
        child: Chimo.image(AppAssets.giftIcon, width: 30, height: 30, fit: BoxFit.contain),
      ),
    );
  }
}

class _ProfileChip extends StatelessWidget {
  const _ProfileChip({
    required this.child,
    this.background = AppColors.gray333333,
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
      decoration: BoxDecoration(color: background, borderRadius: BorderRadius.circular(height / 2)),
      child: Padding(
        padding: padding,
        child: SizedBox(
          height: height,
          child: Align(alignment: Alignment.center, widthFactor: 1, child: child),
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
      child: Chimo.image(url, height: 22, fit: BoxFit.fitHeight, error: const SizedBox.shrink()),
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
      _stopPlay(resetOnly: true);
    });
  }

  @override
  void didUpdateWidget(covariant _VoiceCard oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.seconds != widget.seconds || oldWidget.source != widget.source) {
      _stopPlay();
    }
  }

  @override
  void dispose() {
    AppVoiceExclusive.release(_exclusiveStop);
    _playTimer?.cancel();
    _completeSub?.cancel();
    _player.dispose();
    super.dispose();
  }

  void _exclusiveStop() {
    _stopPlay();
  }

  Future<void> _stopPlay({bool resetOnly = false}) async {
    _playTimer?.cancel();
    _playTimer = null;
    AppVoiceExclusive.release(_exclusiveStop);
    if (!resetOnly) {
      try {
        await _player.stop();
      } catch (_) {
        // 播放器已经停了 / 已释放：忽略。
      }
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
      AppToast.info('Voice file unavailable');
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
          _stopPlay();
          return;
        }
        setState(() => _remaining -= 1);
      });
    } catch (error) {
      AppLog.w('Profile voice play failed', error: error);
      AppVoiceExclusive.release(_exclusiveStop);
      if (!mounted) return;
      AppToast.info('Playback failed');
    }
  }

  @override
  Widget build(BuildContext context) {
    final displaySeconds = _playing ? _remaining : widget.seconds;

    return Padding(
      padding: const EdgeInsetsDirectional.only(end: 16),
      child: GestureDetector(
        onTap: () => _togglePlay(),
        behavior: HitTestBehavior.opaque,
        child: Container(
          width: 140,
          height: 32,
          padding: const EdgeInsets.symmetric(horizontal: 10),
          alignment: Alignment.center,
          decoration: const ShapeDecoration(
            shape: StadiumBorder(),
            color: AppColors.yellow1FFDF652,
          ),
          child: Row(
            children: [
              Chimo.image(
                _playing ? AppAssets.voicePauseIcon : AppAssets.voicePlayIcon,
                width: 18,
                height: 18,
              ),
              const SizedBox(width: 6),
              Expanded(
                child: SizedBox(
                  height: 14,
                  child: _playing
                      ? Chimo.image(
                          AppAssets.voiceWaveAnim,
                          fit: BoxFit.contain,
                          alignment: Alignment.centerLeft,
                        )
                      : Chimo.image(
                          AppAssets.voiceWaveLine,
                          height: 10,
                          fit: BoxFit.contain,
                          color: AppColors.white70,
                        ),
                ),
              ),
              const SizedBox(width: 6),
              Text(
                '$displaySeconds"',
                style: const TextStyle(
                  color: AppColors.white50,
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
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
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(color: AppColors.white12, borderRadius: BorderRadius.circular(15)),
      child: Text(
        label,
        style: const TextStyle(
          color: AppColors.gray9A9A9A,
          fontSize: 12,
          fontWeight: FontWeight.w400,
          height: 1.2,
        ),
      ),
    );
  }
}
