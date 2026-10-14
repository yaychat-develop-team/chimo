import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../common/theme/app_colors.dart';
import '../../../../common/widgets/app_image.dart';
import '../../logic/room_effect_logic.dart';
import '../../model/room_fx.dart';

/// 座驾从右侧滑入，停留后滑出。时长 2500ms。
class RoomJoinLayer extends StatefulWidget {
  const RoomJoinLayer({super.key});

  @override
  State<RoomJoinLayer> createState() => _RoomJoinLayerState();
}

class _RoomJoinLayerState extends State<RoomJoinLayer> with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _slide;
  Worker? _worker;
  RoomEffectLogic? _bound;
  RoomJoinFx? _playing;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: const Duration(milliseconds: 2500));
    _slide = TweenSequence<double>([
      TweenSequenceItem(tween: Tween(begin: 0, end: 1), weight: 2.5),
      TweenSequenceItem(tween: ConstantTween(1), weight: 5),
      TweenSequenceItem(tween: Tween(begin: 1, end: 2), weight: 2.5),
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
    _worker = ever(logic.join, (_) {
      if (mounted) _sync();
    });
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) _sync();
    });
  }

  void _sync() {
    final next = _bound?.join.value;
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
    if (Get.isRegistered<RoomEffectLogic>()) Get.find<RoomEffectLogic>().finishJoin();
  }

  @override
  Widget build(BuildContext context) {
    _bind();
    final item = _playing;
    if (item == null) return const SizedBox.shrink();
    return IgnorePointer(
      child: AnimatedBuilder(
        animation: _slide,
        builder: (context, child) {
          final width = MediaQuery.sizeOf(context).width;
          return Transform.translate(offset: Offset(width * (1 - _slide.value), 0), child: child);
        },
        child: _banner(item),
      ),
    );
  }

  Widget _banner(RoomJoinFx item) {
    return Container(
      height: 84,
      width: double.infinity,
      padding: const EdgeInsetsDirectional.only(start: 22, end: 16),
      decoration: BoxDecoration(gradient: AppColors.roomCarGradient(item.level)),
      child: Row(
        children: [
          ClipOval(
            child: item.avatar.isEmpty
                ? const ColoredBox(color: AppColors.surfaceField, child: SizedBox(width: 36, height: 36))
                : AppImage(item.avatar, width: 36, height: 36, fit: BoxFit.cover),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.name,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(color: AppColors.joinName, fontSize: 13, fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 2),
                Text.rich(
                  TextSpan(
                    style: const TextStyle(color: AppColors.textPreview, fontSize: 12),
                    children: [
                      const TextSpan(text: 'entered in '),
                      TextSpan(text: item.carName, style: const TextStyle(color: AppColors.giftGold)),
                    ],
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
          if (item.carImage.isNotEmpty) AppImage(item.carImage, width: 88, height: 48, fit: BoxFit.contain),
        ],
      ),
    );
  }
}
