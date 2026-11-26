import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../app/app_jumper.dart';
import '../../../../../common/constants/app_assets.dart';
import '../../../../../common/theme/app_colors.dart';
import '../../../logic/room_gift_logic.dart';
import 'package:chimo/common/utils/chimo.dart';

/// 礼物面板底栏：余额 + 充值 + 按 [action] 切换 Gift / Unlock / Open / Apply。
class RoomGiftBuyBar extends StatelessWidget {
  const RoomGiftBuyBar({
    super.key,
    required this.bottomInset,
    required this.balance,
    required this.qty,
    required this.busy,
    required this.sending,
    required this.action,
    required this.unlockLabel,
    this.applyHint = '',
    required this.onPickQty,
    required this.onSend,
    required this.onUnlock,
    required this.onOpen,
    required this.onApply,
  });

  final double bottomInset;
  final int balance;
  final int qty;
  final bool busy;
  final bool sending;
  final RoomGiftBuyAction action;
  final String unlockLabel;
  final String applyHint;
  final VoidCallback onPickQty;
  final VoidCallback onSend;
  final VoidCallback onUnlock;
  final VoidCallback onOpen;
  final VoidCallback onApply;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(16, 8, 16, 12 + bottomInset),
      // 半透明渐变，让下方 Lucky tips 上沿仍可见（对齐 joyride buyPanel）。
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            AppColors.rgba(21, 21, 35, 0.55),
            AppColors.rgba(21, 21, 35, 1),
          ],
        ),
      ),
      child: Row(
        children: [
          Chimo.image(AppAssets.coin, width: 18, height: 18),
          const SizedBox(width: 6),
          Text(
            '$balance',
            style: TextStyle(color: AppColors.white, fontSize: 14.sp, fontWeight: FontWeight.w700),
          ),
          const SizedBox(width: 10),
          GestureDetector(
            onTap: () => AppJumper.showRechargeSheet(),
            child: Container(
              height: 28,
              padding: const EdgeInsets.symmetric(horizontal: 12),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: AppColors.green1A3A28,
                borderRadius: BorderRadius.circular(14),
              ),
              child: Text(
                'Top-Up >',
                style: TextStyle(
                  color: AppColors.green29EEAA,
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
          const Spacer(),
          _trailing(),
        ],
      ),
    );
  }

  Widget _trailing() {
    switch (action) {
      case RoomGiftBuyAction.blocked:
        return const Text(
          'This item cannot be sent',
          style: TextStyle(color: AppColors.gray9A9A9A, fontSize: 12),
        );
      case RoomGiftBuyAction.unlock:
        return GestureDetector(
          onTap: onUnlock,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
            decoration: const ShapeDecoration(
              shape: StadiumBorder(),
              gradient: LinearGradient(colors: [Color(0xFFF7D7B9), Color(0xFFE7B07E)]),
            ),
            child: Text(
              unlockLabel,
              style: TextStyle(
                color: const Color(0xFF3E2C1E),
                fontSize: 13.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        );
      case RoomGiftBuyAction.open:
        return _ActionButton(label: 'Open', onTap: onOpen, busy: sending);
      case RoomGiftBuyAction.apply:
        return Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (applyHint.isNotEmpty) ...[
              SizedBox(
                width: 120.w,
                child: Text(
                  applyHint,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(color: AppColors.white70, fontSize: 11.sp),
                ),
              ),
              SizedBox(width: 12.w),
            ],
            _ActionButton(label: 'Apply', onTap: onApply, busy: sending),
          ],
        );
      case RoomGiftBuyAction.send:
        return _QtyGiftPill(
          qty: qty,
          busy: busy,
          sending: sending,
          onPickQty: onPickQty,
          onSend: onSend,
        );
    }
  }
}

class _ActionButton extends StatelessWidget {
  const _ActionButton({required this.label, required this.onTap, required this.busy});

  final String label;
  final VoidCallback onTap;
  final bool busy;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: busy ? null : onTap,
      child: Container(
        height: 32.w,
        width: 72.w,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: LinearGradient(colors: [AppColors.green00FEA8, AppColors.green00F875]),
        ),
        child: busy
            ? const SizedBox(
                width: 18,
                height: 18,
                child: CircularProgressIndicator(strokeWidth: 2, color: AppColors.black),
              )
            : Text(
                label,
                style: TextStyle(
                  color: AppColors.black1F2518,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
      ),
    );
  }
}

/// 设计稿：数量 + Gift 合成一个胶囊（左白字数量，右实心 Gift）。
class _QtyGiftPill extends StatelessWidget {
  const _QtyGiftPill({
    required this.qty,
    required this.busy,
    required this.sending,
    required this.onPickQty,
    required this.onSend,
  });

  final int qty;
  final bool busy;
  final bool sending;
  final VoidCallback onPickQty;
  final VoidCallback onSend;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 32.w,
      width: 132.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppColors.green29EEAA, width: 1.5),
      ),
      clipBehavior: Clip.antiAlias,
      child: Row(
        children: [
          Expanded(
            child: GestureDetector(
              onTap: onPickQty,
              behavior: HitTestBehavior.opaque,
              child: Padding(
                padding: const EdgeInsets.only(left: 14, right: 4),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '$qty',
                      style: TextStyle(
                        color: AppColors.white,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const Icon(Icons.arrow_drop_down_rounded, color: AppColors.white, size: 20),
                  ],
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: busy ? null : onSend,
            child: Container(
              height: double.infinity,
              width: 60.w,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                gradient: LinearGradient(colors: [AppColors.green00FEA8, AppColors.green00F875]),
              ),
              child: sending
                  ? const SizedBox(
                      width: 18,
                      height: 18,
                      child: CircularProgressIndicator(strokeWidth: 2, color: AppColors.black),
                    )
                  : Text(
                      'Gift',
                      style: TextStyle(
                        color: AppColors.black1F2518,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
            ),
          ),
        ],
      ),
    );
  }
}
