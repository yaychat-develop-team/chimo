import 'package:get/get.dart';

import '../../../app/chimo_api.dart';
import '../../../common/models/server_client/user.pb.dart';

/// 群成员列表。搜索框和防抖计时留在弹层。
class GroupMembersLogic extends GetxController {
  GroupMembersLogic({required this.groupId});

  final String groupId;

  final RxList<User> members = <User>[].obs;
  final RxBool loading = true.obs;
  final RxnString error = RxnString();
  final RxBool needsLogin = false.obs;
  final RxString query = ''.obs;

  @override
  void onReady() {
    super.onReady();
    load();
  }

  Future<void> load({String searchKey = ''}) async {
    loading.value = true;
    error.value = null;
    needsLogin.value = false;
    try {
      final res = await ChimoApis.group.members(groupId, searchKey: searchKey);
      if (isClosed) return;
      if (!res.ok) {
        final notLogin = res.isNotLogin;
        members.clear();
        needsLogin.value = notLogin;
        error.value = notLogin
            ? 'Session expired. Please log in again.'
            : (res.message.isEmpty ? 'Failed to load members' : res.message);
        return;
      }
      members.assignAll(res.data ?? const []);
      error.value = null;
    } catch (e) {
      if (isClosed) return;
      members.clear();
      error.value = '$e';
    } finally {
      if (!isClosed) loading.value = false;
    }
  }
}
