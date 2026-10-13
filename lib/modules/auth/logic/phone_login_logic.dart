import 'package:get/get.dart';

import '../../../app/app_jumper.dart';
import '../../../common/utils/app_toast.dart';
import '../../../common/utils/phone_utils.dart';

/// 手机号登录：只校验号码。发短信在验证码页，对齐 yaychat。
///
/// 输入框留在页面，内容同步到 [phone]。
class PhoneLoginLogic extends GetxController {
  static final RegExp phoneRegExp = RegExp(r'^1[3-9]\d{9}$');

  final RxString phone = ''.obs;

  bool get isValidPhone => phoneRegExp.hasMatch(phone.value.trim());

  bool get canLogin => isValidPhone;

  String? get errorText {
    final value = phone.value.trim();
    if (value.isEmpty || value.length < 11) return null;
    if (!phoneRegExp.hasMatch(value)) {
      return 'Please enter a valid phone number';
    }
    return null;
  }

  void login() {
    final value = phone.value.trim();
    if (!isValidPhone) {
      AppToast.error('Please enter a valid phone number');
      return;
    }
    // 对齐 yaychat：先进入验证码页。测试服短信通道不可用时仍可输入验证码。
    AppJumper.toVerify(PhoneUtils.digitsOnly(value));
  }
}
