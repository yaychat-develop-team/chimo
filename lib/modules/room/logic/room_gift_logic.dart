import 'package:get/get.dart';

import '../../../app/chimo_api.dart';
import '../../../common/extensions/wire_view.dart';
import '../../../common/models/server_client/cash.pb.dart';
import '../../../common/models/server_client/commodity.pb.dart';
import '../../../common/utils/app_log.dart';
import '../model/room_gift_receiver.dart';

/// 送礼结果。成功时带上礼物信息：私聊插气泡，房间播飞麦。
class RoomGiftDispatch {
  const RoomGiftDispatch._({
    this.error,
    this.giftId = 0,
    this.giftName = '',
    this.iconUrl = '',
    this.giftUrl = '',
    this.micRes = '',
    this.qty = 0,
    this.cost = 0,
  });

  const RoomGiftDispatch.fail(String message) : this._(error: message);

  final String? error;
  final int giftId;
  final String giftName;
  final String iconUrl;
  final String giftUrl;
  final String micRes;
  final int qty;
  final int cost;

  bool get ok => error == null;
}

/// 房间礼物目录、麦位收礼人、数量与送出。
class RoomGiftLogic extends GetxController {
  RoomGiftLogic({
    required this.rid,
    required this.channelId,
    required this.receivers,
    this.preferredUid = '',
  });

  static const qtyOptions = [1, 3, 10, 40, 100, 999];

  final int rid;
  final String channelId;
  final List<RoomGiftReceiver> receivers;
  final String preferredUid;

  final tabs = <ItemTab>[].obs;
  final bagItems = <CommodityItem>[].obs;
  final selectedUids = <String>{}.obs;
  final balance = 0.obs;
  final loading = true.obs;
  final bagLoading = false.obs;
  final sending = false.obs;
  final loadError = RxnString();
  final tabIndex = 0.obs;
  final giftIndex = 0.obs;
  final bagIndex = 0.obs;
  final qty = 1.obs;

  String get currentTabType {
    if (tabs.isEmpty) return '';
    return tabs[tabIndex.value.clamp(0, tabs.length - 1)].tabType.trim();
  }

  bool get isBagTab => currentTabType == 'bag';

  bool get isInteractiveTab => currentTabType == 'interactive';

  List<ItemInfo> get currentGifts {
    if (isBagTab || tabs.isEmpty) return const [];
    final index = tabIndex.value.clamp(0, tabs.length - 1);
    return tabs[index].item;
  }

  ItemInfo? get currentGift {
    final gifts = currentGifts;
    if (gifts.isEmpty) return null;
    return gifts[giftIndex.value.clamp(0, gifts.length - 1)];
  }

  CommodityItem? get currentBagItem {
    if (bagItems.isEmpty) return null;
    return bagItems[bagIndex.value.clamp(0, bagItems.length - 1)];
  }

  String? get currentSendName {
    if (isBagTab) return currentBagItem?.name;
    return currentGift?.name;
  }

  bool get allSelected => receivers.isNotEmpty && selectedUids.length == receivers.length;

  /// 是否可选中礼物并点 Gift；未选收礼人时仍可点，由 [send] 提示。
  bool get canDispatch {
    if (sending.value) return false;
    if (isBagTab) {
      final item = currentBagItem;
      return item != null && item.canSend && item.num > 0;
    }
    return currentGift != null;
  }

  @override
  void onInit() {
    super.onInit();
    final prefer = preferredUid.trim();
    if (prefer.isNotEmpty && receivers.any((user) => user.uid == prefer)) {
      selectedUids.add(prefer);
    } else {
      selectedUids.addAll(receivers.map((user) => user.uid));
    }
  }

  @override
  void onReady() {
    super.onReady();
    load();
  }

  Future<void> load() async {
    loading.value = true;
    loadError.value = null;
    try {
      final tabsFuture = ChimoApis.cash.giftTabs(rid: rid);
      final balanceFuture = ChimoApis.cash.balance();
      final tabsRes = await tabsFuture;
      final balanceRes = await balanceFuture;
      if (isClosed) return;
      final next = [...?tabsRes.data];
      if (!next.any((tab) => tab.tabType.trim() == 'bag')) {
        next.add(ItemTab(name: 'Package', tabType: 'bag'));
      }
      tabs.assignAll(next);
      balance.value = balanceRes.data == null ? 0 : cashCoins(balanceRes.data!);
      tabIndex.value = _hotIndex(tabs);
      giftIndex.value = 0;
      bagIndex.value = 0;
      loadError.value = tabs.isEmpty && !tabsRes.ok
          ? (tabsRes.message.isEmpty ? 'Failed to load gifts' : tabsRes.message)
          : null;
      if (isBagTab) await loadBag();
    } catch (error) {
      if (!isClosed) loadError.value = '$error';
    } finally {
      if (!isClosed) loading.value = false;
    }
  }

  Future<void> loadBag() async {
    if (bagLoading.value) return;
    bagLoading.value = true;
    try {
      final res = await ChimoApis.commodity.bag();
      if (isClosed) return;
      final list = res.data ?? const <CommodityItem>[];
      bagItems.assignAll(list);
      if (list.isEmpty) {
        bagIndex.value = 0;
      } else {
        bagIndex.value = bagIndex.value.clamp(0, list.length - 1);
      }
    } catch (error) {
      AppLog.w('RoomGift bag load failed', error: error);
      if (!isClosed) bagItems.clear();
    } finally {
      if (!isClosed) bagLoading.value = false;
    }
  }

  int _hotIndex(List<ItemTab> list) {
    final hot = list.indexWhere((tab) => tab.tabType.trim() == 'normal');
    return hot >= 0 ? hot : 0;
  }

  void selectTab(int index) {
    if (index < 0 || index >= tabs.length) return;
    tabIndex.value = index;
    giftIndex.value = 0;
    bagIndex.value = 0;
    if (isBagTab) loadBag();
  }

  void selectGift(int index) => giftIndex.value = index;

  void selectBagItem(int index) => bagIndex.value = index;

  void setQty(int value) => qty.value = value;

  void toggleUser(String uid) {
    if (selectedUids.contains(uid)) {
      selectedUids.remove(uid);
    } else {
      selectedUids.add(uid);
    }
  }

  void toggleAll() {
    if (allSelected) {
      selectedUids.clear();
      return;
    }
    selectedUids
      ..clear()
      ..addAll(receivers.map((user) => user.uid));
  }

  Future<RoomGiftDispatch> send() async {
    if (sending.value) return const RoomGiftDispatch.fail('Gift failed');
    if (selectedUids.isEmpty) {
      return const RoomGiftDispatch.fail('Please select a receiver');
    }
    if (isBagTab) return _sendBag();
    return _sendCashGift();
  }

  Future<RoomGiftDispatch> _sendCashGift() async {
    final gift = currentGift;
    if (gift == null) return const RoomGiftDispatch.fail('No gifts available');
    final count = qty.value;
    final total = gift.price.toInt() * count * selectedUids.length;
    if (balance.value < total) {
      return const RoomGiftDispatch.fail('Insufficient balance.');
    }
    sending.value = true;
    try {
      final res = await ChimoApis.cash.sendGift(
        receiverIds: selectedUids.toList(),
        itemId: gift.id.toString(),
        count: count,
        channelId: channelId,
      );
      if (!res.ok) {
        idle();
        return RoomGiftDispatch.fail(res.message.isEmpty ? 'Gift failed' : res.message);
      }
    } catch (error) {
      idle();
      return RoomGiftDispatch.fail('Gift failed: $error');
    }

    try {
      final bal = await ChimoApis.cash.balance();
      if (!isClosed) {
        balance.value = bal.data == null ? balance.value : cashCoins(bal.data!);
      }
    } catch (error) {
      AppLog.w('RoomGift balance refresh failed', error: error);
    }
    idle();
    return RoomGiftDispatch._(
      giftId: gift.id.toInt(),
      giftName: gift.name,
      iconUrl: gift.icon,
      giftUrl: gift.dynamicResource,
      micRes: gift.micRes,
      qty: count,
      cost: gift.price.toInt(),
    );
  }

  Future<RoomGiftDispatch> _sendBag() async {
    final item = currentBagItem;
    if (item == null) return const RoomGiftDispatch.fail('No gifts available');
    if (!item.canSend) {
      return const RoomGiftDispatch.fail('This item cannot be sent');
    }
    final count = qty.value;
    final need = count * selectedUids.length;
    if (need > item.num) {
      return const RoomGiftDispatch.fail('Not enough items in package');
    }
    sending.value = true;
    try {
      final res = await ChimoApis.commodity.give(
        receiverIds: selectedUids.toList(),
        knapsackId: item.id,
        count: count,
        type: item.type,
        channelId: channelId,
      );
      if (!res.ok) {
        idle();
        return RoomGiftDispatch.fail(res.message.isEmpty ? 'Gift failed' : res.message);
      }
    } catch (error) {
      idle();
      return RoomGiftDispatch.fail('Gift failed: $error');
    }
    await loadBag();
    idle();
    return RoomGiftDispatch._(
      giftId: item.id.toInt(),
      giftName: item.name,
      iconUrl: item.url,
      qty: count,
    );
  }

  void idle() {
    if (!isClosed) sending.value = false;
  }
}
