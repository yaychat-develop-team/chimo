import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../app/app_router.dart';
import '../../core/auth/auth_session.dart';
import '../../core/network/app_apis.dart';
import 'onboarding_profile_draft.dart';

/// 注册引导结束：尽力标记 `register`，本地记完成，进入首页。
abstract final class OnboardingExit {
  static Future<void> finishToHome(BuildContext context) async {
    OnboardingProfileDraft.clear();
    try {
      await AppApis.user.update({'register': true});
    } catch (_) {}
    await AuthSession.markOnboardingCompleted();
    if (!context.mounted) return;
    context.go(AppRoutes.shell);
  }
}
