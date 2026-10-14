import 'package:get/get.dart';

import '../../../app/chimo_api.dart';
import '../../../common/models/server_client/user.pb.dart';
import 'flavor_label_store.dart';

/// 自己的资料页。带进来的种子资料在刷新失败时保留。
class PersonalProfileLogic extends GetxController {
  PersonalProfileLogic({required User seed}) : profile = seed.obs;

  final Rx<User> profile;
  final RxBool loading = true.obs;

  /// 失败或空数据时不改 [profile]。页面在刷新后决定要不要播名片动效。
  Future<void> refreshProfile() async {
    loading.value = true;
    try {
      final res = await ChimoApis.user.profile();
      final parsed = res.data?.user;
      if (parsed == null || isClosed) return;
      await FlavorLabelStore.ensureLoaded();
      if (!isClosed) profile.value = parsed;
    } catch (_) {
      // 保留种子资料。
    } finally {
      if (!isClosed) loading.value = false;
    }
  }

  void replace(User next) {
    if (!isClosed) profile.value = next;
  }
}
