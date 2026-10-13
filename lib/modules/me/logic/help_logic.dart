import 'package:get/get.dart';

import '../../../app/chimo_api.dart';

/// 帮助页：打开时预热配置。FAQ 正文不依赖这次请求。
class HelpLogic extends GetxController {
  final RxBool loading = true.obs;

  @override
  void onReady() {
    super.onReady();
    prefetch();
  }

  Future<void> prefetch() async {
    try {
      await Future.wait([ChimoApis.user.conf(), ChimoApis.app.settings()]);
    } catch (_) {
      // 静态 FAQ 离线仍可用。
    } finally {
      if (!isClosed) loading.value = false;
    }
  }
}
