import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../common/theme/app_colors.dart';
import '../../../../common/widgets/app_image.dart';
import '../../../../common/widgets/pag_network_overlay.dart';
import '../../logic/room_effect_logic.dart';
import '../../model/room_fx.dart';

/// 左侧礼物条。没有 PAG 地址时播，同一时刻一条。
class RoomGiftBanner extends StatefulWidget {
  const RoomGiftBanner({super.key});

  @override
  State<RoomGiftBanner> createState() => _RoomGiftBannerState();
}

class _RoomGiftBannerState extends State<RoomGiftBanner> with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _slide;
  Worker? _worker;
  RoomEffectLogic? _bound;
  RoomGiftFx? _playing;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: const Duration(milliseconds: 2200));
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
    if (Get.isRegistered<RoomEffectLogic>()) Get.find<RoomEffectLogic>().finishBanner();
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
            return FractionalTranslation(translation: Offset(_slide.value, 0), child: child);
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
            Text(gift.fromName, style: const TextStyle(color: AppColors.textPrimary, fontSize: 12)),
          const Text('sent to', style: TextStyle(color: AppColors.textPrimary, fontSize: 12)),
          Text(gift.toName, style: const TextStyle(color: AppColors.giftGold, fontSize: 12)),
          Text(gift.giftName, style: const TextStyle(color: AppColors.textPreview, fontSize: 12)),
          if (gift.icon.isNotEmpty) AppImage(gift.icon, width: 42, height: 42, fit: BoxFit.contain),
          if (gift.count > 0)
            Text(
              'x${gift.count}',
              style: const TextStyle(color: AppColors.textPrimary, fontSize: 12, fontStyle: FontStyle.italic),
            ),
        ],
      ),
    );
  }
}

/// 全屏 PAG。礼物图标或进房特效地址以 `.pag` 结尾时播一次。
class RoomGiftPag extends StatefulWidget {
  const RoomGiftPag({super.key});

  @override
  State<RoomGiftPag> createState() => _RoomGiftPagState();
}

class _RoomGiftPagState extends State<RoomGiftPag> {
  Worker? _worker;
  RoomEffectLogic? _bound;
  Timer? _timeout;
  String? _url;

  @override
  void initState() {
    super.initState();
    _bind();
  }

  @override
  void dispose() {
    _timeout?.cancel();
    _worker?.dispose();
    super.dispose();
  }

  void _bind() {
    if (!Get.isRegistered<RoomEffectLogic>()) return;
    final logic = Get.find<RoomEffectLogic>();
    if (identical(logic, _bound)) return;
    _worker?.dispose();
    _bound = logic;
    _worker = ever(logic.pag, (url) {
      if (mounted) _arm(url);
    });
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted && Get.isRegistered<RoomEffectLogic>()) {
        _arm(Get.find<RoomEffectLogic>().pag.value);
      }
    });
  }

  void _arm(String? url) {
    _timeout?.cancel();
    if (url == null || url.isEmpty) {
      if (_url != null) setState(() => _url = null);
      return;
    }
    if (_url == url) return;
    setState(() => _url = url);
    _timeout = Timer(const Duration(seconds: 8), _finish);
  }

  void _finish() {
    _timeout?.cancel();
    _url = null;
    if (Get.isRegistered<RoomEffectLogic>()) Get.find<RoomEffectLogic>().finishPag();
  }

  @override
  Widget build(BuildContext context) {
    _bind();
    final url = _url;
    if (url == null || url.isEmpty) return const IgnorePointer(child: SizedBox.expand());
    return IgnorePointer(
      child: Stack(
        children: [
          PagNetworkOverlay(url: url, onAnimationEnd: _finish),
        ],
      ),
    );
  }
}
