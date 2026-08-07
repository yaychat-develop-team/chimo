/// Holds gender + birthday between profile-setup and almost-in screens.
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
