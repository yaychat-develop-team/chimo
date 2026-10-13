import 'package:get/get.dart';

import '../../../app/app_jumper.dart';
import '../../../app/chimo_api.dart';

/// 账号安全：是否已有注销申请。
class AccountSecurityLogic extends GetxController {
  final RxBool loading = true.obs;
  final RxBool hasPendingCancellation = false.obs;

  @override
  void onInit() {
    super.onInit();
    load();
  }

  /// 查询失败时保留上一次的结果。
  Future<void> load() async {
    loading.value = true;
    try {
      final res = await ChimoApis.user.hasApplyForCancel();
      if (!isClosed) {
        hasPendingCancellation.value = res.ok && res.data == true;
      }
    } catch (_) {
      // 保留 [hasPendingCancellation]。
    } finally {
      if (!isClosed) loading.value = false;
    }
  }

  Future<void> openCancelAccount() async {
    if (hasPendingCancellation.value) {
      await AppJumper.toAccountCancelResult();
    } else {
      await AppJumper.toAccountCancellation();
    }
    if (!isClosed) await load();
  }
}
