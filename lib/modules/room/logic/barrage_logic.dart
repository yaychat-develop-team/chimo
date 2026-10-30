import 'package:get/get.dart';

import '../../../common/models/server_client/message.pb.dart';
import '../../../common/utils/app_log.dart';
import '../model/room_message.dart';
import '../service/room_service.dart';
import '../socket/room_msg_handler.dart';
import 'room_message_parser.dart';

/// 公屏。历史和实时消息都进 [messages]，发送走 [RoomService]。
class BarrageLogic extends GetxController {
  BarrageLogic() {
    _parser = RoomMessageParser(nextId: (message) => '${message.id.toInt()}-${_seq++}');
  }

  final messages = <RoomMessage>[].obs;

  /// 与礼物层 `flyEpoch` 同思路：RxList 变更偶发不通知时，靠 epoch 拉起 Obx / ever。
  final listEpoch = 0.obs;

  int _seq = 0;
  late final RoomMessageParser _parser;

  var _seeded = false;

  /// 对齐 joyride：历史整表替换为「历史 + 本地提示」，不叠旧历史，避免多次 pull 重复。
  void addAll(Iterable<Message> batch) {
    final lines = <RoomMessage>[];
    for (final message in batch) {
      try {
        final line = _parser.parse(message);
        if (line != null) lines.add(line);
      } catch (error) {
        AppLog.w('Room history line skipped', error: error);
      }
    }
    if (lines.isEmpty) return;
    final local = messages.where((item) => item.id.startsWith('local-')).toList();
    messages.assignAll([...lines, ...local]);
    _notifyList();
  }

  void clear() {
    messages.clear();
    _seeded = false;
    _notifyList();
  }

  /// 进房后贴在公屏末尾：安全提示，以及房间公告。
  void seedEntry(String notice) {
    if (_seeded) return;
    _seeded = true;
    _append(
      _local(
        'Welcome to Chimo! Any inappropriate content will be banned. Please respect each other and chat in a decent manner.',
        '0xFF29EEAA',
      ),
    );
    final bulletin = notice.trim();
    if (bulletin.isEmpty) return;
    _append(_local(bulletin, '0xFFFFDB4B'));
  }

  void _append(RoomMessage line) {
    messages.add(line);
    _notifyList();
  }

  void _notifyList() {
    messages.refresh();
    listEpoch.value++;
  }

  RoomMessage _local(String text, String color) {
    return RoomMessage(
      id: 'local-${_seq++}',
      text: text,
      showSender: false,
      pieces: [RoomShowPiece(text: text, color: color, size: 11)],
    );
  }

  RoomMsgHandler handler() => _BarrageMsgHandler(this);
}

class _BarrageMsgHandler implements RoomMsgHandler {
  _BarrageMsgHandler(this.logic);

  final BarrageLogic logic;

  @override
  bool supports(Message message) {
    final scene = message.data.scene;
    return message.type == MessageTypeEnum.chat ||
        scene == Scene.USER_JOIN ||
        scene == Scene.USER_NAMED_ROOM;
  }

  @override
  void handle(Message message) {
    if (message.data.scene == Scene.USER_JOIN) {
      _syncOnline(message);
      return;
    }
    try {
      final line = logic._parser.parse(message);
      if (line != null) logic._append(line);
    } catch (error) {
      AppLog.w(
        'BarrageMsgHandler failed type=${message.type} scene=${message.data.scene}',
        error: error,
      );
    }
  }
}

void _syncOnline(Message message) {
  if (!Get.isRegistered<RoomService>()) return;
  final join = message.data.content.unpackInto(RoomUserJoin());
  Get.find<RoomService>().applyUserJoin(join);
}
