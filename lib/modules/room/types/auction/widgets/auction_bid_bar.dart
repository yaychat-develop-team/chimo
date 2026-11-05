import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../../common/constants/app_assets.dart';
import '../../../../../common/theme/app_colors.dart';
import '../../../../../common/utils/chimo.dart';
import '../../../logic/mic_logic.dart';
import '../logic/auction_logic.dart';
import 'auction_bid_sheet.dart';

/// 底栏上方 Place Bid。对齐 joyride `bid_btn_bg.webp`。
class AuctionBidBar extends StatelessWidget {
  const AuctionBidBar({super.key});

  @override
  Widget build(BuildContext context) {
    if (!Get.isRegistered<AuctionLogic>()) return const SizedBox.shrink();
    final logic = Get.find<AuctionLogic>();
    return Obx(() {
      logic.info.value;
      logic.needShowMicTips.value;
      if (Get.isRegistered<MicLogic>()) {
        Get.find<MicLogic>().seats.toList();
      }
      final tip = logic.needShowMicTips.value;
      final bid = logic.showBidBtn;
      if (!tip && !bid) return const SizedBox.shrink();
      return Padding(
        padding: EdgeInsets.only(bottom: 8.w),
        child: Row(
          children: [
            if (tip)
              Padding(
                padding: EdgeInsets.only(left: 14.w),
                child: _micTip(logic),
              )
            else
              const Spacer(),
            if (bid) ...[const Spacer(), _placeBid(logic)],
          ],
        ),
      );
    });
  }

  Widget _micTip(AuctionLogic logic) {
    return GestureDetector(
      onTap: logic.dismissMicTips,
      child: Container(
        width: 138.w,
        height: 34.w,
        alignment: Alignment.center,
        padding: EdgeInsets.only(bottom: 4.w, left: 10.w, right: 8.w),
        decoration: const BoxDecoration(
          image: DecorationImage(image: AssetImage(AppAssets.auctionMicTipsBg), fit: BoxFit.fill),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Take the Stage',
              style: TextStyle(
                color: AppColors.white,
                fontSize: 12.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(width: 8.w),
            Chimo.image(AppAssets.auctionClose, width: 10.w, height: 10.w),
          ],
        ),
      ),
    );
  }

  Widget _placeBid(AuctionLogic logic) {
    return GestureDetector(
      onTap: () {
        final sid = logic.info.value.auctionSessionId.toInt();
        if (sid <= 0) return;
        AuctionBidSheet.show(sessionId: sid, artist: logic.seatAt(1));
      },
      child: Container(
        height: 42.w,
        width: 109.w,
        padding: EdgeInsets.only(left: 3.w, top: 3.w, bottom: 3.w),
        decoration: BoxDecoration(
          color: AppColors.white.withValues(alpha: 0.1),
          borderRadius: BorderRadius.horizontal(left: Radius.circular(21.w)),
        ),
        alignment: Alignment.centerLeft,
        child: Container(
          width: 90.w,
          height: 36.w,
          alignment: Alignment.center,
          decoration: const BoxDecoration(
            image: DecorationImage(image: AssetImage(AppAssets.auctionBidBtnBg), fit: BoxFit.fill),
          ),
          child: Text(
            'Raise Bid',
            style: TextStyle(color: AppColors.white, fontSize: 12.sp, fontWeight: FontWeight.w600),
          ),
        ),
      ),
    );
  }
}
