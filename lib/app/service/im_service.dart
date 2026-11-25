import 'dart:async';
import 'dart:io';

import 'package:chimo/app/session_info.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/scheduler.dart';
import 'package:im_flutter_sdk/im_flutter_sdk.dart';
import 'package:path_provider/path_provider.dart';

import '../chimo_api.dart';
import '../../common/utils/app_log.dart';
import '../../common/im/im_custom_events.dart';
import '../../common/im/im_custom_payload.dart';
import '../../common/im/im_models.dart';
import '../../common/im/im_message_codec.dart';
import '../../modules/heart_link/widgets/heart_link_invite_notice.dart';
import 'im_cmd_push_handler.dart';

export '../../common/im/im_models.dart';

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

  static final StreamController<void> _connectionController = StreamController<void>.broadcast();

  /// 打开中的会话 / 列表用的收发文本（及简单状态）。
  static Stream<ImChatMessage> get messages => _messagesController.stream;

  static Stream<void> get connectionChanges => _connectionController.stream;

  static bool get isConnected => _connected;

  static String? get currentEmUser => _currentEmUser;

  static String stripFileUri(String path) => ImPaths.stripFileUri(path);

  /// iOS 上 `/var` 与 `/private/var` 是同一路径，existsSync 可能漏检。
  static bool localFileExists(String path) => ImPaths.localFileExists(path);

  static String? _existingPath(String path) {
    final p = stripFileUri(path);
    if (p.isEmpty) return null;
    if (p.startsWith('/var/')) {
      final priv = '/private$p';
      if (localFileExists(priv)) return priv;
    }
    if (localFileExists(p)) return p;
    if (p.startsWith('/private/var/')) {
      final alt = p.replaceFirst('/private', '');
      if (localFileExists(alt)) return alt;
    }
    return null;
  }

  static Future<Directory> _voiceCacheDir() async {
    final root = await getApplicationSupportDirectory();
    final dir = Directory('${root.path}/im_voice');
    if (!dir.existsSync()) {
      await dir.create(recursive: true);
    }
    return dir;
  }

  static Future<String?> _cachedVoice(String msgId) async {
    final id = msgId.trim();
    if (id.isEmpty) return null;
    final dir = await _voiceCacheDir();
    final file = File('${dir.path}/$id.m4a');
    return _existingPath(file.path);
  }

  static Future<String?> _copyToVoiceCache(String msgId, String source) async {
    final id = msgId.trim();
    final srcPath = _existingPath(source);
    if (id.isEmpty || srcPath == null) return null;
    try {
      final dir = await _voiceCacheDir();
      final dest = File('${dir.path}/$id.m4a');
      if (_existingPath(dest.path) != null) return dest.path;
      await File(srcPath).copy(dest.path);
      return dest.path;
    } catch (error) {
      AppLog.w('ImService cache voice failed', error: error);
      return srcPath;
    }
  }

  /// 录音在 tmp，离开页面后 iOS 常清掉；发送前拷到持久目录。
  static Future<String> persistOutgoingVoice(String path) async {
    final srcPath = _existingPath(path);
    if (srcPath == null) return stripFileUri(path);
    try {
      final dir = await _voiceCacheDir();
      final dest = File('${dir.path}/out_${DateTime.now().millisecondsSinceEpoch}.m4a');
      await File(srcPath).copy(dest.path);
      return dest.path;
    } catch (error) {
      AppLog.w('ImService persistOutgoingVoice failed', error: error);
      return srcPath;
    }
  }

  /// CDN / 公开 http 可直接播；环信附件必须走 [downloadAttachment]。
  static bool isDirectPlayableUrl(String url) => ImPaths.isDirectPlayableUrl(url);

  static String? _localOf(ChatMessage m) {
    final body = m.body;
    if (body is! ChatFileMessageBody) return null;
    return _existingPath(body.localPath);
  }

  /// 语音/图片：本地已有则返回路径，否则按 msgId 重新下载附件。
  static Future<String?> ensureLocalAttachment(String msgId) async {
    final id = msgId.trim();
    if (id.isEmpty) return null;
    final cached = await _cachedVoice(id);
    if (cached != null) return cached;
    await ensureLoggedIn();
    try {
      var msg = await ChatClient.getInstance.chatManager.loadMessage(id);
      if (msg == null) return null;
      final existing = _localOf(msg);
      if (existing != null) {
        return await _copyToVoiceCache(id, existing) ?? existing;
      }

      final body = msg.body;
      if (body is ChatFileMessageBody) {
        // 自己发出的语音：SDK 标 SUCCESS 但 tmp 文件已不在，必须强制再下。
        if (body.fileStatus == DownloadStatus.SUCCESS || body.fileStatus == DownloadStatus.FAILED) {
          body.fileStatus = DownloadStatus.PENDING;
        }
      }

      final eventId = 'chimo_att_$id';
      final done = Completer<ChatMessage?>();
      ChatClient.getInstance.chatManager.addMessageEvent(
        eventId,
        ChatMessageEvent(
          onSuccess: (mid, message) {
            if (mid == id || message.msgId == id) {
              if (!done.isCompleted) done.complete(message);
            }
          },
          onError: (mid, message, error) {
            if (mid == id || message.msgId == id) {
              if (!done.isCompleted) done.completeError(error);
            }
          },
        ),
      );
      try {
        await ChatClient.getInstance.chatManager.downloadAttachment(msg);
        final quick = _localOf(await ChatClient.getInstance.chatManager.loadMessage(id) ?? msg);
        if (quick != null) {
          return await _copyToVoiceCache(id, quick) ?? quick;
        }
        final downloaded = await done.future.timeout(const Duration(seconds: 20));
        final path = _localOf(downloaded ?? msg);
        if (path != null) {
          return await _copyToVoiceCache(id, path) ?? path;
        }
      } finally {
        ChatClient.getInstance.chatManager.removeMessageEvent(eventId);
      }
      msg = await ChatClient.getInstance.chatManager.loadMessage(id) ?? msg;
      final last = _localOf(msg);
      if (last != null) return await _copyToVoiceCache(id, last) ?? last;
      return null;
    } catch (error) {
      AppLog.w('ImService ensureLocalAttachment failed', error: error);
      return null;
    }
  }

  /// 播放前解析：本地文件 / 公开 URL / 环信下载。
  static Future<String?> resolvePlayableMedia({
    required String mediaSource,
    String msgId = '',
  }) async {
    final cached = await _cachedVoice(msgId);
    if (cached != null) return cached;
    final src = stripFileUri(mediaSource);
    final existing = _existingPath(src);
    if (existing != null) {
      if (msgId.trim().isNotEmpty) {
        return await _copyToVoiceCache(msgId, existing) ?? existing;
      }
      return existing;
    }
    if (isDirectPlayableUrl(src)) return src;
    final downloaded = await ensureLocalAttachment(msgId);
    if (downloaded != null && downloaded.isNotEmpty) return downloaded;
    return _existingPath(src);
  }

  /// 发消息 / 拉历史前调用：保证环信已登录，不只是 SDK 已 init。
  static Future<bool> ensureLoggedIn() async {
    await connectFromServer();
    if (await _isLoggedInAsCurrentUser()) return true;
    // 凭证刚刷到 / 上次 login 失败：再试一次。
    await connectFromServer(forceLogin: true);
    return _isLoggedInAsCurrentUser();
  }

  /// 加载配置 + 凭证并连接。可安全多次调用。
  static Future<void> connectFromServer({bool forceLogin = false}) async {
    try {
      await _ensureAppKey();
      await _initSdk();
      final creds = await _loadCredentials();
      if (creds == null) {
        AppLog.w('ImService: missing emUsername/emPwd');
        return;
      }
      if (!forceLogin && await _isLoggedInAs(creds.$1)) return;
      await _login(creds.$1, creds.$2);
    } catch (error, stack) {
      AppLog.e('ImService.connectFromServer failed', error: error, stack: stack);
    }
  }

  static Future<bool> _isLoggedInAsCurrentUser() async {
    final em = SessionInfo.currentUser?.emUsername.trim() ?? '';
    if (em.isEmpty) return false;
    return _isLoggedInAs(em);
  }

  static Future<bool> _isLoggedInAs(String user) async {
    if (user.isEmpty) return false;
    try {
      final logged = await ChatClient.getInstance.isLoginBefore();
      final current = await sdkUserId();
      if (logged && current == user) {
        _currentEmUser = user;
        _connected = true;
        return true;
      }
    } catch (_) {
      // SDK 未就绪：当作未登录。
    }
    return false;
  }

  static Future<void> _ensureAppKey() async {
    if (_appKey != null && _appKey!.isNotEmpty) return;
    final conf = await ChimoApis.user.imAppKey();
    final key = conf.data;
    if (!conf.ok || key == null || key.isEmpty) {
      throw StateError('imConfig.appKey missing from /user/conf');
    }
    _appKey = key;
    AppLog.d('ImService appKey loaded (${key.length} chars)');
  }

  /// 新注册用户资料里可能暂时没有 em 凭证，缺则刷新一次 `/user/info`。
  static Future<(String, String)?> _loadCredentials() async {
    var emUser = SessionInfo.currentUser?.emUsername.trim() ?? '';
    var emPwd = SessionInfo.currentUser?.emPwd.trim() ?? '';
    if (emUser.isEmpty || emPwd.isEmpty) {
      await SessionInfo.refreshUserInfo();
      emUser = SessionInfo.currentUser?.emUsername.trim() ?? '';
      emPwd = SessionInfo.currentUser?.emPwd.trim() ?? '';
    }
    if (emUser.isEmpty || emPwd.isEmpty) return null;
    return (emUser, emPwd);
  }

  static Future<void> _initSdk() async {
    if (_sdkInited) return;
    final key = _appKey;
    if (key == null || key.isEmpty) {
      throw StateError('ImService: appKey required before init');
    }
    final options = ChatOptions.withAppKey(
      key,
      autoLogin: false,
      debugMode: kDebugMode,
      requireAck: true,
      requireDeliveryAck: true,
      acceptInvitationAlways: true,
      autoAcceptGroupInvitation: true,
    );
    await ChatClient.getInstance.init(options);
    await ChatClient.getInstance.startCallback();

    ChatClient.getInstance.addConnectionEventHandler(
      _handlerId,
      ConnectionEventHandler(
        onConnected: () {
          _connected = true;
          AppLog.i('ImService onConnected as $_currentEmUser');
          if (!_connectionController.isClosed) {
            _connectionController.add(null);
          }
        },
        onDisconnected: () {
          _connected = false;
          AppLog.i('ImService onDisconnected');
          if (!_connectionController.isClosed) {
            _connectionController.add(null);
          }
        },
        onUserKickedByOtherDevice: () {
          _connected = false;
          AppLog.w('ImService kicked by other device');
        },
        onUserDidLoginFromOtherDevice: (_) {
          _connected = false;
          AppLog.d('ImService login from other device');
        },
      ),
    );

    ChatClient.getInstance.chatManager.addEventHandler(
      _handlerId,
      ChatEventHandler(
        onMessagesReceived: (messages) {
          for (final m in messages) {
            _emitEmMessage(m);
          }
        },
        onCmdMessagesReceived: (messages) {
          ImCmdPushHandler.handleMessages(messages);
        },
        onMessagesRecalledInfo: (infos) {
          for (final info in infos) {
            _emitRecall(info);
          }
        },
      ),
    );

    _sdkInited = true;
    AppLog.d('ImService SDK inited');
  }

  static Future<void> _login(String user, String password) async {
    if (user.isEmpty || password.isEmpty) return;
    try {
      await _ensureLoggedOutOfOthers(user);
      await ChatClient.getInstance.loginWithPassword(user, password);
      _currentEmUser = user;
      _connected = true;
      AppLog.d('ImService loginWithPassword ok: $user');
    } on ChatError catch (e) {
      AppLog.w('ImService login failed code=${e.code} desc=${e.description}');
      final already = e.code == 200 || e.description.contains('already');
      if (!already) return;
      final current = await sdkUserId();
      if (current == user) {
        _currentEmUser = user;
        _connected = true;
        return;
      }
      AppLog.d('ImService already login as $current, switching to $user');
      await _forceLogout();
      await ChatClient.getInstance.loginWithPassword(user, password);
      _currentEmUser = user;
      _connected = true;
    }
  }

  static Future<String?> sdkUserId() async {
    try {
      final id = await ChatClient.getInstance.getCurrentUserId();
      if (id != null && id.trim().isNotEmpty) return id.trim();
    } catch (_) {
      // SDK 还没初始化完：当作未登录，调用方会再问一次。
    }
    final cached = ChatClient.getInstance.currentUserId?.trim();
    return (cached != null && cached.isNotEmpty) ? cached : _currentEmUser;
  }

  static Future<void> _ensureLoggedOutOfOthers(String nextUser) async {
    final current = await sdkUserId();
    var logged = false;
    try {
      logged = await ChatClient.getInstance.isLoginBefore();
    } catch (_) {
      // 同上：拿不到就按「没登录过」走完整登录流程。
    }
    if (!logged && (current == null || current.isEmpty)) return;
    if (current == nextUser) return;
    AppLog.d('ImService logout previous IM user=$current before $nextUser');
    await _forceLogout();
  }

  static Future<void> _forceLogout() async {
    try {
      await ChatClient.getInstance.logout(true).timeout(const Duration(seconds: 2));
    } catch (_) {
      try {
        await ChatClient.getInstance.logout(false).timeout(const Duration(seconds: 1));
      } catch (error) {
        AppLog.d('ImService forceLogout', error: error);
      }
    }
    _currentEmUser = null;
    _connected = false;
  }

  static Future<void> logout() async {
    await _forceLogout();
  }

  /// 发送文本。[peerEmUsername] 为对端环信 id；[isGroup] 时为群 id。
  ///
  /// [extra] 写入消息 attributes 的 `extra`（forya 表情载荷）。
  static Future<ImChatMessage?> sendText({
    required String peerEmUsername,
    required String content,
    Map<String, dynamic>? extra,
    ImQuoteMsg? quote,
    bool isGroup = false,
    ImPeerAttrs? peer,
  }) async {
    final text = content.trim();
    if (text.isEmpty || peerEmUsername.isEmpty) return null;
    await ensureLoggedIn();
    final msg = ChatMessage.createTxtSendMessage(targetId: peerEmUsername, content: text);
    msg.chatType = isGroup ? ChatType.GroupChat : ChatType.Chat;
    try {
      await _applyCommonAttrs(msg, peer: peer);
      final attrs = Map<String, dynamic>.from(msg.attributes ?? const {});
      if (extra != null && extra.isNotEmpty) {
        attrs['extra'] = extra;
      }
      if (quote != null) {
        attrs['quoteMsg'] = quote.toMap();
      }
      if (attrs.isNotEmpty) {
        msg.attributes = attrs;
      }
      final sent = await _sendMessageAwaitSuccess(msg);
      return _emitAndReturn(sent, forceSelf: true);
    } on ChatError catch (e) {
      // 201 Not login：补登一次再发（新注册后凭证晚到 / SDK 假在线）。
      if (e.code == 201) {
        AppLog.w('ImService sendText 201, re-login and retry');
        await connectFromServer(forceLogin: true);
        try {
          final sent = await _sendMessageAwaitSuccess(msg);
          return _emitAndReturn(sent, forceSelf: true);
        } on ChatError catch (retryError) {
          AppLog.w(
            'ImService sendText retry failed ${retryError.code} ${retryError.description}',
          );
          await _persistFailed(msg, peerEmUsername, isGroup: isGroup);
          rethrow;
        }
      }
      AppLog.w('ImService sendText failed ${e.code} ${e.description}');
      await _persistFailed(msg, peerEmUsername, isGroup: isGroup);
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
    ImPeerAttrs? peer,
  }) {
    return sendText(
      peerEmUsername: peerEmUsername,
      content: '[${name.isEmpty ? 'Sticker' : name}]',
      isGroup: isGroup,
      peer: peer,
      extra: {
        'type': 'emote',
        'emote': {'emoticons_id': packId, 'id': stickerId, 'desc': name, 'url': url},
      },
    );
  }

  /// 未真正发出（如发送前已知被拉黑）时，写入本地失败消息，便于重进会话仍可见。
  static Future<ImChatMessage?> appendFailedText({
    required String peerEmUsername,
    required String content,
    Map<String, dynamic>? extra,
    bool isGroup = false,
    ImPeerAttrs? peer,
  }) async {
    final text = content.trim();
    if (text.isEmpty || peerEmUsername.isEmpty) return null;
    await ensureLoggedIn();
    final msg = ChatMessage.createTxtSendMessage(targetId: peerEmUsername, content: text);
    msg.chatType = isGroup ? ChatType.GroupChat : ChatType.Chat;
    await _applyCommonAttrs(msg, peer: peer);
    if (extra != null && extra.isNotEmpty) {
      final attrs = Map<String, dynamic>.from(msg.attributes ?? const {});
      attrs['extra'] = extra;
      msg.attributes = attrs;
    }
    await _persistFailed(msg, peerEmUsername, isGroup: isGroup);
    return _fromEm(msg, forceSelf: true);
  }

  static Future<ImChatMessage?> appendFailedImage({
    required String peerEmUsername,
    required String filePath,
    bool isGroup = false,
    ImPeerAttrs? peer,
  }) async {
    final path = filePath.trim();
    if (path.isEmpty || peerEmUsername.isEmpty) return null;
    await ensureLoggedIn();
    var local = path;
    if (local.startsWith('file://')) local = local.substring(7);
    final file = File(local);
    if (!file.existsSync()) return null;
    final msg = ChatMessage.createImageSendMessage(
      targetId: peerEmUsername,
      filePath: local,
      sendOriginalImage: true,
      fileSize: file.lengthSync(),
      displayName: local.split(RegExp(r'[/\\]')).last,
    );
    msg.chatType = isGroup ? ChatType.GroupChat : ChatType.Chat;
    await _applyCommonAttrs(msg, peer: peer);
    await _persistFailed(msg, peerEmUsername, isGroup: isGroup);
    return _fromEm(msg, forceSelf: true);
  }

  static Future<ImChatMessage?> appendFailedVoice({
    required String peerEmUsername,
    required String filePath,
    required int durationSecs,
    bool isGroup = false,
    ImPeerAttrs? peer,
  }) async {
    final path = filePath.trim();
    if (path.isEmpty || peerEmUsername.isEmpty) return null;
    await ensureLoggedIn();
    var local = path;
    if (local.startsWith('file://')) local = local.substring(7);
    final file = File(local);
    if (!file.existsSync()) return null;
    final msg = ChatMessage.createVoiceSendMessage(
      targetId: peerEmUsername,
      filePath: local,
      duration: durationSecs < 1 ? 1 : durationSecs,
      fileSize: file.lengthSync(),
      displayName: local.split(RegExp(r'[/\\]')).last,
    );
    msg.chatType = isGroup ? ChatType.GroupChat : ChatType.Chat;
    await _applyCommonAttrs(msg, peer: peer);
    await _persistFailed(msg, peerEmUsername, isGroup: isGroup);
    return _fromEm(msg, forceSelf: true);
  }

  static Future<void> _persistFailed(
    ChatMessage msg,
    String peerEmUsername, {
    bool isGroup = false,
  }) async {
    msg.status = MessageStatus.FAIL;
    final convType = isGroup ? ChatConversationType.GroupChat : ChatConversationType.Chat;
    try {
      final conv = await ChatClient.getInstance.chatManager.getConversation(
        peerEmUsername,
        type: convType,
        createIfNeed: true,
      );
      if (conv == null) return;
      try {
        await conv.updateMessage(msg);
      } catch (_) {
        try {
          await conv.insertMessage(msg);
        } catch (error) {
          AppLog.e('ImService persist failed msg', error: error);
        }
      }
    } catch (error) {
      AppLog.e('ImService _persistFailed', error: error);
    }
  }

  /// 重发本地失败消息（按 msgId 从会话库取出后 resend）。
  static Future<ImChatMessage?> resendFailed({
    required String peerEmUsername,
    required String msgId,
    bool isGroup = false,
  }) async {
    final id = msgId.trim();
    if (peerEmUsername.isEmpty || id.isEmpty) return null;
    await ensureLoggedIn();
    final convType = isGroup ? ChatConversationType.GroupChat : ChatConversationType.Chat;
    try {
      final conv = await ChatClient.getInstance.chatManager.getConversation(
        peerEmUsername,
        type: convType,
        createIfNeed: true,
      );
      final local = await conv?.loadMessage(id);
      if (local == null) return null;
      final sent = await _awaitMessageSendAck(
        local,
        () => ChatClient.getInstance.chatManager.resendMessage(local),
      );
      return _emitAndReturn(sent, forceSelf: true);
    } on ChatError catch (e) {
      AppLog.w('ImService resendFailed ${e.code} ${e.description}');
      rethrow;
    }
  }

  /// 关注 / 取消关注后的 forya `im_follow_message` 提示。
  static Future<ImChatMessage?> sendFollowTip({
    required String peerEmUsername,
    required bool followed,
    ImPeerAttrs? peer,
  }) async {
    if (peerEmUsername.isEmpty) return null;
    await ensureLoggedIn();
    try {
      final msg = ChatMessage.createCustomSendMessage(
        targetId: peerEmUsername,
        event: 'im_follow_message',
        params: {'follow': followed ? '1' : '0'},
      );
      msg.chatType = ChatType.Chat;
      await _applyCommonAttrs(msg, peer: peer);
      final sent = await _sendMessageAwaitSuccess(msg);
      return _emitAndReturn(sent, forceSelf: true);
    } on ChatError catch (e) {
      AppLog.w('ImService sendFollowTip failed ${e.code} ${e.description}');
      rethrow;
    }
  }

  /// 客户端直发房间邀请（joyride `im_room_invite_message`）。
  ///
  /// 房间 Share 走服务端 `/user/invite`（会下发 `RoomInvite` V2）；
  /// 聊天页 tip「邀请进房」等场景用本方法。
  static Future<ImChatMessage?> sendRoomInvite({
    required String peerEmUsername,
    required int channelId,
    String title = '',
    String imageUrl = '',
    String content = '',
    String tag = '',
    String number = '',
    String tagIcon = '',
    String tagColors = '',
    ImPeerAttrs? peer,
  }) async {
    if (peerEmUsername.isEmpty || channelId <= 0) return null;
    await ensureLoggedIn();
    try {
      final msg = ChatMessage.createCustomSendMessage(
        targetId: peerEmUsername,
        event: ImCustomEvents.roomInvite,
        params: {
          'tit': title,
          'imageUrl': imageUrl,
          'content': content,
          'tag': tag,
          'number': number,
          'channelId': '$channelId',
          'tagIcon': tagIcon,
          'tagColors': tagColors,
        },
      );
      msg.chatType = ChatType.Chat;
      await _applyCommonAttrs(msg, peer: peer);
      final sent = await _sendMessageAwaitSuccess(msg);
      return _emitAndReturn(sent, forceSelf: true);
    } on ChatError catch (e) {
      AppLog.w('ImService sendRoomInvite failed ${e.code} ${e.description}');
      rethrow;
    }
  }

  /// 发送语音文件（本地路径 + 时长秒数）。
  static Future<ImChatMessage?> sendVoice({
    required String peerEmUsername,
    required String filePath,
    required int durationSecs,
    bool isGroup = false,
    ImPeerAttrs? peer,
  }) async {
    final path = filePath.trim();
    if (path.isEmpty || peerEmUsername.isEmpty) return null;
    if (durationSecs < 1) {
      throw StateError('Voice too short');
    }
    await ensureLoggedIn();
    var local = stripFileUri(path);
    local = await persistOutgoingVoice(local);
    final file = File(local);
    if (!file.existsSync()) {
      throw StateError('Voice file missing: $local');
    }
    final msg = ChatMessage.createVoiceSendMessage(
      targetId: peerEmUsername,
      filePath: local,
      duration: durationSecs,
      fileSize: file.lengthSync(),
      // 对齐 forya：扩展名决定 MIME；全名会被 SDK 误判成 audio/mpeg。
      displayName: '.m4a',
    );
    msg.chatType = isGroup ? ChatType.GroupChat : ChatType.Chat;
    try {
      await _applyCommonAttrs(msg, peer: peer);
      final sent = await _sendMessageAwaitSuccess(msg);
      final out = _emitAndReturn(sent, forceSelf: true);
      if (out != null && out.id.isNotEmpty) {
        _copyToVoiceCache(out.id, local);
      }
      return out;
    } on ChatError catch (e) {
      AppLog.w('ImService sendVoice failed ${e.code} ${e.description}');
      await _persistFailed(msg, peerEmUsername, isGroup: isGroup);
      rethrow;
    }
  }

  /// 发送图片（本地文件路径）。
  static Future<ImChatMessage?> sendImage({
    required String peerEmUsername,
    required String filePath,
    bool sendOriginalImage = false,
    bool isGroup = false,
    ImPeerAttrs? peer,
  }) async {
    final path = filePath.trim();
    if (path.isEmpty || peerEmUsername.isEmpty) return null;
    await ensureLoggedIn();
    var local = path;
    if (local.startsWith('file://')) {
      local = local.substring(7);
    }
    final file = File(local);
    if (!file.existsSync()) {
      throw StateError('Image file missing: $local');
    }
    final msg = ChatMessage.createImageSendMessage(
      targetId: peerEmUsername,
      filePath: local,
      sendOriginalImage: sendOriginalImage,
      fileSize: file.lengthSync(),
      displayName: local.split(RegExp(r'[/\\]')).last,
    );
    msg.chatType = isGroup ? ChatType.GroupChat : ChatType.Chat;
    try {
      await _applyCommonAttrs(msg, peer: peer);
      final sent = await _sendMessageAwaitSuccess(msg);
      return _emitAndReturn(sent, forceSelf: true);
    } on ChatError catch (e) {
      AppLog.w('ImService sendImage failed ${e.code} ${e.description}');
      await _persistFailed(msg, peerEmUsername, isGroup: isGroup);
      rethrow;
    }
  }

  /// userid / toUserid：能解析则写 int（对齐 forya），否则写字符串。
  static dynamic _attrIdValue(String raw) {
    final text = raw.trim();
    if (text.isEmpty) return '';
    return int.tryParse(text) ?? text;
  }

  /// 对齐 forya 消息公共 attributes：
  /// `name` / `avatar` / `userid` / `gender` / `emID` /
  /// `toName` / `toAvatar` / `toUserid` / `toGender` / `category`。
  static Future<void> _applyCommonAttrs(ChatMessage msg, {ImPeerAttrs? peer}) async {
    final self = _currentEmUser ?? SessionInfo.currentUser?.emUsername ?? '';
    if (self.isEmpty) return;
    final attrs = Map<String, dynamic>.from(msg.attributes ?? const {});
    attrs['emID'] = self;
    attrs['name'] = SessionInfo.currentUser?.nickname ?? '';
    attrs['userid'] = _attrIdValue(SessionInfo.currentUser?.id.toString() ?? '');
    attrs['avatar'] = SessionInfo.currentUser?.avatar ?? '';
    final gender = SessionInfo.currentUser?.gender.trim() ?? '';
    attrs['gender'] = gender;

    final to = peer;
    if (to != null && !to.isEmpty) {
      attrs['toName'] = to.name.trim();
      attrs['toAvatar'] = to.avatar.trim();
      attrs['toUserid'] = _attrIdValue(to.userid);
      attrs['toGender'] = to.gender.trim();
    } else {
      attrs.putIfAbsent('toName', () => '');
      attrs.putIfAbsent('toAvatar', () => '');
      attrs.putIfAbsent('toUserid', () => '');
      attrs.putIfAbsent('toGender', () => '');
    }

    // 对齐 forya ConversationClassify.normal()
    attrs.putIfAbsent('category', () => <String, dynamic>{'type': 'normal'});
    msg.attributes = attrs;
  }

  static ImChatMessage? _emitAndReturn(ChatMessage sent, {bool forceSelf = false}) {
    final out = _fromEm(sent, forceSelf: forceSelf);
    if (out != null && !_messagesController.isClosed) {
      _messagesController.add(out);
    }
    return out;
  }

  /// 环信 [sendMessage] 返回时 `_msgId` 可能尚未赋值（仍是本地 id），
  /// 撤回/删除需等服务端 ack 后的 msgId。
  static Future<ChatMessage> _sendMessageAwaitSuccess(ChatMessage message) {
    return _awaitMessageSendAck(
      message,
      () => ChatClient.getInstance.chatManager.sendMessage(message),
    );
  }

  static Future<ChatMessage> _awaitMessageSendAck(
    ChatMessage message,
    Future<ChatMessage> Function() send,
  ) async {
    final localId = message.msgId;
    final eventId = 'chimo_send_${localId}_${DateTime.now().microsecondsSinceEpoch}';
    final done = Completer<ChatMessage>();

    ChatClient.getInstance.chatManager.addMessageEvent(
      eventId,
      ChatMessageEvent(
        onSuccess: (mid, msg) {
          if (mid != localId || done.isCompleted) return;
          done.complete(msg);
        },
        onError: (mid, msg, error) {
          if (mid != localId || done.isCompleted) return;
          done.completeError(error);
        },
      ),
    );

    try {
      final sent = await send();
      return await done.future.timeout(
        const Duration(seconds: 30),
        onTimeout: () {
          AppLog.w('ImService send ack timeout localId=$localId');
          return sent;
        },
      );
    } finally {
      ChatClient.getInstance.chatManager.removeMessageEvent(eventId);
    }
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
    await ensureLoggedIn();
    final convType = isGroup ? ChatConversationType.GroupChat : ChatConversationType.Chat;
    try {
      final conv = await ChatClient.getInstance.chatManager.getConversation(
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
        direction: ChatSearchDirection.Up,
      );

      // 对齐 joyride：本地够用就别打漫游。
      // 首屏本地 >1 条直接展示；上拉本地不足才补服务端。
      final needRemote = startMsgId.isEmpty
          ? list.length <= 1
          : list.length < count;
      if (needRemote) {
        try {
          final cursorResult = await ChatClient.getInstance.chatManager.fetchHistoryMessagesByOption(
            conversationId,
            convType,
            options: FetchMessageOptions(direction: ChatSearchDirection.Up, needSave: true),
            cursor: startMsgId.isEmpty ? null : startMsgId,
            pageSize: count,
          );
          final remote = cursorResult.data.reversed.toList();
          final byId = <String, ChatMessage>{
            for (final m in list)
              if (m.msgId.isNotEmpty) m.msgId: m,
          };
          for (final m in remote) {
            final id = m.msgId;
            if (id.isEmpty) {
              list = [...list, m];
              continue;
            }
            final existing = byId[id];
            // 本地 FAIL 优先保留，不被服务端成功态覆盖。
            if (existing != null && existing.status == MessageStatus.FAIL) {
              continue;
            }
            byId[id] = m;
          }
          // 保留本地独有（含失败）+ 合并后的 id 集合。
          final merged = <ChatMessage>[
            ...byId.values,
            for (final m in list)
              if (m.msgId.isEmpty) m,
          ];
          list = merged;
        } catch (error) {
          AppLog.w('ImService fetchHistory', error: error);
        }
      }

      final out = <ImChatMessage>[];
      for (final m in list) {
        final mapped = _fromEm(m);
        if (mapped != null) out.add(mapped);
      }
      out.sort((a, b) => a.serverTimeMs.compareTo(b.serverTimeMs));
      return ImHistoryPage(messages: out, hasMore: list.length >= count);
    } catch (error) {
      AppLog.w('ImService.loadHistory failed', error: error);
      return const ImHistoryPage(messages: [], hasMore: false);
    }
  }

  /// 在环信将 1v1 会话标为已读（本地 + 已读回执）。
  ///
  /// 否则列表角标在 UI 清除后，重启又会回来。
  static Future<void> markConversationRead(String peerEmUsername, {bool isGroup = false}) async {
    final id = peerEmUsername.trim();
    if (id.isEmpty) return;
    await ensureLoggedIn();
    try {
      final conv = await ChatClient.getInstance.chatManager.getConversation(
        id,
        type: isGroup ? ChatConversationType.GroupChat : ChatConversationType.Chat,
        createIfNeed: false,
      );
      if (conv == null) return;
      await conv.markAllMessagesAsRead();
      if (!isGroup) {
        try {
          await ChatClient.getInstance.chatManager.sendConversationReadAck(id);
        } catch (error) {
          AppLog.w('ImService sendConversationReadAck', error: error);
        }
      }
    } catch (error) {
      AppLog.w('ImService.markConversationRead failed', error: error);
    }
  }

  /// 撤回发送成功的消息（支持私聊/群聊）。
  static Future<bool> recallMessage(String messageId, {String? ext}) async {
    final id = messageId.trim();
    if (id.isEmpty) return false;
    await ensureLoggedIn();
    try {
      await ChatClient.getInstance.chatManager.recallMessage(id, ext: ext);
      return true;
    } catch (error) {
      AppLog.w('ImService recallMessage failed', error: error);
      return false;
    }
  }

  /// 对齐 forya：SDK 撤回后追加 `im_recall_message`，对端渲染撤回提示。
  static Future<ImChatMessage?> sendRecallNotice({
    required String conversationId,
    required bool isGroup,
    ImPeerAttrs? peer,
  }) async {
    final target = conversationId.trim();
    if (target.isEmpty) return null;
    await ensureLoggedIn();
    try {
      final msg = ChatMessage.createCustomSendMessage(targetId: target, event: 'im_recall_message');
      msg.chatType = isGroup ? ChatType.GroupChat : ChatType.Chat;
      await _applyCommonAttrs(msg, peer: peer);
      final sent = await _sendMessageAwaitSuccess(msg);
      return _emitAndReturn(sent, forceSelf: true);
    } on ChatError catch (e) {
      AppLog.w('ImService sendRecallNotice failed ${e.code} ${e.description}');
      return null;
    } catch (error) {
      AppLog.w('ImService sendRecallNotice failed', error: error);
      return null;
    }
  }

  /// 删除单条消息（支持私聊/群聊本地+数据库）。
  static Future<void> deleteMessage({
    required String conversationId,
    required bool isGroup,
    required String messageId,
  }) async {
    final convId = conversationId.trim();
    final msgId = messageId.trim();
    if (convId.isEmpty || msgId.isEmpty) return;
    await ensureLoggedIn();

    final type = isGroup ? ChatConversationType.GroupChat : ChatConversationType.Chat;
    try {
      final conv = await ChatClient.getInstance.chatManager.getConversation(
        convId,
        type: type,
        createIfNeed: false,
      );
      await conv?.deleteMessage(msgId);
    } catch (error) {
      AppLog.w('ImService deleteMessage failed', error: error);
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
    await ensureLoggedIn();
    final type = isGroup ? ChatConversationType.GroupChat : ChatConversationType.Chat;
    try {
      final conv = await ChatClient.getInstance.chatManager.getConversation(
        id,
        type: type,
        createIfNeed: false,
      );
      if (conv != null) {
        try {
          await conv.deleteAllMessages();
        } catch (error) {
          AppLog.w('ImService deleteAllMessages', error: error);
        }
      }
      await ChatClient.getInstance.chatManager.deleteConversation(id, deleteMessages: deleteMessages);
      try {
        await ChatClient.getInstance.chatManager.deleteRemoteConversation(
          id,
          conversationType: type,
          isDeleteMessage: deleteMessages,
        );
      } catch (error) {
        AppLog.w('ImService deleteRemoteConversation', error: error);
      }
    } catch (error) {
      AppLog.w('ImService.deleteConversation failed', error: error);
    }
  }

  /// 打开环信会话供列表合并（1v1 Chat + GroupChat）。
  static Future<List<ChatConversation>> loadListConversations() async {
    await ensureLoggedIn();
    try {
      final all = await ChatClient.getInstance.chatManager.loadAllConversations();
      return [
        for (final c in all)
          if (c.type == ChatConversationType.Chat || c.type == ChatConversationType.GroupChat) c,
      ];
    } catch (error) {
      AppLog.w('ImService.loadListConversations', error: error);
      return const [];
    }
  }

  /// 打开 Chat 类型环信会话供列表预览。
  static Future<List<ChatConversation>> loadDmConversations() async {
    final all = await loadListConversations();
    return [
      for (final c in all)
        if (c.type == ChatConversationType.Chat) c,
    ];
  }

  static Future<String> previewFor(ChatConversation conv) async {
    try {
      final latest = await conv.latestMessage();
      if (latest == null) return '';
      return previewText(latest);
    } catch (_) {
      return '';
    }
  }

  static Future<int> latestTimeMs(ChatConversation conv) async {
    try {
      final latest = await conv.latestMessage();
      return latest?.serverTime ?? 0;
    } catch (_) {
      return 0;
    }
  }

  static String previewText(ChatMessage message) => ImMessageCodec.previewText(message);

  static ImChatMessage? _fromEm(ChatMessage message, {bool forceSelf = false}) =>
      ImMessageCodec.fromEm(message, forceSelf: forceSelf, selfEmUser: _currentEmUser ?? '');

  static void _emitEmMessage(ChatMessage message) {
    final out = _fromEm(message);
    if (out == null) return;
    if (!_messagesController.isClosed) {
      _messagesController.add(out);
    }
    // 服务端除 CMD 外还会发私聊 CUSTOM；CMD 丢失时用消息兜底弹全局邀请浮层。
    _maybeShowHeartLinkInvite(out);
  }

  static void _maybeShowHeartLinkInvite(ImChatMessage msg) {
    if (msg.isSelf) return;
    if (!ImCustomEvents.isHeartLinkInvite(msg.customEvent)) return;
    final payload = ImCustomPayload.tryHeartLinkInvite(msg.customPayload);
    if (payload == null) return;
    void show() {
      if (payload.forGs) {
        HeartLinkInviteNotice.showGsInvite(payload.info);
      } else {
        HeartLinkInviteNotice.showUserInvite(payload.info);
      }
    }

    final phase = SchedulerBinding.instance.schedulerPhase;
    if (phase == SchedulerPhase.idle || phase == SchedulerPhase.postFrameCallbacks) {
      show();
    } else {
      SchedulerBinding.instance.addPostFrameCallback((_) => show());
    }
  }

  static void _emitRecall(RecallMessageInfo info) {
    final id = info.recallMessageId.trim();
    if (id.isEmpty) return;
    final selfUser = _currentEmUser ?? '';
    final isSelf = selfUser.isNotEmpty && info.recallBy == selfUser;
    final convId = (info.conversationId ?? info.recallMessage?.conversationId ?? '').trim();
    if (_messagesController.isClosed) return;
    _messagesController.add(
      ImChatMessage(
        id: id,
        conversationId: convId,
        from: info.recallBy,
        to: convId,
        text: isSelf ? 'You recalled a message.' : 'The sender recalled a message.',
        isSelf: isSelf,
        serverTimeMs: info.recallMessage?.serverTime ?? DateTime.now().millisecondsSinceEpoch,
        msgType: 'recall',
        customEvent: 'sdk_recall',
        isGroup: info.recallMessage?.chatType == ChatType.GroupChat,
      ),
    );
  }

  /// 供测试 / 热重启。
  static Future<void> dispose() async {
    await _noop?.cancel();
    await logout();
  }
}
