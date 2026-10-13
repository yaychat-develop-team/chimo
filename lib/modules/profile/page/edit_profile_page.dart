import 'dart:async';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:focus_on_it/focus_on_it.dart';
import 'package:get/get.dart';

import '../../../app/app_jumper.dart';
import '../../../common/utils/app_audio_playback.dart';
import '../../../common/constants/app_assets.dart';
import '../../../common/theme/app_colors.dart';
import '../../../common/theme/app_text.dart';
import '../../../common/utils/app_log.dart';
import '../../../common/widgets/app_back_button.dart';
import '../../../common/widgets/app_image.dart';
import '../../../common/widgets/app_gradient_button.dart';
import '../../../common/widgets/app_scaffold.dart';
import '../../../app/auth/onboarding_state.dart';
import '../../../common/widgets/skip_button.dart';
import '../../../common/extensions/wire_view.dart';
import '../../../common/models/server_client/user.pb.dart';
import 'album_photo_viewer_page.dart';
import '../logic/edit_profile_logic.dart';
import 'widgets/photo_pick_sheet.dart';
import '../../../common/utils/time_fmt.dart';
import '../../../common/theme/app_bottom_sheet.dart';
import '../../../common/utils/app_toast.dart';

/// 编辑资料页（forya MineDataEditPage）。
class EditProfilePage extends StatefulWidget {
  const EditProfilePage({super.key, this.profile});

  /// 首帧资料（列表点进来的那份）；只作预填，logic 会再拉全。
  final User? profile;

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  late final EditProfileLogic logic;

  @override
  void initState() {
    super.initState();
    logic = Get.put(EditProfileLogic(seed: widget.profile ?? User()));
  }

  @override
  void dispose() {
    if (Get.isRegistered<EditProfileLogic>()) {
      Get.delete<EditProfileLogic>();
    }
    super.dispose();
  }

  void _toast(BuildContext context, String message, {required bool ok}) {
    AppToast.error(message);
  }

  /// logic 的方法把「要不要提示、提示什么」返回上来，这里统一弹。
  Future<void> _run(BuildContext context, Future<PersistOutcome?> Function() action) async {
    final outcome = await action();
    if (outcome == null || !context.mounted) return;
    _toast(context, outcome.message, ok: outcome.ok);
  }

  /// 离开页面：引导流程回首页，普通流程带结果 pop。
  void _leave(BuildContext context) {
    if (logic.fromOnboarding) {
      unawaited(OnboardingState.finishToHome(context));
      return;
    }
    AppJumper.back(result: logic.buildResult());
  }

  Future<void> _save(BuildContext context) async {
    final outcome = await logic.save();
    if (!context.mounted) return;
    final message = outcome.message;
    if (message != null) _toast(context, message, ok: false);
    if (outcome.saved) _leave(context);
  }

  Future<void> _openAvatar() async {
    final url = await AppJumper.toEditPicture(
      avatarAsset: AppAssets.avatarPlace,
      avatarUrl: logic.profile.value.shownAvatar,
    );
    if (url == null || url.isEmpty) return;
    logic.applyAvatar(url);
  }

  /// 底部弹层要 BuildContext。选完来源后的挑图、落盘和上传在 Logic。
  Future<void> _pickAlbumPhoto(BuildContext context) async {
    final action = await showPhotoPickSheet(context);
    if (action == null || !context.mounted) return;
    await _run(
      context,
      () => logic.pickAlbumPhoto(fromCamera: action == PhotoPickAction.takePhoto),
    );
  }

  Future<void> _openGender(BuildContext context) async {
    final result = await AppBottomSheet.show<String>(
      isScrollControlled: true,
      child: _GenderPickerSheet(initialGender: logic.gender.value),
    );
    if (result == null || !context.mounted) return;
    await _run(context, () => logic.applyGender(result));
  }

  Future<void> _openBirthday(BuildContext context) async {
    var temp = DateTime.tryParse(logic.birthday.value) ?? DateTime(1995, 1, 1);
    final now = DateTime.now();
    if (temp.isAfter(now)) temp = now;

    final picked = await AppBottomSheet.show<DateTime>(
      backgroundColor: AppColors.surfaceSheet,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      child: SafeArea(
        child: SizedBox(
          height: 320,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(8, 8, 8, 0),
                child: Row(
                  children: [
                    TextButton(
                      onPressed: AppJumper.back,
                      child: const Text('Cancel', style: AppText.field),
                    ),
                    const Spacer(),
                    TextButton(
                      onPressed: () => AppJumper.back(result: temp),
                      child: const Text(
                        'Done',
                        style: TextStyle(
                          color: AppColors.primaryBright,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: CupertinoTheme(
                  data: const CupertinoThemeData(
                    brightness: Brightness.dark,
                    textTheme: CupertinoTextThemeData(
                      dateTimePickerTextStyle: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  ),
                  child: CupertinoDatePicker(
                    mode: CupertinoDatePickerMode.date,
                    initialDateTime: temp,
                    maximumDate: now,
                    minimumDate: DateTime(1920, 1, 1),
                    onDateTimeChanged: (value) => temp = value,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
    if (picked == null || !context.mounted) return;
    await _run(context, () => logic.applyBirthday(picked));
  }

  @override
  Widget build(BuildContext context) {
    final bottom = MediaQuery.paddingOf(context).bottom;

    return PopScope(
      canPop: false,
      // 手势返回被拦住 → 由代码带着结果退。
      onPopInvokedWithResult: (didPop, _) {
        if (didPop) return;
        _leave(context);
      },
      child: FocusOnIt(
        onFocus: logic.onPageFocused,
        child: Obx(() {
          final profile = logic.profile.value;
          final signature = logic.signature.value;
          return ChimoScaffold(
            backgroundColor: AppColors.backgroundDeep,
            loading: logic.loading.value || logic.albumUploading.value,
            navigation: _EditProfileAppBar(
              onBack: () => _leave(context),
              completionPercent: logic.completionPercent,
              onSkip: logic.fromOnboarding
                  ? () => unawaited(OnboardingState.finishToHome(context))
                  : null,
            ),
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  child: ListView(
                    padding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
                    children: [
                      _AvatarCard(
                        avatarAsset: AppAssets.avatarPlace,
                        avatarUrl: profile.shownAvatar,
                        underReview: profile.avatarAudit.trim().isNotEmpty,
                        onTap: () => unawaited(_openAvatar()),
                      ),
                      const SizedBox(height: 16),
                      _PhotoCard(
                        paths: logic.photoPaths.toList(),
                        underReview: logic.photoUnderReview,
                        busy: logic.albumUploading.value,
                        onAdd: () => unawaited(_pickAlbumPhoto(context)),
                        onRemove: (index) =>
                            unawaited(_run(context, () => logic.removeAlbumPhoto(index))),
                        onOpen: (index) {
                          AlbumPhotoViewerPage.open(
                            context,
                            paths: List<String>.from(logic.photoPaths),
                            initialIndex: index,
                          );
                        },
                      ),
                      const SizedBox(height: 16),
                      _PromptCard(
                        title: 'My Signature',
                        hint: signature.isEmpty
                            ? "Don't be shy! Drop a fun line about yourself!"
                            : signature,
                        hintAsValue: signature.isNotEmpty,
                        onTap: () => unawaited(_run(context, logic.openSignature)),
                      ),
                      const SizedBox(height: 16),
                      _VoiceNoteCard(
                        seconds: logic.voiceSeconds.value,
                        source: logic.voiceUrl.value,
                        onTap: () => unawaited(_run(context, logic.openVoiceNote)),
                        onDelete: () => unawaited(_run(context, logic.deleteVoiceNote)),
                      ),
                      const SizedBox(height: 16),
                      _TagsCard(
                        tags: logic.tags.toList(),
                        onTap: () => unawaited(_run(context, logic.openTags)),
                      ),
                      const SizedBox(height: 16),
                      _BasicInfoCard(
                        nickname: logic.nickname.value,
                        gender: logic.gender.value,
                        birthday: logic.birthday.value,
                        height: logic.height.value,
                        weight: logic.weight.value,
                        onNicknameTap: () => unawaited(_run(context, logic.openNickname)),
                        onGenderTap: () => unawaited(_openGender(context)),
                        onBirthdayTap: () => unawaited(_openBirthday(context)),
                        onHeightTap: () => unawaited(_run(context, logic.openHeight)),
                        onWeightTap: () => unawaited(_run(context, logic.openWeight)),
                      ),
                    ],
                  ),
                ),
                if (logic.fromOnboarding)
                  Padding(
                    padding: EdgeInsets.fromLTRB(16, 8, 16, 12 + bottom),
                    child: AppGradientButton(
                      label: 'Save',
                      onTap: () => unawaited(_save(context)),
                      height: 48,
                      borderRadius: 24,
                      loading: logic.saving.value,
                    ),
                  ),
              ],
            ),
          );
        }),
      ),
    );
  }
}

class _EditProfileAppBar extends StatelessWidget {
  const _EditProfileAppBar({required this.onBack, required this.completionPercent, this.onSkip});

  final VoidCallback onBack;
  final int completionPercent;
  final VoidCallback? onSkip;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: AppBackButton(onPressed: onBack),
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                'Edit Profile',
                style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w600),
              ),
              const SizedBox(width: 8),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  '$completionPercent%',
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                    height: 1.1,
                  ),
                ),
              ),
            ],
          ),
          if (onSkip != null)
            Align(
              alignment: Alignment.centerRight,
              child: SkipButton(onPressed: onSkip),
            ),
        ],
      ),
    );
  }
}

class _Chevron extends StatelessWidget {
  const _Chevron();

  @override
  Widget build(BuildContext context) {
    return AppImage(AppAssets.mineArrow, width: 5, height: 8, color: AppColors.textGray8A);
  }
}

class _SectionCard extends StatelessWidget {
  const _SectionCard({required this.child, this.onTap, this.padding});

  final Widget child;
  final VoidCallback? onTap;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    final content = Padding(
      padding: padding ?? const EdgeInsets.fromLTRB(14, 14, 14, 14),
      child: child,
    );

    return Material(
      color: AppColors.surfaceSheet,
      borderRadius: BorderRadius.circular(16),
      clipBehavior: Clip.antiAlias,
      child: onTap == null
          ? content
          : InkWell(onTap: onTap, borderRadius: BorderRadius.circular(16), child: content),
    );
  }
}

class _AvatarCard extends StatelessWidget {
  const _AvatarCard({
    required this.avatarAsset,
    required this.onTap,
    this.avatarUrl,
    this.underReview = false,
  });

  final String avatarAsset;
  final String? avatarUrl;
  final bool underReview;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return _SectionCard(
      onTap: onTap,
      padding: const EdgeInsets.fromLTRB(14, 14, 14, 14),
      child: SizedBox(
        height: 96,
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: SizedBox(
                width: 96,
                height: 96,
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    AppImage(
                      avatarUrl,
                      fallbackAsset: avatarAsset,
                      width: 96,
                      height: 96,
                      fit: BoxFit.cover,
                      fadeIn: Duration.zero,
                    ),
                    if (underReview)
                      const Align(
                        alignment: Alignment.bottomCenter,
                        child: ColoredBox(
                          color: AppColors.scrimBlack60,
                          child: Padding(
                            padding: EdgeInsets.symmetric(vertical: 4),
                            child: Text(
                              'Under review',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: AppColors.giftYellow,
                                fontSize: 10,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            ),
            const SizedBox(width: 12),
            const Expanded(child: Text('My Profile Picture', style: AppText.label)),
            const Text(
              'Edit',
              style: TextStyle(
                color: AppColors.textGray8A,
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
            ),
            const SizedBox(width: 6),
            const _Chevron(),
          ],
        ),
      ),
    );
  }
}

class _PhotoCard extends StatelessWidget {
  const _PhotoCard({
    required this.paths,
    required this.onAdd,
    required this.onRemove,
    required this.onOpen,
    required this.underReview,
    this.busy = false,
  });

  final List<String> paths;
  final VoidCallback onAdd;
  final ValueChanged<int> onRemove;
  final ValueChanged<int> onOpen;
  final bool Function(String path) underReview;
  final bool busy;

  @override
  Widget build(BuildContext context) {
    final count = paths.length;
    final canAdd = !busy && count < EditProfileLogic.maxPhotos;

    return _SectionCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('My Photos ($count/${EditProfileLogic.maxPhotos})', style: AppText.label),
          const SizedBox(height: 12),
          Wrap(
            spacing: 10,
            runSpacing: 10,
            children: [
              if (canAdd)
                Material(
                  color: AppColors.surfaceField,
                  borderRadius: BorderRadius.circular(12),
                  child: InkWell(
                    onTap: onAdd,
                    borderRadius: BorderRadius.circular(12),
                    child: const SizedBox(
                      width: 98,
                      height: 98,
                      child: Icon(Icons.add_rounded, color: Colors.white, size: 28),
                    ),
                  ),
                ),
              ...paths.indexed.map((entry) {
                final (index, path) = entry;
                return _PhotoThumb(
                  path: path,
                  underReview: underReview(path),
                  onTap: () => onOpen(index),
                  onRemove: () => onRemove(index),
                );
              }),
            ],
          ),
        ],
      ),
    );
  }
}

class _PhotoThumb extends StatelessWidget {
  const _PhotoThumb({
    required this.path,
    required this.onTap,
    required this.onRemove,
    this.underReview = false,
  });

  final String path;
  final VoidCallback onTap;
  final VoidCallback onRemove;
  final bool underReview;

  @override
  Widget build(BuildContext context) {
    // path 可能是本地绝对路径、完整 URL，或接口返回的 CDN 相对 key
    // （`/upload/xxx.jpg`）。三种都由 AppImage 分辨，CDN 域名已在 main() 注入。
    return Stack(
      children: [
        GestureDetector(
          onTap: onTap,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: AppImage(
              path,
              width: 98,
              height: 98,
              fit: BoxFit.cover,
              error: Container(
                width: 98,
                height: 98,
                color: AppColors.surfaceField,
                alignment: Alignment.center,
                child: const Icon(Icons.broken_image_outlined, color: Colors.white54),
              ),
            ),
          ),
        ),
        if (underReview)
          const Positioned(
            left: 4,
            right: 4,
            bottom: 4,
            child: DecoratedBox(
              decoration: BoxDecoration(
                color: AppColors.scrimBlack50,
                borderRadius: BorderRadius.all(Radius.circular(8)),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 2),
                child: Text(
                  'Under review',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: AppColors.giftYellow,
                    fontSize: 10,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
          ),
        if (!underReview)
          Positioned(
            top: 4,
            right: 4,
            child: GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: onRemove,
              child: Container(
                width: 22,
                height: 22,
                decoration: const BoxDecoration(
                  color: AppColors.scrimBlack80,
                  shape: BoxShape.circle,
                ),
                child: const Icon(Icons.close, size: 14, color: Colors.white),
              ),
            ),
          ),
      ],
    );
  }
}

class _PromptCard extends StatelessWidget {
  const _PromptCard({
    required this.title,
    required this.hint,
    this.onTap,
    this.hintAsValue = false,
  });

  final String title;
  final String hint;
  final VoidCallback? onTap;
  final bool hintAsValue;

  @override
  Widget build(BuildContext context) {
    return _SectionCard(
      onTap: onTap ?? () {},
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(child: Text(title, style: AppText.label)),
              const _Chevron(),
            ],
          ),
          const SizedBox(height: 12),
          Text(
            hint,
            maxLines: 4,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              color: hintAsValue ? AppColors.textGrayB0 : AppColors.textGray8A,
              fontSize: 13,
              fontWeight: FontWeight.w400,
              height: 20 / 13,
            ),
          ),
        ],
      ),
    );
  }
}

class _VoiceNoteCard extends StatefulWidget {
  const _VoiceNoteCard({
    required this.seconds,
    required this.onTap,
    required this.onDelete,
    this.source,
  });

  final int? seconds;

  /// Remote URL or local file path for playback.
  final String? source;
  final VoidCallback onTap;
  final VoidCallback onDelete;

  @override
  State<_VoiceNoteCard> createState() => _VoiceNoteCardState();
}

class _VoiceNoteCardState extends State<_VoiceNoteCard> {
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
  void didUpdateWidget(covariant _VoiceNoteCard oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.seconds != widget.seconds || oldWidget.source != widget.source) {
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
    final seconds = widget.seconds;
    final source = (widget.source ?? '').trim();
    if (seconds == null || seconds <= 0 || source.isEmpty) return;
    if (_playing) {
      await _stopPlay();
      return;
    }
    try {
      AppVoiceExclusive.claim(_exclusiveStop);
      await AppAudioPlayback.play(_player, source);
      if (!mounted) return;
      setState(() {
        _playing = true;
        _remaining = seconds;
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
      AppLog.w('Edit voice play failed', error: error);
      AppVoiceExclusive.release(_exclusiveStop);
      if (!mounted) return;
      AppToast.error('Playback failed: $error');
    }
  }

  Future<void> _onDelete() async {
    await _stopPlay();
    widget.onDelete();
  }

  @override
  Widget build(BuildContext context) {
    final seconds = widget.seconds;
    final hasVoice = seconds != null && seconds > 0;
    final displaySeconds = _playing ? _remaining : (seconds ?? 0);

    return _SectionCard(
      onTap: hasVoice ? null : widget.onTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: widget.onTap,
            child: const Row(
              children: [
                Expanded(child: Text('Voice Note', style: AppText.label)),
                _Chevron(),
              ],
            ),
          ),
          const SizedBox(height: 12),
          if (!hasVoice)
            GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: widget.onTap,
              child: const Text(
                'Speak up — your voice is your vibe!',
                style: TextStyle(
                  color: AppColors.textGray8A,
                  fontSize: 13,
                  fontWeight: FontWeight.w400,
                  height: 20 / 13,
                ),
              ),
            )
          else
            Row(
              children: [
                GestureDetector(
                  onTap: () => unawaited(_togglePlay()),
                  behavior: HitTestBehavior.opaque,
                  child: Container(
                    width: 140,
                    height: 32,
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: AppColors.giftYellowSoft,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Row(
                      children: [
                        AppImage(
                          _playing ? AppAssets.voicePauseIcon : AppAssets.voicePlayIcon,
                          width: 18,
                          height: 18,
                        ),
                        const SizedBox(width: 6),
                        Expanded(
                          child: SizedBox(
                            height: 14,
                            child: _playing
                                ? AppImage(
                                    AppAssets.voiceWaveAnim,
                                    fit: BoxFit.contain,
                                    alignment: Alignment.centerLeft,
                                  )
                                : AppImage(
                                    AppAssets.voiceWaveLine,
                                    height: 10,
                                    fit: BoxFit.contain,
                                    color: Colors.white70,
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
                ),
                const Spacer(),
                GestureDetector(
                  onTap: () => unawaited(_onDelete()),
                  child: AppImage(
                    AppAssets.voiceDeleteIcon,
                    width: 28,
                    height: 28,
                    fit: BoxFit.contain,
                  ),
                ),
              ],
            ),
        ],
      ),
    );
  }
}

class _TagsCard extends StatelessWidget {
  const _TagsCard({required this.tags, required this.onTap});

  final List<String> tags;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return _SectionCard(
      onTap: onTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Row(
            children: [
              Expanded(child: Text('My Tags', style: AppText.label)),
              _Chevron(),
            ],
          ),
          const SizedBox(height: 12),
          if (tags.isEmpty)
            const Text(
              'Pick tags to find like-minded friends!',
              style: TextStyle(
                color: AppColors.textGray8A,
                fontSize: 13,
                fontWeight: FontWeight.w400,
                height: 20 / 13,
              ),
            )
          else
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: tags.map((tag) {
                return DecoratedBox(
                  decoration: BoxDecoration(
                    color: AppColors.surfaceField,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 7),
                    child: Text(
                      tag,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        height: 1.2,
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
        ],
      ),
    );
  }
}

class _BasicInfoCard extends StatelessWidget {
  const _BasicInfoCard({
    required this.nickname,
    required this.gender,
    required this.birthday,
    this.height,
    this.weight,
    this.onNicknameTap,
    this.onGenderTap,
    this.onBirthdayTap,
    this.onHeightTap,
    this.onWeightTap,
  });

  final String nickname;
  final String gender;
  final String birthday;
  final int? height;
  final int? weight;
  final VoidCallback? onNicknameTap;
  final VoidCallback? onGenderTap;
  final VoidCallback? onBirthdayTap;
  final VoidCallback? onHeightTap;
  final VoidCallback? onWeightTap;

  String get _birthdayDisplay {
    final raw = birthday.trim();
    if (raw.isEmpty) return '';
    final parsed = DateTime.tryParse(raw);
    if (parsed == null) return raw;
    return TimeFmt.slashDate(parsed);
  }

  @override
  Widget build(BuildContext context) {
    return _SectionCard(
      padding: const EdgeInsets.fromLTRB(14, 16, 14, 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('My Basic Info', style: AppText.label),
          const SizedBox(height: 12),
          _InfoRow(label: 'NickName', value: nickname, onTap: onNicknameTap),
          _InfoRow(label: 'Gender', value: gender, onTap: onGenderTap),
          _InfoRow(label: 'Birthday', value: _birthdayDisplay, onTap: onBirthdayTap),
          _InfoRow(
            label: 'Height',
            value: height == null ? '' : '${height}Inch',
            onTap: onHeightTap,
          ),
          _InfoRow(
            label: 'Weight',
            value: weight == null ? '' : '${weight}Ib',
            showDivider: false,
            onTap: onWeightTap,
          ),
        ],
      ),
    );
  }
}

class _InfoRow extends StatelessWidget {
  const _InfoRow({required this.label, required this.value, this.showDivider = true, this.onTap});

  final String label;
  final String value;
  final bool showDivider;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: onTap ?? () {},
          child: SizedBox(
            height: 52,
            child: Row(
              children: [
                Text(
                  label,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Expanded(
                  child: Text(
                    value,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.right,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                const SizedBox(width: 6),
                const _Chevron(),
              ],
            ),
          ),
        ),
        if (showDivider) const Divider(height: 1, thickness: 1, color: AppColors.divider),
      ],
    );
  }
}

class _GenderPickerSheet extends StatefulWidget {
  const _GenderPickerSheet({required this.initialGender});

  final String initialGender;

  @override
  State<_GenderPickerSheet> createState() => _GenderPickerSheetState();
}

class _GenderPickerSheetState extends State<_GenderPickerSheet> {
  late String _selected;

  @override
  void initState() {
    super.initState();
    _selected = widget.initialGender;
  }

  @override
  Widget build(BuildContext context) {
    final bottom = MediaQuery.paddingOf(context).bottom;

    return Container(
      decoration: const BoxDecoration(
        color: AppColors.surfaceSheet,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      padding: EdgeInsets.fromLTRB(16, 24, 16, 20 + bottom),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            height: 32,
            child: Stack(
              alignment: Alignment.center,
              children: [
                const Text(
                  'Gender',
                  style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w600),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: GestureDetector(
                    onTap: () => AppJumper.back(result: _selected),
                    behavior: HitTestBehavior.opaque,
                    child: const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 4, vertical: 4),
                      child: Text(
                        'Save',
                        style: TextStyle(
                          color: AppColors.accentLime,
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 28),
          Row(
            children: [
              Expanded(
                child: _GenderOption(
                  label: 'Male',
                  iconAsset: AppAssets.genderMan,
                  selected: _selected == 'Male',
                  onTap: () => setState(() => _selected = 'Male'),
                ),
              ),
              const SizedBox(width: 15),
              Expanded(
                child: _GenderOption(
                  label: 'Female',
                  iconAsset: AppAssets.genderWoman,
                  selected: _selected == 'Female',
                  onTap: () => setState(() => _selected = 'Female'),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _GenderOption extends StatelessWidget {
  const _GenderOption({
    required this.label,
    required this.iconAsset,
    required this.selected,
    required this.onTap,
  });

  final String label;
  final String iconAsset;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: selected ? AppColors.surfaceOliveActive : AppColors.tagBackground,
      borderRadius: BorderRadius.circular(27),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(27),
        child: Container(
          height: 54,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(27),
            border: Border.all(
              color: selected ? AppColors.accentLime : Colors.transparent,
              width: 1.5,
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AppImage(iconAsset, width: 16, height: 16),
              const SizedBox(width: 8),
              Text(label, style: AppText.field),
            ],
          ),
        ),
      ),
    );
  }
}
