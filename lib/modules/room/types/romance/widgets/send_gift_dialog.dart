import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../../app/chimo_api.dart';
import '../../../../../common/constants/app_assets.dart';
import '../../../../../common/models/server_client/couple.pb.dart';
import '../../../../../common/theme/app_colors.dart';
import '../../../../../common/utils/app_toast.dart';
import '../../../../../common/widgets/app_image.dart';

/// 送礼解锁 21 日挑战弹窗。对齐 joyride `SendGiftDialog`。
///
/// 返回 `true` 表示专属礼物已送出成功。
abstract final class RomanceSendGiftDialog {
  static Future<bool?> show(CoupleInfo coupleInfo) {
    return Get.dialog<bool>(
      RomanceSendGiftDialogBody(coupleInfo: coupleInfo),
      barrierColor: AppColors.black60,
    );
  }
}

class RomanceSendGiftDialogBody extends StatefulWidget {
  const RomanceSendGiftDialogBody({super.key, required this.coupleInfo});

  final CoupleInfo coupleInfo;

  @override
  State<RomanceSendGiftDialogBody> createState() => _RomanceSendGiftDialogBodyState();
}

class _RomanceSendGiftDialogBodyState extends State<RomanceSendGiftDialogBody> {
  var _sending = false;

  Future<void> _unlock() async {
    if (_sending) return;
    final info = widget.coupleInfo;
    final itemId = info.itemId.toString();
    final uid2 = info.uid2.toString();
    if (itemId.isEmpty || itemId == '0' || uid2.isEmpty || uid2 == '0') {
      AppToast.info('Gift unavailable');
      return;
    }
    setState(() => _sending = true);
    final res = await ChimoApis.cash.sendGift(receiverIds: [uid2], itemId: itemId, count: 1);
    if (!mounted) return;
    setState(() => _sending = false);
    if (res.ok) {
      Get.back(result: true);
    } else {
      AppToast.info(res.message.isEmpty ? 'Send failed' : res.message);
    }
  }

  @override
  Widget build(BuildContext context) {
    final info = widget.coupleInfo;
    return Center(
      child: Material(
        color: Colors.transparent,
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(height: 82.w),
                Container(
                  width: 300.w,
                  height: 350.w,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(AppAssets.romanceAlertBg),
                      fit: BoxFit.fill,
                    ),
                  ),
                  child: Column(
                    children: [
                      SizedBox(height: 58.w),
                      Text(
                        'Your Story Begins',
                        style: TextStyle(
                          color: const Color(0xFFFF007E),
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      SizedBox(height: 14.w),
                      Container(
                        width: 268.w,
                        height: 88.w,
                        padding: EdgeInsets.symmetric(horizontal: 18.w),
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(AppAssets.romanceRelationBg),
                            fit: BoxFit.fill,
                          ),
                        ),
                        child: Row(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(color: AppColors.white),
                              ),
                              child: AppImage.avatar(info.avatar1, size: 48.w),
                            ),
                            const Spacer(),
                            Container(
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(color: AppColors.white),
                              ),
                              child: AppImage.avatar(info.avatar2, size: 48.w),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 14.w),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16.w),
                        child: Text(
                          'Exchange ${info.itemName} to unlock the “21-Day Love Challenge” and earn sweet rewards together!',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: const Color(0xFFFF007E),
                            fontSize: 14.sp,
                            height: 1.35,
                          ),
                        ),
                      ),
                      const Spacer(),
                      GestureDetector(
                        onTap: _sending ? null : _unlock,
                        child: Container(
                          width: 240.w,
                          height: 48.w,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: const Color(0xFFFF007E),
                            borderRadius: BorderRadius.circular(24.w),
                          ),
                          child: _sending
                              ? SizedBox(
                                  width: 22.w,
                                  height: 22.w,
                                  child: const CircularProgressIndicator(
                                    strokeWidth: 2,
                                    color: AppColors.white,
                                  ),
                                )
                              : Text(
                                  'Unlock by Gifting',
                                  style: TextStyle(
                                    color: AppColors.white,
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                        ),
                      ),
                      SizedBox(height: 22.w),
                    ],
                  ),
                ),
                SizedBox(height: 24.w),
                GestureDetector(
                  onTap: () => Get.back(),
                  child: Icon(Icons.cancel, color: AppColors.white70, size: 28.w),
                ),
              ],
            ),
            Image.asset(AppAssets.romanceTitleBg, width: 257.w, fit: BoxFit.fitWidth),
          ],
        ),
      ),
    );
  }
}
