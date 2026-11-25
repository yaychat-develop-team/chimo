import 'package:get/get.dart';

import '../../../app/chimo_api.dart';
import '../../../common/models/server_client/auction.pb.dart';
import '../../../common/utils/app_toast.dart';

/// My Agent。对齐 proto `AgentInfoRsp`：艺人视角看经纪人与合同期内送礼。
class MyAgentLogic extends GetxController {
  final loading = true.obs;
  final info = Rxn<AgentInfoRsp>();

  bool get hasAgent {
    final data = info.value;
    if (data == null || !data.hasAgent()) return false;
    return data.agent.id.toInt() > 0;
  }

  List<AgentGiftRecord> get gifts => info.value?.giftList ?? const [];

  @override
  void onInit() {
    super.onInit();
    load();
  }

  Future<void> load() async {
    loading.value = true;
    try {
      final res = await ChimoApis.auction.agentInfo();
      if (res.ok) {
        info.value = res.data;
      } else {
        info.value = null;
        AppToast.error(res.message.isEmpty ? 'Failed to load' : res.message);
      }
    } catch (e) {
      info.value = null;
      AppToast.error('$e');
    } finally {
      loading.value = false;
    }
  }
}
