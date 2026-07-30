import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../core/constants/app_assets.dart';
import '../../core/theme/app_colors.dart';
import '../me/models/me_models.dart';
import 'body_metric_page.dart';
import 'my_picture_page.dart';
import 'my_tags_page.dart';
import 'nickname_page.dart';
import 'personal_signature_page.dart';
import 'photo_pick_sheet.dart';
import 'voice_note_page.dart';

/// 编辑资料页。
class EditProfilePage extends StatefulWidget {
  const EditProfilePage({
    super.key,
    required this.profile,
    this.completionPercent = 15,
    this.photoCount = 0,
  });

  final MeProfile profile;
  final int completionPercent;
  final int photoCount;

  static const int maxPhotos = 9;

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  String _signature = '';
  String _nickname = '';
  String _gender = 'Male';
  String _birthday = '1995-01-01';
  int? _height;
  int? _weight;
  int? _voiceSeconds;
  List<String> _tags = const [];
  bool _nicknameChangedOnce = false;

  @override
  void initState() {
    super.initState();
    final p = widget.profile;
    _signature = p.signature;
    _nickname = p.displayName;
    _gender = p.gender;
    _birthday = p.birthday;
    _height = p.height;
    _weight = p.weight;
    _voiceSeconds = p.voiceSeconds;
    _tags = List<String>.from(p.tags);
    _nicknameChangedOnce = p.nicknameChangedOnce;
  }

  MeProfile _buildResult() {
    return widget.profile.copyWith(
      displayName: _nickname,
      gender: _gender,
      birthday: _birthday,
      height: _height,
      weight: _weight,
      clearHeight: _height == null,
      clearWeight: _weight == null,
      signature: _signature,
      tags: _tags,
      voiceSeconds: _voiceSeconds,
      clearVoice: _voiceSeconds == null,
      nicknameChangedOnce: _nicknameChangedOnce,
    );
  }

  void _popWithResult() {
    Navigator.of(context).pop(_buildResult());
  }

  Future<void> _openSignature() async {
    final result = await Navigator.of(context).push<String>(
      MaterialPageRoute(
        builder: (_) => PersonalSignaturePage(initialText: _signature),
      ),
    );
    if (!mounted || result == null) return;
    setState(() => _signature = result);
  }

  Future<void> _openNickname() async {
    final result = await Navigator.of(context).push<String>(
      MaterialPageRoute(
        builder: (_) => NicknamePage(
          initialText: _nickname,
          showRules: _nicknameChangedOnce,
        ),
      ),
    );
    if (!mounted || result == null) return;
    setState(() {
      if (result != _nickname) {
        _nicknameChangedOnce = true;
      }
      _nickname = result;
    });
  }

  Future<void> _openVoiceNote() async {
    final result = await Navigator.of(context).push<int>(
      MaterialPageRoute(builder: (_) => const VoiceNotePage()),
    );
    if (!mounted || result == null || result <= 0) return;
    setState(() => _voiceSeconds = result);
  }

  void _deleteVoiceNote() {
    setState(() => _voiceSeconds = null);
  }

  Future<void> _openTags() async {
    final result = await Navigator.of(context).push<List<String>>(
      MaterialPageRoute(
        builder: (_) => MyTagsPage(initialSelected: _tags),
      ),
    );
    if (!mounted || result == null) return;
    setState(() => _tags = result);
  }

  Future<void> _openGender() async {
    final result = await showModalBottomSheet<String>(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      builder: (_) => _GenderPickerSheet(initialGender: _gender),
    );
    if (!mounted || result == null) return;
    setState(() => _gender = result);
  }

  Future<void> _openBirthday() async {
    var temp = DateTime.tryParse(_birthday) ?? DateTime(1995, 1, 1);
    final now = DateTime.now();
    if (temp.isAfter(now)) temp = now;

    final picked = await showModalBottomSheet<DateTime>(
      context: context,
      backgroundColor: const Color(0xFF1C1C1E),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (sheetContext) {
        return SafeArea(
          child: SizedBox(
            height: 320,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(8, 8, 8, 0),
                  child: Row(
                    children: [
                      TextButton(
                        onPressed: () => Navigator.pop(sheetContext),
                        child: const Text(
                          'Cancel',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      const Spacer(),
                      TextButton(
                        onPressed: () => Navigator.pop(sheetContext, temp),
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
                        dateTimePickerTextStyle: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
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
        );
      },
    );
    if (!mounted || picked == null) return;
    final y = picked.year.toString().padLeft(4, '0');
    final m = picked.month.toString().padLeft(2, '0');
    final d = picked.day.toString().padLeft(2, '0');
    setState(() => _birthday = '$y-$m-$d');
  }

  Future<void> _openHeight() async {
    final result = await Navigator.of(context).push<int>(
      MaterialPageRoute(
        builder: (_) => BodyMetricPage(
          title: 'Height',
          unit: 'Inch',
          hint: 'Enter height',
          min: 50,
          max: 100,
          initialValue: _height,
        ),
      ),
    );
    if (!mounted || result == null) return;
    setState(() => _height = result);
  }

  Future<void> _openWeight() async {
    final result = await Navigator.of(context).push<int>(
      MaterialPageRoute(
        builder: (_) => BodyMetricPage(
          title: 'Weight',
          unit: 'LB',
          hint: 'Enter weight',
          min: 80,
          max: 330,
          initialValue: _weight,
        ),
      ),
    );
    if (!mounted || result == null) return;
    setState(() => _weight = result);
  }

  @override
  Widget build(BuildContext context) {
    final signatureHint = _signature.isEmpty
        ? "Don't be shy! Drop a fun line about yourself!"
        : _signature;

    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, _) {
        if (didPop) return;
        _popWithResult();
      },
      child: Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _EditProfileAppBar(
              percent: widget.completionPercent,
              onBack: _popWithResult,
            ),
            Expanded(
              child: ListView(
                padding: const EdgeInsets.fromLTRB(16, 8, 16, 24),
                children: [
                  _AvatarCard(
                    avatarAsset: widget.profile.avatarAsset,
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute<void>(
                          builder: (_) => MyPicturePage(
                            avatarAsset: widget.profile.avatarAsset,
                          ),
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: 12),
                  _PhotoCard(count: widget.photoCount),
                  const SizedBox(height: 12),
                  _PromptCard(
                    title: 'My Signature',
                    hint: signatureHint,
                    hintAsValue: _signature.isNotEmpty,
                    onTap: _openSignature,
                  ),
                  const SizedBox(height: 12),
                  _VoiceNoteCard(
                    seconds: _voiceSeconds,
                    onTap: _openVoiceNote,
                    onDelete: _deleteVoiceNote,
                  ),
                  const SizedBox(height: 12),
                  _TagsCard(tags: _tags, onTap: _openTags),
                  const SizedBox(height: 12),
                  _BasicInfoCard(
                    nickname: _nickname,
                    gender: _gender,
                    birthday: _birthday,
                    height: _height,
                    weight: _weight,
                    onNicknameTap: _openNickname,
                    onGenderTap: _openGender,
                    onBirthdayTap: _openBirthday,
                    onHeightTap: _openHeight,
                    onWeightTap: _openWeight,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      ),
    );
  }
}

class _EditProfileAppBar extends StatelessWidget {
  const _EditProfileAppBar({required this.percent, required this.onBack});

  final int percent;
  final VoidCallback onBack;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: IconButton(
              onPressed: onBack,
              icon: SvgPicture.asset(
                AppAssets.chatBack,
                width: 17,
                height: 7,
              ),
            ),
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                'Edit Profile',
                style: TextStyle(
                  color: AppColors.textPrimary,
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(width: 8),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  '$percent%',
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 11,
                    fontWeight: FontWeight.w700,
                    height: 1,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _SectionCard extends StatelessWidget {
  const _SectionCard({required this.child, this.onTap});

  final Widget child;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: const Color(0xFF1C1C1E),
      borderRadius: BorderRadius.circular(16),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16),
        child: Padding(
          padding: const EdgeInsets.all(14),
          child: child,
        ),
      ),
    );
  }
}

class _AvatarCard extends StatelessWidget {
  const _AvatarCard({required this.avatarAsset, required this.onTap});

  final String avatarAsset;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return _SectionCard(
      onTap: onTap,
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(14),
            child: Image.asset(
              avatarAsset,
              width: 72,
              height: 72,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 14),
          const Expanded(
            child: Text(
              'My Profile Picture',
              style: TextStyle(
                color: AppColors.textPrimary,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          const Text(
            'Edit',
            style: TextStyle(
              color: AppColors.textSecondary,
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
          const Icon(
            Icons.chevron_right_rounded,
            color: AppColors.textSecondary,
            size: 20,
          ),
        ],
      ),
    );
  }
}

class _PhotoCard extends StatelessWidget {
  const _PhotoCard({required this.count});

  final int count;

  Future<void> _onAdd(BuildContext context) async {
    final action = await showPhotoPickSheet(context);
    if (!context.mounted || action == null) return;
    final tip = switch (action) {
      PhotoPickAction.takePhoto => 'Take Photo',
      PhotoPickAction.gallery => 'Choose from Gallery',
    };
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(tip),
        behavior: SnackBarBehavior.floating,
        duration: const Duration(seconds: 1),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _SectionCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'My Photo ($count/${EditProfilePage.maxPhotos})',
            style: const TextStyle(
              color: AppColors.textPrimary,
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 12),
          GestureDetector(
            onTap: () => _onAdd(context),
            child: Container(
              width: 72,
              height: 72,
              decoration: BoxDecoration(
                color: const Color(0xFF2C2C2E),
                borderRadius: BorderRadius.circular(14),
              ),
              child: const Icon(
                Icons.add_rounded,
                color: AppColors.textPrimary,
                size: 32,
              ),
            ),
          ),
        ],
      ),
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
              Expanded(
                child: Text(
                  title,
                  style: const TextStyle(
                    color: AppColors.textPrimary,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              const Icon(
                Icons.chevron_right_rounded,
                color: AppColors.textSecondary,
                size: 20,
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            hint,
            style: TextStyle(
              color: hintAsValue
                  ? AppColors.textSecondary
                  : AppColors.textTertiary,
              fontSize: 13,
              fontWeight: FontWeight.w400,
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
  });

  final int? seconds;
  final VoidCallback onTap;
  final VoidCallback onDelete;

  @override
  State<_VoiceNoteCard> createState() => _VoiceNoteCardState();
}

class _VoiceNoteCardState extends State<_VoiceNoteCard> {
  bool _playing = false;
  int _remaining = 0;
  Timer? _playTimer;

  @override
  void didUpdateWidget(covariant _VoiceNoteCard oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.seconds != widget.seconds) {
      _stopPlay();
    }
  }

  @override
  void dispose() {
    _playTimer?.cancel();
    super.dispose();
  }

  void _stopPlay() {
    _playTimer?.cancel();
    _playTimer = null;
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
    final seconds = widget.seconds;
    if (seconds == null || seconds <= 0) return;
    if (_playing) {
      _stopPlay();
      return;
    }
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
        setState(() {
          _playing = false;
          _remaining = 0;
        });
        return;
      }
      setState(() => _remaining -= 1);
    });
  }

  void _onDelete() {
    _stopPlay();
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
                Expanded(
                  child: Text(
                    'Voice Note',
                    style: TextStyle(
                      color: AppColors.textPrimary,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                Icon(
                  Icons.chevron_right_rounded,
                  color: AppColors.textSecondary,
                  size: 20,
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          if (!hasVoice)
            GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: widget.onTap,
              child: const Text(
                'Speak up — your voice is your vibe!',
                style: TextStyle(
                  color: AppColors.textTertiary,
                  fontSize: 13,
                  fontWeight: FontWeight.w400,
                ),
              ),
            )
          else
            Row(
              children: [
                Container(
                  height: 36,
                  constraints: const BoxConstraints(minWidth: 148, maxWidth: 168),
                  padding: const EdgeInsets.fromLTRB(3, 3, 10, 3),
                  decoration: BoxDecoration(
                    color: const Color(0xFF2E2E16),
                    borderRadius: BorderRadius.circular(18),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      GestureDetector(
                        onTap: _togglePlay,
                        child: Container(
                          width: 30,
                          height: 30,
                          decoration: const BoxDecoration(
                            color: Color(0xFFFDF652),
                            shape: BoxShape.circle,
                          ),
                          alignment: Alignment.center,
                          child: Icon(
                            _playing
                                ? Icons.pause_rounded
                                : Icons.play_arrow_rounded,
                            color: Colors.black,
                            size: 22,
                          ),
                        ),
                      ),
                      const SizedBox(width: 6),
                      if (_playing)
                        Image.asset(
                          AppAssets.audioWaveAnim,
                          width: 72,
                          height: 14,
                          fit: BoxFit.contain,
                        )
                      else
                        Image.asset(
                          AppAssets.audioWaveLine,
                          width: 72,
                          height: 14,
                          fit: BoxFit.contain,
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
                const Spacer(),
                GestureDetector(
                  onTap: _onDelete,
                  child: Image.asset(
                    AppAssets.voiceDeleteIcon,
                    width: 36,
                    height: 36,
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
              Expanded(
                child: Text(
                  'My Tags',
                  style: TextStyle(
                    color: AppColors.textPrimary,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Icon(
                Icons.chevron_right_rounded,
                color: AppColors.textSecondary,
                size: 20,
              ),
            ],
          ),
          const SizedBox(height: 10),
          if (tags.isEmpty)
            const Text(
              'Pick tags to find like-minded friends!',
              style: TextStyle(
                color: AppColors.textTertiary,
                fontSize: 13,
                fontWeight: FontWeight.w400,
              ),
            )
          else
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                for (final tag in tags)
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 8,
                    ),
                    decoration: BoxDecoration(
                      color: const Color(0xFF2C2C2E),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      tag,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
              ],
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

  @override
  Widget build(BuildContext context) {
    return _SectionCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'My Basic Info',
            style: TextStyle(
              color: AppColors.textPrimary,
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 4),
          _InfoRow(
            label: 'Nickname',
            value: nickname,
            onTap: onNicknameTap,
          ),
          _InfoRow(
            label: 'Gender',
            value: gender,
            onTap: onGenderTap,
          ),
          _InfoRow(
            label: 'Birthday',
            value: birthday,
            onTap: onBirthdayTap,
          ),
          _InfoRow(
            label: 'Height',
            value: height == null
                ? 'Please enter your height'
                : '$height Inch',
            isPlaceholder: height == null,
            onTap: onHeightTap,
          ),
          _InfoRow(
            label: 'Weight',
            value: weight == null
                ? 'Please enter your weight'
                : '$weight LB',
            isPlaceholder: weight == null,
            showDivider: false,
            onTap: onWeightTap,
          ),
        ],
      ),
    );
  }
}

class _InfoRow extends StatelessWidget {
  const _InfoRow({
    required this.label,
    required this.value,
    this.isPlaceholder = false,
    this.showDivider = true,
    this.onTap,
  });

  final String label;
  final String value;
  final bool isPlaceholder;
  final bool showDivider;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: onTap ?? () {},
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 14),
            child: Row(
              children: [
                SizedBox(
                  width: 88,
                  child: Text(
                    label,
                    style: const TextStyle(
                      color: AppColors.textSecondary,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                Expanded(
                  child: Text(
                    value,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.right,
                    style: TextStyle(
                      color: isPlaceholder
                          ? AppColors.textTertiary
                          : AppColors.textPrimary,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                const SizedBox(width: 4),
                const Icon(
                  Icons.chevron_right_rounded,
                  color: AppColors.textSecondary,
                  size: 20,
                ),
              ],
            ),
          ),
        ),
        if (showDivider)
          const Divider(height: 1, thickness: 1, color: Color(0xFF2A2A2C)),
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
        color: Color(0xFF1C1C1E),
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      padding: EdgeInsets.fromLTRB(16, 8, 16, 20 + bottom),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            height: 48,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: TextButton(
                    onPressed: () => Navigator.of(context).pop(),
                    child: const Text(
                      'Cancel',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
                const Text(
                  'Gender',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 17,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () => Navigator.of(context).pop(_selected),
                    child: const Text(
                      'Save',
                      style: TextStyle(
                        color: AppColors.primaryBright,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 12),
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
              const SizedBox(width: 12),
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
          const SizedBox(height: 8),
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
      color: const Color(0xFF2A2A2A),
      borderRadius: BorderRadius.circular(14),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(14),
        child: Container(
          height: 56,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14),
            border: Border.all(
              color: selected ? AppColors.primaryBright : Colors.transparent,
              width: 1.5,
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(iconAsset, width: 22, height: 22),
              const SizedBox(width: 8),
              Text(
                label,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
