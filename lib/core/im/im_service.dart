import 'dart:async';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:im_flutter_sdk/im_flutter_sdk.dart';

import '../auth/auth_session.dart';
import '../network/network_bootstrap.dart';

/// Lightweight DM message event for UI (peer or self).
class ImChatMessage {
  const ImChatMessage({
    required this.id,
    required this.conversationId,
    required this.from,
    required this.to,
    required this.text,
    required this.isSelf,
    required this.serverTimeMs,
    this.msgType = 'txt',
    this.mediaLocalPath = '',
    this.mediaRemoteUrl = '',
    this.thumbnailUrl = '',
    this.durationSecs = 0,
  });

  final String id;
  final String conversationId;
  final String from;
  final String to;
  final String text;
  final bool isSelf;
  final int serverTimeMs;

  /// `txt` | `image` | `voice` | `custom`
  final String msgType;

  /// Local file path when available (sent / already downloaded).
  final String mediaLocalPath;

  /// Remote CDN / EaseMob path for image or voice.
  final String mediaRemoteUrl;

  /// Image thumbnail (prefer when full image is large).
  final String thumbnailUrl;

  /// Voice duration in seconds.
  final int durationSecs;

  /// Prefer existing local file, else remote URL, else thumbnail.
  String get playableOrDisplayUrl {
    final local = mediaLocalPath.trim();
    if (local.isNotEmpty) {
      try {
        if (File(local).existsSync()) return local;
      } catch (_) {}
    }
    final remote = mediaRemoteUrl.trim();
    if (remote.isNotEmpty) return remote;
    return thumbnailUrl.trim();
  }
}

/// EaseMob IM facade for Chimo (init / login / DM send-receive).
///
/// Credentials: `/user/conf` → imConfig.appKey; `/user/info` → emUsername/emPwd.
/// Conversation id for 1v1 is the peer's **emUsername** (e.g. yqdf-...).
abstract final class ImService {
  static const _handlerId = 'chimo_im';
  static bool _sdkInited = false;
  static String? _appKey;
  static String? _currentEmUser;
  static bool _connected = false;
  static StreamSubscription<void>? _noop;

  static final StreamController<ImChatMessage> _messagesController =
      StreamController<ImChatMessage>.broadcast();

  static final StreamController<void> _connectionController =
      StreamController<void>.broadcast();

  /// Incoming + outgoing text (and simple status) for open chats / list.
  static Stream<ImChatMessage> get messages => _messagesController.stream;

  static Stream<void> get connectionChanges => _connectionController.stream;

  static bool get isConnected => _connected;

  static String? get currentEmUser => _currentEmUser;

  /// Load conf + credentials and connect. Safe to call multiple times.
  static Future<void> connectFromServer() async {
    try {
      await _ensureAppKey();
      await _initSdk();
      final creds = await _loadCredentials();
      if (creds == null) {
        debugPrint('ImService: missing emUsername/emPwd');
        return;
      }
      await _login(creds.$1, creds.$2);
    } catch (error, stack) {
      debugPrint('ImService.connectFromServer failed: $error\n$stack');
    }
  }

  static Future<void> _ensureAppKey() async {
    if (_appKey != null && _appKey!.isNotEmpty) return;
    final conf = await NetworkBootstrap.api.userConf();
    final key = _parseAppKey(conf.data);
    if (key == null || key.isEmpty) {
      throw StateError('imConfig.appKey missing from /user/conf');
    }
    _appKey = key;
    debugPrint('ImService appKey loaded (${key.length} chars)');
  }

  static String? _parseAppKey(Object? data) {
    if (data is! Map) return null;
    final map = Map<String, dynamic>.from(data);
    final im = map['imConfig'] ?? map['im'] ?? map['ImConfig'];
    if (im is Map) {
      final k = '${im['appKey'] ?? im['app_key'] ?? im['appId'] ?? ''}';
      if (k.isNotEmpty) return k;
    }
    final direct = '${map['appKey'] ?? map['imAppKey'] ?? ''}';
    return direct.isEmpty ? null : direct;
  }

  static Future<(String, String)?> _loadCredentials() async {
    var emUser = await AuthSession.emUsername();
    var emPwd = await AuthSession.emPassword();
    if (emUser != null &&
        emUser.isNotEmpty &&
        emPwd != null &&
        emPwd.isNotEmpty) {
      return (emUser, emPwd);
    }

    final info = await NetworkBootstrap.api.userInfo();
    if (!info.success || info.data is! Map) return null;
    final root = Map<String, dynamic>.from(info.data as Map);
    final user = root['user'] is Map
        ? Map<String, dynamic>.from(root['user'] as Map)
        : root;
    emUser = '${user['emUsername'] ?? user['emUserName'] ?? ''}'.trim();
    emPwd = '${user['emPwd'] ?? user['emPassword'] ?? ''}'.trim();
    final uid = '${user['id'] ?? ''}'.trim();
    final nick = '${user['nickname'] ?? user['nickName'] ?? ''}'.trim();
    final avatar = '${user['avatar'] ?? ''}'.trim();
    if (emUser.isEmpty || emPwd.isEmpty) return null;
    await AuthSession.markLoggedIn(
      userId: uid.isEmpty ? null : uid,
      nickname: nick.isEmpty ? null : nick,
      avatarUrl: avatar.isEmpty ? null : avatar,
      emUsername: emUser,
      emPassword: emPwd,
    );
    return (emUser, emPwd);
  }

  static Future<void> _initSdk() async {
    if (_sdkInited) return;
    final key = _appKey;
    if (key == null || key.isEmpty) {
      throw StateError('ImService: appKey required before init');
    }
    final options = EMOptions.withAppKey(
      key,
      autoLogin: false,
      debugMode: kDebugMode,
      requireAck: true,
      requireDeliveryAck: true,
      acceptInvitationAlways: true,
      autoAcceptGroupInvitation: true,
    );
    await EMClient.getInstance.init(options);
    await EMClient.getInstance.startCallback();

    EMClient.getInstance.addConnectionEventHandler(
      _handlerId,
      EMConnectionEventHandler(
        onConnected: () {
          _connected = true;
          debugPrint('ImService onConnected as $_currentEmUser');
          if (!_connectionController.isClosed) {
            _connectionController.add(null);
          }
        },
        onDisconnected: () {
          _connected = false;
          debugPrint('ImService onDisconnected');
          if (!_connectionController.isClosed) {
            _connectionController.add(null);
          }
        },
        onUserKickedByOtherDevice: () {
          _connected = false;
          debugPrint('ImService kicked by other device');
        },
        onUserDidLoginFromOtherDevice: (_) {
          _connected = false;
          debugPrint('ImService login from other device');
        },
      ),
    );

    EMClient.getInstance.chatManager.addEventHandler(
      _handlerId,
      EMChatEventHandler(
        onMessagesReceived: (messages) {
          for (final m in messages) {
            _emitEmMessage(m);
          }
        },
      ),
    );

    _sdkInited = true;
    debugPrint('ImService SDK inited');
  }

  static Future<void> _login(String user, String password) async {
    if (user.isEmpty || password.isEmpty) return;
    try {
      if (_currentEmUser != null &&
          _currentEmUser != user &&
          await EMClient.getInstance.isLoginBefore()) {
        await EMClient.getInstance.logout(true);
      }
      // Prefer password API (login() is deprecated on 4.15).
      await EMClient.getInstance.loginWithPassword(user, password);
      _currentEmUser = user;
      debugPrint('ImService loginWithPassword ok: $user');
    } on EMError catch (e) {
      debugPrint('ImService login failed code=${e.code} desc=${e.description}');
      // Already logged in same account is often OK.
      if (e.code == 200 || e.description.contains('already')) {
        _currentEmUser = user;
      }
    }
  }

  static Future<void> logout() async {
    try {
      if (_sdkInited) {
        await EMClient.getInstance.logout(true);
      }
    } catch (error) {
      debugPrint('ImService logout error: $error');
    }
    _currentEmUser = null;
    _connected = false;
  }

  /// Send 1v1 text. [peerEmUsername] is conversation id on EaseMob.
  static Future<ImChatMessage?> sendText({
    required String peerEmUsername,
    required String content,
  }) async {
    final text = content.trim();
    if (text.isEmpty || peerEmUsername.isEmpty) return null;
    if (!_sdkInited) await connectFromServer();
    try {
      final msg = EMMessage.createTxtSendMessage(
        targetId: peerEmUsername,
        content: text,
      );
      msg.chatType = ChatType.Chat;
      await _applySenderAttrs(msg);
      final sent = await EMClient.getInstance.chatManager.sendMessage(msg);
      return _emitAndReturn(sent, forceSelf: true);
    } on EMError catch (e) {
      debugPrint('ImService sendText failed ${e.code} ${e.description}');
      rethrow;
    }
  }

  /// Send 1v1 voice file (local path + duration seconds).
  static Future<ImChatMessage?> sendVoice({
    required String peerEmUsername,
    required String filePath,
    required int durationSecs,
  }) async {
    final path = filePath.trim();
    if (path.isEmpty || peerEmUsername.isEmpty) return null;
    if (durationSecs < 1) {
      throw StateError('Voice too short');
    }
    if (!_sdkInited) await connectFromServer();
    try {
      var local = path;
      if (local.startsWith('file://')) {
        local = local.substring(7);
      }
      final file = File(local);
      if (!file.existsSync()) {
        throw StateError('Voice file missing: $local');
      }
      final msg = EMMessage.createVoiceSendMessage(
        targetId: peerEmUsername,
        filePath: local,
        duration: durationSecs,
        fileSize: file.lengthSync(),
        displayName: local.split(RegExp(r'[/\\]')).last,
      );
      msg.chatType = ChatType.Chat;
      await _applySenderAttrs(msg);
      final sent = await EMClient.getInstance.chatManager.sendMessage(msg);
      return _emitAndReturn(sent, forceSelf: true);
    } on EMError catch (e) {
      debugPrint('ImService sendVoice failed ${e.code} ${e.description}');
      rethrow;
    }
  }

  /// Send 1v1 image (local file path).
  static Future<ImChatMessage?> sendImage({
    required String peerEmUsername,
    required String filePath,
    bool sendOriginalImage = false,
  }) async {
    final path = filePath.trim();
    if (path.isEmpty || peerEmUsername.isEmpty) return null;
    if (!_sdkInited) await connectFromServer();
    try {
      var local = path;
      if (local.startsWith('file://')) {
        local = local.substring(7);
      }
      final file = File(local);
      if (!file.existsSync()) {
        throw StateError('Image file missing: $local');
      }
      final msg = EMMessage.createImageSendMessage(
        targetId: peerEmUsername,
        filePath: local,
        sendOriginalImage: sendOriginalImage,
        fileSize: file.lengthSync(),
        displayName: local.split(RegExp(r'[/\\]')).last,
      );
      msg.chatType = ChatType.Chat;
      await _applySenderAttrs(msg);
      final sent = await EMClient.getInstance.chatManager.sendMessage(msg);
      return _emitAndReturn(sent, forceSelf: true);
    } on EMError catch (e) {
      debugPrint('ImService sendImage failed ${e.code} ${e.description}');
      rethrow;
    }
  }

  static Future<void> _applySenderAttrs(EMMessage msg) async {
    final self = _currentEmUser ?? (await AuthSession.emUsername()) ?? '';
    if (self.isEmpty) return;
    msg.attributes = {
      'emID': self,
      'name': await AuthSession.nickname() ?? '',
      'userid': await AuthSession.userId() ?? '',
    };
  }

  static ImChatMessage? _emitAndReturn(
    EMMessage sent, {
    bool forceSelf = false,
  }) {
    final out = _fromEm(sent, forceSelf: forceSelf);
    if (out != null && !_messagesController.isClosed) {
      _messagesController.add(out);
    }
    return out;
  }

  /// Local + attempt server history for a 1v1 conversation.
  static Future<List<ImChatMessage>> loadHistory(
    String peerEmUsername, {
    int count = 40,
  }) async {
    if (peerEmUsername.isEmpty) return const [];
    if (!_sdkInited) await connectFromServer();
    try {
      final conv = await EMClient.getInstance.chatManager.getConversation(
        peerEmUsername,
        type: EMConversationType.Chat,
        createIfNeed: true,
      );
      if (conv == null) return const [];

      var list = await conv.loadMessages(
        startMsgId: '',
        loadCount: count,
      );
      if (list.isEmpty) {
        try {
          final result =
              await EMClient.getInstance.chatManager.fetchHistoryMessages(
            conversationId: peerEmUsername,
            type: EMConversationType.Chat,
            pageSize: count,
          );
          list = result.data;
        } catch (error) {
          debugPrint('ImService fetchHistory: $error');
        }
      }

      final out = <ImChatMessage>[];
      for (final m in list) {
        final mapped = _fromEm(m);
        if (mapped != null) out.add(mapped);
      }
      out.sort((a, b) => a.serverTimeMs.compareTo(b.serverTimeMs));
      return out;
    } catch (error) {
      debugPrint('ImService.loadHistory failed: $error');
      return const [];
    }
  }

  /// Open EM conversations of Chat type for list previews.
  static Future<List<EMConversation>> loadDmConversations() async {
    if (!_sdkInited) await connectFromServer();
    try {
      final all =
          await EMClient.getInstance.chatManager.loadAllConversations();
      return [
        for (final c in all)
          if (c.type == EMConversationType.Chat) c,
      ];
    } catch (error) {
      debugPrint('ImService.loadDmConversations: $error');
      return const [];
    }
  }

  static Future<String> previewFor(EMConversation conv) async {
    try {
      final latest = await conv.latestMessage();
      if (latest == null) return '';
      return previewText(latest);
    } catch (_) {
      return '';
    }
  }

  static String previewText(EMMessage message) {
    final body = message.body;
    if (body is EMTextMessageBody) return body.content;
    if (body is EMImageMessageBody) return '[Image]';
    if (body is EMVoiceMessageBody) {
      final d = body.duration;
      return d > 0 ? '[Voice] $d"' : '[Voice]';
    }
    if (body is EMCustomMessageBody) {
      final event = body.event;
      return event.isEmpty ? '[Message]' : '[$event]';
    }
    return '[Message]';
  }

  static void _emitEmMessage(EMMessage message) {
    final out = _fromEm(message);
    if (out == null) return;
    if (!_messagesController.isClosed) {
      _messagesController.add(out);
    }
  }

  static String _pickLocal(String? path) {
    final p = path?.trim() ?? '';
    return p;
  }

  static String _pickRemote(String? path) {
    final p = path?.trim() ?? '';
    if (p.startsWith('http://') || p.startsWith('https://')) return p;
    // EaseMob sometimes yields bare paths; keep if non-empty for download.
    return p;
  }

  static ImChatMessage? _fromEm(EMMessage message, {bool forceSelf = false}) {
    final body = message.body;
    var text = '';
    var type = 'txt';
    var local = '';
    var remote = '';
    var thumb = '';
    var durationSecs = 0;

    if (body is EMTextMessageBody) {
      text = body.content;
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
      text = body.event.isEmpty ? '[Message]' : '[${body.event}]';
      type = 'custom';
    } else {
      return null;
    }

    final selfUser = _currentEmUser ?? '';
    final isSelf = forceSelf ||
        message.direction == MessageDirection.SEND ||
        (selfUser.isNotEmpty && message.from == selfUser);

    final convIdRaw = message.conversationId?.trim() ?? '';
    final conversationId = convIdRaw.isNotEmpty
        ? convIdRaw
        : (isSelf ? (message.to ?? '') : (message.from ?? ''));

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
    );
  }

  /// For tests / hot restart.
  static Future<void> dispose() async {
    await _noop?.cancel();
    await logout();
  }
}
