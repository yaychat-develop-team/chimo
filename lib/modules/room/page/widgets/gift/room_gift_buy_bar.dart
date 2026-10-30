import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../app/app_jumper.dart';
import '../../../../../common/constants/app_assets.dart';
import '../../../../../common/theme/app_colors.dart';
import 'package:chimo/common/utils/chimo.dart';

/// 礼物面板底栏：余额 + 充值 + 数量/Gift 胶囊。
class RoomGiftBuyBar extends StatelessWidget {
  const RoomGiftBuyBar({
    super.key,
    required this.bottomInset,
    required this.balance,
    required this.qty,
    required this.busy,
    required this.sending,
    required this.canSend,
    required this.onPickQty,
    required this.onSend,
  });

  final double bottomInset;
  final int balance;
  final int qty;
  final bool busy;
  final bool sending;
  final bool canSend;
  final VoidCallback onPickQty;
  final VoidCallback onSend;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(16, 8, 16, 12 + bottomInset),
      color: AppColors.black,
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
            onTap: AppJumper.toWallet,
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
          if (!canSend)
            const Text(
              'This item cannot be sent',
              style: TextStyle(color: AppColors.gray9A9A9A, fontSize: 12),
            )
          else
            _QtyGiftPill(
              qty: qty,
              busy: busy,
              sending: sending,
              onPickQty: onPickQty,
              onSend: onSend,
            ),
        ],
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
