import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../common/constants/app_assets.dart';
import '../../../common/models/server_client/gift_wall.pb.dart';
import '../../../common/theme/app_colors.dart';
import '../../../common/utils/chimo.dart';
import '../../../common/utils/text_fmt.dart';
import '../../../common/widgets/app_scaffold.dart';
import '../logic/gift_wall_logic.dart';
import 'widgets/gift_wall_cells.dart';

/// 卡片详情。对齐 oumi `GWCardInfoPage`。
class GiftWallCardDetailPage extends StatelessWidget {
  const GiftWallCardDetailPage({
    super.key,
    required this.targetId,
    required this.cardId,
  });

  final int targetId;
  final int cardId;

  @override
  Widget build(BuildContext context) {
    final logic = GiftWallLogic.put(targetId);
    return Obx(() {
      final item = logic.detail.value?.cardList.firstWhereOrNull((e) => e.id.toInt() == cardId);
      final unlock = item?.canActive ?? false;
      final tips = unlock
          ? 'Gift collection complete! Go to your profile to\n show it off!'
          : item == null
              ? ''
              : '${item.gainedNum}/${item.totalCollectionNum} gifts collected—'
                  '${item.totalCollectionNum.toInt() - item.gainedNum.toInt()} more to unlock\n the Sigil';
      // 背景放 body 内：AppScaffold.backdrop 只有 top/left/right，
      // 里头再套 SizedBox.expand 会高度无界，整页空白。
      return AppScaffold(
        extendBody: true,
        backgroundColor: AppColors.purple14102B,
        appBar: AppNavBar(title: item?.name ?? '', foregroundColor: AppColors.white),
        body: Stack(
          fit: StackFit.expand,
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: Chimo.image(
                AppAssets.giftWallCardDetailBg,
                width: MediaQuery.sizeOf(context).width,
                fit: BoxFit.fitWidth,
              ),
            ),
            if (logic.loading.value && item == null)
              const Center(child: CircularProgressIndicator(color: AppColors.green29EEAA))
            else if (item == null)
              Center(
                child: GestureDetector(
                  onTap: logic.load,
                  child: Text(
                    logic.error.value.isEmpty ? 'Card not found' : logic.error.value,
                    style: const TextStyle(color: AppColors.white60),
                  ),
                ),
              )
            else
              Column(
                children: [
                  SizedBox(height: MediaQuery.paddingOf(context).top + 55.w),
                  GestureDetector(
                    onTap: () => Get.to(() => GiftWallCardCheckPage(item: item)),
                    child: GiftWallCardFrame(url: item.icon, width: 168.w),
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        '${item.gainedNum}/${item.totalCollectionNum}',
                        style: TextStyle(color: AppColors.white, fontSize: 13.sp),
                      ),
                      if (unlock)
                        Container(
                          margin: EdgeInsets.only(left: 4.w),
                          padding: EdgeInsets.symmetric(horizontal: 3.w),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(3.w),
                            gradient: AppColors.primaryGradient,
                          ),
                          child: Text(
                            'Ready',
                            style: TextStyle(
                              color: AppColors.black1F2518,
                              fontSize: 9.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                    ],
                  ),
                  SizedBox(height: 6.w),
                  Text(
                    tips,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: AppColors.white,
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(height: 24.w),
                  Container(
                    width: double.infinity,
                    height: 30.w,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(AppAssets.giftWallCardTipsBg),
                        fit: BoxFit.fill,
                      ),
                    ),
                    child: Text.rich(
                      TextSpan(
                        style: TextStyle(
                          color: AppColors.white,
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w500,
                        ),
                        children: [
                          const TextSpan(text: 'Collect to earn '),
                          TextSpan(
                            text: '${item.gainExp}XP',
                            style: const TextStyle(color: Color(0xFFFFE24B)),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: item.giftList.isEmpty
                        ? Center(
                            child: Chimo.image(
                              AppAssets.giftWallEmpty,
                              width: 160.w,
                              height: 160.w,
                            ),
                          )
                        : GridView.builder(
                            padding: EdgeInsets.fromLTRB(10.w, 12.w, 10.w, 20.w),
                            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 3,
                              mainAxisSpacing: 3.w,
                              crossAxisSpacing: 10.w,
                              childAspectRatio: 112 / 162,
                            ),
                            itemCount: item.giftList.length,
                            itemBuilder: (_, i) {
                              final gift = item.giftList[i];
                              return GiftWallGiftCell(
                                item: gift,
                                mode: GiftWallCellMode.wall,
                                mine: logic.isMe,
                                onSend: () => logic.sendGift(
                                  giftPrice: gift.price.toInt(),
                                  giftId: gift.id.toInt(),
                                ),
                              );
                            },
                          ),
                  ),
                ],
              ),
          ],
        ),
      );
    });
  }
}

/// 卡片全屏预览。对齐 oumi `GWCardCheckPage`。
class GiftWallCardCheckPage extends StatelessWidget {
  const GiftWallCardCheckPage({super.key, required this.item});

  final CardInfo item;

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      extendBody: true,
      backgroundColor: AppColors.transparent,
      appBar: AppNavBar(title: item.name, foregroundColor: AppColors.white),
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(AppAssets.giftWallCardBigBg),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            SizedBox(height: MediaQuery.paddingOf(context).top + 67.w),
            Container(
              width: 267.w,
              height: 30.w,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(AppAssets.giftWallCardTipsBg),
                  fit: BoxFit.fill,
                ),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Total Card Value:',
                    style: TextStyle(
                      color: AppColors.white,
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(width: 3.w),
                  Chimo.image(AppAssets.coin, width: 14.w, height: 14.w),
                  SizedBox(width: 3.w),
                  Text(
                    TextFmt.compact(item.gainExp.toInt()),
                    style: TextStyle(
                      color: const Color(0xFFFFE24B),
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 28.w),
            GiftWallCardFrame(url: item.icon, width: 296.w),
            SizedBox(height: 16.w),
            Text(
              'Gifts Collected: ${item.gainedNum}/${item.totalCollectionNum}',
              style: TextStyle(
                color: AppColors.white,
                fontSize: 13.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
