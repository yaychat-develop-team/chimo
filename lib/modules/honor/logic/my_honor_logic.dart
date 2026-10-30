import 'package:get/get.dart';

import '../../../app/chimo_api.dart';
import '../../../app/session_info.dart';
import '../../../common/models/server_client/honor.pb.dart';
import '../../../common/models/server_client/user.pb.dart';

/// 我的荣誉。对齐 joyride `MineHonorPage`：`/user/honorTarget` / `/user/honor`。
class MyHonorLogic extends GetxController {
  MyHonorLogic(this.targetUid);

  final int targetUid;

  final loading = true.obs;
  final error = ''.obs;
  final activeList = <HonorItem>[].obs;
  final targetList = <HonorItem>[].obs;
  final profile = Rxn<User>();

  /// 佩戴请求中，避免连点。
  final wearing = false.obs;

  bool get isMe => targetUid > 0 && targetUid == SessionInfo.uid;

  int get earnedCount => activeList.length;

  static MyHonorLogic put(int uid) {
    final tag = '$uid';
    if (Get.isRegistered<MyHonorLogic>(tag: tag)) {
      return Get.find<MyHonorLogic>(tag: tag);
    }
    return Get.put(MyHonorLogic(uid), tag: tag);
  }

  static void delete(int uid) {
    final tag = '$uid';
    if (Get.isRegistered<MyHonorLogic>(tag: tag)) {
      Get.delete<MyHonorLogic>(tag: tag, force: true);
    }
  }

  @override
  void onInit() {
    super.onInit();
    load();
    _loadUser();
  }

  Future<void> load() async {
    loading.value = true;
    error.value = '';
    try {
      final res = isMe
          ? await ChimoApis.honor.target()
          : await ChimoApis.honor.list(targetUid);
      if (isClosed) return;
      if (!res.ok || res.data == null) {
        error.value = res.message.isEmpty ? 'Failed to load' : res.message;
        activeList.clear();
        targetList.clear();
      } else {
        activeList.assignAll(res.data!.activeList);
        targetList.assignAll(isMe ? res.data!.targetList : const []);
      }
    } catch (e) {
      if (!isClosed) error.value = '$e';
    } finally {
      if (!isClosed) loading.value = false;
    }
  }

  Future<void> _loadUser() async {
    try {
      if (isMe) {
        final res = await ChimoApis.user.profile();
        if (isClosed) return;
        if (res.ok && res.data != null) profile.value = res.data!.user;
        return;
      }
      final res = await ChimoApis.user.profileByUid('$targetUid');
      if (isClosed) return;
      if (res.ok && res.data != null) profile.value = res.data!.user;
    } catch (_) {}
  }

  /// 资料佩戴上限（对齐 Manage Honors 设计稿）。
  static const int maxWearCount = 3;

  List<HonorItem> get wearingItems =>
      activeList.where((e) => e.wear).toList(growable: false);

  /// 佩戴 / 取消佩戴。成功返回 `null`，失败返回 toast 文案。
  Future<String?> toggleWear(HonorItem item) async {
    if (!isMe || wearing.value) return null;
    final valid = item.forever || _isAfterNow(item.expireTime.toInt());
    if (!valid) return 'This honor has expired';

    final nextWear = !item.wear;
    if (nextWear && wearingItems.length >= maxWearCount) {
      return 'You can equip up to $maxWearCount honors';
    }

    wearing.value = true;
    try {
      final res = await ChimoApis.honor.wear(
        hid: item.hid.toInt(),
        wear: nextWear,
      );
      if (isClosed) return null;
      if (!res.ok) {
        return res.message.isEmpty ? 'Failed to update' : res.message;
      }
      await load();
      return null;
    } catch (e) {
      return '$e';
    } finally {
      if (!isClosed) wearing.value = false;
    }
  }

  /// Manage Honors 保存：按选中集合批量佩戴 / 卸下。
  Future<String?> applyWearSelection(Set<int> selectedHids) async {
    if (!isMe || wearing.value) return null;
    if (selectedHids.length > maxWearCount) {
      return 'You can equip up to $maxWearCount honors';
    }

    wearing.value = true;
    try {
      final current = <int>{
        for (final e in activeList)
          if (e.wear) e.hid.toInt(),
      };
      final toUnwear = current.difference(selectedHids);
      final toWear = selectedHids.difference(current);

      for (final hid in toUnwear) {
        final res = await ChimoApis.honor.wear(hid: hid, wear: false);
        if (isClosed) return null;
        if (!res.ok) {
          return res.message.isEmpty ? 'Failed to update' : res.message;
        }
      }
      for (final hid in toWear) {
        final res = await ChimoApis.honor.wear(hid: hid, wear: true);
        if (isClosed) return null;
        if (!res.ok) {
          return res.message.isEmpty ? 'Failed to update' : res.message;
        }
      }
      await load();
      return null;
    } catch (e) {
      return '$e';
    } finally {
      if (!isClosed) wearing.value = false;
    }
  }

  static bool _isAfterNow(int millis) {
    if (millis <= 0) return false;
    final ms = millis < 100000000000 ? millis * 1000 : millis;
    return DateTime.fromMillisecondsSinceEpoch(ms).isAfter(DateTime.now());
  }
}
