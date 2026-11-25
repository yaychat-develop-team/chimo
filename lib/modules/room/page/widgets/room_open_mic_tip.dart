import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../common/constants/app_assets.dart';
import '../../../../common/theme/app_colors.dart';
import '../../../../common/utils/chimo.dart';
import '../../logic/mic_logic.dart';

/// 底栏麦钮上方「Toggle the mic」气泡。对齐 joyride `micOffAlarmWidget`。
class RoomOpenMicTip extends StatefulWidget {
  const RoomOpenMicTip({super.key});

  @override
  State<RoomOpenMicTip> createState() => _RoomOpenMicTipState();
}

class _RoomOpenMicTipState extends State<RoomOpenMicTip> {
  Worker? _worker;
  Timer? _hideTimer;
  Timer? _showDelay;
  var _visible = false;
  Offset _pos = Offset.zero;

  @override
  void initState() {
    super.initState();
    _bind();
  }

  @override
  void dispose() {
    _worker?.dispose();
    _hideTimer?.cancel();
    _showDelay?.cancel();
    super.dispose();
  }

  void _bind() {
    if (!Get.isRegistered<MicLogic>()) return;
    final mic = Get.find<MicLogic>();
    _worker?.dispose();
    _worker = ever(mic.showOpenMicTip, (show) {
      if (show == true) {
        _armShow();
      } else {
        _hideTimer?.cancel();
        _showDelay?.cancel();
        if (_visible && mounted) setState(() => _visible = false);
      }
    });
    if (mic.showOpenMicTip.value) _armShow();
  }

  void _armShow() {
    _showDelay?.cancel();
    _hideTimer?.cancel();
    // 对齐 joyride：flag 置 true 后再等 1.5s 定位展示。
    _showDelay = Timer(const Duration(milliseconds: 1500), () {
      if (!mounted || !Get.isRegistered<MicLogic>()) return;
      final mic = Get.find<MicLogic>();
      if (!mic.showOpenMicTip.value) return;
      final box = mic.micButtonKey.currentContext?.findRenderObject();
      if (box is! RenderBox || !box.hasSize) {
        mic.dismissOpenMicTip();
        return;
      }
      final global = box.localToGlobal(Offset.zero);
      setState(() {
        _pos = Offset(global.dx, global.dy - 36);
        _visible = true;
      });
      _hideTimer = Timer(const Duration(seconds: 5), () {
        if (Get.isRegistered<MicLogic>()) Get.find<MicLogic>().dismissOpenMicTip();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    _bind();
    if (!_visible) return const SizedBox.shrink();
    return Positioned(
      left: _pos.dx,
      top: _pos.dy,
      child: IgnorePointer(
        child: SizedBox(
          width: 112,
          height: 34,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Chimo.image(
                AppAssets.roomMicOnTipsIcon,
                width: 112,
                height: 34,
                fit: BoxFit.cover,
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 3.w),
                child: const Text(
                  'Toggle the mic.',
                  style: TextStyle(
                    color: AppColors.black1F2518,
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
