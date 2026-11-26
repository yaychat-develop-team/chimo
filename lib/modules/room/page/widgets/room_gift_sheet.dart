import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../app/app_jumper.dart';
import '../../../../app/session_info.dart';
import '../../../../common/constants/app_assets.dart';
import '../../../../common/models/server_client/cash.pb.dart';
import '../../../../common/models/server_client/commodity.pb.dart';
import '../../../../common/theme/app_colors.dart';
import '../../../../common/utils/app_log.dart';
import '../../../../common/utils/app_toast.dart';
import '../../../../common/widgets/app_blur_backdrop.dart';
import 'package:chimo/common/utils/chimo.dart';
import '../../logic/mic_logic.dart';
import '../../logic/room_effect_logic.dart';
import '../../logic/room_gift_logic.dart';
import '../../model/mic_seat.dart';
import '../../model/room_gift_receiver.dart';
import '../../service/room_service.dart';
import '../../types/heart_link/logic/heart_link_logic.dart';
import 'gift/room_gift_blind_box_dialog.dart';
import 'gift/room_gift_buy_bar.dart';
import 'gift/room_gift_grids.dart';
import 'gift/room_gift_lucky_buff.dart';
import 'gift/room_gift_receivers_bar.dart';

/// 私聊送礼成功结果，供聊天页插礼物气泡。
class GiftSendResult {
  const GiftSendResult({
    required this.id,
    required this.name,
    required this.qty,
    this.emoji = '',
    this.iconUrl = '',
    this.cost = 0,
  });

  final int id;
  final String emoji;
  final String name;
  final int qty;
  final String iconUrl;
  final int cost;
}

/// 房间送礼面板。样式对齐 Cosmic Lounge 设计稿。
///
/// [preferredUid] 可来自资料卡（未必在麦上）；不在麦位列表时会补进收礼人。
Future<void> showRoomGiftSheet(
  BuildContext context, {
  String preferredUid = '',
  String preferredName = '',
  String preferredAvatar = '',
  int preferredGiftId = 0,
}) {
  final service = RoomService.findOrNull();
  if (service == null || !service.inRoom.value) {
    AppToast.info('Not in a room');
    return Future.value();
  }
  final myUid = '${service.myUid}';
  final people = <RoomGiftReceiver>[];
  if (Get.isRegistered<MicLogic>()) {
    people.addAll(
      Get.find<MicLogic>().seats
          .where((seat) => seat.occupied && '${seat.uid}' != myUid)
          .map(_receiver),
    );
  }
  final prefer = preferredUid.trim();
  if (prefer.isNotEmpty && prefer != myUid && prefer != '0') {
    final exists = people.any((item) => item.uid == prefer);
    if (!exists) {
      people.insert(
        0,
        RoomGiftReceiver(
          uid: prefer,
          name: preferredName.trim().isEmpty ? 'User' : preferredName.trim(),
          avatar: preferredAvatar,
        ),
      );
    }
  }
  // 对齐 yaychat GiftPage.show：用 Flutter showModalBottomSheet，不要 Get.bottomSheet。
  // Get persistent:true 关窗会误 pause PAG；persistent:false 又会因面板叠层立刻 pause。
  return showModalBottomSheet<void>(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    barrierColor: Colors.transparent,
    // LuckyBuff 在卡片外并下移叠边，勿裁切。
    clipBehavior: Clip.none,
    builder: (_) => RoomGiftSheet(
      rid: service.rid,
      channelId: '${service.rid}',
      receivers: people,
      preferredUid: prefer,
      preferredGiftId: preferredGiftId,
    ),
  );
}

RoomGiftReceiver _receiver(MicSeat seat) {
  return RoomGiftReceiver(uid: '${seat.uid}', name: seat.name, avatar: seat.avatar);
}

/// 共用礼物面板（房间 / 私聊 / 资料卡）。对齐 joyride `GiftPage`。
///
/// 是否房间场景由 [channelId] 是否非空决定：有 channel → 展示 To 栏（飞麦由 SEND_GIFT）；
/// 私聊传空 channel + [returnResult] 回传 [GiftSendResult]。
class RoomGiftSheet extends StatefulWidget {
  const RoomGiftSheet({
    super.key,
    required this.rid,
    required this.channelId,
    required this.receivers,
    this.preferredUid = '',
    this.preferredGiftId = 0,
    this.returnResult = false,
  });

  final int rid;
  final String channelId;
  final List<RoomGiftReceiver> receivers;
  final String preferredUid;
  final int preferredGiftId;

  /// 私聊：成功后 `pop` [GiftSendResult] 供消息流插卡。
  final bool returnResult;

  /// 带房间 channel → 房间送礼（To 多选 + 飞麦特效）。
  bool get isRoomScene => channelId.trim().isNotEmpty;

  @override
  State<RoomGiftSheet> createState() => _RoomGiftSheetState();
}

class _RoomGiftSheetState extends State<RoomGiftSheet> with SingleTickerProviderStateMixin {
  static const _panelH = 360.0;

  /// 底栏内容高度（不含安全区）：padding 8+12 + 按钮 32。
  /// 目录区底部留白，避免最后一行被底栏挡住。
  static const _buyBarContentH = 52.0;

  late final String _tag;
  late final RoomGiftLogic logic;
  late final Worker _tabsWorker;
  TabController? _tabs;

  @override
  void initState() {
    super.initState();
    _tag = 'room-gift-$hashCode';
    logic = Get.put(
      RoomGiftLogic(
        rid: widget.rid,
        channelId: widget.channelId,
        receivers: widget.receivers,
        preferredUid: widget.preferredUid,
        preferredGiftId: widget.preferredGiftId,
      ),
      tag: _tag,
    );
    _tabsWorker = ever(logic.tabs, _syncTabs);
  }

  @override
  void dispose() {
    _tabsWorker.dispose();
    _tabs?.dispose();
    Get.delete<RoomGiftLogic>(tag: _tag);
    super.dispose();
  }

  void _syncTabs(List<ItemTab> tabs) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;
      final len = tabs.length;
      if (len == 0) {
        _tabs?.dispose();
        _tabs = null;
        setState(() {});
        return;
      }
      if (_tabs == null || _tabs!.length != len) {
        _tabs?.dispose();
        _tabs = TabController(
          length: len,
          vsync: this,
          initialIndex: logic.tabIndex.value.clamp(0, len - 1),
        );
        _tabs!.addListener(() {
          if (_tabs!.indexIsChanging) return;
          logic.selectTab(_tabs!.index);
        });
      }
      final want = logic.tabIndex.value.clamp(0, len - 1);
      if (_tabs!.index != want) _tabs!.index = want;
      setState(() {});
    });
  }

  Future<void> _send() async {
    final result = await logic.send();
    if (!mounted) return;
    if (!result.ok) {
      logic.idle();
      if (result.insufficient) {
        await AppJumper.showRechargeSheet(price: result.needPrice, onSuccess: () => logic.load());
        return;
      }
      AppToast.info(result.error ?? 'Gift failed');
      return;
    }
    // 私聊等 returnResult 场景仍 pop 回传气泡数据。
    if (widget.returnResult) {
      _closeSheet(
        result: GiftSendResult(
          id: result.giftId,
          name: result.giftName,
          qty: result.qty,
          iconUrl: result.iconUrl,
          cost: result.cost,
        ),
      );
      return;
    }
    // 房间：立刻本地飞麦；WS SEND_GIFT 到了用去重挡双播。面板留着可连送。
    if (widget.isRoomScene) {
      _playRoomGiftFly(result);
    }
    logic.idle();
  }

  void _playRoomGiftFly(RoomGiftDispatch result) {
    if (!Get.isRegistered<RoomEffectLogic>()) {
      AppLog.w('GiftFly skip: RoomEffectLogic missing');
      return;
    }
    final icon = result.iconUrl.trim();
    final pag = result.giftUrl.trim();
    if (icon.isEmpty && pag.isEmpty) {
      AppLog.w('GiftFly skip: empty icon/pag', body: {'giftId': result.giftId});
      return;
    }
    final service = RoomService.findOrNull();
    final senderUid = service?.myUid ?? 0;
    final receivers = [
      for (final raw in logic.selectedUids) int.tryParse(raw.trim()) ?? 0,
    ].where((id) => id > 0).toList();
    if (senderUid <= 0 || receivers.isEmpty) {
      AppLog.w('GiftFly skip: bad uids', body: {'sender': senderUid, 'receivers': receivers});
      return;
    }
    final toName = [
      for (final user in logic.receivers)
        if (logic.selectedUids.contains(user.uid)) user.name,
    ].where((name) => name.trim().isNotEmpty).join(', ');
    Get.find<RoomEffectLogic>().playLocalSendGift(
      senderUid: senderUid,
      receiverUids: receivers,
      iconUrl: icon,
      giftUrl: pag,
      micRes: result.micRes,
      count: result.qty,
      giftId: result.giftId,
      price: result.cost,
      fromName: service?.myName ?? '',
      toName: toName,
      giftName: result.giftName,
    );
  }

  /// 用当前弹层 context pop，精确关掉礼物 bottomSheet（勿用 Get.back）。
  void _closeSheet({Object? result}) {
    final nav = Navigator.of(context);
    if (!nav.canPop()) return;
    nav.pop(result);
  }

  void _pickQty() {
    final box = context.findRenderObject()! as RenderBox;
    final overlay = Overlay.of(context).context.findRenderObject()! as RenderBox;
    final offset = box.localToGlobal(Offset.zero, ancestor: overlay);
    showMenu<int>(
      context: context,
      color: AppColors.black2A2A2A,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      position: RelativeRect.fromLTRB(
        offset.dx + box.size.width - 200,
        offset.dy + box.size.height - 300,
        offset.dx + box.size.width - 80,
        0,
      ),
      items: RoomGiftLogic.qtyOptions
          .map(
            (q) => PopupMenuItem<int>(
              value: q,
              child: Center(
                child: Text(
                  '$q',
                  style: TextStyle(
                    color: q == logic.qty.value ? AppColors.green29EEAA : AppColors.white,
                    fontSize: 15,
                    fontWeight: q == logic.qty.value ? FontWeight.w800 : FontWeight.w500,
                  ),
                ),
              ),
            ),
          )
          .toList(),
    ).then((value) {
      if (value != null) logic.setQty(value);
    });
  }

  @override
  Widget build(BuildContext context) {
    final bottom = Get.mediaQuery.padding.bottom;
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Obx(() {
          final gift = logic.isBagTab ? null : logic.currentGift;
          if (gift == null || !gift.hasBoxMaxItem()) return const SizedBox.shrink();
          return RoomGiftLuckyBuff(box: gift);
        }),
        AppBlurBackdrop(
          blur: 28,
          color: AppColors.black111DE5.withValues(alpha: 0.9),
          borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // 对齐 joyride showUserList：仅房间且有收礼人时展示顶部 To 区。
              if (widget.isRoomScene && widget.receivers.isNotEmpty) ...[
                Obx(
                  () => RoomGiftReceiversBar(
                    receivers: widget.receivers,
                    selectedUids: logic.selectedUids.toSet(),
                    allSelected: logic.allSelected,
                    onToggleUser: logic.toggleUser,
                    onToggleAll: logic.toggleAll,
                  ),
                ),
                const Divider(
                  color: AppColors.white12,
                  indent: 12,
                  endIndent: 12,
                  thickness: 1,
                  height: 1,
                ),
              ],
              // 目录铺满；tips / buyBar 叠在 Stack 底部。
              SizedBox(
                height: _panelH,
                child: Stack(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Obx(_tabBar),
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.only(bottom: _buyBarContentH + bottom),
                            child: Obx(_catalog),
                          ),
                        ),
                      ],
                    ),
                    Obx(() => _specialTips(bottom)),
                    Positioned(
                      left: 0,
                      right: 0,
                      bottom: 0,
                      child: Obx(
                        () => RoomGiftBuyBar(
                          bottomInset: bottom,
                          balance: logic.balance.value,
                          qty: logic.qty.value,
                          busy: !logic.canDispatch,
                          sending: logic.sending.value,
                          action: logic.buyAction,
                          unlockLabel: logic.unlockLabel,
                          applyHint: logic.privilegeHint,
                          onPickQty: _pickQty,
                          onSend: () => _send(),
                          onUnlock: _onUnlock,
                          onOpen: _onOpenBlindBox,
                          onApply: _onApplyPrivilege,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  void _onUnlock() {
    final user = SessionInfo.currentUser;
    _closeSheet();
    AppJumper.toLevel(
      level: user?.vipLevel ?? 0,
      experience: user?.experience.toInt() ?? 0,
      moreExpForNextLevel: user?.moreExpForNextLevel.toInt() ?? 0,
      totalExperience: user?.totalExperience.toInt() ?? 0,
    );
  }

  Future<void> _onOpenBlindBox() async {
    final item = logic.currentBagItem;
    if (item == null || item.type != CommodityType.BLIND_BOX) return;
    final opened = await RoomGiftBlindBoxDialog.show(item.id);
    if (opened) await logic.loadBag();
  }

  Future<void> _onApplyPrivilege() async {
    final item = logic.currentBagItem;
    if (item == null || item.type != CommodityType.BENEFIT_CARD) return;
    final subType = item.subType;
    if (subType == 4) {
      if (!widget.isRoomScene) {
        AppToast.info('Enter a room to use this card');
        return;
      }
      // 先发飘屏再关面板，避免 dispose 后 Logic 已删。
      await _showFloatMsgInput();
      if (mounted) _closeSheet();
      return;
    }
    _closeSheet();
    // 喇叭 / 彩名 / 炫彩依赖独立页与 H5，尚未接入。
    AppToast.info('Coming soon');
  }

  Future<void> _showFloatMsgInput() async {
    final controller = TextEditingController();
    final text = await Get.dialog<String>(
      AlertDialog(
        backgroundColor: AppColors.black2A2A2A,
        title: const Text('Floating Message', style: TextStyle(color: AppColors.white)),
        content: TextField(
          controller: controller,
          autofocus: true,
          maxLength: 60,
          style: const TextStyle(color: AppColors.white),
          decoration: const InputDecoration(
            hintText: 'Enter message',
            hintStyle: TextStyle(color: AppColors.gray9A9A9A),
          ),
        ),
        actions: [
          TextButton(onPressed: () => Get.back<String>(), child: const Text('Cancel')),
          TextButton(
            onPressed: () => Get.back<String>(result: controller.text.trim()),
            child: const Text('Send'),
          ),
        ],
      ),
    );
    controller.dispose();
    if (text == null || text.isEmpty) return;
    final res = await logic.sendRoomFloatMsg(text);
    if (res.ok) {
      AppToast.info('Sent');
    } else {
      AppToast.info(res.message.isEmpty ? 'Send failed' : res.message);
    }
  }

  /// Lucky / Tricky / Heartie tips。
  /// 对齐 joyride：`bottom: 24 + safeArea`，tips 中部条落在 Gift 按钮上方；底栏后绘不挡点击。
  Widget _specialTips(double bottomInset) {
    if (logic.isBagTab) return const SizedBox.shrink();
    final item = logic.currentGift;
    if (item == null) return const SizedBox.shrink();
    final tipBottom = 24.0 + bottomInset;
    if (item.hasBoxMaxItem()) {
      return Positioned(
        left: 0,
        right: 0,
        bottom: tipBottom,
        // 勿整层 IgnorePointer：右侧问号要可点（闪电图标在 tips 内部已 IgnorePointer）。
        child: RoomGiftLuckyTips(boxMaxItem: item.boxMaxItem, payCurrency: item.payCurrency),
      );
    }
    if (item.hasTrickyConfig() && item.trickyConfig.items.isNotEmpty) {
      final pic = item.trickyConfig.items.first.pic.trim();
      if (pic.isEmpty) return const SizedBox.shrink();
      return Positioned(
        left: 0,
        right: 0,
        bottom: tipBottom,
        child: IgnorePointer(child: Chimo.image(pic, fit: BoxFit.fitWidth)),
      );
    }
    if (_showHtTips) return _htGiftTips(tipBottom);
    return const SizedBox.shrink();
  }

  /// 对齐 oumi `GiftPageModel.showHtTips`：房间场景 + 已选收礼人 + 当前礼物为牵手礼物。
  bool get _showHtTips {
    if (!widget.isRoomScene || logic.selectedUids.isEmpty || logic.isBagTab) {
      return false;
    }
    if (!Get.isRegistered<HeartLinkLogic>()) return false;
    final htId = Get.find<HeartLinkLogic>().roomHtInfo?.itemId.toInt() ?? 0;
    if (htId <= 0) return false;
    return logic.currentGift?.id.toInt() == htId;
  }

  String get _htTipsName {
    if (logic.selectedUids.length != 1) return 'her';
    final uid = logic.selectedUids.first;
    for (final user in logic.receivers) {
      if (user.uid == uid) {
        final name = user.name.trim();
        return name.isEmpty ? 'her' : name;
      }
    }
    return 'her';
  }

  /// Heartie 牵手礼物悬浮提示。[tipBottom] 已含赠送栏高度。
  Widget _htGiftTips(double tipBottom) {
    final name = _htTipsName;
    final text = 'Send this gift to partner up with $name and enjoy exclusive features';
    final nameIndex = text.indexOf(name);
    return Positioned(
      left: 0,
      right: 0,
      bottom: tipBottom,
      child: IgnorePointer(
        child: Container(
          width: double.infinity,
          height: 93.w,
          padding: EdgeInsetsDirectional.only(start: 104.w, top: 30.w, end: 35.w),
          decoration: const BoxDecoration(
            image: DecorationImage(image: AssetImage(AppAssets.htGiftTipsBg), fit: BoxFit.fill),
          ),
          child: nameIndex < 0
              ? Text(
                  text,
                  style: TextStyle(
                    color: AppColors.white,
                    fontSize: 11.sp,
                    fontWeight: FontWeight.w500,
                    height: 1.3,
                  ),
                )
              : Text.rich(
                  TextSpan(
                    style: TextStyle(
                      color: AppColors.white,
                      fontSize: 11.sp,
                      fontWeight: FontWeight.w500,
                      height: 1.3,
                    ),
                    children: [
                      TextSpan(text: text.substring(0, nameIndex)),
                      TextSpan(
                        text: name,
                        style: const TextStyle(color: Color(0xFFFFE05A)),
                      ),
                      TextSpan(text: text.substring(nameIndex + name.length)),
                    ],
                  ),
                ),
        ),
      ),
    );
  }

  Widget _tabBar() {
    final tabs = logic.tabs;
    final controller = _tabs;
    if (tabs.isEmpty || controller == null) {
      return const SizedBox(height: 40);
    }
    return Padding(
      padding: const EdgeInsets.only(top: 4, right: 12),
      child: TabBar(
        controller: controller,
        isScrollable: true,
        tabAlignment: TabAlignment.start,
        labelPadding: const EdgeInsets.symmetric(horizontal: 14),
        labelColor: AppColors.white,
        unselectedLabelColor: AppColors.gray9A9A9A,
        labelStyle: const TextStyle(fontSize: 15, fontWeight: FontWeight.w700),
        unselectedLabelStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
        indicator: const BoxDecoration(),
        indicatorWeight: 0.01,
        dividerColor: Colors.transparent,
        tabs: tabs.map((tab) => Tab(text: _tabName(tab), height: 36)).toList(),
      ),
    );
  }

  String _tabName(ItemTab tab) {
    final type = tab.tabType.trim();
    if (type == 'bag') return 'Package';
    if (type == 'interactive') {
      return tab.name.isEmpty ? 'Interaction' : tab.name;
    }
    if (type == 'normal' && (tab.name.isEmpty || tab.name.toLowerCase() == 'hot')) {
      return 'Popular';
    }
    return tab.name.isEmpty ? 'Gift' : tab.name;
  }

  Widget _catalog() {
    if (logic.loading.value && logic.tabs.isEmpty) {
      return const Center(
        child: CircularProgressIndicator(color: AppColors.green29EEAA, strokeWidth: 2.4),
      );
    }
    final error = logic.loadError.value;
    if (error != null && logic.tabs.isEmpty) {
      return Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(error, style: const TextStyle(color: AppColors.gray9A9A9A, fontSize: 13)),
            TextButton(onPressed: () => logic.load(), child: const Text('Retry')),
          ],
        ),
      );
    }
    if (logic.isBagTab) {
      return RoomGiftBagGrid(
        items: logic.bagItems.toList(),
        selected: logic.bagIndex.value,
        loading: logic.bagLoading.value,
        onSelect: logic.selectBagItem,
        onRetry: () => logic.loadBag(),
      );
    }
    if (logic.isInteractiveTab) {
      return RoomGiftInteractiveList(
        gifts: logic.currentGifts,
        selected: logic.giftIndex.value,
        onSelect: logic.selectGift,
      );
    }
    return RoomGiftCashGrid(
      gifts: logic.currentGifts,
      selected: logic.giftIndex.value,
      onSelect: logic.selectGift,
      isLocked: logic.isGiftLocked,
    );
  }
}
