import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

import '../../app/app_router.dart';
import '../../core/constants/app_assets.dart';
import '../../core/theme/app_colors.dart';
import '../../core/widgets/app_gradient_button.dart';

enum _Gender { male, female }

/// Post-registration profile setup: gender + birthday (Figma 完善资料).
class ProfileSetupPage extends StatefulWidget {
  const ProfileSetupPage({super.key});

  @override
  State<ProfileSetupPage> createState() => _ProfileSetupPageState();
}

class _ProfileSetupPageState extends State<ProfileSetupPage> {
  _Gender? _gender;
  DateTime? _birthday;

  bool get _canNext => _gender != null && _birthday != null;

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

  void _onNext() {
    if (!_canNext) return;
    context.push(AppRoutes.almostIn);
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
                Align(
                  alignment: Alignment.centerLeft,
                  child: _BackButton(
                    onTap: () => Navigator.of(context).maybePop(),
                  ),
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
                      image: _gender == _Gender.male
                          ? AppAssets.genderMaleSelected
                          : AppAssets.genderMaleImg,
                      onTap: () => setState(() => _gender = _Gender.male),
                    ),
                    const SizedBox(width: 18),
                    _GenderCard(
                      label: "I'm female",
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
                    label: 'Next',
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
  });

  final String label;
  final String image;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        width: 148,
        height: 148,
        child: Stack(
          fit: StackFit.expand,
          children: [
            // Unselected: man_img / woman_img; selected: man_select / woman_select
            Image.asset(image, fit: BoxFit.contain),
            Positioned(
              top: 6,
              left: 0,
              right: 0,
              child: Text(
                label,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Color(0xFFB0B0B0),
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
