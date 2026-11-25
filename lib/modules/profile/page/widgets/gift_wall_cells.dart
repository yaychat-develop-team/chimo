import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../common/constants/app_assets.dart';
import '../../../../common/models/server_client/gift_wall.pb.dart';
import '../../../../common/models/server_client/user.pb.dart';
import '../../../../common/theme/app_colors.dart';
import '../../../../common/utils/cache_util.dart';
import '../../../../common/utils/chimo.dart';

enum GiftWallCellMode { wall, showcase, vault }

/// 礼物墙格子。对齐 oumi `GiftWallItemPage`。
class GiftWallGiftCell extends StatelessWidget {
  const GiftWallGiftCell({
    super.key,
    required this.item,
    required this.mode,
    required this.mine,
    this.onSend,
    this.onToggle,
  });

  final GiftItem item;
  final GiftWallCellMode mode;
  final bool mine;
  final VoidCallback? onSend;
  final VoidCallback? onToggle;

  @override
  Widget build(BuildContext context) {
    final lighten = item.isHighlight;
    final showGray = mode == GiftWallCellMode.wall && !lighten;
    final level = item.level.clamp(1, 3);
    final bg = showGray ? AppAssets.giftWallItemBgGray : AppAssets.giftWallItemBg(level);
    final now = DateTime.now().millisecondsSinceEpoch;
    final limitSend = item.isTimeLimited &&
        (now > item.limitTimeEnd.toInt() || now < item.limitTimeStart.toInt());
    final compactTop = mode != GiftWallCellMode.wall || (mine && showGray);
    final topMargin = compactTop ? 28.w : 23.w;
    final nameTop = compactTop ? 109.w : 95.w;

    return SizedBox(
      width: 112.w,
      height: 162.w,
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          Chimo.image(bg, width: 112.w, height: 162.w, fit: BoxFit.fill),
          Positioned(
            top: topMargin,
            child: showGray
                ? ColorFiltered(
                    colorFilter: const ColorFilter.matrix(<double>[
                      0.2126, 0.7152, 0.0722, 0, 0,
                      0.2126, 0.7152, 0.0722, 0, 0,
                      0.2126, 0.7152, 0.0722, 0, 0,
                      0, 0, 0, 1, 0,
                    ]),
                    child: Chimo.image(item.icon, width: 64.w, height: 64.w, fit: BoxFit.contain),
                  )
                : Chimo.image(item.icon, width: 64.w, height: 64.w, fit: BoxFit.contain),
          ),
          if (!showGray && item.senderHeadImg.trim().isNotEmpty)
            Positioned(
              top: topMargin + 46.w,
              right: 20.w,
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: AppColors.white, width: 0.5.w),
                ),
                child: Chimo.image(
                  item.senderHeadImg,
                  width: 18.w,
                  height: 18.w,
                  circle: true,
                  fallbackAsset: AppAssets.avatarPlace,
                ),
              ),
            ),
          Positioned(
            top: nameTop,
            left: 4.w,
            right: 4.w,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  item.name,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                  style: TextStyle(color: AppColors.white, fontSize: 9.sp, fontWeight: FontWeight.w400),
                ),
                if (lighten && mode == GiftWallCellMode.wall)
                  Padding(
                    padding: EdgeInsets.only(top: 1.w, bottom: 2.w),
                    child: Text(
                      '×${item.receiveCount}',
                      style: TextStyle(color: AppColors.white50, fontSize: 10.sp),
                    ),
                  ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Chimo.image(AppAssets.coin, width: 10.w, height: 10.w),
                    SizedBox(width: 3.w),
                    Text(
                      '${item.price}',
                      style: TextStyle(color: AppColors.yellowFFC83D, fontSize: 10.sp),
                    ),
                  ],
                ),
                if (!mine &&
                    !lighten &&
                    mode == GiftWallCellMode.wall &&
                    !limitSend &&
                    onSend != null)
                  Padding(
                    padding: EdgeInsets.only(top: 2.w),
                    child: GestureDetector(
                      onTap: onSend,
                      child: Container(
                        width: 78.w,
                        height: 16.w,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(9.w),
                          border: Border.all(color: AppColors.white, width: 0.6.w),
                        ),
                        child: Text(
                          'Send Gift',
                          style: TextStyle(
                            color: AppColors.white,
                            fontSize: 9.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ),
          if (mode == GiftWallCellMode.wall && item.isTimeLimited)
            Positioned(
              top: 22.w,
              right: 0,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 3.w),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(3.w),
                  gradient: const LinearGradient(
                    colors: [Color(0xFFFF8E15), Color(0xFFFF201D)],
                  ),
                ),
                child: Text(
                  'Limited',
                  style: TextStyle(color: AppColors.white, fontSize: 9.sp, fontWeight: FontWeight.w500),
                ),
              ),
            ),
          if (mode != GiftWallCellMode.wall && onToggle != null)
            Positioned(
              top: 7.w,
              right: 0,
              child: GestureDetector(
                onTap: onToggle,
                child: Chimo.image(
                  mode == GiftWallCellMode.showcase ? AppAssets.giftWallReduce : AppAssets.giftWallAdd,
                  width: 20.w,
                  height: 20.w,
                ),
              ),
            ),
        ],
      ),
    );
  }
}

/// 卡片格子。对齐 oumi `GiftWallCardPage`。
class GiftWallCardCell extends StatelessWidget {
  const GiftWallCardCell({super.key, required this.item, required this.onTap});

  final CardInfo item;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final unlock = item.canActive;
    final level = item.level.clamp(1, 3);
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        width: 166.w,
        height: 312.w,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Container(
              width: 158.w,
              height: 278.w,
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                color: AppColors.purple14102B,
                borderRadius: BorderRadius.circular(12.w),
              ),
              child: Stack(
                alignment: Alignment.topCenter,
                children: [
                  Opacity(
                    opacity: unlock ? 1 : 0.3,
                    child: Chimo.image(
                      item.icon,
                      width: 158.w,
                      height: 220.w,
                      fit: BoxFit.cover,
                      fallbackAsset: AppAssets.avatarPlace,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 212.w),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Chimo.image(
                          AppAssets.giftWallCardLevelTag(level),
                          width: 73.w,
                          height: 14.w,
                        ),
                        SizedBox(height: 2.w),
                        Text(
                          item.name,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            color: AppColors.white,
                            fontSize: 13.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(height: 1.w),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              '${item.gainedNum}/${item.totalCollectionNum}',
                              style: TextStyle(color: AppColors.white, fontSize: 11.sp),
                            ),
                            if (unlock)
                              Padding(
                                padding: EdgeInsets.only(left: 2.w),
                                child: Text(
                                  'Ready',
                                  style: TextStyle(
                                    color: AppColors.white50,
                                    fontSize: 9.sp,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Chimo.image(
              AppAssets.giftWallCardItemBg,
              width: 166.w,
              height: 312.w,
              fit: BoxFit.cover,
            ),
          ],
        ),
      ),
    );
  }
}

/// 卡片大图框。对齐 oumi `GWCardInfo`。
class GiftWallCardFrame extends StatelessWidget {
  const GiftWallCardFrame({super.key, required this.url, required this.width});

  final String url;
  final double width;

  @override
  Widget build(BuildContext context) {
    final scale = width / 310.w;
    // 边框图比内容区高，用固定外框避免 Stack 被撑到 508.w 挤垮下方列表。
    return SizedBox(
      width: 310.w * scale,
      height: 442.w * scale,
      child: Stack(
        alignment: Alignment.center,
        clipBehavior: Clip.none,
        children: [
          Container(
            width: 296.w * scale,
            height: 442.w * scale,
            decoration: BoxDecoration(
              color: AppColors.purple14102B,
              borderRadius: BorderRadius.circular(12.w),
            ),
          ),
          Chimo.image(url, width: 296.w * scale, height: 412.w * scale, fit: BoxFit.cover),
          Chimo.image(
            AppAssets.giftWallCardDetailBorder,
            width: 310.w * scale,
            height: 508.w * scale,
            fit: BoxFit.fill,
          ),
        ],
      ),
    );
  }
}

String giftWallCardEffectCacheKey(int cardId) => 'gift_card_effect_shown_$cardId';

bool giftWallCardEffectShouldShow(int cardId) {
  final key = giftWallCardEffectCacheKey(cardId);
  if (CacheUtil.getBool(key)) return false;
  CacheUtil.setBool(key, true);
  return true;
}

/// 可激活卡片弹窗。对齐 oumi `GWCardUnlockDialog`。
Future<void> showGiftWallCardUnlockDialog(
  CardInfo info, {
  required Future<void> Function() onActive,
}) {
  return Get.dialog(
    Dialog(
      backgroundColor: AppColors.black.withValues(alpha: 0.7),
      insetPadding: EdgeInsets.zero,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Chimo.image(AppAssets.giftWallCardSuccessBg, width: 375.w, height: 500.w),
          Positioned(
            top: 66.w,
            right: 60.w,
            child: Chimo.image(AppAssets.giftWallCardSuccessTips),
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(height: 16.w),
              Text(
                'Congratulations!',
                style: TextStyle(
                  color: AppColors.white,
                  fontSize: 24.sp,
                  fontWeight: FontWeight.w800,
                  fontStyle: FontStyle.italic,
                ),
              ),
              SizedBox(height: 4.w),
              Text(
                'You unlocked ${info.name}',
                style: TextStyle(
                  color: AppColors.white,
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w800,
                  fontStyle: FontStyle.italic,
                ),
              ),
              GiftWallCardFrame(url: info.icon, width: 220.w),
              SizedBox(height: 10.w),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 45.w),
                child: Text(
                  'Activate ${info.name} to show it on your profile',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: AppColors.white, fontSize: 13.sp),
                ),
              ),
              SizedBox(height: 24.w),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: Get.back,
                    child: Container(
                      width: 148.w,
                      height: 48.w,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        border: Border.all(color: AppColors.white, width: 1.w),
                        borderRadius: BorderRadius.circular(24.w),
                      ),
                      child: Text(
                        'Later',
                        style: TextStyle(
                          color: AppColors.white,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 16.w),
                  GestureDetector(
                    onTap: () async {
                      Get.back();
                      await onActive();
                    },
                    child: Container(
                      width: 148.w,
                      height: 48.w,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(24.w),
                        gradient: AppColors.primaryGradient,
                      ),
                      child: Text(
                        'Activate',
                        style: TextStyle(
                          color: AppColors.black1F2518,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    ),
    barrierDismissible: true,
    useSafeArea: false,
  );
}
