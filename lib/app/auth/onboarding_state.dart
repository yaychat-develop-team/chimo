import 'package:flutter/widgets.dart';

import '../app_jumper.dart';
import '../chimo_api.dart';
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
    if (context != null && !context.mounted) return;
    AppJumper.toShellAndClear();
  }
}
