import 'package:get/get.dart';

import '../../../app/chimo_api.dart';
import '../../../common/utils/app_toast.dart';

/// 隐私开关。先改本地，请求失败再拨回去并 toast。
class PrivacySettingsLogic extends GetxController {
  final RxBool isHidden = false.obs;
  final RxBool isInvisibleVisit = false.obs;
  final RxBool isInvisibleUpMic = false.obs;
  final RxBool blockStrangers = false.obs;

  @override
  void onReady() {
    super.onReady();
    load();
  }

  Future<void> load() async {
    try {
      final res = await ChimoApis.app.settings();
      final data = res.data;
      if (!res.ok || data == null) {
        AppToast.error(
          res.message.isEmpty ? 'Failed to load settings' : res.message,
        );
        return;
      }
      isHidden.value = data.isHidden;
      isInvisibleVisit.value = data.isInvisibleVisit;
      isInvisibleUpMic.value = data.isInvisibleUpMic;
      blockStrangers.value = data.hasAccessStrangerMessage()
          ? !data.accessStrangerMessage
          : false;
    } catch (error) {
      AppToast.error('Failed to load settings: $error');
    }
  }

  Future<void> setHidden(bool value) => _save(isHidden, 'isHidden', value);

  Future<void> setInvisibleVisit(bool value) =>
      _save(isInvisibleVisit, 'isInvisibleVisit', value);

  Future<void> setInvisibleUpMic(bool value) =>
      _save(isInvisibleUpMic, 'isInvisibleUpMic', value);

  /// 接口字段是 `accessStrangerMessage`，和开关方向相反。
  Future<void> setBlockStrangers(bool value) =>
      _save(blockStrangers, 'accessStrangerMessage', value, payload: !value);

  Future<void> _save(
    RxBool flag,
    String field,
    bool next, {
    bool? payload,
  }) async {
    final previous = flag.value;
    flag.value = next;
    try {
      final res = await ChimoApis.app.updateSettings({field: payload ?? next});
      if (res.ok) return;
      flag.value = previous;
      AppToast.error(res.message.isEmpty ? 'Update failed' : res.message);
    } catch (error) {
      flag.value = previous;
      AppToast.error('Update failed: $error');
    }
  }
}
