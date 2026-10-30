import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:chimo/common/utils/app_toast.dart';
import 'package:fixnum/fixnum.dart';
import 'package:flutter/foundation.dart';
import 'package:protobuf/protobuf.dart';
import 'package:protobuf/well_known_types/google/protobuf/any.pb.dart';

import '../../../common/models/any_parser.dart';
import '../../../common/models/server_client/message.pb.dart';
import '../../../common/utils/app_log.dart';
import 'room_msg_handler.dart';

/// 房间长连接。帧格式对齐 joyride `JRSocket`：JSON proto3，心跳是一个空格。
/// 断线后静默重连（对齐 joyride），不因偶发握手失败直接放弃。
class RoomSocket {
  RoomSocket({required this.url, required this.rid, required this.uid, required this.token});

  /// 用全量 [AnyParser.typeRegistry]，避免 SEND_GIFT 等 Any 解包失败。
  static TypeRegistry get registry => AnyParser.typeRegistry;

  final String url;
  final int rid;
  final String uid;
  final String token;

  final List<RoomMsgHandler> handlers = [];

  /// 每次真正连上（含重连成功）回调一次，用来拉历史。
  VoidCallback? onConnected;

  WebSocket? _socket;
  Timer? _ping;
  int _reqId = 0;
  var _closed = false;
  var _connecting = false;
  var _retrying = false;
  var _everConnected = false;
  var _backoffMs = 2000;
  final Map<int, void Function(ReqContent)> _waiters = {};

  bool get isOpen => _socket?.readyState == WebSocket.open;

  Future<void> connect() async {
    if (url.isEmpty || _closed || _connecting) return;
    if (isOpen) return;

    _connecting = true;
    try {
      await _dropSocket();
      _socket = await WebSocket.connect(
        url,
        headers: {'rid': '$rid', 'uid': uid, 'token': token, if (_everConnected) 'reconnect': '1'},
      ).timeout(const Duration(seconds: 12));
      if (_closed) {
        await _dropSocket();
        return;
      }
      _socket!.listen(
        _onData,
        onError: (Object error) {
          AppLog.w('RoomSocket error', error: error);
          _scheduleReconnect();
        },
        onDone: () {
          if (_closed || _retrying) return;
          AppLog.w('RoomSocket closed by remote');
          _scheduleReconnect();
        },
        cancelOnError: true,
      );
      _ping?.cancel();
      _ping = Timer.periodic(const Duration(seconds: 5), (_) => _send(' '));
      _backoffMs = 2000;
      _everConnected = true;
      onConnected?.call();
    } catch (error) {
      AppLog.w('RoomSocket connect failed', error: error);
      _scheduleReconnect();
    } finally {
      _connecting = false;
    }
  }

  void addHandlers(Iterable<RoomMsgHandler> next) => handlers.addAll(next);

  /// 未连上或超时返回 `null`（可重试）；连上但无历史返回空列表。
  Future<List<Message>?> pullHistory() async {
    if (!isOpen) return null;
    final body = await _request(ReqContent(action: 'pull_chat_msg'));
    if (body == null) return null;
    final raw = body.body['list'];
    if (raw == null || raw.isEmpty) return const [];
    final decoded = jsonDecode(raw);
    if (decoded is! List) return const [];
    final messages = <Message>[];
    for (final item in decoded.reversed) {
      try {
        final text = item is String ? item : jsonEncode(item);
        messages.add(
          Message.create()..mergeFromProto3Json(
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
    _retrying = false;
    _ping?.cancel();
    _ping = null;
    handlers.clear();
    _waiters.clear();
    onConnected = null;
    await _dropSocket();
  }

  Future<void> _dropSocket() async {
    _ping?.cancel();
    _ping = null;
    final socket = _socket;
    _socket = null;
    if (socket == null) return;
    try {
      await socket.close();
    } catch (_) {}
  }

  void _scheduleReconnect() {
    if (_closed || _retrying) return;
    _retrying = true;
    unawaited(() async {
      await _dropSocket();
      final delay = _backoffMs;
      _backoffMs = (_backoffMs + 1000).clamp(2000, 5000);
      AppLog.w('RoomSocket reconnect in ${delay}ms');
      await Future<void>.delayed(Duration(milliseconds: delay));
      _retrying = false;
      if (_closed || isOpen) return;
      await connect();
    }());
  }

  void _onData(dynamic raw) {
    final text = switch (raw) {
      String value => value,
      List<int> bytes => utf8.decode(bytes),
      _ => null,
    };
    if (text == null || text.trim().isEmpty) return;
    try {
      final decoded = jsonDecode(text);
      if (decoded is! Map) return;
      if (decoded['type'] == 'ping') return;
      if (_takeReq(decoded)) return;
      final message = Message.create()
        ..mergeFromProto3Json(decoded, typeRegistry: registry, ignoreUnknownFields: true);
      AppToast.info(message.data.scene.name);
      for (final handler in handlers) {
        if (handler.supports(message)) handler.handle(message);
      }
    } catch (error) {
      AppLog.w('RoomSocket frame skipped', error: error);
    }
  }

  /// 历史回包的 body.list 有时是数组，不能按 proto 的 string map 解，否则请求会空等到超时。
  bool _takeReq(Map decoded) {
    final type = decoded['type'];
    if (type != 'req' && type != 2) return false;
    final data = decoded['data'];
    if (data is! Map) return true;
    final reqId = int.tryParse('${data['reqId']}') ?? 0;
    final content = _reqContent(data['content']);
    final waiter = _waiters.remove(reqId);
    if (waiter != null) {
      waiter(content);
      return true;
    }
    if (_waiters.length == 1) {
      final onlyId = _waiters.keys.first;
      _waiters.remove(onlyId)?.call(content);
    }
    return true;
  }

  ReqContent _reqContent(dynamic content) {
    final req = ReqContent();
    if (content is! Map) return req;
    final payload = Map<String, dynamic>.from(content);
    payload.remove('@type');
    final body = payload['body'];
    if (body is Map) {
      final normalized = <String, String>{};
      for (final entry in body.entries) {
        final value = entry.value;
        normalized['${entry.key}'] = value is String ? value : jsonEncode(value);
      }
      payload['body'] = normalized;
    }
    try {
      req.mergeFromProto3Json(payload, ignoreUnknownFields: true);
    } catch (error) {
      AppLog.w('RoomSocket req decode failed', error: error);
    }
    return req;
  }

  Future<ReqContent?> _request(ReqContent content) {
    if (!isOpen) return Future.value(null);
    _reqId++;
    final id = _reqId;
    final done = Completer<ReqContent?>();
    _waiters[id] = done.complete;
    final data = MessageData(reqId: Int64(id), content: Any.pack(content));
    final message = Message(type: MessageTypeEnum.req, data: data);
    _send(_encode(message));
    return done.future.timeout(
      const Duration(seconds: 8),
      onTimeout: () {
        _waiters.remove(id);
        return null;
      },
    );
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
