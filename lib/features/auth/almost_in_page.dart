import 'dart:async';
import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';

import '../../app/app_router.dart';
import '../../core/auth/auth_session.dart';
import '../../core/constants/app_assets.dart';
import '../../core/network/app_apis.dart';
import '../../core/network/media_upload.dart';
import '../../core/theme/app_colors.dart';
import '../../core/widgets/app_gradient_button.dart';
import '../../core/widgets/app_network_image.dart';
import '../profile/edit/photo_pick_sheet.dart';
import 'onboarding_profile_draft.dart';
import 'widgets/onboarding_skip_button.dart';

/// 注册收尾：头像 + 昵称（Figma 完善资料 — You're almost in!）。
class AlmostInPage extends StatefulWidget {
  const AlmostInPage({super.key});

  @override
  State<AlmostInPage> createState() => _AlmostInPageState();
}

class _AlmostInPageState extends State<AlmostInPage> {
  late final TextEditingController _nickController;
  String? _localAvatarPath;
  String? _remoteAvatarUrl;
  bool _submitting = false;
  bool _uploadingAvatar = false;

  @override
  void initState() {
    super.initState();
    final id = 1000000 + Random().nextInt(9000000);
    _nickController = TextEditingController(text: 'S·$id');
    // 优先使用真实会话昵称；邮箱占位名保持生成结果。
    WidgetsBinding.instance.addPostFrameCallback((_) {
      unawaited(_prefillNickname());
    });
  }

  Future<void> _prefillNickname() async {
    final nick = (await AuthSession.nickname() ?? '').trim();
    if (!mounted || nick.isEmpty || nick.contains('@')) return;
    _nickController.text = nick;
  }

  @override
  void dispose() {
    _nickController.dispose();
    super.dispose();
  }

  Future<void> _pickAvatar() async {
    if (_submitting || _uploadingAvatar) return;
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
    } catch (_) {
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

    setState(() {
      _localAvatarPath = file!.path;
      _uploadingAvatar = true;
    });

    final remote = await MediaUpload.uploadFile(file.path);
    if (!mounted) return;

    if (remote == null || remote.isEmpty) {
      setState(() {
        _uploadingAvatar = false;
        _localAvatarPath = null;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Avatar upload failed. Try again.'),
          behavior: SnackBarBehavior.floating,
        ),
      );
      return;
    }

    // 立即持久化（对齐 forya AddUserInfoController.saveAvatar）。
    final res = await AppApis.user.update({
      'avatarUrl': remote,
      'register': true,
    });
    if (!mounted) return;

    if (!res.ok) {
      setState(() {
        _uploadingAvatar = false;
        _localAvatarPath = null;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            res.message.isEmpty ? 'Unable to update avatar' : res.message,
          ),
          behavior: SnackBarBehavior.floating,
        ),
      );
      return;
    }

    await AuthSession.markLoggedIn(avatarUrl: remote);
    if (!mounted) return;

    setState(() {
      _remoteAvatarUrl = remote;
      _localAvatarPath = null;
      _uploadingAvatar = false;
    });
  }

  Future<void> _onSkip() async {
    if (_submitting || _uploadingAvatar) return;
    OnboardingProfileDraft.clear();
    if (!mounted) return;
    context.go(AppRoutes.welcomeBrand);
  }

  Future<void> _onLetsGo() async {
    if (_submitting) return;
    final nick = _nickController.text.trim();
    if (nick.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please enter a nickname'),
          behavior: SnackBarBehavior.floating,
        ),
      );
      return;
    }
    if (nick.contains('@')) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please choose a nickname (not your email)'),
          behavior: SnackBarBehavior.floating,
        ),
      );
      return;
    }

    if (_uploadingAvatar) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Avatar is still uploading…'),
          behavior: SnackBarBehavior.floating,
        ),
      );
      return;
    }

    setState(() => _submitting = true);
    try {
      final fields = <String, dynamic>{
        'nickname': nick,
        'register': true,
      };
      final gender = OnboardingProfileDraft.gender.trim();
      final birthday = OnboardingProfileDraft.birthday.trim();
      if (gender.isNotEmpty) fields['gender'] = gender;
      if (birthday.isNotEmpty) fields['birthday'] = birthday;
      final avatar = (_remoteAvatarUrl ?? '').trim();
      if (avatar.isNotEmpty) {
        fields['avatarUrl'] = avatar;
      }

      final res = await AppApis.user.update(fields);
      if (!mounted) return;
      if (!res.ok) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              res.message.isEmpty ? 'Unable to update profile' : res.message,
            ),
            behavior: SnackBarBehavior.floating,
          ),
        );
        return;
      }

      await AuthSession.markLoggedIn(
        nickname: nick,
        avatarUrl: avatar.isEmpty ? null : avatar,
      );
      OnboardingProfileDraft.clear();
      if (!mounted) return;
      context.go(AppRoutes.welcomeBrand);
    } catch (error) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Unable to update profile: $error'),
          behavior: SnackBarBehavior.floating,
        ),
      );
    } finally {
      if (mounted) setState(() => _submitting = false);
    }
  }

  Widget _buildAvatar() {
    final local = _localAvatarPath;
    final remote = _remoteAvatarUrl;
    Widget image;
    if (local != null && local.isNotEmpty) {
      image = Image.file(
        File(local),
        width: 112,
        height: 112,
        fit: BoxFit.cover,
        errorBuilder: (_, _, _) => Image.asset(
          AppAssets.defaultAvatar,
          width: 112,
          height: 112,
          fit: BoxFit.cover,
        ),
      );
    } else if (remote != null && remote.isNotEmpty) {
      image = AppNetworkImage(
        remote,
        width: 112,
        height: 112,
        fit: BoxFit.cover,
        errorWidget: (_, _, _) => Image.asset(
          AppAssets.defaultAvatar,
          width: 112,
          height: 112,
          fit: BoxFit.cover,
        ),
      );
    } else {
      image = Image.asset(
        AppAssets.defaultAvatar,
        width: 112,
        height: 112,
        fit: BoxFit.cover,
        errorBuilder: (_, _, _) => Image.asset(
          AppAssets.friendsEmpty,
          width: 112,
          height: 112,
          fit: BoxFit.cover,
        ),
      );
    }

    return SizedBox(
      width: 112,
      height: 112,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          ClipOval(child: image),
          if (_uploadingAvatar)
            const Positioned.fill(
              child: ColoredBox(
                color: Color(0x66000000),
                child: Center(
                  child: SizedBox(
                    width: 28,
                    height: 28,
                    child: CircularProgressIndicator(strokeWidth: 2),
                  ),
                ),
              ),
            ),
          Positioned(
            right: 0,
            bottom: 0,
            child: Image.asset(
              AppAssets.cameraIcon,
              width: 32,
              height: 32,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final bottom = MediaQuery.paddingOf(context).bottom;
    final keyboardOpen = MediaQuery.viewInsetsOf(context).bottom > 0;

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: Scaffold(
        backgroundColor: const Color(0xFF0A0A14),
        resizeToAvoidBottomInset: true,
        body: SafeArea(
          child: LayoutBuilder(
            builder: (context, constraints) {
              return SingleChildScrollView(
                keyboardDismissBehavior:
                    ScrollViewKeyboardDismissBehavior.onDrag,
                padding: EdgeInsets.fromLTRB(30, 16, 30, 16 + bottom),
                child: ConstrainedBox(
                  constraints: BoxConstraints(minHeight: constraints.maxHeight),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Row(
                        children: [
                          Material(
                            color: const Color(0xFF2A2A2A),
                            borderRadius: BorderRadius.circular(12),
                            child: InkWell(
                              onTap: _submitting
                                  ? null
                                  : () => Navigator.of(context).pop(),
                              borderRadius: BorderRadius.circular(12),
                              child: SizedBox(
                                width: 36,
                                height: 36,
                                child: Center(
                                  child: SvgPicture.asset(
                                    AppAssets.backArrow,
                                    width: 7,
                                    height: 12,
                                    colorFilter: const ColorFilter.mode(
                                      Colors.white,
                                      BlendMode.srcIn,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const Spacer(),
                          OnboardingSkipButton(
                            enabled: !_submitting && !_uploadingAvatar,
                            onPressed: () => unawaited(_onSkip()),
                          ),
                        ],
                      ),
                      SizedBox(height: keyboardOpen ? 16 : 28),
                      const Text(
                        "You're almost in!",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 26,
                          fontWeight: FontWeight.w700,
                          height: 1.5,
                        ),
                      ),
                      const SizedBox(height: 4),
                      const Text(
                        'A great profile picture and nickname help you stand out.',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          height: 1.5,
                        ),
                      ),
                      SizedBox(height: keyboardOpen ? 20 : 40),
                      Center(
                        child: Material(
                          color: Colors.transparent,
                          child: InkWell(
                            onTap: _pickAvatar,
                            customBorder: const CircleBorder(),
                            child: _buildAvatar(),
                          ),
                        ),
                      ),
                      SizedBox(height: keyboardOpen ? 20 : 36),
                      Container(
                        height: 54,
                        padding: const EdgeInsets.symmetric(horizontal: 18),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: const Color(0xFF2A2A2A),
                          borderRadius: BorderRadius.circular(27),
                        ),
                        child: TextField(
                          controller: _nickController,
                          enabled: !_submitting,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                          cursorColor: AppColors.accentLime,
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(20),
                          ],
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            isCollapsed: true,
                            hintText: 'Enter a nickname',
                            hintStyle: TextStyle(
                              color: Color(0xFF8A8A8A),
                              fontSize: 14,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: keyboardOpen ? 28 : 48),
                      Center(
                        child: AppGradientButton(
                          label: _submitting ? 'Saving…' : "Let's Go!",
                          onTap: _submitting ? null : _onLetsGo,
                          enabled: !_submitting,
                          width: 134,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
