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

  /// 已经在提交时返回 false。
  bool beginSubmit() {
    if (submitting.value) return false;
    submitting.value = true;
    return true;
  }

  void endSubmit() {
    if (!isClosed) submitting.value = false;
  }

  /// 按需加入已选部落，然后结束引导并进入首页。
  Future<void> continueHome({bool joinSelected = false}) async {
    if (!beginSubmit()) return;
    try {
      if (joinSelected && selected.isNotEmpty) {
        final failure = await join(selected.toList(growable: false));
        if (isClosed) return;
        if (failure != null) {
          AppToast.info(failure);
          return;
        }
      }
      if (isClosed) return;
      await OnboardingState.finishToHome();
    } catch (error) {
      if (isClosed) return;
      AppToast.info('Failed: $error');
    } finally {
      endSubmit();
    }
  }

  /// 返回 `null` 表示已加入。
  Future<String?> join(List<String> ids) async {
    try {
      final res = await ChimoApis.group.join(ids);
      if (!res.ok) return res.message.isEmpty ? 'Join failed' : res.message;
      return null;
    } catch (e) {
      return 'Failed: $e';
    }
  }
}
