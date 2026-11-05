import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../app/app_jumper.dart';
import '../../../../app/chimo_api.dart';
import '../../../../common/constants/app_assets.dart';
import '../../../../common/models/server_client/emote.pb.dart';
import '../../../../common/theme/app_colors.dart';
import '../../../../common/theme/app_emoji.dart';
import '../../../../common/utils/app_toast.dart';
import '../../../chat/page/widgets/panels/emoji_panel.dart';
import '../../logic/mic_logic.dart';
import '../../service/room_service.dart';
import 'mic_queue_sheet.dart';
import 'package:chimo/common/utils/chimo.dart';

/// 房间底栏。顺序：主持排麦管理、上麦、输入框、礼物、消息、功能。
class RoomInputBar extends StatelessWidget {
  const RoomInputBar({
    super.key,
    required this.controller,
    required this.onSend,
    required this.onJoinMic,
    required this.onToggleMic,
    required this.onGift,
    required this.onMessages,
    required this.onTools,
  });

  final TextEditingController controller;
  final VoidCallback onSend;
  final VoidCallback onJoinMic;
  final VoidCallback onToggleMic;
  final VoidCallback onGift;
  final VoidCallback onMessages;
  final VoidCallback onTools;

  static const _barHeight = 36.0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(14, 8, 16, 8),
        child: Row(
          children: [
            _manageMic(),
            _mic(),
            const SizedBox(width: 8),
            Expanded(child: _field(context)),
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

  /// 主持排麦管理：管理角色 + 非自由上麦时显示，在上麦按钮左侧。
  Widget _manageMic() {
    final room = RoomService.findOrNull();
    if (room == null) return const SizedBox.shrink();
    return Obx(() {
      room.freePub.value;
      room.role.value;
      room.waitQueue.length;
      room.carOwnerMicQueue.length;
      if (!room.isStaff || room.freePub.value) return const SizedBox.shrink();
      final count = room.waitQueue.length + room.carOwnerMicQueue.length;
      return Padding(
        padding: const EdgeInsets.only(right: 8),
        child: GestureDetector(
          onTap: () => MicQueueSheet.show(),
          behavior: HitTestBehavior.opaque,
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                height: _barHeight.w,
                padding: EdgeInsets.symmetric(horizontal: 10.w),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: AppColors.white.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  'Wait',
                  style: TextStyle(
                    color: AppColors.white,
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w600,
                    height: 1,
                  ),
                ),
              ),
              if (count > 0)
                Positioned(
                  top: -4.w,
                  right: -4.w,
                  child: Container(
                    constraints: BoxConstraints(minWidth: 16.w),
                    height: 16.w,
                    padding: EdgeInsets.symmetric(horizontal: 4.w),
                    alignment: Alignment.center,
                    decoration: const ShapeDecoration(
                      shape: StadiumBorder(),
                      color: AppColors.redFF3B30,
                    ),
                    child: Text(
                      count > 99 ? '99+' : '$count',
                      style: TextStyle(
                        color: AppColors.white,
                        fontSize: 9.sp,
                        fontWeight: FontWeight.w700,
                        height: 1,
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ),
      );
    });
  }

  Widget _field(BuildContext context) {
    return GestureDetector(
      onTap: () => RoomMessageInput.show(context, controller: controller, onSend: onSend),
      child: Container(
        height: _barHeight,
        padding: const EdgeInsets.only(left: 16, right: 10),
        decoration: BoxDecoration(
          color: AppColors.black35,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          children: [
            Expanded(
              child: ValueListenableBuilder<TextEditingValue>(
                valueListenable: controller,
                builder: (context, value, child) {
                  final text = value.text;
                  if (text.isEmpty) {
                    return const Text(
                      'Say Something...',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(color: AppColors.gray8A8A8A, fontSize: 14, height: 1.2),
                    );
                  }
                  return AppEmojiText(
                    text,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(color: AppColors.white, fontSize: 14, height: 1.2),
                  );
                },
              ),
            ),
            GestureDetector(
              onTap: () => RoomMessageInput.show(
                context,
                controller: controller,
                onSend: onSend,
                showEmoji: true,
              ),
              child: Chimo.image(
                AppAssets.roomEmojiMenu,
                width: 22,
                height: 22,
                fit: BoxFit.contain,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _asset(String asset, double size, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: Chimo.image(asset, width: size, height: size, fit: BoxFit.contain),
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
          width: _barHeight.w,
          height: _barHeight.w,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.black.withValues(alpha: 0.3),
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Chimo.image(
                open ? AppAssets.roomMicOn : AppAssets.roomMicOff,
                width: 22.w,
                height: 22.w,
                fit: BoxFit.contain,
                color: AppColors.white,
                colorBlendMode: BlendMode.srcIn,
              ),
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
        height: _barHeight.w,
        width: 72.w,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: AppColors.green29EEAA,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(
          'Join Mic',
          style: TextStyle(
            color: AppColors.black1F2518,
            fontSize: 13.sp,
            fontWeight: FontWeight.w700,
            height: 1,
          ),
        ),
      ),
    );
  }
}

/// 键盘上方的输入条。房间页本身不跟随键盘上移，只抬这一层。
class RoomMessageInput extends StatefulWidget {
  const RoomMessageInput({
    super.key,
    required this.controller,
    required this.onSend,
    this.showEmoji = false,
  });

  final TextEditingController controller;
  final VoidCallback onSend;
  final bool showEmoji;

  static Future<void> show(
    BuildContext context, {
    required TextEditingController controller,
    required VoidCallback onSend,
    bool showEmoji = false,
  }) {
    return Get.generalDialog<void>(
      barrierDismissible: true,
      barrierLabel: 'Message',
      barrierColor: Colors.transparent,
      transitionDuration: const Duration(milliseconds: 200),
      pageBuilder: (context, animation, secondaryAnimation) {
        return RoomMessageInput(controller: controller, onSend: onSend, showEmoji: showEmoji);
      },
      transitionBuilder: (context, animation, secondaryAnimation, child) {
        return FadeTransition(opacity: animation, child: child);
      },
    );
  }

  @override
  State<RoomMessageInput> createState() => _RoomMessageInputState();
}

class _RoomMessageInputState extends State<RoomMessageInput> {
  late final FocusNode _focus;
  late bool _showEmoji;

  /// 对齐房间其它弹层（工具 / 资料卡）：`black1C1C1E`。

  static final _roomEmojiStyle = ChatEmojiPanelStyle(
    panelColor: AppColors.rgba(23, 23, 31, 1),
    gridPadding: const EdgeInsets.fromLTRB(8, 0, 8, 56),
    glyphFontSize: 24,
    actions: ChatEmojiActions.floatingPills,
  );

  @override
  void initState() {
    super.initState();
    _showEmoji = widget.showEmoji;
    _focus = FocusNode();
    _focus.addListener(() {
      if (_showEmoji && _focus.hasFocus && mounted) {
        setState(() => _showEmoji = false);
      }
    });
    widget.controller.addListener(_onText);
  }

  @override
  void dispose() {
    widget.controller.removeListener(_onText);
    _focus.dispose();
    super.dispose();
  }

  void _onText() {
    if (mounted) setState(() {});
  }

  void _send() {
    if (widget.controller.text.trim().isEmpty) return;
    AppJumper.back();
    widget.onSend();
  }

  void _insert(String glyph) {
    final text = widget.controller.text;
    final selection = widget.controller.selection;
    final start = selection.start < 0 ? text.length : selection.start;
    final end = selection.end < 0 ? text.length : selection.end;
    final next = text.replaceRange(start, end, glyph);
    widget.controller.value = TextEditingValue(
      text: next,
      selection: TextSelection.collapsed(offset: start + glyph.length),
    );
  }

  void _backspace() {
    final text = widget.controller.text;
    if (text.isEmpty) return;
    final selection = widget.controller.selection;
    var start = selection.start < 0 ? text.length : selection.start;
    var end = selection.end < 0 ? text.length : selection.end;
    if (start != end) {
      final next = text.replaceRange(start, end, '');
      widget.controller.value = TextEditingValue(
        text: next,
        selection: TextSelection.collapsed(offset: start),
      );
      return;
    }
    if (start <= 0) return;
    // 一次删一个 UTF-16 码元；emoji 字体多为单 PUA。
    final next = text.replaceRange(start - 1, start, '');
    widget.controller.value = TextEditingValue(
      text: next,
      selection: TextSelection.collapsed(offset: start - 1),
    );
  }

  Future<void> _sendSticker(Emoticons pack, EmoteItem sticker) async {
    final url = sticker.url.trim().isNotEmpty ? sticker.url.trim() : sticker.showUrl.trim();
    if (url.isEmpty) return;
    AppJumper.back();
    final service = RoomService.findOrNull();
    if (service == null) return;
    final failure = await service.sendRoomSticker(
      packId: pack.id,
      packType: pack.type,
      stickerId: sticker.id,
      name: sticker.name,
      url: url,
    );
    if (failure != null) AppToast.error(failure);
  }

  @override
  Widget build(BuildContext context) {
    final bottom = MediaQuery.paddingOf(context).bottom;
    final onMic = Get.isRegistered<MicLogic>() && Get.find<MicLogic>().onMic;
    return Scaffold(
      backgroundColor: Colors.transparent,
      resizeToAvoidBottomInset: !_showEmoji,
      body: Column(
        children: [
          Expanded(
            child: GestureDetector(
              onTap: () => AppJumper.back(),
              behavior: HitTestBehavior.opaque,
              child: const SizedBox.expand(),
            ),
          ),
          DecoratedBox(
            decoration: BoxDecoration(
              color: AppColors.rgba(23, 23, 31, 1),
              borderRadius: BorderRadius.vertical(top: Radius.circular(16.r)),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(14, 10, 4, 10),
                  child: Row(
                    children: [
                      Expanded(child: _field()),
                      IconButton(
                        onPressed: () {
                          _focus.unfocus();
                          setState(() => _showEmoji = true);
                        },
                        icon: Chimo.image(
                          AppAssets.roomEmojiMenu,
                          width: 26,
                          height: 26,
                          fit: BoxFit.contain,
                        ),
                        padding: EdgeInsets.zero,
                      ),
                      GestureDetector(
                        onTap: _send,
                        child: Container(
                          height: 32,
                          padding: const EdgeInsets.symmetric(horizontal: 12),
                          alignment: Alignment.center,
                          decoration: const ShapeDecoration(
                            shape: StadiumBorder(),
                            color: AppColors.green29EEAA,
                          ),
                          child: const Text(
                            'Send',
                            style: TextStyle(
                              color: AppColors.black1F2518,
                              fontSize: 13,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 8),
                    ],
                  ),
                ),
                if (_showEmoji)
                  // ChatEmojiPanel 内部有 Expanded，必须给有界高度（对齐私聊 _panelHeight=300）。
                  SizedBox(
                    height: 300 + bottom,
                    width: double.infinity,
                    child: ChatEmojiPanel(
                      style: _roomEmojiStyle,
                      bottomInset: bottom,
                      canSend: widget.controller.text.trim().isNotEmpty,
                      onEmojiTap: _insert,
                      onBackspace: _backspace,
                      onSend: _send,
                      preferPackType: onMic ? 'mic_emote' : null,
                      stickers: ChatStickerSource(
                        loadPacks: () => ChimoApis.emote.packs(scene: 'ROOM'),
                        loadStickers: ChimoApis.emote.stickers,
                        onSend: (pack, sticker) => unawaited(_sendSticker(pack, sticker)),
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _field() {
    return Container(
      height: 40,
      alignment: AlignmentDirectional.centerStart,
      decoration: BoxDecoration(
        color: AppColors.white10,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppColors.white30, width: 1),
      ),
      // decoration: const ShapeDecoration(shape: StadiumBorder(), color: AppColors.white10),
      child: TextField(
        autofocus: !widget.showEmoji,
        focusNode: _focus,
        controller: widget.controller,
        cursorColor: AppColors.green29EEAA,
        cursorHeight: 20,
        maxLengthEnforcement: MaxLengthEnforcement.enforced,
        inputFormatters: [LengthLimitingTextInputFormatter(200)],
        textInputAction: TextInputAction.send,
        style: const TextStyle(
          color: AppColors.white,
          fontSize: 14,
          fontFamilyFallback: ['PingFang SC', 'Roboto'],
        ).withAppEmojiFont,
        onSubmitted: (_) => _send(),
        decoration: InputDecoration(
          hintText: 'Say Something...',
          hintStyle: TextStyle(color: AppColors.white30, fontSize: 14.sp),
          isDense: true,
          contentPadding: const EdgeInsets.symmetric(vertical: 4, horizontal: 12),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
