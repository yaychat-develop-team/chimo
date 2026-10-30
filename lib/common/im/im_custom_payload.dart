import 'dart:convert';

import '../utils/app_log.dart';
import '../utils/json_read.dart';
import '../utils/type_util.dart';
import 'im_custom_events.dart';

/// 自定义消息 payload 的统一入口。
///
/// [ImMessageCodec] 解析 CUSTOM 后写入 `ImChatMessage.customPayload`；
/// UI 侧用 [tryRoomInvite] 等 typed getter 取结构化数据。
/// 新类型：加 `tryXxx` + `fromXxxParams`，不要在 codec 里堆 if。
abstract final class ImCustomPayload {
  static const String keyKind = '_kind';

  static const String kindRoomInvite = 'room_invite';

  /// 从 CUSTOM event + params 解析成可序列化 map；无法识别返回 `null`
  ///（调用方仍可走 generic `msgType: custom` 兜底）。
  static Map<String, dynamic>? parse({
    required String event,
    required Map<String, String> params,
    Map<String, dynamic>? attributes,
  }) {
    if (ImCustomEvents.isRoomInvite(event)) {
      return ImRoomInvitePayload.tryParse(
        event: event,
        params: params,
        attributes: attributes,
      )?.toMap();
    }
    return null;
  }

  static ImRoomInvitePayload? tryRoomInvite(Map<String, dynamic>? raw) {
    if (raw == null || raw.isEmpty) return null;
    if (JsonRead.str(raw, keyKind) != kindRoomInvite) return null;
    return ImRoomInvitePayload.fromMap(raw);
  }
}

/// 房间邀请卡片数据（兼容 V1 扁平 params 与 V2 content JSON）。
class ImRoomInvitePayload {
  const ImRoomInvitePayload({
    required this.rid,
    this.title = '',
    this.desc = '',
    this.tag = '',
    this.onMics = 0,
    this.tagIcon = '',
    this.tagColors = const [],
    this.roomIcon = '',
    this.fromUid = 0,
    this.gameId = '',
    this.gameName = '',
    this.gameIconBig = '',
    this.gameIconSmall = '',
  });

  final int rid;
  final String title;
  final String desc;
  final String tag;
  final int onMics;
  final String tagIcon;
  final List<String> tagColors;
  final String roomIcon;
  final int fromUid;
  final String gameId;
  final String gameName;
  final String gameIconBig;
  final String gameIconSmall;

  bool get isGameRoom => gameId.trim().isNotEmpty;

  Map<String, dynamic> toMap() => {
        ImCustomPayload.keyKind: ImCustomPayload.kindRoomInvite,
        'rid': rid,
        'title': title,
        'desc': desc,
        'tag': tag,
        'onMics': onMics,
        'tagIcon': tagIcon,
        'tagColors': tagColors,
        'roomIcon': roomIcon,
        'fromUid': fromUid,
        'gameId': gameId,
        'gameName': gameName,
        'gameIconBig': gameIconBig,
        'gameIconSmall': gameIconSmall,
      };

  static ImRoomInvitePayload? fromMap(Map<String, dynamic> map) {
    final rid = TypeUtil.parseInt(map['rid']);
    if (rid <= 0) return null;
    final colorsRaw = map['tagColors'];
    final colors = <String>[];
    if (colorsRaw is List) {
      for (final c in colorsRaw) {
        final s = '$c'.trim();
        if (s.isNotEmpty) colors.add(s);
      }
    }
    return ImRoomInvitePayload(
      rid: rid,
      title: JsonRead.str(map, 'title'),
      desc: JsonRead.str(map, 'desc'),
      tag: JsonRead.str(map, 'tag'),
      onMics: TypeUtil.parseInt(map['onMics']),
      tagIcon: JsonRead.str(map, 'tagIcon'),
      tagColors: colors,
      roomIcon: JsonRead.str(map, 'roomIcon'),
      fromUid: TypeUtil.parseInt(map['fromUid']),
      gameId: JsonRead.str(map, 'gameId'),
      gameName: JsonRead.str(map, 'gameName'),
      gameIconBig: JsonRead.str(map, 'gameIconBig'),
      gameIconSmall: JsonRead.str(map, 'gameIconSmall'),
    );
  }

  static ImRoomInvitePayload? tryParse({
    required String event,
    required Map<String, String> params,
    Map<String, dynamic>? attributes,
  }) {
    if (event == ImCustomEvents.roomInviteV2) {
      return _fromV2(params);
    }
    if (event == ImCustomEvents.roomInvite) {
      return _fromV1(params, attributes: attributes);
    }
    return null;
  }

  /// V2：`params.content` = RoomInvite JSON。
  static ImRoomInvitePayload? _fromV2(Map<String, String> params) {
    final raw = (params['content'] ?? '').trim();
    if (raw.isEmpty) return null;
    try {
      final decoded = jsonDecode(raw);
      if (decoded is! Map) return null;
      final map = Map<String, dynamic>.from(decoded);
      final rid = TypeUtil.parseInt(map['rid']);
      if (rid <= 0) return null;

      var gameId = '';
      var gameName = '';
      var gameIconBig = '';
      var gameIconSmall = '';
      final gameInfo = map['gameInfo'];
      if (gameInfo is Map) {
        final g = Map<String, dynamic>.from(gameInfo);
        gameId = JsonRead.str(g, 'gameId');
        gameName = JsonRead.str(g, 'gameName');
        gameIconBig = JsonRead.str(g, 'gameIconBig');
        gameIconSmall = JsonRead.str(g, 'gameIconSmall');
      }

      final colors = <String>[];
      final tagColors = map['tagColors'];
      if (tagColors is List) {
        for (final c in tagColors) {
          final s = '$c'.trim();
          if (s.isNotEmpty) colors.add(s);
        }
      }

      return ImRoomInvitePayload(
        rid: rid,
        title: JsonRead.str(map, 'title'),
        desc: JsonRead.str(map, 'desc'),
        tag: JsonRead.str(map, 'tag'),
        onMics: TypeUtil.parseInt(map['onMics']),
        tagIcon: JsonRead.str(map, 'tagIcon'),
        tagColors: colors,
        roomIcon: JsonRead.str(map, 'roomIcon'),
        fromUid: TypeUtil.parseInt(map['fromUid']),
        gameId: gameId,
        gameName: gameName,
        gameIconBig: gameIconBig,
        gameIconSmall: gameIconSmall,
      );
    } catch (error) {
      AppLog.d('ImRoomInvitePayload V2 parse failed', error: error);
      return null;
    }
  }

  /// V1：扁平 params（客户端 tip 直发）。
  static ImRoomInvitePayload? _fromV1(
    Map<String, String> params, {
    Map<String, dynamic>? attributes,
  }) {
    final rid = TypeUtil.parseInt(params['channelId'] ?? params['rid']);
    if (rid <= 0) return null;
    var fromUid = TypeUtil.parseInt(params['fromUid'] ?? params['uid']);
    if (fromUid <= 0 && attributes != null) {
      fromUid = TypeUtil.parseInt(attributes['userid']);
    }
    final colorRaw = (params['tagColors'] ?? '').trim();
    final colors = colorRaw.isEmpty
        ? const <String>[]
        : colorRaw
            .split(RegExp(r'[,|]'))
            .map((e) => e.trim())
            .where((e) => e.isNotEmpty)
            .toList();
    return ImRoomInvitePayload(
      rid: rid,
      title: (params['tit'] ?? params['title'] ?? '').trim(),
      desc: (params['content'] ?? params['desc'] ?? '').trim(),
      tag: (params['tag'] ?? '').trim(),
      onMics: TypeUtil.parseInt(params['number'] ?? params['onMics']),
      tagIcon: (params['tagIcon'] ?? '').trim(),
      tagColors: colors,
      roomIcon: (params['imageUrl'] ?? params['roomIcon'] ?? '').trim(),
      fromUid: fromUid,
    );
  }
}
