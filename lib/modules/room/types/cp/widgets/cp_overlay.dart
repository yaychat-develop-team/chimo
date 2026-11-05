import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:forya_pag/pag.dart';
import 'package:get/get.dart';

import '../../../../../common/constants/app_assets.dart';
import '../../../../../common/models/server_client/room_cp.pb.dart';
import '../../../../../common/theme/app_colors.dart';
import '../../../../../common/utils/chimo.dart';
import '../../../../../common/widgets/app_image.dart';
import '../logic/cp_logic.dart';

/// CP 浮层：配对变更条 + 结局 PAG。对齐 joyride page builder overlays。
class CpOverlay extends StatelessWidget {
  const CpOverlay({super.key});

  @override
  Widget build(BuildContext context) {
    if (!Get.isRegistered<CpLogic>()) return const SizedBox.shrink();
    final logic = Get.find<CpLogic>();
    return Obx(() {
      logic.info.value;
      final pair = logic.pairEffect.value;
      final stage = logic.stage;
      final end = logic.info.value.hasEndInfo() ? logic.info.value.endInfo : null;
      return Stack(
        fit: StackFit.expand,
        children: [
          if (pair != null)
            Positioned(
              left: 0,
              right: 0,
              top: 458.w,
              child: _PairChangeBanner(
                change: pair,
                onDone: logic.clearPairEffect,
              ),
            ),
          if (stage == CPStage.end &&
              end != null &&
              end.url.isNotEmpty &&
              end.icon1.isNotEmpty &&
              end.icon2.isNotEmpty)
            Positioned.fill(
              child: IgnorePointer(
                child: PAGView.network(
                  end.url,
                  width: 1.sw,
                  height: 1.sh,
                  autoPlay: true,
                  texts: [end.desc, end.name1, end.name2],
                  imgs: [end.icon1, end.icon2],
                ),
              ),
            ),
        ],
      );
    });
  }
}

class _PairChangeBanner extends StatefulWidget {
  const _PairChangeBanner({required this.change, required this.onDone});

  final CpPairChange change;
  final VoidCallback onDone;

  @override
  State<_PairChangeBanner> createState() => _PairChangeBannerState();
}

class _PairChangeBannerState extends State<_PairChangeBanner>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _anim;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2500),
    )..addStatusListener((status) {
        if (status == AnimationStatus.completed) widget.onDone();
      });
    _anim = TweenSequence<double>([
      TweenSequenceItem(tween: Tween(begin: 0, end: 1), weight: 2),
      TweenSequenceItem(tween: Tween(begin: 1, end: 1), weight: 8),
    ]).animate(_controller);
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  String _clip(String s) => s.length <= 4 ? s : s.substring(0, 4);

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      child: AnimatedBuilder(
        animation: _anim,
        builder: (context, child) {
          final dx = (_anim.value * 280.w) - 280.w;
          return Transform.translate(offset: Offset(dx, 0), child: child);
        },
        child: Align(
          alignment: Alignment.centerLeft,
          child: Container(
            width: 280.w,
            height: 60.w,
            decoration: BoxDecoration(
              image: Chimo.decorationImage(
                AppAssets.cpChooseChangeBg,
                fit: BoxFit.cover,
              ),
            ),
            padding: EdgeInsets.only(left: 19.w),
            child: Row(
              children: [
                AppImage.avatar(widget.change.avatar, size: 42.w),
                SizedBox(width: 8.w),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Flexible(
                            child: Text(
                              _clip(widget.change.fromNickName),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontSize: 12.sp,
                                color: const Color(0xFFFCFF54),
                                fontWeight: FontWeight.w600,
                                height: 1,
                              ),
                            ),
                          ),
                          Text(
                            ' to ',
                            style: TextStyle(
                              fontSize: 12.sp,
                              color: AppColors.white,
                            ),
                          ),
                          Flexible(
                            child: Text(
                              _clip(widget.change.toNickName),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontSize: 12.sp,
                                color: const Color(0xFFFCFF54),
                                fontWeight: FontWeight.w600,
                                height: 1,
                              ),
                            ),
                          ),
                        ],
                      ),
                      if (widget.change.desc.isNotEmpty) ...[
                        SizedBox(height: 4.w),
                        Text(
                          widget.change.desc,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 11.sp,
                            color: AppColors.white.withValues(alpha: 0.85),
                          ),
                        ),
                      ],
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
