import 'package:get/get.dart';

import '../../../app/chimo_api.dart';

/// 隐私开关（GET/POST `/app/settings`）。
///
/// 抽出来的理由：这里不是「展开/折叠」那种纯 UI 态，
/// 而是**乐观更新 + 失败回滚**的逻辑 —— 先把开关拨过去，请求失败再拨回来。
///
/// **不 import material**：失败文案由方法返回给 View，
/// 由 View 决定怎么提示。
class PrivacySettingsLogic extends GetxController {
  final RxBool loading = true.obs;
  final RxBool saving = false.obs;

  final RxBool isHidden = false.obs;
  final RxBool isInvisibleVisit = false.obs;
  final RxBool isInvisibleUpMic = false.obs;
  final RxBool blockStrangers = false.obs;

  @override
  void onReady() {
    super.onReady();
    // onReady = 首帧之后，等价于原来的 addPostFrameCallback。
    load();
  }

  /// 拉一次设置。返回错误文案，`null` 表示成功。
  Future<String?> load() async {
    loading.value = true;
    try {
      final res = await ChimoApis.app.settings();
      if (res.ok && res.data != null) {
        final data = res.data!;
        isHidden.value = data.isHidden;
        isInvisibleVisit.value = data.isInvisibleVisit;
        isInvisibleUpMic.value = data.isInvisibleUpMic;
        blockStrangers.value = data.hasAccessStrangerMessage()
            ? !data.accessStrangerMessage
            : false;
        return null;
      }
      return res.message.isEmpty ? 'Failed to load settings' : res.message;
    } catch (error) {
      return 'Failed to load settings: $error';
    } finally {
      loading.value = false;
    }
  }

  Future<String?> setHidden(bool value) => _toggle(isHidden, 'isHidden', value, value);

  Future<String?> setInvisibleVisit(bool value) =>
      _toggle(isInvisibleVisit, 'isInvisibleVisit', value, value);

  Future<String?> setInvisibleUpMic(bool value) =>
      _toggle(isInvisibleUpMic, 'isInvisibleUpMic', value, value);

  /// 「屏蔽陌生人消息」在接口里是反向字段（`accessStrangerMessage`）。
  Future<String?> setBlockStrangers(bool value) =>
      _toggle(blockStrangers, 'accessStrangerMessage', value, !value);

  /// 乐观更新：先改本地开关，失败再回滚到 [flag] 原值。
  Future<String?> _toggle(RxBool flag, String field, bool next, bool payload) async {
    final previous = flag.value;
    flag.value = next;
    saving.value = true;
    try {
      final res = await ChimoApis.app.updateSettings({field: payload});
      if (res.ok) return null;
      flag.value = previous;
      return res.message.isEmpty ? 'Update failed' : res.message;
    } catch (error) {
      flag.value = previous;
      return 'Update failed: $error';
    } finally {
      saving.value = false;
    }
  }
}
