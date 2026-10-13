import 'package:get/get.dart';

import '../../../app/app_jumper.dart';
import '../../../app/chimo_api.dart';

/// 品牌欢迎页的行业列表与勾选。
///
/// 展开动画和列表滚动留在页面，不进这里。
class WelcomeBrandLogic extends GetxController {
  /// 接口失败时的本地兜底（须与服务端 type 文案一致才能筛群）。
  static const List<String> fallbackIndustries = [
    'Tech / IT',
    'Finance/Business',
    'Creative/Design',
    'Medical/Health',
    'Education/Academia',
    'Sales / Marketing',
    'Legal/Public Service',
    'Engineering/Manufacturing',
  ];

  final RxList<String> industries = List<String>.from(fallbackIndustries).obs;
  final RxBool loadingTypes = true.obs;
  final selected = <String>{}.obs;

  @override
  void onReady() {
    super.onReady();
    loadIndustries();
  }

  /// 拉行业。失败或空列表时保留 [fallbackIndustries]。
  Future<void> loadIndustries() async {
    try {
      final res = await ChimoApis.group.typeList();
      if (isClosed) return;
      if (res.ok) {
        final types = res.data ?? const <String>[];
        if (types.isNotEmpty) industries.assignAll(types);
      }
    } catch (_) {
      // 保留兜底列表。
    } finally {
      if (!isClosed) loadingTypes.value = false;
    }
  }

  void toggle(String industry) {
    if (selected.contains(industry)) {
      selected.remove(industry);
    } else {
      selected.add(industry);
    }
  }

  String get typeList => selected.join(',');

  void skip() => AppJumper.toTribes();

  void next() => AppJumper.toTribes(typeList: typeList);
}
