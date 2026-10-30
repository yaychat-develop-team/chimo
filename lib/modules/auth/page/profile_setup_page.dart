import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../app/app_jumper.dart';
import '../../../common/constants/app_assets.dart';
import '../../../common/theme/app_colors.dart';
import '../../../common/theme/app_text.dart';
import '../logic/profile_setup_logic.dart';
import '../../../common/widgets/app_scaffold.dart';
import 'package:chimo/common/utils/chimo.dart';
import '../../../common/theme/app_bottom_sheet.dart';

/// 注册后资料完善：性别 + 生日（Figma 完善资料）。
///
/// 手机 OTP / 邮箱 / Apple 未完成资料时共用此流程，
/// 随后进入头像+昵称 → 欢迎 → 部落。
class ProfileSetupPage extends StatefulWidget {
  const ProfileSetupPage({super.key});

  @override
  State<ProfileSetupPage> createState() => _ProfileSetupPageState();
}

class _ProfileSetupPageState extends State<ProfileSetupPage> {
  late final ProfileSetupLogic logic;

  @override
  void initState() {
    super.initState();
    logic = Get.put(ProfileSetupLogic());
  }

  @override
  void dispose() {
    Get.delete<ProfileSetupLogic>();
    super.dispose();
  }

  Future<void> _pickBirthday() async {
    var temp = logic.pickerInitial;
    final picked = await AppBottomSheet.show<DateTime>(
      backgroundColor: AppColors.black1C1C1E,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      child: Builder(
        builder: (context) {
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
                          onPressed: () => AppJumper.back(),
                          child: const Text(
                            'Cancel',
                            style: TextStyle(color: AppColors.gray9A9A9A),
                          ),
                        ),
                        const Spacer(),
                        TextButton(
                          onPressed: () => AppJumper.back(result: temp),
                          child: const Text(
                            'Done',
                            style: TextStyle(
                              color: AppColors.green00F875,
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
                        maximumDate: logic.birthdayCeiling,
                        minimumDate: ProfileSetupLogic.birthdayFloor,
                        onDateTimeChanged: (value) => temp = value,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
    if (picked != null && mounted) logic.setBirthday(picked);
  }

  @override
  Widget build(BuildContext context) {
    final bottom = MediaQuery.paddingOf(context).bottom;

    return Obx(
      () => AppScaffold(
        backgroundColor: AppColors.black111111,
        appBar: AppNavBar(
          title: "Spice up your profile!",
          onBack: () => Get.back(),
          trailing: Chimo.s.skipButton(enabled: !logic.saving.value, onPressed: logic.skip),
        ),
        body: Padding(
          padding: EdgeInsets.fromLTRB(30, 16, 30, 16 + bottom),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
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
              const Text('Gender', style: AppText.label),
              const SizedBox(height: 12),
              Row(
                children: [
                  Expanded(
                    child: AspectRatio(
                      aspectRatio: 1,
                      child: _GenderCard(
                        label: "I'm male",
                        selected: logic.gender.value == ProfileGender.male,
                        image: logic.gender.value == ProfileGender.male
                            ? AppAssets.genderMaleSelected
                            : AppAssets.genderMaleImg,
                        onTap: () => logic.selectGender(ProfileGender.male),
                      ),
                    ),
                  ),
                  const SizedBox(width: 18),
                  Expanded(
                    child: AspectRatio(
                      aspectRatio: 1,
                      child: _GenderCard(
                        label: "I'm female",
                        selected: logic.gender.value == ProfileGender.female,
                        image: logic.gender.value == ProfileGender.female
                            ? AppAssets.genderFemaleSelected
                            : AppAssets.genderFemaleImg,
                        onTap: () => logic.selectGender(ProfileGender.female),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 36),
              const Text("When's your birthday?", style: AppText.label),
              const SizedBox(height: 12),
              Material(
                color: AppColors.black2A2A2A,
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
                          logic.birthdayLabel,
                          style: TextStyle(
                            color: logic.birthday.value == null
                                ? AppColors.gray8A8A8A
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
                child: Chimo.s.gradientButton(
                  label: logic.saving.value ? 'Saving…' : 'Next',
                  onTap: logic.canNext ? logic.next : null,
                  enabled: logic.canNext,
                  width: 134,
                ),
              ),
              const Spacer(),
            ],
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
          // width: 148,
          // height: 148,
          child: Stack(
            // fit: StackFit.expand,
            children: [
              Positioned.fill(child: Chimo.image(image, fit: BoxFit.contain)),
              Positioned(
                top: 6,
                left: 0,
                right: 0,
                child: Text(
                  label,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: selected ? AppColors.green00F875 : AppColors.grayB0B0B0,
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
