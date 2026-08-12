import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

import '../../app/app_router.dart';
import '../../core/constants/app_assets.dart';
import '../../core/network/app_apis.dart';
import '../../core/theme/app_colors.dart';
import '../../core/widgets/app_gradient_button.dart';
import 'onboarding_profile_draft.dart';
import 'widgets/onboarding_skip_button.dart';

enum _Gender { male, female }

/// 注册后资料完善：性别 + 生日（Figma 完善资料）。
///
/// 用于手机 OTP 与邮箱登录后资料尚未完整时。
class ProfileSetupPage extends StatefulWidget {
  const ProfileSetupPage({super.key});

  @override
  State<ProfileSetupPage> createState() => _ProfileSetupPageState();
}

class _ProfileSetupPageState extends State<ProfileSetupPage> {
  _Gender? _gender;
  DateTime? _birthday;
  bool _saving = false;

  bool get _canNext => _gender != null && _birthday != null && !_saving;

  String get _birthdayLabel {
    final d = _birthday;
    if (d == null) return 'Please select';
    final y = d.year.toString().padLeft(4, '0');
    final m = d.month.toString().padLeft(2, '0');
    final day = d.day.toString().padLeft(2, '0');
    return '$y / $m / $day';
  }

  Future<void> _pickBirthday() async {
    var temp = _birthday ?? DateTime(2000, 1, 1);
    final now = DateTime.now();
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
                  padding: const EdgeInsets.fromLTRB(16, 12, 8, 0),
                  child: Row(
                    children: [
                      TextButton(
                        onPressed: () => Navigator.pop(sheetContext),
                        child: const Text(
                          'Cancel',
                          style: TextStyle(color: AppColors.textSecondary),
                        ),
                      ),
                      const Spacer(),
                      TextButton(
                        onPressed: () => Navigator.pop(sheetContext, temp),
                        child: const Text(
                          'Done',
                          style: TextStyle(
                            color: AppColors.accentLime,
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
    if (picked != null && mounted) {
      setState(() => _birthday = picked);
    }
  }

  Future<void> _onSkip() async {
    if (_saving) return;
    context.push(AppRoutes.almostIn);
  }

  Future<void> _onNext() async {
    if (!_canNext) return;
    final d = _birthday!;
    final y = d.year.toString().padLeft(4, '0');
    final m = d.month.toString().padLeft(2, '0');
    final day = d.day.toString().padLeft(2, '0');
    final gender = _gender == _Gender.female ? 'female' : 'male';
    final birthday = '$y-$m-$day';

    OnboardingProfileDraft.setGenderAndBirthday(
      gender: gender,
      birthday: birthday,
    );

    setState(() => _saving = true);
    try {
      final res = await AppApis.user.update({
        'gender': gender,
        'birthday': birthday,
        'register': true,
      });
      if (!mounted) return;
      if (!res.ok) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              res.message.isEmpty ? 'Unable to save profile' : res.message,
            ),
            behavior: SnackBarBehavior.floating,
          ),
        );
        return;
      }
      context.push(AppRoutes.almostIn);
    } catch (error) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Unable to save profile: $error'),
          behavior: SnackBarBehavior.floating,
        ),
      );
    } finally {
      if (mounted) setState(() => _saving = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final bottom = MediaQuery.paddingOf(context).bottom;

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: Scaffold(
        backgroundColor: const Color(0xFF0A0A14),
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.fromLTRB(30, 16, 30, 16 + bottom),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  children: [
                    _BackButton(
                      onTap: () => Navigator.of(context).maybePop(),
                    ),
                    const Spacer(),
                    OnboardingSkipButton(
                      enabled: !_saving,
                      onPressed: () => _onSkip(),
                    ),
                  ],
                ),
                const SizedBox(height: 28),
                const Text(
                  'Spice up your profile!',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 26,
                    fontWeight: FontWeight.w700,
                    height: 1.5,
                  ),
                ),
                const SizedBox(height: 36),
                const Text(
                  'Gender',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 12),
                Row(
                  children: [
                    _GenderCard(
                      label: "I'm male",
                      selected: _gender == _Gender.male,
                      image: _gender == _Gender.male
                          ? AppAssets.genderMaleSelected
                          : AppAssets.genderMaleImg,
                      onTap: () => setState(() => _gender = _Gender.male),
                    ),
                    const SizedBox(width: 18),
                    _GenderCard(
                      label: "I'm female",
                      selected: _gender == _Gender.female,
                      image: _gender == _Gender.female
                          ? AppAssets.genderFemaleSelected
                          : AppAssets.genderFemaleImg,
                      onTap: () => setState(() => _gender = _Gender.female),
                    ),
                  ],
                ),
                const SizedBox(height: 36),
                const Text(
                  "When's your birthday?",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 12),
                Material(
                  color: const Color(0xFF2A2A2A),
                  borderRadius: BorderRadius.circular(27),
                  child: InkWell(
                    onTap: _pickBirthday,
                    borderRadius: BorderRadius.circular(27),
                    child: SizedBox(
                      height: 54,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            _birthdayLabel,
                            style: TextStyle(
                              color: _birthday == null
                                  ? const Color(0xFF8A8A8A)
                                  : Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 60),
                Center(
                  child: AppGradientButton(
                    label: _saving ? 'Saving…' : 'Next',
                    onTap: _canNext ? _onNext : null,
                    enabled: _canNext,
                    width: 134,
                  ),
                ),
                const Spacer(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _BackButton extends StatelessWidget {
  const _BackButton({required this.onTap});

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: const Color(0xFF2A2A2A),
      borderRadius: BorderRadius.circular(12),
      child: InkWell(
        onTap: onTap,
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
    );
  }
}

class _GenderCard extends StatelessWidget {
  const _GenderCard({
    required this.label,
    required this.image,
    required this.onTap,
    required this.selected,
  });

  final String label;
  final String image;
  final VoidCallback onTap;
  final bool selected;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16),
        child: SizedBox(
          width: 148,
          height: 148,
          child: Stack(
            fit: StackFit.expand,
            children: [
              Image.asset(image, fit: BoxFit.contain),
              Positioned(
                top: 6,
                left: 0,
                right: 0,
                child: Text(
                  label,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: selected
                        ? AppColors.accentLime
                        : const Color(0xFFB0B0B0),
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
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
