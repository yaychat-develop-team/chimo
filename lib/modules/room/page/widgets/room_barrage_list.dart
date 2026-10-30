import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../app/app_jumper.dart';
import '../../../../common/constants/app_assets.dart';
import '../../../../common/theme/app_colors.dart';
import '../../logic/barrage_logic.dart';
import 'room_message_item.dart';
import 'package:chimo/common/utils/chimo.dart';

/// 公屏。不在底部时累计未读，点「新消息」回到最新一条。
class RoomBarrageList extends StatefulWidget {
  const RoomBarrageList({super.key});

  @override
  State<RoomBarrageList> createState() => _RoomBarrageListState();
}

class _RoomBarrageListState extends State<RoomBarrageList> {
  final _scroll = ScrollController();
  Worker? _worker;
  BarrageLogic? _bound;
  var _unread = 0;
  var _pinned = true;
  var _count = 0;

  @override
  void initState() {
    super.initState();
    _scroll.addListener(_onScroll);
    _bind();
  }

  @override
  void dispose() {
    _worker?.dispose();
    _scroll.dispose();
    super.dispose();
  }

  /// 进房瞬间 BarrageLogic 可能尚未 put；对齐礼物层，build 里补绑，避免偶发空白。
  void _bind() {
    if (!Get.isRegistered<BarrageLogic>()) return;
    final logic = Get.find<BarrageLogic>();
    if (identical(logic, _bound)) return;
    _worker?.dispose();
    _bound = logic;
    _count = logic.messages.length;
    // messages + listEpoch 双通道，避免 RxList 变更偶发不通知（对齐礼物层）。
    _worker = everAll([logic.messages, logic.listEpoch], (_) {
      _onMessages(logic.messages);
    });
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
    if (!mounted) return;
    if (added <= 0) {
      setState(() {});
      return;
    }
    if (_pinned) {
      setState(() {});
      return;
    }
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
    _bind();
    if (_bound == null) return const SizedBox.expand();
    final logic = _bound!;
    return Stack(
      children: [
        Obx(() {
          logic.listEpoch.value;
          final lines = logic.messages.toList();
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
                  onProfile: ({required uid, name = '', avatar = ''}) {
                    AppJumper.showUserProfileSheet(uid: uid, name: name, avatar: avatar);
                  },
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
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(13),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      '$_unread New Messages',
                      style: const TextStyle(
                        color: AppColors.green00D68F,
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(width: 4),
                    Transform.rotate(
                      angle: 1.5707963,
                      child: Chimo.image(
                        AppAssets.roomArrowRight,
                        width: 8,
                        height: 12,
                        color: AppColors.green00D68F,
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
