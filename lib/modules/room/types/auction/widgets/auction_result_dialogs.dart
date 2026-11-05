import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../../common/constants/app_assets.dart';
import '../../../../../common/models/server_client/auction.pb.dart';
import '../../../../../common/theme/app_colors.dart';
import '../../../../../common/utils/chimo.dart';
import '../../../../../common/widgets/app_image.dart';

/// 拍卖成交 / 流拍弹窗。对齐 joyride Success/Fail Dialog + 流程图匹配/流拍动效。
abstract final class AuctionResultDialogs {
  static Future<void> showSuccess(AuctionResult result) {
    return Get.dialog<void>(
      _AuctionSuccessDialog(result: result),
      barrierColor: Colors.black.withValues(alpha: 0.55),
      barrierDismissible: false,
    );
  }

  static Future<void> showFail() {
    return Get.dialog<void>(
      const _AuctionFailDialog(),
      barrierColor: Colors.black.withValues(alpha: 0.55),
      barrierDismissible: true,
    );
  }
}

class _AuctionSuccessDialog extends StatefulWidget {
  const _AuctionSuccessDialog({required this.result});

  final AuctionResult result;

  @override
  State<_AuctionSuccessDialog> createState() => _AuctionSuccessDialogState();
}

class _AuctionSuccessDialogState extends State<_AuctionSuccessDialog> {
  Timer? _timer;
  late int _remain;

  @override
  void initState() {
    super.initState();
    final expire = widget.result.expire.toInt();
    _remain = expire > 0 ? expire : 10;
    _timer = Timer.periodic(const Duration(seconds: 1), (_) {
      if (!mounted) return;
      setState(() => _remain--);
      if (_remain <= 0) {
        _timer?.cancel();
        Get.back<void>();
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void _close() {
    _timer?.cancel();
    Get.back<void>();
  }

  @override
  Widget build(BuildContext context) {
    final artist = widget.result.artist.nickname.trim();
    final agent = widget.result.agent.nickname.trim();
    final artistName = artist.isEmpty ? 'Artist' : artist;
    final agentName = agent.isEmpty ? 'Agent' : agent;
    return Material(
      type: MaterialType.transparency,
      child: Center(
        child: Stack(
          alignment: Alignment.topCenter,
          clipBehavior: Clip.none,
          children: [
            // 全宽背景
            SizedBox(
              width: 1.sw,
              height: 613.w,
              child: Chimo.image(
                AppAssets.auctionSuccessBg,
                width: 1.sw,
                height: 613.w,
                fit: BoxFit.fill,
              ),
            ),
            Positioned(
              top: 189.w,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    width: 280.w,
                    padding: EdgeInsets.fromLTRB(24.w, 67.w, 24.w, 15.w),
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.circular(36.w),
                      image: const DecorationImage(
                        image: AssetImage(AppAssets.auctionSuccessBgSmall),
                        fit: BoxFit.fitWidth,
                        alignment: Alignment.topCenter,
                      ),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text.rich(
                          TextSpan(
                            style: TextStyle(
                              color: AppColors.black1C1C1E,
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w500,
                              height: 1.35,
                            ),
                            children: [
                              TextSpan(
                                text: agentName,
                                style: const TextStyle(
                                  color: Color(0xFFBF3AFC),
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              const TextSpan(text: ' signed '),
                              TextSpan(
                                text: artistName,
                                style: const TextStyle(
                                  color: Color(0xFFBF3AFC),
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ],
                          ),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 16.w),
                        Text(
                          '$artistName is now worth ${widget.result.currentValue} coins!',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: AppColors.black2A2A2A.withValues(alpha: 0.65),
                            fontSize: 12.sp,
                          ),
                        ),
                        SizedBox(height: 10.w),
                        SizedBox(
                          width: 232.w,
                          height: 90.w,
                          child: Stack(
                            children: [
                              Chimo.image(
                                AppAssets.auctionSuccessArrowBg,
                                width: 232.w,
                                height: 90.w,
                                fit: BoxFit.fill,
                              ),
                              Positioned(
                                left: 0,
                                bottom: 20.w,
                                child: SizedBox(
                                  width: 98.w,
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Chimo.image(
                                            AppAssets.auctionCoin,
                                            width: 16.w,
                                            height: 16.w,
                                          ),
                                          SizedBox(width: 2.w),
                                          Text(
                                            '${widget.result.originalValue}',
                                            style: TextStyle(
                                              fontSize: 18.sp,
                                              fontWeight: FontWeight.w600,
                                              foreground: Paint()
                                                ..shader = const LinearGradient(
                                                  colors: [
                                                    Color(0xFFFC5CC6),
                                                    Color(0xFFFC475F),
                                                  ],
                                                ).createShader(
                                                  const Rect.fromLTWH(0, 0, 80, 24),
                                                ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Text(
                                        'Opening',
                                        style: TextStyle(
                                          color: AppColors.black2A2A2A
                                              .withValues(alpha: 0.45),
                                          fontSize: 10.sp,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Positioned(
                                right: 0,
                                bottom: 24.w,
                                child: SizedBox(
                                  width: 120.w,
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Chimo.image(
                                            AppAssets.auctionCoin,
                                            width: 16.w,
                                            height: 16.w,
                                          ),
                                          SizedBox(width: 2.w),
                                          Text(
                                            '${widget.result.currentValue}',
                                            style: TextStyle(
                                              color: AppColors.black1C1C1E,
                                              fontSize: 24.sp,
                                              fontWeight: FontWeight.w800,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Text(
                                        'Final',
                                        style: TextStyle(
                                          color: AppColors.black2A2A2A
                                              .withValues(alpha: 0.45),
                                          fontSize: 10.sp,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 14.w),
                        Text(
                          'Auto close in ${_remain}s',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: AppColors.black2A2A2A.withValues(alpha: 0.4),
                            fontSize: 10.sp,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 16.w),
                  GestureDetector(
                    onTap: _close,
                    child: Chimo.image(
                      AppAssets.auctionCircleClose,
                      width: 28.w,
                      height: 28.w,
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              top: 145.w,
              left: 106.w,
              child: _avatar(widget.result.agent.avatar),
            ),
            Positioned(
              top: 145.w,
              right: 106.w,
              child: _avatar(widget.result.artist.avatar),
            ),
            Positioned(
              top: 171.w,
              child: Chimo.image(
                AppAssets.auctionSuccessHeart,
                width: 36.w,
                height: 36.w,
              ),
            ),
            Positioned(
              top: 236.w,
              child: Chimo.image(
                AppAssets.auctionSuccessShadow,
                width: 112.w,
                height: 7.w,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _avatar(String url) {
    return Container(
      width: 88.w,
      height: 88.w,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: AppColors.white, width: 2.w),
      ),
      child: ClipOval(
        child: AppImage.avatar(url, size: 84.w),
      ),
    );
  }
}

class _AuctionFailDialog extends StatelessWidget {
  const _AuctionFailDialog();

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: Center(
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(height: 35.w),
                Container(
                  width: 280.w,
                  padding: EdgeInsets.fromLTRB(20.w, 70.w, 20.w, 43.w),
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(36.w),
                    image: const DecorationImage(
                      image: AssetImage(AppAssets.auctionSuccessBgSmall),
                      fit: BoxFit.fitWidth,
                      alignment: Alignment.topCenter,
                    ),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'Auction Failed',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: AppColors.black1C1C1E,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(height: 6.w),
                      Text(
                        'No winning bid this round. Back to preparation.',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: AppColors.black2A2A2A.withValues(alpha: 0.65),
                          fontSize: 13.sp,
                          height: 1.35,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20.w),
                GestureDetector(
                  onTap: () => Get.back<void>(),
                  child: Chimo.image(
                    AppAssets.auctionCircleClose,
                    width: 28.w,
                    height: 28.w,
                  ),
                ),
              ],
            ),
            Chimo.image(
              AppAssets.auctionBidFailBg,
              width: 118.w,
              height: 92.w,
            ),
          ],
        ),
      ),
    );
  }
}
