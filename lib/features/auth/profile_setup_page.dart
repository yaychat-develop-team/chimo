import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../core/constants/app_assets.dart';
import '../../core/theme/app_colors.dart';
import 'almost_in_page.dart';

enum _Gender { male, female }

/// Post-registration profile setup: gender + birthday.
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
    return '$y-$m-$day';
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
                            color: AppColors.primaryBright,
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
    Navigator.of(context).push(
      MaterialPageRoute<void>(builder: (_) => const AlmostInPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    final bottom = MediaQuery.paddingOf(context).bottom;

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.fromLTRB(20, 28, 20, 16 + bottom),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Text(
                  'Spice up your profile!',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 28,
                    fontWeight: FontWeight.w700,
                    height: 1.2,
                  ),
                ),
                const SizedBox(height: 36),
                const Text(
                  'Gender',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 14),
                Row(
                  children: [
                    Expanded(
                      child: _GenderCard(
                        label: "I'm Male",
                        image: _gender == _Gender.male
                            ? AppAssets.genderMaleSelected
                            : AppAssets.genderMaleImg,
                        onTap: () => setState(() => _gender = _Gender.male),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: _GenderCard(
                        label: "I'm Female",
                        image: _gender == _Gender.female
                            ? AppAssets.genderFemaleSelected
                            : AppAssets.genderFemaleImg,
                        onTap: () => setState(() => _gender = _Gender.female),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 32),
                const Text(
                  "When's your birthday?",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 14),
                Material(
                  color: const Color(0xFF2A2A2A),
                  borderRadius: BorderRadius.circular(16),
                  child: InkWell(
                    onTap: _pickBirthday,
                    borderRadius: BorderRadius.circular(16),
                    child: SizedBox(
                      height: 54,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 18),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            _birthdayLabel,
                            style: TextStyle(
                              color: _birthday == null
                                  ? const Color(0xFF8A8A8A)
                                  : Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                const Spacer(),
                Material(
                  color: _canNext
                      ? AppColors.primaryBright
                      : const Color(0xFF2A2A2A),
                  borderRadius: BorderRadius.circular(28),
                  child: InkWell(
                    onTap: _canNext ? _onNext : null,
                    borderRadius: BorderRadius.circular(28),
                    child: SizedBox(
                      height: 54,
                      child: Center(
                        child: Text(
                          'Next',
                          style: TextStyle(
                            color: _canNext
                                ? Colors.black
                                : const Color(0xFF6E6E6E),
                            fontSize: 17,
                            fontWeight: FontWeight.w700,
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
      child: AspectRatio(
        aspectRatio: 1,
        child: Stack(
          fit: StackFit.expand,
          children: [
            // Unselected: man_img / woman_img; selected: man_select / woman_select
            Image.asset(image, fit: BoxFit.contain),
            Positioned(
              top: 14,
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
