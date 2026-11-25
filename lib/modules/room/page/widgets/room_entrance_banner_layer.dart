import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../common/theme/app_colors.dart';
import '../../../../common/widgets/app_image.dart';
import '../../logic/room_effect_logic.dart';
import '../../model/room_fx.dart';
import 'package:chimo/common/utils/chimo.dart';

/// 入场 banner 层。对齐 joyride `JoinBannerDisplay`。
class RoomEntranceBannerLayer extends StatefulWidget {
  const RoomEntranceBannerLayer({super.key});

  @override
  State<RoomEntranceBannerLayer> createState() => _RoomEntranceBannerLayerState();
}

class _RoomEntranceBannerLayerState extends State<RoomEntranceBannerLayer>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<Offset> _slide;
  Worker? _worker;
  RoomEffectLogic? _bound;
  RoomEntranceBannerFx? _playing;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: const Duration(milliseconds: 4000));
    _slide = TweenSequence<Offset>([
      TweenSequenceItem(
        tween: Tween(begin: const Offset(1, 0), end: Offset.zero)
            .chain(CurveTween(curve: Curves.easeOutCubic)),
        weight: 1,
      ),
      TweenSequenceItem(tween: ConstantTween(Offset.zero), weight: 3),
    ]).animate(_controller);
    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) _finish();
    });
    _bind();
  }

  @override
  void dispose() {
    _worker?.dispose();
    _controller.dispose();
    super.dispose();
  }

  void _bind() {
    if (!Get.isRegistered<RoomEffectLogic>()) return;
    final logic = Get.find<RoomEffectLogic>();
    if (identical(logic, _bound)) return;
    _worker?.dispose();
    _bound = logic;
    _worker = ever(logic.entranceBanner, (_) {
      if (mounted) _sync();
    });
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) _sync();
    });
  }

  void _sync() {
    final next = _bound?.entranceBanner.value;
    if (next == null) {
      if (_playing != null) {
        _controller.stop();
        setState(() => _playing = null);
      }
      return;
    }
    if (_playing?.id == next.id) return;
    setState(() => _playing = next);
    _controller.forward(from: 0);
  }

  void _finish() {
    _playing = null;
    if (Get.isRegistered<RoomEffectLogic>()) {
      Get.find<RoomEffectLogic>().finishEntranceBanner();
    }
  }

  @override
  Widget build(BuildContext context) {
    _bind();
    final item = _playing;
    if (item == null) return const SizedBox.shrink();
    final name1 = item.names.isNotEmpty ? item.names[0] : '';
    final name2 = item.names.length > 1 ? item.names[1] : '';
    return IgnorePointer(
      child: SlideTransition(
        position: _slide,
        child: SizedBox(
          height: 154.w,
          width: double.infinity,
          child: Stack(
            fit: StackFit.expand,
            children: [
              Chimo.image(item.bgUrl, fit: BoxFit.fill),
              Padding(
                padding: EdgeInsetsDirectional.only(start: 40.w, end: 40.w, top: 93.w),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _avatars(item.avatars),
                    SizedBox(width: 8.w),
                    Expanded(
                      child: Text.rich(
                        TextSpan(
                          style: TextStyle(
                            color: AppColors.white,
                            fontSize: 11.sp,
                            fontWeight: FontWeight.w600,
                            shadows: const [
                              Shadow(offset: Offset(0, 1), blurRadius: 1, color: Color(0xFF3D0D66)),
                            ],
                          ),
                          children: [
                            TextSpan(
                              text: name1,
                              style: const TextStyle(color: Color(0xFFFDE42B)),
                            ),
                            const TextSpan(text: ' and '),
                            TextSpan(
                              text: name2,
                              style: const TextStyle(color: Color(0xFFFDE42B)),
                            ),
                            const TextSpan(text: '---the beloved duo---are here together!'),
                          ],
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _avatars(List<String> urls) {
    if (urls.isEmpty) return const SizedBox.shrink();
    final width = 30.w * urls.length + 6.w;
    return SizedBox(
      width: width,
      height: 36.w,
      child: Stack(
        children: [
          for (var i = 0; i < urls.length; i++)
            Positioned(
              left: i * 24.w,
              child: Container(
                width: 36.w,
                height: 36.w,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: AppColors.white, width: 1),
                ),
                child: ClipOval(child: AppImage.avatar(urls[i], size: 36.w)),
              ),
            ),
        ],
      ),
    );
  }
}
