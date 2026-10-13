import 'package:get/get.dart';

import '../../../app/chimo_api.dart';
import '../../../common/models/server_client/user.pb.dart';

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

  /// 返回 `null` 表示已取消拉黑，否则是失败文案。
  Future<String?> unblock(String userId) async {
    final res = await ChimoApis.relation.setBlackList(userId: userId, isCancel: true);
    if (!res.ok) return res.message.isEmpty ? 'Failed' : res.message;
    if (!isClosed) users.removeWhere((user) => user.id.toString() == userId);
    return null;
  }
}
