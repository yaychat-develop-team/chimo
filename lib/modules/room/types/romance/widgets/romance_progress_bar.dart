import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../app/app_jumper.dart';
import '../../../../../app/network/services/romance_api.dart';
import '../../../../../common/constants/app_assets.dart';
import '../../../../../common/models/server_client/couple.pb.dart';
import '../../../../../common/theme/app_colors.dart';
import '../../../../../common/widgets/app_image.dart';

/// 私聊白底区顶部 21 日进度卡。对齐 joyride `chat_page._romanceInfoWidget` + 设计稿。
class RomanceProgressBar extends StatelessWidget {
  const RomanceProgressBar({super.key, required this.info, required this.onClaim});

  final ActivityBaseInfo info;
  final VoidCallback onClaim;

  bool get _canClaim => info.hasClaimItem() && info.claimItem.id.toInt() > 0;

  @override
  Widget build(BuildContext context) {
    final total = info.totalIntimacy.toDouble();
    final current = info.currentIntimacy.toDouble();
    final progress = _canClaim ? 1.0 : (total <= 0 ? 0.0 : (current / total).clamp(0.0, 1.0));
    final rewardUrl = _canClaim
        ? info.claimItem.url
        : (info.hasNextReward() ? info.nextReward.url : '');

    return GestureDetector(
      onTap: () {
        if (_canClaim) {
          onClaim();
          return;
        }
        final aid = info.id.toString();
        if (aid.isEmpty || aid == '0') return;
        AppJumper.toWeb(url: RomanceApi.intimacyMissionUrl(aid), title: '21-Day Romance');
      },
      child: SizedBox(
        width: double.infinity,
        height: 93.w,
        child: DecoratedBox(
          decoration: const BoxDecoration(
            image: DecorationImage(image: AssetImage(AppAssets.romanceChatBg), fit: BoxFit.fill),
          ),
          child: Stack(
            alignment: Alignment.topCenter,
            clipBehavior: Clip.none,
            children: [
              Positioned(
                top: 38.w,
                left: 10.w,
                right: 10.w,
                child: Container(
                  height: 44.w,
                  decoration: BoxDecoration(
                    color: const Color(0xFFFFECFA),
                    borderRadius: BorderRadius.circular(14.w),
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 9.w, left: 13.w, right: 72.w, bottom: 6.w),
                        child: _RomanceProgressTrack(progress: progress),
                      ),
                      if (_canClaim)
                        Padding(
                          padding: EdgeInsets.only(left: 12.w),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Current Rewards Pending',
                              style: TextStyle(
                                color: AppColors.gray333333,
                                fontSize: 10.sp,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        )
                      else
                        Padding(
                          padding: EdgeInsets.only(left: 12.w, right: 74.w),
                          child: Row(
                            children: [
                              Expanded(
                                child: Text.rich(
                                  TextSpan(
                                    children: [
                                      TextSpan(
                                        text: '${info.upgradeIntimacy}',
                                        style: TextStyle(
                                          color: const Color(0xFFFF007E),
                                          fontSize: 10.sp,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      TextSpan(
                                        text: ' more Intimacy Points to claim rewards',
                                        style: TextStyle(
                                          color: AppColors.gray333333,
                                          fontSize: 10.sp,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ],
                                  ),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              Text(
                                '${info.currentIntimacy}/${info.totalIntimacy}',
                                style: TextStyle(
                                  color: const Color(0xFFAF6297),
                                  fontSize: 10.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ),
                    ],
                  ),
                ),
              ),
              Positioned(
                top: 18.w,
                right: 14.w,
                child: Container(
                  width: 58.w,
                  height: 58.w,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                        _canClaim ? AppAssets.romanceGiftBgSelect : AppAssets.romanceGiftBg,
                      ),
                      fit: BoxFit.fill,
                    ),
                  ),
                  child: rewardUrl.trim().isEmpty
                      ? Icon(Icons.card_giftcard, color: AppColors.pinkFF5BA8, size: 28.w)
                      : AppImage.image(rewardUrl, width: 48.w, height: 48.w, fit: BoxFit.contain),
                ),
              ),
              Positioned(
                top: 40.w,
                left: 14.w + 240.w * progress,
                child: Image.asset(
                  AppAssets.romanceHeartPoint,
                  width: 28.w,
                  height: 18.w,
                  fit: BoxFit.contain,
                ),
              ),
              if (_canClaim) Positioned(top: -6.w, right: 12.w, child: const _ClaimTip()),
            ],
          ),
        ),
      ),
    );
  }
}

/// 对齐 joyride `JRProgressWidget`：内边距轨道 + 粉渐变填充。
class _RomanceProgressTrack extends StatelessWidget {
  const _RomanceProgressTrack({required this.progress});

  final double progress;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 8.w,
      padding: EdgeInsets.all(1.w),
      alignment: Alignment.centerLeft,
      decoration: BoxDecoration(
        color: const Color(0xFFFEBAD6),
        borderRadius: BorderRadius.circular(8.w),
      ),
      child: FractionallySizedBox(
        widthFactor: math.min(progress, 1.0),
        heightFactor: 1,
        child: DecoratedBox(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.w),
            gradient: const LinearGradient(colors: [Color(0xFFFD5CD6), Color(0xFFFB1ED7)]),
          ),
        ),
      ),
    );
  }
}

class _ClaimTip extends StatefulWidget {
  const _ClaimTip();

  @override
  State<_ClaimTip> createState() => _ClaimTipState();
}

class _ClaimTipState extends State<_ClaimTip> with SingleTickerProviderStateMixin {
  late final AnimationController _ctrl;
  late final Animation<Offset> _offset;

  @override
  void initState() {
    super.initState();
    _ctrl = AnimationController(vsync: this, duration: const Duration(milliseconds: 1000))
      ..repeat(reverse: true);
    _offset = Tween<Offset>(
      begin: Offset.zero,
      end: const Offset(0, 0.35),
    ).animate(CurvedAnimation(parent: _ctrl, curve: Curves.easeInOut));
  }

  @override
  void dispose() {
    _ctrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: _offset,
      child: Container(
        width: 62.w,
        height: 20.w,
        alignment: Alignment.center,
        padding: EdgeInsets.only(bottom: 2.w),
        decoration: const BoxDecoration(
          image: DecorationImage(image: AssetImage(AppAssets.romanceClaimTips), fit: BoxFit.fill),
        ),
        child: Text(
          'Claim',
          style: TextStyle(color: AppColors.white, fontSize: 9.sp, fontWeight: FontWeight.w500),
        ),
      ),
    );
  }
}
