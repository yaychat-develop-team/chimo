import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../app/app_jumper.dart';
import '../../../../common/constants/app_assets.dart';
import '../../../../common/models/server_client/cash.pb.dart';
import '../../logic/gift_sheet_logic.dart';
import '../../../../common/theme/app_colors.dart';
import '../../../../common/theme/app_bottom_sheet.dart';
import '../../../../common/utils/app_toast.dart';
import '../../../../common/widgets/app_image.dart';

/// 送礼结果 → 聊天消息流。
///
/// 只有聊天那套用（[GiftSheetStyle.chat]）：私聊页面拿它往消息流里插一张礼物卡。
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

/// 礼物弹层的差异表。
///
/// | 项 | 聊天 | 资料页 |
/// | --- | --- | --- |
/// | [accent] | `accentLime` `#00F875` | `accentNeon` `#1CFF8A` |
/// | [popsWithResult] | true（回传 [GiftSendResult]，页面插一张礼物卡） | false（关一下弹层 + 一句 toast） |
/// | [ellipsisWhileLoading] | true（余额位先显示 `…`） | false（先显示 `0`） |
/// | [dimSendWhenBusy] | true（送出中 / 无礼物时按钮压到 50%） | false（始终实色） |
class GiftSheetStyle {
  const GiftSheetStyle({
    required this.accent,
    required this.popsWithResult,
    required this.ellipsisWhileLoading,
    required this.dimSendWhenBusy,
  });

  final Color accent;
  final bool popsWithResult;
  final bool ellipsisWhileLoading;
  final bool dimSendWhenBusy;

  static const GiftSheetStyle chat = GiftSheetStyle(
    accent: AppColors.accentLime,
    popsWithResult: true,
    ellipsisWhileLoading: true,
    dimSendWhenBusy: true,
  );

  static const GiftSheetStyle profile = GiftSheetStyle(
    accent: AppColors.accentNeon,
    popsWithResult: false,
    ellipsisWhileLoading: false,
    dimSendWhenBusy: false,
  );
}

/// 资料 / 浮层礼物弹层 — 与聊天礼物弹层共用 `/cash/item` 目录。
Future<void> showGiftBottomSheet(BuildContext context, {required String receiverUid}) {
  return AppBottomSheet.show<void>(
    isScrollControlled: true,
    child: GiftSheet(style: GiftSheetStyle.profile, receiverUid: receiverUid),
  );
}

/// 礼物弹层：礼物目录 + 余额 + 数量 + 送出。
class GiftSheet extends StatefulWidget {
  const GiftSheet({super.key, required this.style, this.receiverUid = ''});

  final GiftSheetStyle style;
  final String receiverUid;

  @override
  State<GiftSheet> createState() => _GiftSheetState();
}

class _GiftSheetState extends State<GiftSheet> {
  static const _darkBg = AppColors.surfaceElevated;

  late final String _tag;
  late final GiftSheetLogic logic;

  int get _balance => logic.balance.value;
  bool get _loading => logic.loading.value;
  bool get _sending => logic.sending.value;
  String? get _loadError => logic.loadError.value;
  List<ItemInfo> get _gifts => logic.gifts;
  int get _selected => logic.selected.value;
  int get _qty => logic.qty.value;

  Color get _green => widget.style.accent;

  @override
  void initState() {
    super.initState();
    _tag = 'gift-$hashCode';
    logic = Get.put(GiftSheetLogic(), tag: _tag);
  }

  @override
  void dispose() {
    Get.delete<GiftSheetLogic>(tag: _tag);
    super.dispose();
  }

  Future<void> _load() => logic.load();

  void _showQtyPicker() {
    final box = context.findRenderObject()! as RenderBox;
    final overlay = Overlay.of(context).context.findRenderObject()! as RenderBox;
    final btnOffset = box.localToGlobal(Offset.zero, ancestor: overlay);

    showMenu<int>(
      context: context,
      color: AppColors.surfaceSection,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      position: RelativeRect.fromLTRB(
        btnOffset.dx + box.size.width - 180,
        btnOffset.dy + box.size.height - 330,
        btnOffset.dx + box.size.width - 60,
        0,
      ),
      items: GiftSheetLogic.qtyOptions
          .map(
            (q) => PopupMenuItem<int>(
              value: q,
              child: Center(
                child: Text(
                  '$q',
                  style: TextStyle(
                    color: q == _qty ? _green : Colors.white,
                    fontSize: 16,
                    fontWeight: q == _qty ? FontWeight.w900 : FontWeight.w600,
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

  Future<void> _sendSelected() async {
    if (_sending || _gifts.isEmpty) return;
    final item = _gifts[_selected.clamp(0, _gifts.length - 1)];
    final total = item.price.toInt() * _qty;
    if (_balance < total) {
      AppToast.info('Insufficient balance.');
      return;
    }

    final uid = widget.receiverUid.trim();
    if (uid.isEmpty) {
      AppToast.info('Invalid receiver.');
      return;
    }

    final sent = await logic.send(uid);
    if (!mounted) return;
    if (!sent.ok) {
      AppToast.info(sent.error ?? 'Gift failed');
      return;
    }

    if (widget.style.popsWithResult) {
      AppJumper.back(
        result: GiftSendResult(
          id: item.id.toInt(),
          name: item.name,
          qty: _qty,
          iconUrl: item.icon,
          cost: item.price.toInt(),
          emoji: '',
        ),
      );
    } else {
      AppJumper.back();
      AppToast.info('Sent ${item.name} ×$_qty');
    }
  }

  Widget _giftIcon(ItemInfo g) {
    if (g.icon.isNotEmpty) {
      return AppImage(
        g.icon,
        width: 40,
        height: 40,
        fit: BoxFit.contain,
        error: const Text('🎁', style: TextStyle(fontSize: 28)),
      );
    }
    return const Text('🎁', style: TextStyle(fontSize: 28));
  }

  @override
  Widget build(BuildContext context) {
    final bottom = MediaQuery.paddingOf(context).bottom;

    return Obx(
      () => Container(
        padding: EdgeInsets.only(bottom: bottom),
        decoration: const BoxDecoration(
          color: _darkBg,
          borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
        ),
        child: SafeArea(
          top: false,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(16, 18, 16, 12),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Gift',
                  style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w800),
                ),
                const SizedBox(height: 14),
                SizedBox(height: 300, child: _catalog()),
                const SizedBox(height: 10),
                Row(
                  children: [
                    AppImage(AppAssets.coin, width: 16, height: 16),
                    const SizedBox(width: 6),
                    Text(
                      _loading && widget.style.ellipsisWhileLoading ? '…' : '$_balance',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    const SizedBox(width: 12),
                    GestureDetector(
                      onTap: () {
                        AppJumper.toWallet();
                      },
                      child: Container(
                        height: 28,
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        decoration: BoxDecoration(
                          color: AppColors.chipGreenMuted,
                          borderRadius: BorderRadius.circular(14),
                        ),
                        alignment: Alignment.center,
                        child: Text(
                          'Top-Up >',
                          style: TextStyle(
                            color: _green,
                            fontSize: 13,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                      ),
                    ),
                    const Spacer(),
                    GestureDetector(
                      onTap: _gifts.isEmpty ? null : _showQtyPicker,
                      child: Container(
                        height: 40,
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(color: _green, width: 1.5),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              '$_qty',
                              style: TextStyle(
                                color: _green,
                                fontSize: 15,
                                fontWeight: FontWeight.w900,
                              ),
                            ),
                            const SizedBox(width: 4),
                            Icon(Icons.arrow_drop_down, color: _green, size: 18),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    GestureDetector(
                      onTap: (_sending || _gifts.isEmpty) ? null : () => unawaited(_sendSelected()),
                      child: Container(
                        height: 40,
                        padding: const EdgeInsets.symmetric(horizontal: 28),
                        decoration: BoxDecoration(
                          color: widget.style.dimSendWhenBusy && (_sending || _gifts.isEmpty)
                              ? _green.withValues(alpha: 0.5)
                              : _green,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        alignment: Alignment.center,
                        child: _sending
                            ? const SizedBox(
                                width: 18,
                                height: 18,
                                child: CircularProgressIndicator(
                                  strokeWidth: 2,
                                  color: Colors.black,
                                ),
                              )
                            : const Text(
                                'Gift',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w900,
                                ),
                              ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  /// 目录区：转圈 → 报错 + Retry → 空 → 4 列网格。
  Widget _catalog() {
    if (_loading) {
      return Center(
        child: SizedBox(
          width: 28,
          height: 28,
          child: CircularProgressIndicator(strokeWidth: 2.4, color: _green),
        ),
      );
    }
    if (_loadError != null) {
      return Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              _loadError!,
              textAlign: TextAlign.center,
              style: const TextStyle(color: Colors.white70, fontSize: 13),
            ),
            const SizedBox(height: 12),
            TextButton(onPressed: () => unawaited(_load()), child: const Text('Retry')),
          ],
        ),
      );
    }
    if (_gifts.isEmpty) {
      return const Center(
        child: Text('No gifts available', style: TextStyle(color: Colors.white70, fontSize: 14)),
      );
    }

    // 选中下标必须在 Obx 同步路径里读；放进 itemBuilder 时 GetX 已结束订阅。
    final selectedIndex = _selected;
    return GridView.builder(
      padding: EdgeInsets.zero,
      itemCount: _gifts.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
        mainAxisSpacing: 14,
        crossAxisSpacing: 10,
        childAspectRatio: 0.72,
      ),
      itemBuilder: (context, index) {
        final gift = _gifts[index];
        final selected = index == selectedIndex;
        return GestureDetector(
          onTap: () => logic.select(index),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Expanded(
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: AppColors.surfaceSection,
                    borderRadius: BorderRadius.circular(16),
                    border: selected ? Border.all(color: _green, width: 2) : null,
                  ),
                  alignment: Alignment.center,
                  child: _giftIcon(gift),
                ),
              ),
              const SizedBox(height: 6),
              Text(
                gift.name,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 2),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  AppImage(AppAssets.coin, width: 12, height: 12),
                  const SizedBox(width: 3),
                  Text(
                    '${gift.price}',
                    style: const TextStyle(
                      color: Colors.white70,
                      fontSize: 11,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
