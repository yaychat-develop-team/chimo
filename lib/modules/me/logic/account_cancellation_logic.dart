import 'package:get/get.dart';

import '../../../app/app_jumper.dart';
import '../../../app/chimo_api.dart';
import '../../../common/utils/app_toast.dart';

/// 注销协议勾选与提交。
class AccountCancellationLogic extends GetxController {
  final RxBool agreed = false.obs;
  final RxBool submitting = false.obs;

  void toggleAgreed() => agreed.toggle();

  Future<void> submit() async {
    if (!agreed.value || submitting.value) return;
    final failure = await apply();
    if (isClosed) return;
    if (failure != null) {
      AppToast.error(failure);
      return;
    }
    await AppJumper.replaceWithAccountCancelResult();
    idle();
  }

  /// 返回 `null` 表示成功。成功时 [submitting] 保持 true，等页面跳走再 [idle]。
  Future<String?> apply() async {
    if (!agreed.value || submitting.value) return null;
    submitting.value = true;
    try {
      final res = await ChimoApis.user.cancelAccount();
      if (!res.ok) {
        idle();
        return res.message.isEmpty ? 'Request failed' : res.message;
      }
      return null;
    } catch (error) {
      idle();
      return 'Request failed: $error';
    }
  }

  void idle() {
    if (!isClosed) submitting.value = false;
  }
}
