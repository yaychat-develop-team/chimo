import 'package:get/get.dart';

import '../../../app/chimo_api.dart';
import '../../../common/models/server_client/user.pb.dart';
import '../../../common/utils/app_toast.dart';

/// 黑名单列表与取消拉黑。
class BlacklistLogic extends GetxController {
  final RxList<SimpleUser> users = <SimpleUser>[].obs;
  final RxBool loading = true.obs;

  @override
  void onReady() {
    super.onReady();
    load();
  }

  /// 拉取失败时保留当前列表。
  Future<void> load() async {
    loading.value = true;
    try {
      final res = await ChimoApis.relation.blackList();
      if (!isClosed) users.assignAll(res.data ?? const []);
    } catch (_) {
      // 保留 [users]。
    } finally {
      if (!isClosed) loading.value = false;
    }
  }

  /// 取消拉黑。失败 toast。
  Future<void> unblock(String userId) async {
    final res = await ChimoApis.relation.setBlackList(userId: userId, isCancel: true);
    if (!res.ok) {
      AppToast.error(res.message.isEmpty ? 'Failed' : res.message);
      return;
    }
    users.removeWhere((user) => user.id.toString() == userId);
  }
}
