import 'dart:async';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';

import '../../core/constants/app_assets.dart';
import '../../core/network/media_upload.dart';
import '../../core/network/network_bootstrap.dart';
import '../../core/theme/app_colors.dart';
import '../../core/widgets/network_or_asset_avatar.dart';
import '../me/data/user_dto.dart';
import '../me/models/me_models.dart';
import 'body_metric_page.dart';
import 'album_photo_viewer_page.dart';
import 'my_picture_page.dart';
import 'my_tags_page.dart';
import 'nickname_page.dart';
import 'personal_signature_page.dart';
import 'photo_pick_sheet.dart';
import 'voice_note_page.dart';

/// Edit profile page.
class EditProfilePage extends StatefulWidget {
  const EditProfilePage({
    super.key,
    required this.profile,
  });

  final MeProfile profile;

  static const int maxPhotos = 9;

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  late MeProfile _profile;
  String _signature = '';
  String _nickname = '';
  String _gender = 'Male';
  String _birthday = '1995-01-01';
  int? _height;
  int? _weight;
  int? _voiceSeconds;
  List<String> _tags = const [];
  bool _nicknameChangedOnce = false;
  final List<String> _photoPaths = [];
  bool _loading = true;
  bool _saving = false;
  Object? _photoUploadToken;

  int get _photoCount => _photoPaths.length;

  @override
  void initState() {
    super.initState();
    _applyProfile(widget.profile);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      unawaited(_loadFromApi());
    });
  }

  void _applyProfile(MeProfile p, {bool keepLocalPhotosIfRemoteEmpty = false}) {
    final previousPhotos = List<String>.from(_photoPaths);
    _profile = p;
    _signature = p.signature;
    _nickname = p.displayName;
    _gender = p.gender;
    _birthday = p.birthday;
    _height = p.height;
    _weight = p.weight;
    _voiceSeconds = p.voiceSeconds;
    _tags = List<String>.from(p.tags);
    _nicknameChangedOnce = p.nicknameChangedOnce;
    _photoPaths
      ..clear()
      ..addAll(p.momentUrls);
    // Avoid wiping pics the user just added while user/info was still loading,
    // or when the backend omits pending-audit items from parse.
    if (keepLocalPhotosIfRemoteEmpty &&
        _photoPaths.isEmpty &&
        previousPhotos.isNotEmpty) {
      _photoPaths.addAll(previousPhotos);
    } else if (keepLocalPhotosIfRemoteEmpty && previousPhotos.isNotEmpty) {
      for (final path in previousPhotos) {
        if (!_photoPaths.contains(path)) _photoPaths.add(path);
      }
    }
  }

  Future<void> _loadFromApi() async {
    try {
      final res = await NetworkBootstrap.api.userInfo();
      if (!mounted) return;
      final parsed = UserDto.parseProfile(res);
      if (parsed != null) {
        setState(
          () => _applyProfile(parsed, keepLocalPhotosIfRemoteEmpty: true),
        );
      }
    } catch (_) {
      // Keep seed profile if refresh fails.
    } finally {
      if (mounted) setState(() => _loading = false);
    }
  }

  MeProfile _buildResult() {
    return _profile.copyWith(
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
      momentUrls: List<String>.from(_photoPaths),
      avatarUrl: _profile.avatarUrl,
    );
  }

  void _popWithResult() {
    Navigator.of(context).pop(_buildResult());
  }

  Future<void> _save() async {
    if (_saving) return;
    setState(() => _saving = true);
    try {
      final genderApi = _gender.toLowerCase() == 'female' ? 'female' : 'male';
      final fields = <String, dynamic>{
        'nickname': _nickname.trim(),
        'birthday': _birthday,
        'gender': genderApi,
        'personalSignature': _signature.trim(),
      };
      if (_height != null) {
        fields['height'] = _height;
      } else {
        fields['deleteHeight'] = true;
      }
      if (_weight != null) {
        fields['weight'] = _weight;
      } else {
        fields['deleteWeight'] = true;
      }
      if (_voiceSeconds == null) {
        fields['deleteVoice'] = true;
      }

      final res = await NetworkBootstrap.api.updateUserInfo(fields);
      if (!mounted) return;
      if (!res.success) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(res.message.isEmpty ? 'Save failed' : res.message),
            behavior: SnackBarBehavior.floating,
          ),
        );
        return;
      }
      _popWithResult();
    } catch (error) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Save failed: $error'),
          behavior: SnackBarBehavior.floating,
        ),
      );
    } finally {
      if (mounted) setState(() => _saving = false);
    }
  }

  /// Profile fill progress for the app bar (0–100).
  int get _completionPercent {
    var filled = 0;
    const total = 10;
    if ((_profile.avatarUrl ?? '').isNotEmpty ||
        _profile.avatarAsset.isNotEmpty) {
      filled++;
    }
    if (_photoCount > 0) filled++;
    if (_signature.trim().isNotEmpty) filled++;
    if (_voiceSeconds != null && _voiceSeconds! > 0) filled++;
    if (_tags.isNotEmpty) filled++;
    if (_nickname.trim().isNotEmpty) filled++;
    if (_gender.trim().isNotEmpty) filled++;
    if (_birthday.trim().isNotEmpty) filled++;
    if (_height != null) filled++;
    if (_weight != null) filled++;
    return ((filled / total) * 100).round().clamp(0, 100);
  }

  Future<void> _pickPhoto({required bool forAlbum}) async {
    final action = await showPhotoPickSheet(context);
    if (!mounted || action == null) return;

    final source = switch (action) {
      PhotoPickAction.takePhoto => ImageSource.camera,
      PhotoPickAction.gallery => ImageSource.gallery,
    };

    XFile? file;
    try {
      file = await ImagePicker().pickImage(
        source: source,
        imageQuality: 85,
        maxWidth: 1920,
      );
    } catch (error) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            source == ImageSource.camera
                ? 'Camera unavailable. Check app permissions.'
                : 'Gallery unavailable. Check app permissions.',
          ),
          behavior: SnackBarBehavior.floating,
        ),
      );
      return;
    }
    if (!mounted || file == null) return;

    if (file.path.toLowerCase().endsWith('.gif')) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('GIF uploads are not supported'),
          behavior: SnackBarBehavior.floating,
        ),
      );
      return;
    }

    if (!forAlbum) {
      // Avatar path (profile picture) is handled on its own page for now.
      return;
    }
    if (_photoCount >= EditProfilePage.maxPhotos) return;

    // Optimistic local preview while upload runs.
    final localPath = file.path;
    final token = Object();
    _photoUploadToken = token;
    setState(() => _photoPaths.add(localPath));

    try {
      final remote = await MediaUpload.uploadFile(localPath);
      if (!mounted || !identical(_photoUploadToken, token)) return;
      if (remote == null) {
        setState(() => _photoPaths.remove(localPath));
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Photo upload failed'),
            behavior: SnackBarBehavior.floating,
          ),
        );
        return;
      }

      final res = await NetworkBootstrap.api.updateUserInfo({
        'newPic': [remote],
      });
      if (!mounted || !identical(_photoUploadToken, token)) return;
      if (!res.success) {
        setState(() => _photoPaths.remove(localPath));
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              res.message.isEmpty ? 'Save photo failed' : res.message,
            ),
            behavior: SnackBarBehavior.floating,
          ),
        );
        return;
      }

      // Prefer server picList from the update response; always keep this URL.
      final fromServer = UserDto.parseProfile(res)?.momentUrls ?? const [];
      setState(() {
        _photoPaths.remove(localPath);
        if (fromServer.isNotEmpty) {
          _photoPaths
            ..clear()
            ..addAll(fromServer);
        }
        if (!_photoPaths.contains(remote)) {
          _photoPaths.add(remote);
        }
      });
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Photo saved'),
          behavior: SnackBarBehavior.floating,
          duration: Duration(seconds: 1),
        ),
      );
    } catch (error) {
      if (!mounted || !identical(_photoUploadToken, token)) return;
      setState(() => _photoPaths.remove(localPath));
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Photo upload failed: $error'),
          behavior: SnackBarBehavior.floating,
        ),
      );
    }
  }

  Future<void> _removeAlbumPhoto(int index) async {
    if (index < 0 || index >= _photoPaths.length) return;
    final path = _photoPaths[index];
    setState(() => _photoPaths.removeAt(index));

    if (!path.startsWith('http')) return;

    try {
      final res = await NetworkBootstrap.api.updateUserInfo({
        'delPic': [path],
      });
      if (!mounted) return;
      if (!res.success) {
        setState(() {
          if (index <= _photoPaths.length) {
            _photoPaths.insert(index.clamp(0, _photoPaths.length), path);
          } else {
            _photoPaths.add(path);
          }
        });
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              res.message.isEmpty ? 'Delete failed' : res.message,
            ),
            behavior: SnackBarBehavior.floating,
          ),
        );
      }
    } catch (error) {
      if (!mounted) return;
      setState(() => _photoPaths.add(path));
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Delete failed: $error'),
          behavior: SnackBarBehavior.floating,
        ),
      );
    }
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
    final bottom = MediaQuery.paddingOf(context).bottom;

    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, _) {
        if (didPop) return;
        _popWithResult();
      },
      child: Scaffold(
        backgroundColor: const Color(0xFF0A0A14),
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _EditProfileAppBar(
                onBack: _popWithResult,
                completionPercent: _completionPercent,
              ),
              if (_loading)
                const LinearProgressIndicator(
                  minHeight: 2,
                  color: Color(0xFFB6FF2E),
                  backgroundColor: Colors.transparent,
                ),
              Expanded(
                child: ListView(
                  padding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
                  children: [
                    _AvatarCard(
                      avatarAsset: _profile.avatarAsset,
                      avatarUrl: _profile.avatarUrl,
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute<void>(
                            builder: (_) => MyPicturePage(
                              avatarAsset: _profile.avatarAsset,
                            ),
                          ),
                        );
                      },
                    ),
                    const SizedBox(height: 16),
                    _PhotoCard(
                      paths: _photoPaths,
                      onAdd: () => _pickPhoto(forAlbum: true),
                      onRemove: (index) => unawaited(_removeAlbumPhoto(index)),
                      onOpen: (index) {
                        Navigator.of(context).push(
                          MaterialPageRoute<void>(
                            builder: (_) => AlbumPhotoViewerPage(
                              paths: List<String>.from(_photoPaths),
                              initialIndex: index,
                            ),
                          ),
                        );
                      },
                    ),
                    const SizedBox(height: 16),
                    _PromptCard(
                      title: 'My Signature',
                      hint: signatureHint,
                      hintAsValue: _signature.isNotEmpty,
                      onTap: _openSignature,
                    ),
                    const SizedBox(height: 16),
                    _VoiceNoteCard(
                      seconds: _voiceSeconds,
                      onTap: _openVoiceNote,
                      onDelete: _deleteVoiceNote,
                    ),
                    const SizedBox(height: 16),
                    _TagsCard(tags: _tags, onTap: _openTags),
                    const SizedBox(height: 16),
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
              Padding(
                padding: EdgeInsets.fromLTRB(16, 8, 16, 12 + bottom),
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    onTap: _saving ? null : _save,
                    borderRadius: BorderRadius.circular(24),
                    child: Ink(
                      height: 48,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(24),
                        gradient: AppColors.promoBannerGradient,
                      ),
                      child: Center(
                        child: _saving
                            ? const SizedBox(
                                width: 22,
                                height: 22,
                                child: CircularProgressIndicator(
                                  strokeWidth: 2.2,
                                  color: AppColors.promoText,
                                ),
                              )
                            : const Text(
                                'Save',
                                style: TextStyle(
                                  color: AppColors.promoText,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                      ),
                    ),
                  ),
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
  const _EditProfileAppBar({
    required this.onBack,
    required this.completionPercent,
  });

  final VoidCallback onBack;
  final int completionPercent;

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
                colorFilter: const ColorFilter.mode(
                  Colors.white,
                  BlendMode.srcIn,
                ),
              ),
            ),
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                'Edit Profile',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
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
        ],
      ),
    );
  }
}

class _Chevron extends StatelessWidget {
  const _Chevron();

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      AppAssets.mineArrow,
      width: 5,
      height: 8,
      colorFilter: const ColorFilter.mode(
        Color(0xFF8A8A8A),
        BlendMode.srcIn,
      ),
    );
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
      color: const Color(0xFF1C1C1E),
      borderRadius: BorderRadius.circular(16),
      clipBehavior: Clip.antiAlias,
      child: onTap == null
          ? content
          : InkWell(
              onTap: onTap,
              borderRadius: BorderRadius.circular(16),
              child: content,
            ),
    );
  }
}

class _AvatarCard extends StatelessWidget {
  const _AvatarCard({
    required this.avatarAsset,
    required this.onTap,
    this.avatarUrl,
  });

  final String avatarAsset;
  final String? avatarUrl;
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
              child: NetworkOrAssetAvatar(
                asset: avatarAsset,
                url: avatarUrl,
                width: 96,
                height: 96,
              ),
            ),
            const SizedBox(width: 12),
            const Expanded(
              child: Text(
                'My Profile Picture',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            const Text(
              'Edit',
              style: TextStyle(
                color: Color(0xFF8A8A8A),
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
  });

  final List<String> paths;
  final VoidCallback onAdd;
  final ValueChanged<int> onRemove;
  final ValueChanged<int> onOpen;

  @override
  Widget build(BuildContext context) {
    final count = paths.length;
    final canAdd = count < EditProfilePage.maxPhotos;

    return _SectionCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'My Photos（$count/${EditProfilePage.maxPhotos}）',
            style: const TextStyle(
              color: Colors.white,
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 12),
          Wrap(
            spacing: 10,
            runSpacing: 10,
            children: [
              if (canAdd)
                Material(
                  color: const Color(0xFF2C2C2E),
                  borderRadius: BorderRadius.circular(12),
                  child: InkWell(
                    onTap: onAdd,
                    borderRadius: BorderRadius.circular(12),
                    child: const SizedBox(
                      width: 98,
                      height: 98,
                      child: Icon(
                        Icons.add_rounded,
                        color: Colors.white,
                        size: 28,
                      ),
                    ),
                  ),
                ),
              for (var i = 0; i < paths.length; i++)
                _PhotoThumb(
                  path: paths[i],
                  onTap: () => onOpen(i),
                  onRemove: () => onRemove(i),
                ),
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
  });

  final String path;
  final VoidCallback onTap;
  final VoidCallback onRemove;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GestureDetector(
          onTap: onTap,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: path.startsWith('http')
                ? Image.network(
                    path,
                    width: 98,
                    height: 98,
                    fit: BoxFit.cover,
                    errorBuilder: (_, error, stack) => Container(
                      width: 98,
                      height: 98,
                      color: const Color(0xFF2C2C2E),
                      alignment: Alignment.center,
                      child: const Icon(
                        Icons.broken_image_outlined,
                        color: Colors.white54,
                      ),
                    ),
                  )
                : Image.file(
                    File(path),
                    width: 98,
                    height: 98,
                    fit: BoxFit.cover,
                    errorBuilder: (_, error, stack) => Container(
                      width: 98,
                      height: 98,
                      color: const Color(0xFF2C2C2E),
                      alignment: Alignment.center,
                      child: const Icon(
                        Icons.broken_image_outlined,
                        color: Colors.white54,
                      ),
                    ),
                  ),
          ),
        ),
        Positioned(
          top: 4,
          right: 4,
          child: GestureDetector(
            onTap: onRemove,
            child: Container(
              width: 22,
              height: 22,
              decoration: const BoxDecoration(
                color: Color(0xCC000000),
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
              Expanded(
                child: Text(
                  title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              const _Chevron(),
            ],
          ),
          const SizedBox(height: 12),
          Text(
            hint,
            maxLines: 4,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              color: hintAsValue
                  ? const Color(0xFFB0B0B0)
                  : const Color(0xFF8A8A8A),
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
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
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
                  color: Color(0xFF8A8A8A),
                  fontSize: 13,
                  fontWeight: FontWeight.w400,
                  height: 20 / 13,
                ),
              ),
            )
          else
            Row(
              children: [
                Container(
                  height: 28,
                  constraints: const BoxConstraints(minWidth: 108),
                  padding: const EdgeInsets.fromLTRB(2, 2, 8, 2),
                  decoration: BoxDecoration(
                    color: const Color(0xFF2E2E16),
                    borderRadius: BorderRadius.circular(14),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      GestureDetector(
                        onTap: _togglePlay,
                        child: Container(
                          width: 24,
                          height: 24,
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
                            size: 16,
                          ),
                        ),
                      ),
                      const SizedBox(width: 6),
                      if (_playing)
                        Image.asset(
                          AppAssets.audioWaveAnim,
                          width: 44,
                          height: 8,
                          fit: BoxFit.contain,
                        )
                      else
                        Image.asset(
                          AppAssets.audioWaveLine,
                          width: 44,
                          height: 8,
                          fit: BoxFit.contain,
                        ),
                      const SizedBox(width: 6),
                      Text(
                        '$displaySeconds"',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 13,
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
              Expanded(
                child: Text(
                  'My Tags',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              _Chevron(),
            ],
          ),
          const SizedBox(height: 12),
          if (tags.isEmpty)
            const Text(
              'Pick tags to find like-minded friends!',
              style: TextStyle(
                color: Color(0xFF8A8A8A),
                fontSize: 13,
                fontWeight: FontWeight.w400,
                height: 20 / 13,
              ),
            )
          else
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                for (final tag in tags)
                  DecoratedBox(
                    decoration: BoxDecoration(
                      color: const Color(0xFF2C2C2E),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 7,
                      ),
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

  String get _birthdayDisplay {
    final parsed = DateTime.tryParse(birthday);
    if (parsed == null) return birthday;
    final m = parsed.month.toString().padLeft(2, '0');
    final d = parsed.day.toString().padLeft(2, '0');
    final y = parsed.year.toString().padLeft(4, '0');
    return '$m/$d/$y';
  }

  @override
  Widget build(BuildContext context) {
    return _SectionCard(
      padding: const EdgeInsets.fromLTRB(14, 16, 14, 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'My Basic Info',
            style: TextStyle(
              color: Colors.white,
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 12),
          _InfoRow(
            label: 'NickName',
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
            value: _birthdayDisplay,
            onTap: onBirthdayTap,
          ),
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
  const _InfoRow({
    required this.label,
    required this.value,
    this.showDivider = true,
    this.onTap,
  });

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
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: GestureDetector(
                    onTap: () => Navigator.of(context).pop(_selected),
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
      color: selected ? const Color(0xFF2E2E16) : const Color(0xFF2A2A2A),
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
              Image.asset(iconAsset, width: 16, height: 16),
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
