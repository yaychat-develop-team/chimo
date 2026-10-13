import 'package:get/get.dart';

import '../../../app/app_jumper.dart';
import '../../../app/auth/onboarding_state.dart';
import '../../../app/chimo_api.dart';
import '../../../common/utils/app_toast.dart';
import '../../../common/utils/time_fmt.dart';

enum ProfileGender { male, female }

/// 引导里的性别和生日。日期滚轮留在页面，选完交给 [setBirthday]。
class ProfileSetupLogic extends GetxController {
  final Rxn<ProfileGender> gender = Rxn<ProfileGender>();
  final Rxn<DateTime> birthday = Rxn<DateTime>();
  final RxBool saving = false.obs;

  static final DateTime birthdayFloor = DateTime(1920, 1, 1);

  bool get canNext => gender.value != null && birthday.value != null && !saving.value;

  bool get canSkip => !saving.value;

  DateTime get birthdayCeiling => DateTime.now();

  /// 滚轮初始值：已选日期，否则 2000-01-01，并夹在可选范围内。
  DateTime get pickerInitial {
    final now = birthdayCeiling;
    final seed = birthday.value ?? DateTime(2000, 1, 1);
    if (seed.isAfter(now)) return now;
    if (seed.isBefore(birthdayFloor)) return birthdayFloor;
    return seed;
  }

  String get birthdayLabel {
    final picked = birthday.value;
    if (picked == null) return 'Please select';
    return TimeFmt.spacedDate(picked);
  }

  String? get genderApi {
    final value = gender.value;
    if (value == null) return null;
    return value == ProfileGender.female ? 'female' : 'male';
  }

  void selectGender(ProfileGender value) {
    gender.value = value;
  }

  void setBirthday(DateTime value) {
    birthday.value = value;
  }

  void skip() {
    if (!canSkip) return;
    AppJumper.toAlmostIn();
  }

  Future<void> next() async {
    if (!canNext) return;
    final failure = await save();
    if (isClosed) return;
    if (failure != null) {
      AppToast.error(failure);
      return;
    }
    AppJumper.toAlmostIn();
    idle();
  }

  /// 写入引导草稿并提交资料。返回 `null` 表示已保存。
  ///
  /// 未填完时返回提示。正在保存时直接返回 `null`，不再发请求。
  /// 成功时 [saving] 保持 true，等页面跳走再 [idle]。
  Future<String?> save() async {
    final genderValue = genderApi;
    final picked = birthday.value;
    if (genderValue == null || picked == null) {
      return 'Please select gender and birthday';
    }
    if (saving.value) return null;
    final iso = TimeFmt.isoDate(picked);
    OnboardingState.setGenderAndBirthday(gender: genderValue, birthday: iso);
    saving.value = true;
    try {
      final res = await ChimoApis.user.update({
        'gender': genderValue,
        'birthday': iso,
        'register': true,
      });
      if (!res.ok) {
        idle();
        return res.message.isEmpty ? 'Unable to save profile' : res.message;
      }
      return null;
    } catch (error) {
      idle();
      return 'Unable to save profile: $error';
    }
  }

  void idle() {
    if (!isClosed) saving.value = false;
  }
}
