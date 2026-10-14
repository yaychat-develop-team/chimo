import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../common/theme/app_colors.dart';
import '../../logic/room_effect_logic.dart';

/// 可拖动的歌词卡片。没有歌词文本时不显示。
class RoomLyricLayer extends StatefulWidget {
  const RoomLyricLayer({super.key});

  @override
  State<RoomLyricLayer> createState() => _RoomLyricLayerState();
}

class _RoomLyricLayerState extends State<RoomLyricLayer> {
  var _placed = false;
  double _left = 0;
  double _top = 0;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (_placed) return;
    final size = MediaQuery.sizeOf(context);
    _left = (size.width - 300) / 2;
    _top = (size.height - 124) / 2;
    _placed = true;
  }

  void _drag(DragUpdateDetails details, Size size) {
    setState(() {
      _left = (_left + details.delta.dx).clamp(0, size.width - 80).toDouble();
      _top = (_top + details.delta.dy).clamp(0, size.height - 48).toDouble();
    });
  }

  @override
  Widget build(BuildContext context) {
    if (!Get.isRegistered<RoomEffectLogic>()) return const SizedBox.shrink();
    final logic = Get.find<RoomEffectLogic>();
    final size = MediaQuery.sizeOf(context);
    return Obx(() {
      final lines = logic.lyric.value
          .split('\n')
          .map((line) => line.trim())
          .where((line) => line.isNotEmpty)
          .toList();
      if (lines.isEmpty) return const IgnorePointer(child: SizedBox.expand());
      return Stack(
        children: [
          Positioned(
            left: _left,
            top: _top,
            child: GestureDetector(
              onPanUpdate: (details) => _drag(details, size),
              child: _card(lines, logic.hideLyric),
            ),
          ),
        ],
      );
    });
  }

  Widget _card(List<String> lines, VoidCallback onClose) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
        child: Container(
          width: 300,
          height: 124,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: AppColors.textPrimary.withValues(alpha: 0.1)),
            gradient: AppColors.roomLyricGradient,
          ),
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 28, 16, 12),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    for (var i = 0; i < lines.length && i < 3; i++)
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 2),
                        child: Text(
                          lines[i],
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: i == 0 ? AppColors.textPrimary : AppColors.roomLyricDim,
                            fontSize: i == 0 ? 16 : 14,
                          ),
                        ),
                      ),
                  ],
                ),
              ),
              PositionedDirectional(
                top: 0,
                end: 0,
                child: IconButton(
                  onPressed: onClose,
                  icon: const Icon(Icons.close_rounded, size: 16, color: AppColors.textPrimary),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
