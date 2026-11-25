import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../app/app_jumper.dart';
import '../../../../../app/chimo_api.dart';
import '../../../../../common/constants/app_assets.dart';
import '../../../../../common/theme/app_colors.dart';
import '../../../../../common/utils/app_toast.dart';
import '../../../../../common/utils/chimo.dart';
import '../../../model/mic_seat.dart';
import '../logic/heart_link_logic.dart';

/// Heart Link 牵手送礼确认。对齐 oumi `HtSendGiftDialog`。
abstract final class HeartLinkSendGiftSheet {
  static Future<void> show(MicSeat gs) async {
    if (!Get.isRegistered<HeartLinkLogic>()) return;
    final ht = Get.find<HeartLinkLogic>();
    final info = ht.roomHtInfo;
    if (info == null || info.itemId.toInt() <= 0) {
      AppToast.info('Gift not ready');
      return;
    }
    await Get.dialog(
      _GiftDialog(gs: gs, ht: ht),
      barrierDismissible: false,
    );
  }
}

class _GiftDialog extends StatefulWidget {
  const _GiftDialog({required this.gs, required this.ht});

  final MicSeat gs;
  final HeartLinkLogic ht;

  @override
  State<_GiftDialog> createState() => _GiftDialogState();
}

class _GiftDialogState extends State<_GiftDialog> {
  var _sending = false;

  /// 对齐 oumi `JR.color.brandGradient`。
  static const _brand = LinearGradient(
    colors: [Color(0xFF4843FE), Color(0xFFFF4BA7)],
  );

  Future<void> _send() async {
    if (_sending) return;
    final info = widget.ht.roomHtInfo;
    final uid = widget.gs.uid ?? 0;
    if (info == null || uid <= 0) return;
    setState(() => _sending = true);
    final cash = await ChimoApis.cash.balance();
    if (!mounted) return;
    if (!(cash.ok) || cash.data == null) {
      setState(() => _sending = false);
      AppToast.error(cash.message.isEmpty ? 'Failed' : cash.message);
      return;
    }
    final price = info.itemPrice.toInt();
    final coin = cash.data!.coin.toInt();
    if (coin < price) {
      setState(() => _sending = false);
      Get.back();
      await AppJumper.showRechargeSheet(price: price, diffCoin: price - coin);
      return;
    }
    final result = await ChimoApis.cash.sendGift(
      receiverIds: ['$uid'],
      itemId: '${info.itemId}',
      count: 1,
      channelId: '${widget.ht.rid}',
    );
    if (!mounted) return;
    setState(() => _sending = false);
    if (!result.ok) {
      AppToast.error(result.message.isEmpty ? 'Send failed' : result.message);
      return;
    }
    Get.back();
    AppToast.success('Sent.');
  }

  Widget _gradientText(String text, TextStyle style) {
    return ShaderMask(
      blendMode: BlendMode.srcIn,
      shaderCallback: (rect) => _brand.createShader(rect),
      child: Text(text, style: style.copyWith(color: AppColors.white)),
    );
  }

  @override
  Widget build(BuildContext context) {
    final info = widget.ht.roomHtInfo!;
    final name = widget.gs.name.trim().isEmpty ? 'partner' : widget.gs.name;
    return Dialog(
      backgroundColor: AppColors.transparent,
      insetPadding: EdgeInsets.zero,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 280,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(24),
              image: DecorationImage(
                image: AssetImage(AppAssets.htSendGiftBg),
                alignment: Alignment.topCenter,
                fit: BoxFit.fitWidth,
              ),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(height: 4),
                const Text(
                  'Send Your Heartie Token',
                  style: TextStyle(
                    color: AppColors.black1F2518,
                    fontSize: 16,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                const SizedBox(height: 6),
                Text.rich(
                  TextSpan(
                    style: const TextStyle(
                      color: AppColors.gray9A9A9A,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      height: 1.35,
                    ),
                    children: [
                      const TextSpan(
                        text: 'Send the Heartie Token to\n unlock a special connection and\n form your Heartie relation with\n ',
                      ),
                      WidgetSpan(
                        alignment: PlaceholderAlignment.baseline,
                        baseline: TextBaseline.alphabetic,
                        child: _gradientText(
                          name,
                          const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                        ),
                      ),
                      const TextSpan(text: ' now!'),
                    ],
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 6),
                Chimo.image(
                  info.itemIcon,
                  width: 120,
                  height: 120,
                  fit: BoxFit.contain,
                  fallbackAsset: AppAssets.avatarPlace,
                ),
                const SizedBox(height: 2),
                _gradientText(
                  info.itemName,
                  const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                ),
                const SizedBox(height: 2),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Chimo.image(AppAssets.coin, width: 16, height: 16),
                    const SizedBox(width: 4),
                    Text(
                      '${info.itemPrice} Coins',
                      style: const TextStyle(
                        color: AppColors.gray9A9A9A,
                        fontSize: 10,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                GestureDetector(
                  onTap: _sending ? null : _send,
                  child: Opacity(
                    opacity: _sending ? 0.6 : 1,
                    child: Container(
                      width: double.infinity,
                      height: 44,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(22),
                        gradient: AppColors.primaryGradient,
                      ),
                      child: Text(
                        _sending ? 'Sending...' : 'Send now',
                        style: const TextStyle(
                          color: AppColors.black1F2518,
                          fontSize: 15,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),
          GestureDetector(
            onTap: () => Get.back(),
            child: Chimo.image(AppAssets.auctionCircleClose, width: 24, height: 24),
          ),
        ],
      ),
    );
  }
}
