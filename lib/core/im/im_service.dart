import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:im_flutter_sdk/im_flutter_sdk.dart';

import '../auth/auth_session.dart';
import '../network/app_apis.dart';
import 'im_system_accounts.dart';

/// 供 UI 使用的轻量私聊消息事件（对端或自己）。
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
    this.customEvent = '',
    this.giftId = 0,
    this.giftQty = 1,
    this.giftName = '',
    this.giftIconUrl = '',
    this.emoteUrl = '',
    this.emoteName = '',
    this.joinName = '',
    this.joinUid = '',
    this.isGroup = false,
  });

  final String id;
  final String conversationId;
  final String from;
  final String to;
  final String text;
  final bool isSelf;
  final int serverTimeMs;

  /// 消息类型：`txt` | `image` | `voice` | `gift` | `follow` | `emote` | `join` | `custom`
  final String msgType;

  /// 可用时的本地文件路径（已发送 / 已下载）。
  final String mediaLocalPath;

  /// 图片或语音的远程 CDN / 环信路径。
  final String mediaRemoteUrl;

  /// 图片缩略图（大图时优先使用）。
  final String thumbnailUrl;

  /// 语音时长（秒）。
  final int durationSecs;

  /// 环信自定义消息体事件（SendGift、Smiley 等）。
  final String customEvent;

  final int giftId;
  final int giftQty;
  final String giftName;
  final String giftIconUrl;

  /// 贴纸图片 URL（表情消息）。
  final String emoteUrl;
  final String emoteName;

  /// 入群提示（JoinGroupMessage）。
  final String joinName;
  final String joinUid;

  /// GroupChat 与 Chat（私聊 / 系统）。
  final bool isGroup;

  /// 优先已有本地文件，否则远程 URL，再否则缩略图。
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

/// 私聊历史一页，用于懒加载。
class ImHistoryPage {
  const ImHistoryPage({
    required this.messages,
    required this.hasMore,
  });

  final List<ImChatMessage> messages;
  final bool hasMore;
}

/// Chimo 的环信 IM 门面（初始化 / 登录 / 私聊收发）。
///
/// 凭证：`/user/conf` → imConfig.appKey；`/user/info` → emUsername/emPwd。
/// 1v1 会话 id 为对端的 **emUsername**（如 yqdf-...）。
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

  /// 打开中的会话 / 列表用的收发文本（及简单状态）。
  static Stream<ImChatMessage> get messages => _messagesController.stream;

  static Stream<void> get connectionChanges => _connectionController.stream;

  static bool get isConnected => _connected;

  static String? get currentEmUser => _currentEmUser;

  /// 加载配置 + 凭证并连接。可安全多次调用。
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
    final conf = await AppApis.user.imAppKey();
    final key = conf.data;
    if (!conf.ok || key == null || key.isEmpty) {
      throw StateError('imConfig.appKey missing from /user/conf');
    }
    _appKey = key;
    debugPrint('ImService appKey loaded (${key.length} chars)');
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

    final info = await AppApis.user.imCredentials();
    if (!info.ok || info.data == null) return null;
    final creds = info.data!;
    await AuthSession.markLoggedIn(
      userId: creds.profile.userId.isEmpty ? null : creds.profile.userId,
      nickname:
          creds.profile.displayName.isEmpty ? null : creds.profile.displayName,
      avatarUrl: (creds.profile.avatarUrl == null ||
              creds.profile.avatarUrl!.isEmpty)
          ? null
          : creds.profile.avatarUrl,
      emUsername: creds.emUser,
      emPassword: creds.emPwd,
    );
    return (creds.emUser, creds.emPwd);
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
      // 优先使用密码 API（4.15 上 login() 已弃用）。
      await EMClient.getInstance.loginWithPassword(user, password);
      _currentEmUser = user;
      debugPrint('ImService loginWithPassword ok: $user');
    } on EMError catch (e) {
      debugPrint('ImService login failed code=${e.code} desc=${e.description}');
      // 同一账号已登录通常可接受。
      if (e.code == 200 || e.description.contains('already')) {
        _currentEmUser = user;
      }
    }
  }

  static Future<void> logout() async {
    try {
      if (_sdkInited) {
        // 弱网下 unbindDeviceToken 可能卡住；保持登出快速。
        try {
          await EMClient.getInstance
              .logout(true)
              .timeout(const Duration(seconds: 2));
        } on TimeoutException {
          debugPrint('ImService logout(true) timed out; retry without unbind');
          await EMClient.getInstance
              .logout(false)
              .timeout(const Duration(seconds: 1));
        }
      }
    } catch (error) {
      debugPrint('ImService logout error: $error');
    }
    _currentEmUser = null;
    _connected = false;
  }

  /// 发送文本。[peerEmUsername] 为对端环信 id；[isGroup] 时为群 id。
  ///
  /// [extra] 写入消息 attributes 的 `extra`（forya 表情载荷）。
  static Future<ImChatMessage?> sendText({
    required String peerEmUsername,
    required String content,
    Map<String, dynamic>? extra,
    bool isGroup = false,
  }) async {
    final text = content.trim();
    if (text.isEmpty || peerEmUsername.isEmpty) return null;
    if (!_sdkInited) await connectFromServer();
    try {
      final msg = EMMessage.createTxtSendMessage(
        targetId: peerEmUsername,
        content: text,
      );
      msg.chatType = isGroup ? ChatType.GroupChat : ChatType.Chat;
      await _applySenderAttrs(msg);
      if (extra != null && extra.isNotEmpty) {
        final attrs = Map<String, dynamic>.from(msg.attributes ?? const {});
        attrs['extra'] = extra;
        msg.attributes = attrs;
      }
      final sent = await EMClient.getInstance.chatManager.sendMessage(msg);
      return _emitAndReturn(sent, forceSelf: true);
    } on EMError catch (e) {
      debugPrint('ImService sendText failed ${e.code} ${e.description}');
      rethrow;
    }
  }

  /// 发送贴纸（forya sendEmote）：文本 `[name]` + attributes.extra.emote。
  static Future<ImChatMessage?> sendEmote({
    required String peerEmUsername,
    required String packId,
    required String stickerId,
    required String name,
    required String url,
    bool isGroup = false,
  }) {
    return sendText(
      peerEmUsername: peerEmUsername,
      content: '[${name.isEmpty ? 'Sticker' : name}]',
      isGroup: isGroup,
      extra: {
        'type': 'emote',
        'emote': {
          'emoticons_id': packId,
          'id': stickerId,
          'desc': name,
          'url': url,
        },
      },
    );
  }

  /// 关注 / 取消关注后的 forya `im_follow_message` 提示。
  static Future<ImChatMessage?> sendFollowTip({
    required String peerEmUsername,
    required bool followed,
  }) async {
    if (peerEmUsername.isEmpty) return null;
    if (!_sdkInited) await connectFromServer();
    try {
      final msg = EMMessage.createCustomSendMessage(
        targetId: peerEmUsername,
        event: 'im_follow_message',
        params: {'follow': followed ? '1' : '0'},
      );
      msg.chatType = ChatType.Chat;
      await _applySenderAttrs(msg);
      final sent = await EMClient.getInstance.chatManager.sendMessage(msg);
      return _emitAndReturn(sent, forceSelf: true);
    } on EMError catch (e) {
      debugPrint('ImService sendFollowTip failed ${e.code} ${e.description}');
      rethrow;
    }
  }

  /// 发送语音文件（本地路径 + 时长秒数）。
  static Future<ImChatMessage?> sendVoice({
    required String peerEmUsername,
    required String filePath,
    required int durationSecs,
    bool isGroup = false,
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
      msg.chatType = isGroup ? ChatType.GroupChat : ChatType.Chat;
      await _applySenderAttrs(msg);
      final sent = await EMClient.getInstance.chatManager.sendMessage(msg);
      return _emitAndReturn(sent, forceSelf: true);
    } on EMError catch (e) {
      debugPrint('ImService sendVoice failed ${e.code} ${e.description}');
      rethrow;
    }
  }

  /// 发送图片（本地文件路径）。
  static Future<ImChatMessage?> sendImage({
    required String peerEmUsername,
    required String filePath,
    bool sendOriginalImage = false,
    bool isGroup = false,
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
      msg.chatType = isGroup ? ChatType.GroupChat : ChatType.Chat;
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

  /// 某会话的本地 + 服务端历史分页。
  ///
  /// [startMsgId] 为空 = 第一页（最新）。非空 = 该 id 之前的更早一页。
  /// 对齐 forya ChatController.loadMessages 分页。
  static Future<ImHistoryPage> loadHistory(
    String conversationId, {
    String startMsgId = '',
    int count = 20,
    bool isGroup = false,
  }) async {
    if (conversationId.isEmpty) {
      return const ImHistoryPage(messages: [], hasMore: false);
    }
    if (!_sdkInited) await connectFromServer();
    final convType =
        isGroup ? EMConversationType.GroupChat : EMConversationType.Chat;
    try {
      final conv = await EMClient.getInstance.chatManager.getConversation(
        conversationId,
        type: convType,
        createIfNeed: true,
      );
      if (conv == null) {
        return const ImHistoryPage(messages: [], hasMore: false);
      }

      var list = await conv.loadMessages(
        startMsgId: startMsgId,
        loadCount: count,
        direction: EMSearchDirection.Up,
      );

      // 打开更早分页或本地页不足时，从服务端拉取。
      if (startMsgId.isNotEmpty || list.length < count) {
        try {
          final cursorResult =
              await EMClient.getInstance.chatManager.fetchHistoryMessagesByOption(
            conversationId,
            convType,
            options: FetchMessageOptions(
              direction: EMSearchDirection.Up,
              needSave: true,
            ),
            cursor: startMsgId.isEmpty ? null : startMsgId,
            pageSize: count,
          );
          // 服务端 Up 为最新在前；翻转为最旧在前。
          list = cursorResult.data.reversed.toList();
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
      return ImHistoryPage(
        messages: out,
        hasMore: list.length >= count,
      );
    } catch (error) {
      debugPrint('ImService.loadHistory failed: $error');
      return const ImHistoryPage(messages: [], hasMore: false);
    }
  }

  /// 在环信将 1v1 会话标为已读（本地 + 已读回执）。
  ///
  /// 否则列表角标在 UI 清除后，重启又会回来。
  static Future<void> markConversationRead(
    String peerEmUsername, {
    bool isGroup = false,
  }) async {
    final id = peerEmUsername.trim();
    if (id.isEmpty) return;
    if (!_sdkInited) await connectFromServer();
    try {
      final conv = await EMClient.getInstance.chatManager.getConversation(
        id,
        type: isGroup ? EMConversationType.GroupChat : EMConversationType.Chat,
        createIfNeed: false,
      );
      if (conv == null) return;
      await conv.markAllMessagesAsRead();
      if (!isGroup) {
        try {
          await EMClient.getInstance.chatManager.sendConversationReadAck(id);
        } catch (error) {
          debugPrint('ImService sendConversationReadAck: $error');
        }
      }
    } catch (error) {
      debugPrint('ImService.markConversationRead failed: $error');
    }
  }

  /// 删除本地（+ 远程）会话 — forya `ConversationController.removeItem`。
  static Future<void> deleteConversation(
    String conversationId, {
    bool isGroup = false,
    bool deleteMessages = true,
  }) async {
    final id = conversationId.trim();
    if (id.isEmpty) return;
    if (!_sdkInited) await connectFromServer();
    final type =
        isGroup ? EMConversationType.GroupChat : EMConversationType.Chat;
    try {
      final conv = await EMClient.getInstance.chatManager.getConversation(
        id,
        type: type,
        createIfNeed: false,
      );
      if (conv != null) {
        try {
          await conv.deleteAllMessages();
        } catch (error) {
          debugPrint('ImService deleteAllMessages: $error');
        }
      }
      await EMClient.getInstance.chatManager.deleteConversation(
        id,
        deleteMessages: deleteMessages,
      );
      try {
        await EMClient.getInstance.chatManager.deleteRemoteConversation(
          id,
          conversationType: type,
          isDeleteMessage: deleteMessages,
        );
      } catch (error) {
        debugPrint('ImService deleteRemoteConversation: $error');
      }
    } catch (error) {
      debugPrint('ImService.deleteConversation failed: $error');
    }
  }

  /// 打开环信会话供列表合并（1v1 Chat + GroupChat）。
  static Future<List<EMConversation>> loadListConversations() async {
    if (!_sdkInited) await connectFromServer();
    try {
      final all =
          await EMClient.getInstance.chatManager.loadAllConversations();
      return [
        for (final c in all)
          if (c.type == EMConversationType.Chat ||
              c.type == EMConversationType.GroupChat)
            c,
      ];
    } catch (error) {
      debugPrint('ImService.loadListConversations: $error');
      return const [];
    }
  }

  /// 打开 Chat 类型环信会话供列表预览。
  static Future<List<EMConversation>> loadDmConversations() async {
    final all = await loadListConversations();
    return [
      for (final c in all)
        if (c.type == EMConversationType.Chat) c,
    ];
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

  static Future<int> latestTimeMs(EMConversation conv) async {
    try {
      final latest = await conv.latestMessage();
      return latest?.serverTime ?? 0;
    } catch (_) {
      return 0;
    }
  }

  static String previewText(EMMessage message) {
    final body = message.body;
    if (body is EMTextMessageBody) {
      final emote = _emoteFromAttributes(message.attributes);
      if (emote != null) {
        return emote.name.isEmpty ? '[Sticker]' : '[${emote.name}]';
      }
      return body.content;
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
    if (event.isEmpty) return '[Message]';
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
      case 'im_follow_message':
        return 'Followed you';
      case 'JoinGroupMessage':
        final join = _parseJoinGroupParams(body.params);
        if (join.name.isNotEmpty) {
          return '${join.name} joined the community';
        }
        return 'joined the community';
      case 'SystemNotify':
        final params = body.params;
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
        return '[Message]';
      default:
        return '[$event]';
    }
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
    // 环信有时只给裸路径；非空则保留以便下载。
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
      final emote = _emoteFromAttributes(message.attributes);
      if (emote != null) {
        type = 'emote';
        remote = emote.url;
        text = emote.name.isEmpty ? text : '[${emote.name}]';
        return _finishEm(
          message,
          forceSelf: forceSelf,
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
      return _mapCustomBody(body, message: message, forceSelf: forceSelf);
    } else {
      return null;
    }

    return _finishEm(
      message,
      forceSelf: forceSelf,
      text: text,
      type: type,
      local: local,
      remote: remote,
      thumb: thumb,
      durationSecs: durationSecs,
    );
  }

  static ImChatMessage _finishEm(
    EMMessage message, {
    required bool forceSelf,
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
      customEvent: customEvent,
      giftId: giftId,
      giftQty: giftQty,
      giftName: giftName,
      giftIconUrl: giftIconUrl,
      emoteUrl: emoteUrl,
      emoteName: emoteName,
      isGroup: message.chatType == ChatType.GroupChat,
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
    final url =
        '${emote['url'] ?? emote['resource'] ?? emote['showUrl'] ?? ''}'
            .trim();
    if (url.isEmpty) return null;
    final name = '${emote['desc'] ?? emote['name'] ?? ''}'.trim();
    return (url: url, name: name);
  }

  static ImChatMessage? _mapCustomBody(
    EMCustomMessageBody body, {
    required EMMessage message,
    bool forceSelf = false,
  }) {
    final selfUser = _currentEmUser ?? '';
    final isSelf = forceSelf ||
        message.direction == MessageDirection.SEND ||
        (selfUser.isNotEmpty && message.from == selfUser);
    final convIdRaw = message.conversationId?.trim() ?? '';
    final conversationId = convIdRaw.isNotEmpty
        ? convIdRaw
        : (isSelf ? (message.to ?? '') : (message.from ?? ''));

    final event = body.event;
    final params = body.params ?? const <String, String>{};
    final isGroup = message.chatType == ChatType.GroupChat;

    if (event == 'SendGift') {
      final gift = _parseGiftParams(params);
      final name = gift.name;
      final qty = gift.qty;
      final text = name.isEmpty
          ? '[Gift] x$qty'
          : '[Gift] $name x$qty';
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
        isGroup: isGroup,
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
        isGroup: isGroup,
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
        isGroup: isGroup,
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
        isGroup: isGroup,
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
      isGroup: isGroup,
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
      debugPrint('ImService parse gift: $error');
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
    var name = (params['name'] ?? '').trim();
    var uid = (params['uid'] ?? params['userId'] ?? '').trim();
    final raw = (params['content'] ?? '').trim();
    if (raw.startsWith('{')) {
      try {
        final decoded = jsonDecode(raw);
        if (decoded is Map) {
          final map = Map<String, dynamic>.from(decoded);
          final n = '${map['name'] ?? map['nickname'] ?? ''}'.trim();
          final u = '${map['uid'] ?? map['userId'] ?? map['id'] ?? ''}'.trim();
          if (n.isNotEmpty) name = n;
          if (u.isNotEmpty) uid = u;
        }
      } catch (_) {}
    }
    return (name: name, uid: uid);
  }

  static String _firstParam(Map<String, String> params, List<String> keys) {
    for (final k in keys) {
      final v = (params[k] ?? '').trim();
      if (v.isNotEmpty && !v.startsWith('{') && !v.startsWith('[')) return v;
    }
    return '';
  }

  /// 供测试 / 热重启。
  static Future<void> dispose() async {
    await _noop?.cancel();
    await logout();
  }
}
