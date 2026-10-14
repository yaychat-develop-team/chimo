import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../app/app_jumper.dart';
import '../../../../common/constants/app_assets.dart';
import '../../../../common/theme/app_colors.dart';
import '../../../../common/widgets/app_image.dart';
import '../../logic/barrage_logic.dart';
import 'room_message_item.dart';

/// 公屏。不在底部时累计未读，点「新消息」回到最新一条。
class RoomBarrageList extends StatefulWidget {
  const RoomBarrageList({super.key});

  @override
  State<RoomBarrageList> createState() => _RoomBarrageListState();
}

class _RoomBarrageListState extends State<RoomBarrageList> {
  final _scroll = ScrollController();
  Worker? _worker;
  var _unread = 0;
  var _pinned = true;
  var _count = 0;

  @override
  void initState() {
    super.initState();
    _scroll.addListener(_onScroll);
    if (!Get.isRegistered<BarrageLogic>()) return;
    final logic = Get.find<BarrageLogic>();
    _count = logic.messages.length;
    _worker = ever(logic.messages, _onMessages);
  }

  @override
  void dispose() {
    _worker?.dispose();
    _scroll.dispose();
    super.dispose();
  }

  void _onScroll() {
    final pinned = !_scroll.hasClients || _scroll.offset <= 36;
    if (pinned == _pinned) return;
    setState(() {
      _pinned = pinned;
      if (pinned) _unread = 0;
    });
  }

  void _onMessages(List<dynamic> lines) {
    final added = lines.length - _count;
    _count = lines.length;
    if (added <= 0 || _pinned || !mounted) return;
    setState(() => _unread += added);
  }

  void _openRoomLink(String link) {
    final uri = Uri.tryParse(link.trim());
    if (uri == null || uri.path != '/room') return;
    final rid = int.tryParse(uri.queryParameters['rid'] ?? '') ?? 0;
    if (rid > 0) AppJumper.toRoom(rid);
  }

  void _jumpLatest() {
    if (_scroll.hasClients) {
      _scroll.animateTo(0, duration: const Duration(milliseconds: 250), curve: Curves.easeOut);
    }
    setState(() => _unread = 0);
  }

  @override
  Widget build(BuildContext context) {
    if (!Get.isRegistered<BarrageLogic>()) return const SizedBox.expand();
    final logic = Get.find<BarrageLogic>();
    return Stack(
      children: [
        Obx(() {
          final lines = logic.messages;
          return ShaderMask(
            shaderCallback: (rect) {
              return const LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Colors.transparent, Colors.black, Colors.black],
                stops: [0, 0.12, 1],
              ).createShader(rect);
            },
            blendMode: BlendMode.dstIn,
            child: ListView.builder(
              controller: _scroll,
              reverse: true,
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.fromLTRB(12, 4, 72, 8),
              itemCount: lines.length,
              itemBuilder: (context, index) {
                final line = lines[lines.length - 1 - index];
                return RoomMessageItem(
                  key: ValueKey(line.id),
                  message: line,
                  onSender: () => AppJumper.toProfile(line.senderUid),
                  onLink: _openRoomLink,
                );
              },
            ),
          );
        }),
        if (_unread > 0)
          Positioned(
            left: 12,
            bottom: 4,
            child: GestureDetector(
              onTap: _jumpLatest,
              child: Container(
                height: 26,
                padding: const EdgeInsets.symmetric(horizontal: 12),
                decoration: BoxDecoration(
                  color: AppColors.roomNewMsg,
                  borderRadius: BorderRadius.circular(13),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      '$_unread New Messages',
                      style: const TextStyle(
                        color: AppColors.roomNewMsgText,
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(width: 4),
                    Transform.rotate(
                      angle: 1.5707963,
                      child: const AppImage(
                        AppAssets.roomArrowRight,
                        width: 8,
                        height: 12,
                        color: AppColors.roomNewMsgText,
                        colorBlendMode: BlendMode.srcIn,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
      ],
    );
  }
}
