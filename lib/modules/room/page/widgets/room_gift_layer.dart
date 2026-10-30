import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../common/theme/app_colors.dart';
import '../../logic/room_effect_logic.dart';
import '../../model/room_fx.dart';
import '../../model/room_gift_display.dart';
import 'room_gift_item_display.dart';
import 'package:chimo/common/utils/chimo.dart';

/// 左侧礼物条。没有 PAG 地址时播，同一时刻一条。
class RoomGiftBanner extends StatefulWidget {
  const RoomGiftBanner({super.key});

  @override
  State<RoomGiftBanner> createState() => _RoomGiftBannerState();
}

class _RoomGiftBannerState extends State<RoomGiftBanner>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _slide;
  Worker? _worker;
  RoomEffectLogic? _bound;
  RoomGiftFx? _playing;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2200),
    );
    _slide = TweenSequence<double>([
      TweenSequenceItem(tween: Tween(begin: -1.2, end: 0), weight: 4),
      TweenSequenceItem(tween: ConstantTween(0), weight: 14),
      TweenSequenceItem(tween: Tween(begin: 0, end: -1.2), weight: 4),
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
    _worker = ever(logic.banner, (_) {
      if (mounted) _sync();
    });
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) _sync();
    });
  }

  void _sync() {
    final next = _bound?.banner.value;
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
    if (Get.isRegistered<RoomEffectLogic>())
      Get.find<RoomEffectLogic>().finishBanner();
  }

  @override
  Widget build(BuildContext context) {
    _bind();
    final gift = _playing;
    if (gift == null) return const SizedBox.shrink();
    return IgnorePointer(
      child: Align(
        alignment: Alignment.topLeft,
        child: AnimatedBuilder(
          animation: _slide,
          builder: (context, child) {
            return FractionalTranslation(
              translation: Offset(_slide.value, 0),
              child: child,
            );
          },
          child: Padding(
            padding: const EdgeInsets.fromLTRB(16, 8, 48, 0),
            child: _card(gift),
          ),
        ),
      ),
    );
  }

  Widget _card(RoomGiftFx gift) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: AppColors.roomBubble,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Wrap(
        crossAxisAlignment: WrapCrossAlignment.center,
        spacing: 4,
        children: [
          if (gift.fromName.isNotEmpty)
            Text(
              gift.fromName,
              style: const TextStyle(color: AppColors.white, fontSize: 12),
            ),
          const Text(
            'sent to',
            style: TextStyle(color: AppColors.white, fontSize: 12),
          ),
          Text(
            gift.toName,
            style: const TextStyle(color: AppColors.yellowFFD400, fontSize: 12),
          ),
          Text(
            gift.giftName,
            style: const TextStyle(color: AppColors.white70, fontSize: 12),
          ),
          if (gift.icon.isNotEmpty)
            Chimo.image(gift.icon, width: 42, height: 42, fit: BoxFit.contain),
          if (gift.count > 0)
            Text(
              'x${gift.count}',
              style: const TextStyle(
                color: AppColors.white,
                fontSize: 12,
                fontStyle: FontStyle.italic,
              ),
            ),
        ],
      ),
    );
  }
}

/// 全屏礼物层。对齐 joyride [GiftDisplay] + [GiftItemDisplay]（麦位飞入飞出 + PAG）。
///
/// 挂在房间 Stack、且在进房 Obx **之外**（关 sheet / Obx 刷新不拆播放层）。
/// [RoomEffectLogic] 往往晚于本层首帧才 `Get.put`，必须重试绑定；
/// 否则 `ever` 订不上 → 表现为「送礼无动画，热 reload 后才有」。
class RoomGiftPag extends StatefulWidget {
  const RoomGiftPag({super.key});

  @override
  State<RoomGiftPag> createState() => _RoomGiftPagState();
}

class _RoomGiftPagState extends State<RoomGiftPag> {
  Worker? _worker;
  RoomEffectLogic? _bound;
  List<RoomGiftDisplay> _items = const [];
  var _bindRetries = 0;

  @override
  void initState() {
    super.initState();
    _bind();
  }

  @override
  void dispose() {
    _worker?.dispose();
    super.dispose();
  }

  void _bind() {
    if (!mounted) return;
    if (!Get.isRegistered<RoomEffectLogic>()) {
      // 进房 HTTP 返回前 logic 还不在；下一帧再试，避免永久订空。
      if (_bindRetries >= 60) return;
      _bindRetries++;
      WidgetsBinding.instance.addPostFrameCallback((_) => _bind());
      return;
    }
    final logic = Get.find<RoomEffectLogic>();
    if (identical(logic, _bound)) return;
    _worker?.dispose();
    _bound = logic;
    _bindRetries = 0;
    // playingGifts + flyEpoch 双通道，避免 RxList 变更偶发不通知。
    _worker = everAll([logic.playingGifts, logic.flyEpoch], (_) {
      if (mounted) _sync();
    });
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) _sync();
    });
  }

  void _sync() {
    final next = List<RoomGiftDisplay>.from(_bound?.playingGifts ?? const []);
    final same =
        next.length == _items.length &&
        List.generate(
          next.length,
          (i) => next[i].id == _items[i].id,
        ).every((ok) => ok);
    if (same) return;
    setState(() => _items = next);
  }

  @override
  Widget build(BuildContext context) {
    _bind();
    final logic = _bound;
    if (logic == null) return const SizedBox.shrink();
    // Obx 再订 flyEpoch，避免仅靠 ever 时偶发不同步。
    return Obx(() {
      logic.flyEpoch.value;
      final items = List<RoomGiftDisplay>.from(logic.playingGifts);
      if (items.isEmpty) return const SizedBox.shrink();
      return IgnorePointer(
        child: Stack(
          fit: StackFit.expand,
          children: items
              .map(
                (config) => RoomGiftItemDisplay(
                  key: config.key,
                  config: config,
                  onComplete: logic.finishGiftDisplay,
                ),
              )
              .toList(),
        ),
      );
    });
  }
}
