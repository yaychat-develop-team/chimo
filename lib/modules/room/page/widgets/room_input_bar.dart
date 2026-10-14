import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../app/app_jumper.dart';
import '../../../../common/constants/app_assets.dart';
import '../../../../common/theme/app_colors.dart';
import '../../../../common/theme/app_emoji.dart';
import '../../../../common/widgets/app_image.dart';
import '../../logic/mic_logic.dart';

/// 房间底栏。顺序按设计图：上麦、输入框、礼物、消息、功能。
class RoomInputBar extends StatelessWidget {
  const RoomInputBar({
    super.key,
    required this.controller,
    required this.onSend,
    required this.onJoinMic,
    required this.onToggleMic,
    required this.onEmoji,
    required this.onGift,
    required this.onMessages,
    required this.onTools,
  });

  final TextEditingController controller;
  final VoidCallback onSend;
  final VoidCallback onJoinMic;
  final VoidCallback onToggleMic;
  final VoidCallback onEmoji;
  final VoidCallback onGift;
  final VoidCallback onMessages;
  final VoidCallback onTools;

  static const _barHeight = 40.0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(14, 8, 16, 8),
        child: Row(
          children: [
            _mic(),
            const SizedBox(width: 8),
            Expanded(child: _field()),
            const SizedBox(width: 10),
            _asset(AppAssets.roomGiftMenu, 26, onGift),
            const SizedBox(width: 16),
            _asset(AppAssets.roomMsgMenu, 24, onMessages),
            const SizedBox(width: 16),
            _asset(AppAssets.roomFuncMenu, 26, onTools),
          ],
        ),
      ),
    );
  }

  Widget _field() {
    return SizedBox(
      height: _barHeight,
      child: TextField(
        controller: controller,
        style: const TextStyle(color: AppColors.textPrimary, fontSize: 14, height: 1.2),
        textInputAction: TextInputAction.send,
        onSubmitted: (_) => onSend(),
        decoration: InputDecoration(
          hintText: 'Say Something...',
          hintStyle: const TextStyle(color: AppColors.roomHint, fontSize: 14, height: 1.2),
          filled: true,
          fillColor: AppColors.roomInput,
          isDense: true,
          contentPadding: const EdgeInsets.only(left: 16, right: 4, top: 10, bottom: 10),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20), borderSide: BorderSide.none),
          enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(20), borderSide: BorderSide.none),
          focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(20), borderSide: BorderSide.none),
          suffixIcon: GestureDetector(
            onTap: onEmoji,
            child: const Padding(
              padding: EdgeInsets.only(right: 10),
              child: AppImage(AppAssets.roomEmojiMenu, width: 22, height: 22, fit: BoxFit.contain),
            ),
          ),
          suffixIconConstraints: const BoxConstraints(minWidth: 36, minHeight: 22, maxHeight: 22),
        ),
      ),
    );
  }

  Widget _asset(String asset, double size, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: AppImage(asset, width: size, height: size, fit: BoxFit.contain),
    );
  }

  Widget _mic() {
    if (!Get.isRegistered<MicLogic>()) return _join();
    final logic = Get.find<MicLogic>();
    return Obx(() {
      if (!logic.onMic) return _join();
      final open = logic.localOpen;
      return GestureDetector(
        onTap: onToggleMic,
        behavior: HitTestBehavior.opaque,
        child: SizedBox(
          width: 40,
          height: _barHeight,
          child: Center(
            child: open
                ? const Icon(Icons.mic_rounded, color: AppColors.textPrimary, size: 26)
                : const AppImage(
                    AppAssets.roomMicOff,
                    width: 28,
                    height: 28,
                    fit: BoxFit.contain,
                    color: AppColors.textPrimary,
                    colorBlendMode: BlendMode.srcIn,
                  ),
          ),
        ),
      );
    });
  }

  Widget _join() {
    return GestureDetector(
      onTap: onJoinMic,
      child: Container(
        height: _barHeight,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        alignment: Alignment.center,
        decoration: BoxDecoration(color: AppColors.roomSave, borderRadius: BorderRadius.circular(20)),
        child: const Text(
          'Join Mic',
          style: TextStyle(color: AppColors.textPrimary, fontSize: 15, fontWeight: FontWeight.w700, height: 1),
        ),
      ),
    );
  }
}

/// 把自定义表情插进公屏输入框。
Future<void> showRoomEmojiSheet(BuildContext context, ValueChanged<String> onPick) {
  return showModalBottomSheet<void>(
    context: context,
    backgroundColor: AppColors.rankSheet,
    shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(24))),
    builder: (context) {
      return FutureBuilder<List<String>>(
        future: AppEmoji.loadGlyphs(),
        builder: (context, snapshot) {
          final glyphs = snapshot.data ?? const <String>[];
          return SafeArea(
            child: SizedBox(
              height: 240,
              child: glyphs.isEmpty
                  ? const Center(child: Text('No emoji', style: TextStyle(color: AppColors.textPrimary)))
                  : GridView.builder(
                      padding: const EdgeInsets.all(12),
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 8),
                      itemCount: glyphs.length,
                      itemBuilder: (context, index) {
                        final glyph = glyphs[index];
                        return GestureDetector(
                          onTap: () {
                            AppJumper.back();
                            onPick(glyph);
                          },
                          child: Center(
                            child: AppEmojiText(glyph, style: const TextStyle(fontSize: 24, color: AppColors.textPrimary)),
                          ),
                        );
                      },
                    ),
            ),
          );
        },
      );
    },
  );
}
