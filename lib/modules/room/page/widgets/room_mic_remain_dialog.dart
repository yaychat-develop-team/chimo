import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../app/app_jumper.dart';
import '../../../../common/constants/app_assets.dart';
import '../../../../common/theme/app_colors.dart';
import 'package:chimo/common/utils/chimo.dart';

/// 麦上剩余时长不足弹窗。对齐 Cosmic Lounge 设计稿：
/// 背景 [AppAssets.roomOnMicDialogBg]，顶部 [AppAssets.roomOnMicClock] 压在卡片上沿。
Future<bool?> showRoomMicRemainDialog() {
  return Get.dialog<bool>(
    const RoomMicRemainDialog(),
    barrierDismissible: true,
    barrierColor: AppColors.black.withValues(alpha: 0.55),
  );
}

class RoomMicRemainDialog extends StatelessWidget {
  const RoomMicRemainDialog({super.key});

  /// 设计稿底图 280×375；图标大约压住上沿一半。
  static const _iconSize = 128.0;
  static const _iconHang = 64.0;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: AppColors.transparent,
      elevation: 0,
      insetPadding: const EdgeInsets.symmetric(horizontal: 40),
      child: Container(
        constraints: BoxConstraints(maxWidth: 280.w),
        child: Stack(
          clipBehavior: Clip.none,
          alignment: Alignment.topCenter,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: _iconHang),
              child: DecoratedBox(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(28),
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.black.withValues(alpha: 0.28),
                      blurRadius: 28,
                      offset: const Offset(0, 10),
                    ),
                  ],
                  image: const DecorationImage(
                    image: AssetImage(AppAssets.roomOnMicDialogBg),
                    fit: BoxFit.fill,
                  ),
                ),
                child: Padding(
                  // 顶部留给压边图标：图标底约在卡片内 64，再留 8 到标题。
                  padding: EdgeInsets.only(top: 62.w, left: 22.w, right: 22.w, bottom: 22.w),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Mic Time Running Low',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: AppColors.black,
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w800,
                          height: 1,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        'Send gifts in this room to extend your mic time.',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: AppColors.gray6E6E6E,
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w400,
                          height: 1,
                        ),
                      ),
                      const SizedBox(height: 14),
                      _coinRateChip(),
                      const SizedBox(height: 14),
                      Text.rich(
                        TextSpan(
                          style: TextStyle(
                            color: AppColors.gray6E6E6E,
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w400,
                            height: 1,
                          ),
                          children: [
                            TextSpan(text: 'You can also send a '),
                            TextSpan(
                              text: 'Room VIP\nCard',
                              style: TextStyle(
                                color: AppColors.black1F2518,
                                fontSize: 15.sp,
                                fontWeight: FontWeight.w900,
                              ),
                            ),
                            TextSpan(text: ' to enjoy unlimited mic time in this room for 7 days.'),
                          ],
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 16.w),
                      _sendButton(),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              top: 0,
              child: Chimo.image(
                AppAssets.roomOnMicClock,
                width: _iconSize,
                height: _iconSize,
                fit: BoxFit.contain,
              ),
            ),
            Positioned(
              right: 0,
              top: 60.w,
              child: IconButton(
                onPressed: () => AppJumper.back(result: false),
                iconSize: 24.w,
                icon: Icon(Icons.close_rounded, color: AppColors.rgba(134, 128, 146, 0.5)),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _coinRateChip() {
    return Container(
      height: 48.w,
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: AppColors.rgba(245, 245, 245, 1),
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Chimo.image(AppAssets.coin, width: 18, height: 18),
          SizedBox(width: 6),
          Text(
            '60 Coins = 1 minute',
            style: TextStyle(
              color: AppColors.rgba(253, 113, 0, 1),
              fontSize: 16.sp,
              fontWeight: FontWeight.w700,
              height: 1.2,
            ),
          ),
        ],
      ),
    );
  }

  Widget _sendButton() {
    return InkWell(
      onTap: () => AppJumper.back(result: true),
      borderRadius: BorderRadius.circular(12.r),
      child: Container(
        height: 48.w,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24.r),
          gradient: LinearGradient(
            colors: [AppColors.green00F875, AppColors.green00FEA8],
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
          ),
        ),
        child: Center(
          child: Text(
            'Send Gift',
            style: TextStyle(
              color: AppColors.black1F2518,
              fontSize: 16.sp,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ),
    );
  }
}
