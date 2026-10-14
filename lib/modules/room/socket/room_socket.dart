import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:fixnum/fixnum.dart';
import 'package:protobuf/protobuf.dart';
import 'package:protobuf/well_known_types/google/protobuf/any.pb.dart';

import '../../../common/models/server_client/heart_link.pb.dart';
import '../../../common/models/server_client/message.pb.dart';
import '../../../common/utils/app_log.dart';
import 'room_msg_handler.dart';

/// 房间长连接。帧格式对齐 joyride `JRSocket`：JSON proto3，心跳是一个空格。
class RoomSocket {
  RoomSocket({
    required this.url,
    required this.rid,
    required this.uid,
    required this.token,
  });

  static final TypeRegistry registry = TypeRegistry([
    ChatContent.create(),
    CommonChatContent.create(),
    CardChatContent.create(),
    HeartLinkChatContent.create(),
    UserNamedRoomMsgCmd.create(),
    ReqContent.create(),
    RoomMicChange.create(),
    RoomUserJoin.create(),
    RoomRealTimeRankChange.create(),
  ]);

  final String url;
  final int rid;
  final String uid;
  final String token;

  final List<RoomMsgHandler> handlers = [];

  WebSocket? _socket;
  Timer? _ping;
  int _reqId = 0;
  var _closed = false;
  final Map<int, void Function(ReqContent)> _waiters = {};

  Future<void> connect() async {
    if (url.isEmpty || _closed) return;
    _socket = await WebSocket.connect(url, headers: {
      'rid': '$rid',
      'uid': uid,
      'token': token,
    });
    _socket!.listen(_onData, onError: (Object error) {
      AppLog.w('RoomSocket error', error: error);
    }, onDone: () {
      if (!_closed) AppLog.w('RoomSocket closed by remote');
    });
    _ping = Timer.periodic(const Duration(seconds: 5), (_) => _send(' '));
  }

  void addHandlers(Iterable<RoomMsgHandler> next) => handlers.addAll(next);

  Future<List<Message>> pullHistory() async {
    final body = await _request(ReqContent(action: 'pull_chat_msg'));
    final raw = body?.body['list'];
    if (raw == null || raw.isEmpty) return const [];
    final decoded = jsonDecode(raw);
    if (decoded is! List) return const [];
    final messages = <Message>[];
    for (final item in decoded.reversed) {
      try {
        final text = item is String ? item : jsonEncode(item);
        messages.add(
          Message.create()
            ..mergeFromProto3Json(
              jsonDecode(text),
              typeRegistry: registry,
              ignoreUnknownFields: true,
            ),
        );
      } catch (error) {
        AppLog.w('RoomSocket history item skipped', error: error);
      }
    }
    return messages;
  }

  Future<void> close() async {
    _closed = true;
    _ping?.cancel();
    _ping = null;
    handlers.clear();
    _waiters.clear();
    final socket = _socket;
    _socket = null;
    await socket?.close();
  }

  void _onData(dynamic raw) {
    if (raw is! String || raw.trim().isEmpty) return;
    try {
      final map = jsonDecode(raw);
      if (map is! Map) return;
      if (map['type'] == 'ping') return;
      final message = Message.create()
        ..mergeFromProto3Json(map, typeRegistry: registry, ignoreUnknownFields: true);
      if (message.type == MessageTypeEnum.req) {
        final reqId = message.data.reqId.toInt();
        final content = message.data.content.unpackInto(ReqContent());
        _waiters.remove(reqId)?.call(content);
        return;
      }
      for (final handler in handlers) {
        if (handler.supports(message)) handler.handle(message);
      }
    } catch (error) {
      AppLog.w('RoomSocket frame skipped', error: error);
    }
  }

  Future<ReqContent?> _request(ReqContent content) {
    _reqId++;
    final id = _reqId;
    final done = Completer<ReqContent?>();
    _waiters[id] = done.complete;
    final data = MessageData(reqId: Int64(id), content: Any.pack(content));
    final message = Message(type: MessageTypeEnum.req, data: data);
    _send(_encode(message));
    return done.future.timeout(const Duration(seconds: 5), onTimeout: () {
      _waiters.remove(id);
      return null;
    });
  }

  String _encode(Message message) {
    final json = message.toProto3Json(typeRegistry: registry);
    if (json is Map) {
      final data = json['data'];
      if (data is Map) {
        final content = data['content'];
        if (content is Map) content.remove('@type');
      }
    }
    return jsonEncode(json);
  }

  void _send(String text) {
    if (_socket?.readyState == WebSocket.open) {
      _socket!.add(text);
    }
  }
}
