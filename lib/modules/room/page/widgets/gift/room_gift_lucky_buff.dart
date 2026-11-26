import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../../app/app_jumper.dart';
import '../../../../../app/chimo_api.dart';
import '../../../../../common/constants/app_assets.dart';
import '../../../../../common/constants/app_links.dart';
import '../../../../../common/models/server_client/cash.pb.dart';
import '../../../../../common/models/server_client/commodity.pbenum.dart';
import '../../../../../common/theme/app_colors.dart';
import '../../../../../common/utils/app_log.dart';
import 'package:chimo/common/utils/chimo.dart';

/// Lucky 礼物顶部关联：头像框 / 麦位光圈 / 气泡 / 座驾。
/// 对齐 joyride `BoxLuckyBuffWidget`。
class RoomGiftLuckyBuff extends StatefulWidget {
  const RoomGiftLuckyBuff({super.key, required this.box});

  final ItemInfo box;

  @override
  State<RoomGiftLuckyBuff> createState() => _RoomGiftLuckyBuffState();
}

class _RoomGiftLuckyBuffState extends State<RoomGiftLuckyBuff> {
  static const _wearTypes = [
    CommodityType.AVATAR_FRAME,
    CommodityType.MIC_EFFECT,
    CommodityType.BUBBLE,
    CommodityType.CAR,
  ];

  LuckyBuffInfo? _info;
  int _lastRequestMs = 0;

  @override
  void initState() {
    super.initState();
    _load();
  }

  @override
  void didUpdateWidget(RoomGiftLuckyBuff oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.box.boxId != oldWidget.box.boxId) _load();
  }

  Future<void> _load() async {
    final now = DateTime.now().millisecondsSinceEpoch;
    if (_lastRequestMs > 0 && now - _lastRequestMs < 2000) return;
    _lastRequestMs = now;
    try {
      final res = await ChimoApis.cash.luckyBuff();
      if (!mounted) return;
      if (res.ok) setState(() => _info = res.data);
    } catch (error) {
      AppLog.w('LuckyBuff load failed', error: error);
    }
  }

  bool get _enabled => (_info?.enable ?? 0) == 1;

  BoxGiftInfo? get _boxInfo {
    final list = _info?.boxInfo;
    if (list == null) return null;
    for (final item in list) {
      if (item.id.toInt() == widget.box.boxId) return item;
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    if (_info == null) return const SizedBox.shrink();
    return Transform.translate(
      offset: Offset(0, 12.h),
      child: SizedBox(
        width: double.infinity,
        height: 100.h,
        child: Stack(
          clipBehavior: Clip.none,
          alignment: Alignment.topCenter,
          children: [
            Positioned.fill(
              child: Chimo.image(
                _enabled ? AppAssets.luckyBuffLuckyBg : AppAssets.luckyBuffBg,
                fit: BoxFit.fill,
              ),
            ),
            PositionedDirectional(
              start: 16.w,
              top: 8.h,
              child: SizedBox(
                height: 68.h,
                child: Row(
                  children: [
                    SizedBox(
                      width: 105.w,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(height: 18.h),
                          Chimo.image(
                            AppAssets.luckyBuffTitle,
                            width: 73.w,
                            height: 30.h,
                            fit: BoxFit.fill,
                          ),
                          Text(
                            _enabled
                                ? '${_boxInfo?.grandTimes ?? 0} chances for grand prize'
                                : 'Wear dress & car for Lucky Buff',
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              color: AppColors.white,
                              fontSize: 10.sp,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 8.w),
                    if (_enabled)
                      ..._bigGiftSlots()
                    else
                      for (final type in _wearTypes) _wearSlot(type),
                  ],
                ),
              ),
            ),
            // 对齐 joyride 左上角问号：打开 LuckyBuff 说明页。
            PositionedDirectional(
              start: 10.w,
              top: 16.h,
              child: GestureDetector(
                onTap: () {
                  AppJumper.toWeb(
                    url: AppLinks.luckyBuffHelp(payCurrency: widget.box.payCurrency),
                    title: 'Lucky Buff',
                  );
                },
                child: Chimo.image(AppAssets.luckyBuffHelp, width: 14.w, height: 14.w),
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> _bigGiftSlots() {
    final gifts = _boxInfo?.bigGifts ?? const [];
    return [
      for (final item in gifts)
        Stack(
          alignment: Alignment.topCenter,
          children: [
            SizedBox(height: 68.h),
            Padding(
              padding: EdgeInsets.only(top: 16.h),
              child: Container(
                width: 52.w,
                height: 52.w,
                alignment: Alignment.center,
                margin: EdgeInsets.symmetric(horizontal: 2.5.w),
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(AppAssets.luckyBuffLuckyBorder),
                    fit: BoxFit.fill,
                  ),
                ),
                child: Chimo.image(item.icon, width: 40.w, height: 40.w, fit: BoxFit.contain),
              ),
            ),
            if (item.prize > 0)
              SizedBox(
                height: 16.h,
                child: Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    Chimo.image(AppAssets.luckyBuffSj, width: 6.w, height: 6.w),
                    Container(
                      height: 14.h,
                      margin: EdgeInsets.only(bottom: 2.h),
                      padding: EdgeInsets.symmetric(horizontal: 6.w),
                      alignment: Alignment.center,
                      decoration: const ShapeDecoration(
                        shape: StadiumBorder(),
                        gradient: LinearGradient(
                          colors: [Color(0xFFFFFFB8), Color(0xFFFDD84F)],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        ),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Chimo.image(AppAssets.luckyBuffCoin, width: 8.w, height: 8.w),
                          Text(
                            '${item.prize}',
                            style: TextStyle(
                              color: const Color(0xFF9C2119),
                              fontSize: 9.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
          ],
        ),
    ];
  }

  Widget _wearSlot(CommodityType type) {
    WearItem? wear;
    for (final item in _info?.wearItems ?? const <WearItem>[]) {
      if (item.type == type) {
        wear = item;
        break;
      }
    }
    final hasWear = wear != null && wear.id.toInt() != 0;
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        SizedBox(height: 68.h),
        Padding(
          padding: EdgeInsets.only(top: 16.h),
          child: GestureDetector(
            onTap: () {
              AppJumper.toMyFrame(initIndex: _dressIndex(type));
            },
            child: Container(
              width: 52.w,
              height: 52.w,
              alignment: Alignment.center,
              margin: EdgeInsets.symmetric(horizontal: 2.5.w),
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(AppAssets.luckyBuffBorder),
                  fit: BoxFit.fill,
                ),
              ),
              child: hasWear
                  ? Chimo.image(wear.url, width: 40.w, height: 40.w, fit: BoxFit.contain)
                  : Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SizedBox(height: 8.h),
                        Chimo.image(AppAssets.luckyBuffAdd, width: 14.w, height: 14.w),
                        SizedBox(height: 4.h),
                        Text(
                          _label(type),
                          style: TextStyle(
                            color: AppColors.white,
                            fontSize: 9.sp,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
            ),
          ),
        ),
      ],
    );
  }

  String _label(CommodityType type) {
    return switch (type) {
      CommodityType.AVATAR_FRAME => 'Frame',
      CommodityType.MIC_EFFECT => 'Mic FX',
      CommodityType.BUBBLE => 'Bubble',
      CommodityType.CAR => 'Car',
      _ => '',
    };
  }

  int _dressIndex(CommodityType type) {
    return switch (type) {
      CommodityType.AVATAR_FRAME => 0,
      CommodityType.MIC_EFFECT => 1,
      CommodityType.BUBBLE => 2,
      CommodityType.CAR => 3,
      _ => 0,
    };
  }
}

/// Lucky 底部 tip：可开出大奖预览。对齐 joyride `BoxTipsWidget`。
///
/// 不用 `centerSlice`：窄屏目标小于原图逻辑尺寸时九宫格会直接 paint 失败（背景+文案一起挂）。
/// 拉伸条用 `BoxFit.fill` 即可随 `Get.width - 24.w` 适配。
class RoomGiftLuckyTips extends StatelessWidget {
  const RoomGiftLuckyTips({super.key, required this.boxMaxItem, this.payCurrency = 0});

  final BoxMaxItem boxMaxItem;

  /// 对齐 joyride `BoxTipsWidget.type` → `LuckyBox.html?type=`。
  final int payCurrency;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 93,
      width: double.infinity,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            height: 36.w,
            width: Get.width - 24.w,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              image: Chimo.decorationImage(AppAssets.luckyBoxTipsBg, fit: BoxFit.fill),
            ),
            child: Row(
              children: [
                const SizedBox(width: 12),
                Text(
                  'Open the lucky gift chance to get: ',
                  style: TextStyle(
                    color: AppColors.white,
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Chimo.image(boxMaxItem.icon, width: 36, height: 36, fit: BoxFit.contain),
                const Spacer(),
                GestureDetector(
                  onTap: () {
                    AppJumper.toWeb(
                      url: AppLinks.luckyBoxHelp(payCurrency: payCurrency),
                      title: 'Lucky Gift',
                    );
                  },
                  child: const Icon(Icons.help_outline, size: 20, color: AppColors.white),
                ),
                const SizedBox(width: 12),
              ],
            ),
          ),
          const PositionedDirectional(
            end: 0,
            top: 0,
            child: IgnorePointer(
              child: Image(image: AssetImage(AppAssets.luckyTipsFlashRight), width: 58, height: 58),
            ),
          ),
          const PositionedDirectional(
            start: 0,
            bottom: 0,
            child: IgnorePointer(
              child: Image(image: AssetImage(AppAssets.luckyTipsFlashLeft), width: 58, height: 58),
            ),
          ),
        ],
      ),
    );
  }
}
