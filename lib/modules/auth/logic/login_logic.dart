import 'package:get/get.dart';

import '../../../app/auth/apple_auth_state.dart';
import '../../../app/chimo_api.dart';
import '../../../app/app_config.dart';
import '../../../common/models/server_client/login.pb.dart';

/// 登录页：协议勾选、Apple 登录中、以及各入口是否展示。
///
/// 协议弹层需要 BuildContext，留在页面。这里只记勾选结果和入口开关。
class LoginLogic extends GetxController {
  final RxBool agreed = false.obs;
  final RxBool appleSigningIn = false.obs;
  final RxBool showAppleEntry = true.obs;
  final RxBool showEmailLogin = true.obs;
  final RxBool showPhoneLogin = false.obs;

  bool get showAppleLogin => AppleAuthState.isSupportedPlatform && showAppleEntry.value;

  @override
  void onInit() {
    super.onInit();
    applyProductionDefaults();
    if (!AppConfig.isOfficial) {
      loadPlatforms();
    }
  }

  void applyProductionDefaults() {
    showAppleEntry.value = AppleAuthState.isSupportedPlatform;
    showEmailLogin.value = true;
    // 正式环境（正式包 / 切到正式服）不展示手机号登录。
    showPhoneLogin.value = AppConfig.isDebug && !AppConfig.isOfficial;
  }

  void toggleAgreed() => agreed.toggle();

  void acceptAgreement() => agreed.value = true;

  /// 已经在登录时返回 false，调用方不要再调起 Apple。
  bool beginAppleSignIn() {
    if (appleSigningIn.value) return false;
    appleSigningIn.value = true;
    return true;
  }

  void endAppleSignIn() {
    if (!isClosed) appleSigningIn.value = false;
  }

  /// 测试环境按 `/auth/login-platforms` 调整入口。拉不到就保持正式默认。
  Future<void> loadPlatforms() async {
    if (AppConfig.isOfficial) return;
    try {
      final res = await ChimoApis.auth.loginPlatforms();
      if (isClosed || !res.ok || res.data == null) return;
      final config = res.data!;
      showAppleEntry.value =
          _supports(config, 'apple') ||
          _supports(config, 'appleid') ||
          _supports(config, 'apple_id');
      showEmailLogin.value = _supports(config, 'email');
      showPhoneLogin.value =
          _supports(config, 'phone') || _supports(config, 'sms') || _supports(config, 'mobile');
      if (!showAppleEntry.value && !showEmailLogin.value && !showPhoneLogin.value) {
        applyProductionDefaults();
      }
    } catch (_) {
      // 保留 [applyProductionDefaults] 的结果。
    }
  }

  bool _supports(LoginPlatformsRsp config, String name) {
    final key = name.toLowerCase();
    bool hit(String item) => item.toLowerCase() == key;
    return config.mainPlatforms.any(hit) || config.subPlatforms.any(hit);
  }
}
