/// 在资料完善页与 almost-in 页之间暂存性别 + 生日。
abstract final class OnboardingProfileDraft {
  static String gender = '';
  static String birthday = '';

  static void setGenderAndBirthday({
    required String gender,
    required String birthday,
  }) {
    OnboardingProfileDraft.gender = gender;
    OnboardingProfileDraft.birthday = birthday;
  }

  static void clear() {
    gender = '';
    birthday = '';
  }

  static bool get isReady =>
      gender.trim().isNotEmpty && birthday.trim().isNotEmpty;
}
