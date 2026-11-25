import 'package:get/get.dart';

import '../../../app/chimo_api.dart';
import '../../../common/models/server_client/commodity.pb.dart';
import '../../../common/utils/app_toast.dart';

/// My Frame 装扮页。对齐设计图 + `/commodity/*`。
class MyFrameLogic extends GetxController {
  MyFrameLogic({this.initIndex = -1});

  /// 外部指定初始 Tab；`< 0` 时跟服务端 `selected`。
  final int initIndex;

  final loading = true.obs;
  final error = ''.obs;
  final acting = false.obs;
  final giving = false.obs;

  final tabs = <CommodityTab>[].obs;
  final tabIndex = 0.obs;

  /// tabId → 列表。
  final itemsByTab = <int, List<CommodityItem>>{}.obs;

  /// tabId → 当前选中。
  final selectedByTab = <int, CommodityItem>{}.obs;

  /// tabId → 列表加载中。
  final listLoading = <int, bool>{}.obs;

  /// tabId → 列表错误。
  final listError = <int, String>{}.obs;

  CommodityTab? get currentTab {
    if (tabs.isEmpty) return null;
    return tabs[tabIndex.value.clamp(0, tabs.length - 1)];
  }

  CommodityItem? get selectedItem {
    final tab = currentTab;
    return tab == null ? null : selectedByTab[tab.id];
  }

  @override
  void onReady() {
    super.onReady();
    loadTabs();
  }

  Future<void> loadTabs({bool reset = false}) async {
    if (reset) {
      tabs.clear();
      itemsByTab.clear();
      selectedByTab.clear();
      listLoading.clear();
      listError.clear();
    }
    loading.value = true;
    error.value = '';
    try {
      final res = await ChimoApis.commodity.tabs();
      if (!res.ok || res.data == null) {
        error.value = res.message.trim().isEmpty ? 'Failed to load' : res.message;
        return;
      }
      final list = res.data!.list.toList(growable: false);
      tabs.assignAll(list);
      var index = 0;
      if (res.data!.hasSelected()) {
        final found = list.indexWhere((e) => e.type == res.data!.selected.type);
        if (found >= 0) index = found;
      }
      if (initIndex >= 0 && initIndex < list.length) index = initIndex;
      tabIndex.value = index;
      if (list.isNotEmpty) await loadList(list[index]);
    } catch (e) {
      error.value = '$e';
    } finally {
      loading.value = false;
    }
  }

  void onTabChanged(int index) {
    if (tabIndex.value == index) return;
    tabIndex.value = index;
    final tab = tabs[index];
    if (!itemsByTab.containsKey(tab.id)) loadList(tab);
  }

  Future<void> loadList(CommodityTab tab, {bool reset = false}) async {
    if (!reset && (listLoading[tab.id] == true || itemsByTab.containsKey(tab.id))) return;
    if (reset) {
      itemsByTab.remove(tab.id);
      listError.remove(tab.id);
    }
    listLoading[tab.id] = true;
    listError[tab.id] = '';
    listLoading.refresh();
    listError.refresh();
    try {
      final res = await ChimoApis.commodity.mineList(typeId: tab.id);
      if (!res.ok || res.data == null) {
        listError[tab.id] = res.message.trim().isEmpty ? 'Failed to load' : res.message;
        return;
      }
      final list = res.data!;
      itemsByTab[tab.id] = list;
      itemsByTab.refresh();
      _defaultSelect(tab, list);
    } catch (e) {
      listError[tab.id] = '$e';
    } finally {
      listLoading[tab.id] = false;
      listLoading.refresh();
      listError.refresh();
    }
  }

  void selectItem(CommodityTab tab, CommodityItem item) {
    selectedByTab[tab.id] = item;
    selectedByTab.refresh();
  }

  bool isSelected(CommodityTab tab, CommodityItem item) {
    return selectedByTab[tab.id]?.id == item.id;
  }

  Future<void> toggleWear() async {
    final item = selectedItem;
    if (item == null || acting.value) return;
    acting.value = true;
    try {
      final using = item.state == CommodityState.USING;
      final res = using
          ? await ChimoApis.commodity.cancelUse(item.id)
          : await ChimoApis.commodity.use(item.id);
      if (!res.ok) {
        AppToast.error(res.message.trim().isEmpty ? 'Failed' : res.message);
        return;
      }
      AppToast.success(using ? 'Unequipped' : 'Equipped');
      final tab = currentTab;
      if (tab != null) await loadList(tab, reset: true);
    } catch (e) {
      AppToast.error('$e');
    } finally {
      acting.value = false;
    }
  }

  /// 赠送装扮。成功返回 `null`，失败返回错误文案。
  Future<String?> giveTo({
    required String receiverId,
    required CommodityItem item,
    required int count,
  }) async {
    if (giving.value) return 'Busy';
    giving.value = true;
    try {
      final res = await ChimoApis.commodity.give(
        receiverIds: [receiverId],
        knapsackId: item.id,
        count: count,
        type: item.type,
      );
      if (!res.ok) {
        return res.message.trim().isEmpty ? 'Gift failed' : res.message;
      }
      final tab = currentTab;
      if (tab != null) await loadList(tab, reset: true);
      return null;
    } catch (e) {
      return '$e';
    } finally {
      giving.value = false;
    }
  }

  void _defaultSelect(CommodityTab tab, List<CommodityItem> list) {
    if (list.isEmpty) {
      selectedByTab.remove(tab.id);
      selectedByTab.refresh();
      return;
    }
    final currentId = selectedByTab[tab.id]?.id;
    selectedByTab[tab.id] = list.firstWhere(
      (e) => e.state == CommodityState.USING,
      orElse: () => list.firstWhere(
        (e) => e.id == currentId,
        orElse: () => list.first,
      ),
    );
    selectedByTab.refresh();
  }

  static MyFrameLogic put({int initIndex = -1}) {
    if (Get.isRegistered<MyFrameLogic>()) return Get.find<MyFrameLogic>();
    return Get.put(MyFrameLogic(initIndex: initIndex));
  }

  static void delete() {
    if (Get.isRegistered<MyFrameLogic>()) {
      Get.delete<MyFrameLogic>(force: true);
    }
  }
}
