import 'dart:convert';

import 'package:im_flutter_sdk/im_flutter_sdk.dart';

import '../theme/app_emoji.dart';
import '../utils/app_log.dart';
import '../utils/json_read.dart';
import 'im_models.dart';
import 'im_system_accounts.dart';

/// 环信消息 ↔ 界面消息。
///
/// 只做解析和预览文案，不连接、不发送、不持有会话流。
/// 当前登录的环信用户 id 由调用方传入，避免这里回头依赖 IM 门面。
abstract final class ImMessageCodec {
  static String previewText(EMMessage message) {
    final body = message.body;
    if (body is EMTextMessageBody) {
      final emote = _emoteFromAttributes(message.attributes);
      if (emote != null) {
        return emote.name.isEmpty ? '[Sticker]' : '[${emote.name}]';
      }
      return AppEmoji.normalize(body.content);
    }
    if (body is EMImageMessageBody) return '[Image]';
    if (body is EMVoiceMessageBody) {
      final d = body.duration;
      return d > 0 ? '[Voice] $d"' : '[Voice]';
    }
    if (body is EMCustomMessageBody) {
      return _customPreview(body, message: message);
    }
    return '[Message]';
  }

  static String _customPreview(
    EMCustomMessageBody body, {
    required EMMessage message,
  }) {
    final event = body.event;
    final params = body.params;
    final fallbackText = _customTextFromParams(params);
    if (event.isEmpty) {
      return fallbackText.isNotEmpty ? fallbackText : '[Message]';
    }
    switch (event) {
      case 'SendGift':
        return '[Gift]';
      case 'im_ride_invite_message':
        return '[Ride Invitation]';
      case 'im_room_invite_message':
      case 'RoomInvite':
        return '[Room Invitation]';
      case 'share_user_msg':
        return '[Friend Referral]';
      case 'im_prick_message':
        return '[Poke]';
      case 'im_recall_message':
      case 'recallMessage':
        return 'The sender recalled a message.';
      case 'im_follow_message':
        return 'Followed you';
      case 'JoinGroupMessage':
        final join = _parseJoinGroupParams(body.params);
        if (join.name.isNotEmpty) {
          return '${join.name} joined the community';
        }
        return 'joined the community';
      case 'SystemNotify':
        if (params != null) {
          for (final key in ['text', 'content', 'title', 'body']) {
            final v = (params[key] ?? '').trim();
            if (v.isNotEmpty && !v.startsWith('{') && !v.startsWith('[')) {
              return v;
            }
          }
        }
        final convId = message.conversationId ?? message.from;
        if (ImSystemAccounts.isNewFriends(convId)) {
          return 'New friend activity';
        }
        return fallbackText.isNotEmpty ? fallbackText : '[Message]';
      default:
        return fallbackText.isNotEmpty ? fallbackText : '[$event]';
    }
  }

  static String _customTextFromParams(Map<String, String>? params) {
    if (params == null || params.isEmpty) return '';
    for (final key in const [
      'text',
      'content',
      'msg',
      'message',
      'body',
      'title',
    ]) {
      final raw = (params[key] ?? '').trim();
      if (raw.isEmpty) continue;
      if (!raw.startsWith('{') && !raw.startsWith('[')) {
        return AppEmoji.normalize(raw);
      }
      try {
        final decoded = jsonDecode(raw);
        if (decoded is Map) {
          final map = Map<String, dynamic>.from(decoded);
          for (final nestedKey in const [
            'text',
            'content',
            'msg',
            'message',
            'body',
            'title',
            'desc',
            'name',
          ]) {
            final value = JsonRead.str(map, nestedKey);
            if (value.isNotEmpty &&
                !value.startsWith('{') &&
                !value.startsWith('[')) {
              return AppEmoji.normalize(value);
            }
          }
        }
      } catch (error) {
        // 自定义消息的 attributes 结构不认识：退回下面的通用兜底文案。
        // 记 debug 级 —— 对端 App 版本不一致时会成片出现，不该淹掉告警流。
        AppLog.d('ImService custom attrs parse failed', error: error);
      }
    }
    return '';
  }
  static String _pickLocal(String? path) {
    final p = path?.trim() ?? '';
    return p;
  }

  static String _pickRemote(String? path) {
    final p = path?.trim() ?? '';
    if (p.startsWith('http://') || p.startsWith('https://')) return p;
    // 环信有时只给裸路径；非空则保留以便下载。
    return p;
  }

  static ImChatMessage? fromEm(
    EMMessage message, {
    bool forceSelf = false,
    String selfEmUser = '',
  }) {
    final body = message.body;
    var text = '';
    var type = 'txt';
    var local = '';
    var remote = '';
    var thumb = '';
    var durationSecs = 0;

    if (body is EMTextMessageBody) {
      text = AppEmoji.normalize(body.content);
      final emote = _emoteFromAttributes(message.attributes);
      if (emote != null) {
        type = 'emote';
        remote = emote.url;
        text = emote.name.isEmpty ? text : '[${emote.name}]';
        return _finishEm(
          message,
          forceSelf: forceSelf,
          selfEmUser: selfEmUser,
          text: text,
          type: type,
          remote: remote,
          emoteUrl: emote.url,
          emoteName: emote.name,
        );
      }
    } else if (body is EMImageMessageBody) {
      type = 'image';
      local = _pickLocal(body.localPath);
      remote = _pickRemote(body.remotePath);
      final thumbRemote = _pickRemote(body.thumbnailRemotePath);
      final thumbLocal = _pickLocal(body.thumbnailLocalPath);
      thumb = thumbRemote.isNotEmpty ? thumbRemote : thumbLocal;
      text = '[Image]';
    } else if (body is EMVoiceMessageBody) {
      type = 'voice';
      local = _pickLocal(body.localPath);
      remote = _pickRemote(body.remotePath);
      durationSecs = body.duration;
      text = durationSecs > 0 ? '[Voice] $durationSecs"' : '[Voice]';
    } else if (body is EMCustomMessageBody) {
      final mapped = _mapCustomBody(
        body,
        message: message,
        forceSelf: forceSelf,
        selfEmUser: selfEmUser,
      );
      if (mapped == null) return null;
      return _attachQuote(mapped, message);
    } else {
      return null;
    }

    return _finishEm(
      message,
      forceSelf: forceSelf,
      selfEmUser: selfEmUser,
      text: text,
      type: type,
      local: local,
      remote: remote,
      thumb: thumb,
      durationSecs: durationSecs,
    );
  }

  static String _attrText(dynamic value) {
    if (value == null) return '';
    final text = '$value'.trim();
    if (text.isEmpty || text == 'null' || text == 'undefined') return '';
    return text;
  }

  static ({String name, String avatar, String uid, String gender})
  _senderFromAttributes(Map<String, dynamic>? attributes) {
    if (attributes == null || attributes.isEmpty) {
      return (name: '', avatar: '', uid: '', gender: '');
    }
    return (
      name: _attrText(attributes['name']),
      avatar: _attrText(attributes['avatar']),
      uid: _attrText(attributes['userid']),
      gender: _attrText(attributes['gender']),
    );
  }

  static ImChatMessage _finishEm(
    EMMessage message, {
    required bool forceSelf,
    required String selfEmUser,
    required String text,
    required String type,
    String local = '',
    String remote = '',
    String thumb = '',
    int durationSecs = 0,
    String emoteUrl = '',
    String emoteName = '',
    String customEvent = '',
    int giftId = 0,
    int giftQty = 1,
    String giftName = '',
    String giftIconUrl = '',
  }) {
    final selfUser = selfEmUser;
    final isSelf =
        forceSelf ||
        message.direction == MessageDirection.SEND ||
        (selfUser.isNotEmpty && message.from == selfUser);

    final convIdRaw = message.conversationId?.trim() ?? '';
    final conversationId = convIdRaw.isNotEmpty
        ? convIdRaw
        : (isSelf ? (message.to ?? '') : (message.from ?? ''));
    final sender = _senderFromAttributes(message.attributes);
    final quote = ImQuoteMsg.fromAttributes(message.attributes);

    return ImChatMessage(
      id: message.msgId,
      conversationId: conversationId,
      from: message.from ?? '',
      to: message.to ?? '',
      text: text,
      isSelf: isSelf,
      serverTimeMs: message.serverTime,
      msgType: type,
      mediaLocalPath: local,
      mediaRemoteUrl: remote,
      thumbnailUrl: thumb,
      durationSecs: durationSecs,
      customEvent: customEvent,
      giftId: giftId,
      giftQty: giftQty,
      giftName: giftName,
      giftIconUrl: giftIconUrl,
      emoteUrl: emoteUrl,
      emoteName: emoteName,
      senderName: sender.name,
      senderAvatar: sender.avatar,
      senderUid: sender.uid,
      senderGender: sender.gender,
      quoteMsgId: quote?.msgId ?? '',
      quoteShowText: quote?.showText ?? '',
      quoteSendName: quote?.sendName ?? '',
      isGroup: message.chatType == ChatType.GroupChat,
      failed: message.status == MessageStatus.FAIL,
    );
  }

  static ImChatMessage _attachQuote(ImChatMessage msg, EMMessage message) {
    final quote = ImQuoteMsg.fromAttributes(message.attributes);
    if (quote == null) return msg;
    return ImChatMessage(
      id: msg.id,
      conversationId: msg.conversationId,
      from: msg.from,
      to: msg.to,
      text: msg.text,
      isSelf: msg.isSelf,
      serverTimeMs: msg.serverTimeMs,
      msgType: msg.msgType,
      mediaLocalPath: msg.mediaLocalPath,
      mediaRemoteUrl: msg.mediaRemoteUrl,
      thumbnailUrl: msg.thumbnailUrl,
      durationSecs: msg.durationSecs,
      customEvent: msg.customEvent,
      giftId: msg.giftId,
      giftQty: msg.giftQty,
      giftName: msg.giftName,
      giftIconUrl: msg.giftIconUrl,
      emoteUrl: msg.emoteUrl,
      emoteName: msg.emoteName,
      joinName: msg.joinName,
      joinUid: msg.joinUid,
      senderName: msg.senderName,
      senderAvatar: msg.senderAvatar,
      senderUid: msg.senderUid,
      senderGender: msg.senderGender,
      quoteMsgId: quote.msgId,
      quoteShowText: quote.showText,
      quoteSendName: quote.sendName,
      isGroup: msg.isGroup,
      failed: msg.failed,
    );
  }

  static ({String url, String name})? _emoteFromAttributes(
    Map<String, dynamic>? attributes,
  ) {
    if (attributes == null) return null;
    var extra = attributes['extra'];
    if (extra is String) {
      final raw = extra.trim();
      if (raw.isEmpty) return null;
      try {
        extra = jsonDecode(raw);
      } catch (_) {
        return null;
      }
    }
    if (extra is! Map) return null;
    final type = '${extra['type'] ?? ''}';
    if (type != 'emote' && type != 'outside_emote') return null;
    final emote = extra['emote'];
    if (emote is! Map) return null;
    final url = '${emote['url'] ?? emote['resource'] ?? emote['showUrl'] ?? ''}'
        .trim();
    if (url.isEmpty) return null;
    final name = '${emote['desc'] ?? emote['name'] ?? ''}'.trim();
    return (url: url, name: name);
  }

  static ImChatMessage? _mapCustomBody(
    EMCustomMessageBody body, {
    required EMMessage message,
    bool forceSelf = false,
    String selfEmUser = '',
  }) {
    final selfUser = selfEmUser;
    final isSelf =
        forceSelf ||
        message.direction == MessageDirection.SEND ||
        (selfUser.isNotEmpty && message.from == selfUser);
    final convIdRaw = message.conversationId?.trim() ?? '';
    final conversationId = convIdRaw.isNotEmpty
        ? convIdRaw
        : (isSelf ? (message.to ?? '') : (message.from ?? ''));

    final event = body.event;
    final params = body.params ?? const <String, String>{};
    final isGroup = message.chatType == ChatType.GroupChat;
    final sender = _senderFromAttributes(message.attributes);

    if (event == 'SendGift') {
      final gift = _parseGiftParams(params);
      final name = gift.name;
      final qty = gift.qty;
      final text = name.isEmpty ? '[Gift] x$qty' : '[Gift] $name x$qty';
      return ImChatMessage(
        id: message.msgId,
        conversationId: conversationId,
        from: message.from ?? '',
        to: message.to ?? '',
        text: text,
        isSelf: isSelf,
        serverTimeMs: message.serverTime,
        msgType: 'gift',
        customEvent: event,
        giftId: gift.id,
        giftQty: qty,
        giftName: name,
        giftIconUrl: gift.iconUrl,
        senderName: sender.name,
        senderAvatar: sender.avatar,
        senderUid: sender.uid,
        senderGender: sender.gender,
        isGroup: isGroup,
        failed: message.status == MessageStatus.FAIL,
      );
    }

    if (event == 'im_follow_message') {
      final followed = (int.tryParse(params['follow'] ?? '1') ?? 1) > 0;
      final text = isSelf
          ? (followed
                ? 'You have followed the user'
                : 'You have unfollowed the user')
          : (followed
                ? 'The user has followed you'
                : 'The user has unfollowed you');
      return ImChatMessage(
        id: message.msgId,
        conversationId: conversationId,
        from: message.from ?? '',
        to: message.to ?? '',
        text: text,
        isSelf: isSelf,
        serverTimeMs: message.serverTime,
        msgType: 'follow',
        customEvent: event,
        senderName: sender.name,
        senderAvatar: sender.avatar,
        senderUid: sender.uid,
        senderGender: sender.gender,
        isGroup: isGroup,
        failed: message.status == MessageStatus.FAIL,
      );
    }

    // 对齐 forya `CusTomMessage.recallMessage`：这条 CUSTOM 才是撤回提示文案。
    if (event == 'im_recall_message' || event == 'recallMessage') {
      return ImChatMessage(
        id: message.msgId,
        conversationId: conversationId,
        from: message.from ?? '',
        to: message.to ?? '',
        text: isSelf
            ? 'You recalled a message.'
            : 'The sender recalled a message.',
        isSelf: isSelf,
        serverTimeMs: message.serverTime,
        msgType: 'recall',
        customEvent: event,
        senderName: sender.name,
        senderAvatar: sender.avatar,
        senderUid: sender.uid,
        senderGender: sender.gender,
        isGroup: isGroup,
        failed: false,
      );
    }

    if (event == 'JoinGroupMessage') {
      final join = _parseJoinGroupParams(params);
      final name = join.name.isEmpty ? 'Someone' : join.name;
      return ImChatMessage(
        id: message.msgId,
        conversationId: conversationId,
        from: message.from ?? '',
        to: message.to ?? '',
        text: '$name joined the community',
        isSelf: isSelf,
        serverTimeMs: message.serverTime,
        msgType: 'join',
        customEvent: event,
        joinName: name,
        joinUid: join.uid,
        senderName: sender.name.isNotEmpty ? sender.name : name,
        senderAvatar: sender.avatar,
        senderUid: sender.uid.isNotEmpty ? sender.uid : join.uid,
        senderGender: sender.gender,
        isGroup: isGroup,
        failed: message.status == MessageStatus.FAIL,
      );
    }

    // 贴纸 / Smiley 等：优先取 params 中的原始 emoji / 文本。
    if (event == 'Smiley' || event == 'Emoji' || event == 'sticker') {
      final emoji = _firstParam(params, const [
        'emoji',
        'text',
        'content',
        'smiley',
        'name',
      ]);
      return ImChatMessage(
        id: message.msgId,
        conversationId: conversationId,
        from: message.from ?? '',
        to: message.to ?? '',
        text: emoji.isNotEmpty ? emoji : '😊',
        isSelf: isSelf,
        serverTimeMs: message.serverTime,
        msgType: 'txt',
        customEvent: event,
        senderName: sender.name,
        senderAvatar: sender.avatar,
        senderUid: sender.uid,
        senderGender: sender.gender,
        isGroup: isGroup,
        failed: message.status == MessageStatus.FAIL,
      );
    }

    final preview = _customPreview(body, message: message);
    return ImChatMessage(
      id: message.msgId,
      conversationId: conversationId,
      from: message.from ?? '',
      to: message.to ?? '',
      text: preview,
      isSelf: isSelf,
      serverTimeMs: message.serverTime,
      msgType: 'custom',
      customEvent: event,
      senderName: sender.name,
      senderAvatar: sender.avatar,
      senderUid: sender.uid,
      senderGender: sender.gender,
      isGroup: isGroup,
      failed: message.status == MessageStatus.FAIL,
    );
  }

  static ({int id, int qty, String name, String iconUrl}) _parseGiftParams(
    Map<String, String> params,
  ) {
    var id = 0;
    var qty = 1;
    var name = '';
    var iconUrl = '';
    final raw = params['content'] ?? params['gift'] ?? '';
    if (raw.isEmpty) {
      id = int.tryParse(params['id'] ?? params['giftId'] ?? '') ?? 0;
      qty = int.tryParse(params['itemCount'] ?? params['qty'] ?? '1') ?? 1;
      name = params['name'] ?? params['giftName'] ?? '';
      iconUrl = params['icon'] ?? params['giftIcon'] ?? '';
      return (id: id, qty: qty, name: name, iconUrl: iconUrl);
    }
    try {
      final decoded = jsonDecode(raw);
      if (decoded is Map) {
        final map = Map<String, dynamic>.from(decoded);
        final item = map['item'];
        if (item is Map) {
          final im = Map<String, dynamic>.from(item);
          id = int.tryParse('${im['id'] ?? ''}') ?? 0;
          name = '${im['name'] ?? im['title'] ?? ''}'.trim();
          iconUrl = '${im['icon'] ?? im['iconUrl'] ?? im['url'] ?? ''}'.trim();
        }
        qty = int.tryParse('${map['itemCount'] ?? map['count'] ?? '1'}') ?? 1;
        if (name.isEmpty) {
          name = '${map['name'] ?? map['giftName'] ?? ''}'.trim();
        }
        if (iconUrl.isEmpty) {
          iconUrl = '${map['icon'] ?? map['giftIcon'] ?? ''}'.trim();
        }
      }
    } catch (error) {
      AppLog.e('ImService parse gift', error: error);
    }
    if (qty < 1) qty = 1;
    return (id: id, qty: qty, name: name, iconUrl: iconUrl);
  }

  /// 入群提示参数：扁平 `name`/`uid`，或 JSON `content`（服务端 / forya）。
  static ({String name, String uid}) _parseJoinGroupParams(
    Map<String, String>? params,
  ) {
    if (params == null || params.isEmpty) {
      return (name: '', uid: '');
    }
    var name = _displayJoinName(params['name'] ?? '');
    var uid = (params['uid'] ?? params['userId'] ?? '').trim();
    final raw = (params['content'] ?? '').trim();
    if (raw.startsWith('{')) {
      try {
        final decoded = jsonDecode(raw);
        if (decoded is Map) {
          final map = Map<String, dynamic>.from(decoded);
          final n = _displayJoinName('${map['name'] ?? map['nickname'] ?? ''}');
          final u = '${map['uid'] ?? map['userId'] ?? map['id'] ?? ''}'.trim();
          if (n.isNotEmpty) name = n;
          if (u.isNotEmpty) uid = u;
        }
      } catch (_) {
        // 入群通知的 attributes 不是 JSON（不同版本发的格式不一样）：
        // 保留已解析出的 name / uid，界面显示「Someone joined」。
      }
    }
    return (name: name, uid: uid);
  }

  /// 过滤占位昵称（全下划线 / 波浪线），避免列表预览变成 `____ joined…`。
  static String _displayJoinName(String raw) {
    final name = raw.trim();
    if (name.isEmpty) return '';
    if (RegExp(r'^[_~\-\s·.]+$').hasMatch(name)) return '';
    return name;
  }

  static String _firstParam(Map<String, String> params, List<String> keys) {
    for (final k in keys) {
      final v = (params[k] ?? '').trim();
      if (v.isNotEmpty && !v.startsWith('{') && !v.startsWith('[')) return v;
    }
    return '';
  }

}
