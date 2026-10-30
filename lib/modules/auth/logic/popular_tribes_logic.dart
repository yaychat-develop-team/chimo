import 'package:get/get.dart';

import '../../../app/auth/onboarding_state.dart';
import '../../../app/chimo_api.dart';
import '../../../common/models/server_client/group/group.pb.dart';
import '../../../common/utils/app_toast.dart';

/// 推荐部落：列表、勾选、加入，以及进入首页。
class PopularTribesLogic extends GetxController {
  PopularTribesLogic({required this.typeList});

  final String typeList;

  final RxList<GroupInfo> groups = <GroupInfo>[].obs;
  final RxBool loading = true.obs;
  final RxBool submitting = false.obs;
  final RxnString error = RxnString();
  final selected = <String>{}.obs;

  @override
  void onReady() {
    super.onReady();
    load();
  }

  Future<void> load() async {
    loading.value = true;
    error.value = null;
    try {
      var res = await ChimoApis.group.listByType(typeList);
      if (typeList.isEmpty && (!res.ok || (res.data?.isEmpty ?? true))) {
        res = await ChimoApis.group.list(pageNum: 1, pageSize: 50);
      }
      if (isClosed) return;
      if (!res.ok) {
        groups.clear();
        error.value = res.message.isEmpty ? 'Failed to load tribes' : res.message;
        return;
      }
      groups.assignAll(res.data ?? const []);
      error.value = null;
    } catch (e) {
      if (isClosed) return;
      groups.clear();
      error.value = '$e';
    } finally {
      if (!isClosed) loading.value = false;
    }
  }

  void toggle(String id) {
    if (selected.contains(id)) {
      selected.remove(id);
    } else {
      selected.add(id);
    }
  }

  /// 按需加入已选部落，然后结束引导并进入首页。
  Future<void> continueHome({bool joinSelected = false}) async {
    if (submitting.value) return;
    submitting.value = true;
    try {
      if (joinSelected && selected.isNotEmpty) {
        final res = await ChimoApis.group.join(selected.toList(growable: false));
        if (!res.ok) {
          AppToast.info(res.message.isEmpty ? 'Join failed' : res.message);
          return;
        }
      }
      await OnboardingState.finishToHome();
    } catch (error) {
      AppToast.info('Failed: $error');
    } finally {
      if (!isClosed) submitting.value = false;
    }
  }
}
