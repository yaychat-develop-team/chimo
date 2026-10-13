import 'package:flutter/widgets.dart';

import '../app_jumper.dart';
import '../chimo_api.dart';
import '../storage/user_store.dart';
import '../../common/models/server_client/user.pb.dart';
import '../../common/utils/app_log.dart';

/// 注册引导：暂存性别生日、判断要不要进首页、结束时标记完成并进壳层。
///
/// 手机 / 邮箱 / Apple 未完成资料时走同一条流程
///（性别+生日 → 头像+昵称 → 欢迎 → 部落）。
/// 邮箱注册常返回 `isRegister: true`，但昵称仍是邮箱地址，这类仍须走引导。
abstract final class OnboardingState {
  static String gender = '';
  static String birthday = '';

  static void setGenderAndBirthday({required String gender, required String birthday}) {
    OnboardingState.gender = gender;
    OnboardingState.birthday = birthday;
  }

  static void clearDraft() {
    gender = '';
    birthday = '';
  }

  /// 清掉暂存资料、标记完成，进入首页。标记失败不挡住进首页。
  static Future<void> finishToHome([BuildContext? context]) async {
    clearDraft();
    try {
      await ChimoApis.user.update({'register': true});
    } catch (error) {
      AppLog.w('Onboarding mark register failed', error: error);
    }
    await UserStore.markOnboardingCompleted();
    if (context != null && !context.mounted) return;
    AppJumper.toShellAndClear();
  }

  /// `true` → 进入壳/首页；`false` → 资料设置引导。
  ///
  /// 资料接口失败时进引导。这里不清会话：调用方刚写完登录态，清掉会把人送进无 token 的完善资料页。
  static Future<bool> shouldEnterHome({bool newUser = false, String? email}) async {
    if (UserStore.currentUser.onboardingCompleted) return true;
    if (newUser) return false;

    try {
      final res = await ChimoApis.user.profileOrNull(clearSessionOnNotLogin: false);
      final user = res.data;
      if (!res.ok || user == null) return false;
      await _cacheProfile(user);
      if (!_complete(user, email: email)) return false;
      if (user.hasIsRegister() && !user.isRegister) return false;
      return true;
    } catch (_) {
      return false;
    }
  }

  static Future<void> _cacheProfile(User user) {
    final id = user.id.toString();
    final genderValue = user.gender.trim();
    return UserStore.update(
      (cache) => cache.patch(
        userId: id == '0' ? null : id,
        nickname: user.nickname,
        avatarUrl: user.avatar,
        gender: genderValue.isEmpty ? null : genderValue,
        birthday: user.birthday,
      ),
    );
  }

  /// 空性别不能被当成已填写。昵称是邮箱时也还没完成。
  static bool _complete(User user, {String? email}) {
    final nick = user.nickname.trim();
    final gender = user.gender.trim().toLowerCase();
    final birthday = user.birthday.trim();
    if (nick.isEmpty || gender.isEmpty || birthday.isEmpty) return false;
    if (gender == '0' || gender == 'unknown' || gender == 'null') return false;
    if (nick.contains('@')) return false;
    final mail = (email ?? '').trim().toLowerCase();
    if (mail.isNotEmpty && nick.toLowerCase() == mail) return false;
    return true;
  }
}
