import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:im_flutter_sdk/im_flutter_sdk.dart';
import 'package:path_provider/path_provider.dart';

import '../auth/auth_session.dart';
import '../network/app_apis.dart';
import '../theme/app_emoji.dart';
import 'im_system_accounts.dart';

/// 对齐 forya `ChatInputController.attributes` 的对端 / 群公共字段。
class ImPeerAttrs {
  const ImPeerAttrs({
    this.name = '',
    this.avatar = '',
    this.userid = '',
    this.gender = '',
  });

  final String name;
  final String avatar;
  final String userid;
  final String gender;

  bool get isEmpty =>
      name.trim().isEmpty &&
      avatar.trim().isEmpty &&
      userid.trim().isEmpty &&
      gender.trim().isEmpty;
}

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
    this.senderName = '',
    this.senderAvatar = '',
    this.senderUid = '',
    this.senderGender = '',
    this.isGroup = false,
    this.failed = false,
  });

  final String id;
  final String conversationId;
  final String from;
  final String to;
  final String text;
  final bool isSelf;
  final int serverTimeMs;

  /// 本地发送失败（如被拉黑），对应环信 [MessageStatus.FAIL]。
  final bool failed;

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

  /// 发送方资料（环信公共 attributes：name / avatar / userid / gender）。
  final String senderName;
  final String senderAvatar;
  final String senderUid;
  /// 原始性别（`male` / `female` 等）；空表示未设置。
  final String senderGender;

  /// GroupChat 与 Chat（私聊 / 系统）。
  final bool isGroup;

  /// 优先已有本地文件。环信 chatfiles URL 需要 secret，不能直接给播放器。
  String get playableOrDisplayUrl {
    final local = mediaLocalPath.trim();
    if (local.isNotEmpty) {
      try {
        final path = ImService.stripFileUri(local);
        if (ImService.localFileExists(path)) return path;
      } catch (_) {}
    }
    final remote = mediaRemoteUrl.trim();
    final thumb = thumbnailUrl.trim();
    if (ImService.isDirectPlayableUrl(remote)) return remote;
    if (ImService.isDirectPlayableUrl(thumb)) return thumb;
    if (local.isNotEmpty) return ImService.stripFileUri(local);
    if (remote.isNotEmpty) return remote;
    return thumb;
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

  static String stripFileUri(String path) {
    var s = path.trim();
    if (s.startsWith('file://')) {
      try {
        return Uri.parse(s).toFilePath();
      } catch (_) {
        return s.substring(7);
      }
    }
    return s;
  }

  /// iOS 上 `/var` 与 `/private/var` 是同一路径，existsSync 可能漏检。
  static bool localFileExists(String path) {
    final p = stripFileUri(path);
    if (p.isEmpty) return false;
    bool ok(String candidate) {
      try {
        final f = File(candidate);
        return f.existsSync() && f.lengthSync() > 0;
      } catch (_) {
        return false;
      }
    }

    if (ok(p)) return true;
    if (p.startsWith('/var/')) return ok('/private$p');
    if (p.startsWith('/private/var/')) {
      return ok(p.replaceFirst('/private', ''));
    }
    return false;
  }

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
      debugPrint('ImService cache voice failed: $error');
      return srcPath;
    }
  }

  /// 录音在 tmp，离开页面后 iOS 常清掉；发送前拷到持久目录。
  static Future<String> persistOutgoingVoice(String path) async {
    final srcPath = _existingPath(path);
    if (srcPath == null) return stripFileUri(path);
    try {
      final dir = await _voiceCacheDir();
      final dest =
          File('${dir.path}/out_${DateTime.now().millisecondsSinceEpoch}.m4a');
      await File(srcPath).copy(dest.path);
      return dest.path;
    } catch (error) {
      debugPrint('ImService persistOutgoingVoice failed: $error');
      return srcPath;
    }
  }

  /// CDN / 公开 http 可直接播；环信附件必须走 [downloadAttachment]。
  static bool isDirectPlayableUrl(String url) {
    final u = url.trim().toLowerCase();
    if (!(u.startsWith('http://') || u.startsWith('https://'))) return false;
    if (u.contains('chatfiles') ||
        u.contains('easemob.com') ||
        u.contains('chat.agora.io')) {
      return false;
    }
    return true;
  }

  static String? _localOf(EMMessage m) {
    final body = m.body;
    if (body is! EMFileMessageBody) return null;
    return _existingPath(body.localPath);
  }

  /// 语音/图片：本地已有则返回路径，否则按 msgId 重新下载附件。
  static Future<String?> ensureLocalAttachment(String msgId) async {
    final id = msgId.trim();
    if (id.isEmpty) return null;
    final cached = await _cachedVoice(id);
    if (cached != null) return cached;
    if (!_sdkInited) await connectFromServer();
    try {
      var msg = await EMClient.getInstance.chatManager.loadMessage(id);
      if (msg == null) return null;
      final existing = _localOf(msg);
      if (existing != null) {
        return await _copyToVoiceCache(id, existing) ?? existing;
      }

      final body = msg.body;
      if (body is EMFileMessageBody) {
        // 自己发出的语音：SDK 标 SUCCESS 但 tmp 文件已不在，必须强制再下。
        if (body.fileStatus == DownloadStatus.SUCCESS ||
            body.fileStatus == DownloadStatus.FAILED) {
          body.fileStatus = DownloadStatus.PENDING;
        }
      }

      final eventId = 'chimo_att_$id';
      final done = Completer<EMMessage?>();
      EMClient.getInstance.chatManager.addMessageEvent(
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
        await EMClient.getInstance.chatManager.downloadAttachment(msg);
        final quick = _localOf(
          await EMClient.getInstance.chatManager.loadMessage(id) ?? msg,
        );
        if (quick != null) {
          return await _copyToVoiceCache(id, quick) ?? quick;
        }
        final downloaded = await done.future.timeout(
          const Duration(seconds: 20),
        );
        final path = _localOf(downloaded ?? msg);
        if (path != null) {
          return await _copyToVoiceCache(id, path) ?? path;
        }
      } finally {
        EMClient.getInstance.chatManager.removeMessageEvent(eventId);
      }
      msg = await EMClient.getInstance.chatManager.loadMessage(id) ?? msg;
      final last = _localOf(msg);
      if (last != null) return await _copyToVoiceCache(id, last) ?? last;
      return null;
    } catch (error) {
      debugPrint('ImService ensureLocalAttachment failed: $error');
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
      gender: creds.profile.gender,
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
      await _ensureLoggedOutOfOthers(user);
      await EMClient.getInstance.loginWithPassword(user, password);
      _currentEmUser = user;
      _connected = true;
      debugPrint('ImService loginWithPassword ok: $user');
    } on EMError catch (e) {
      debugPrint('ImService login failed code=${e.code} desc=${e.description}');
      final already = e.code == 200 || e.description.contains('already');
      if (!already) return;
      final current = await sdkUserId();
      if (current == user) {
        _currentEmUser = user;
        _connected = true;
        return;
      }
      debugPrint('ImService already login as $current, switching to $user');
      await _forceLogout();
      await EMClient.getInstance.loginWithPassword(user, password);
      _currentEmUser = user;
      _connected = true;
    }
  }

  static Future<String?> sdkUserId() async {
    try {
      final id = await EMClient.getInstance.getCurrentUserId();
      if (id != null && id.trim().isNotEmpty) return id.trim();
    } catch (_) {}
    final cached = EMClient.getInstance.currentUserId?.trim();
    return (cached != null && cached.isNotEmpty) ? cached : _currentEmUser;
  }

  static Future<void> _ensureLoggedOutOfOthers(String nextUser) async {
    final current = await sdkUserId();
    var logged = false;
    try {
      logged = await EMClient.getInstance.isLoginBefore();
    } catch (_) {}
    if (!logged && (current == null || current.isEmpty)) return;
    if (current == nextUser) return;
    debugPrint('ImService logout previous IM user=$current before $nextUser');
    await _forceLogout();
  }

  static Future<void> _forceLogout() async {
    try {
      await EMClient.getInstance
          .logout(true)
          .timeout(const Duration(seconds: 2));
    } catch (_) {
      try {
        await EMClient.getInstance
            .logout(false)
            .timeout(const Duration(seconds: 1));
      } catch (error) {
        debugPrint('ImService forceLogout: $error');
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
    bool isGroup = false,
    ImPeerAttrs? peer,
  }) async {
    final text = content.trim();
    if (text.isEmpty || peerEmUsername.isEmpty) return null;
    if (!_sdkInited) await connectFromServer();
    final msg = EMMessage.createTxtSendMessage(
      targetId: peerEmUsername,
      content: text,
    );
    msg.chatType = isGroup ? ChatType.GroupChat : ChatType.Chat;
    try {
      await _applyCommonAttrs(msg, peer: peer);
      if (extra != null && extra.isNotEmpty) {
        final attrs = Map<String, dynamic>.from(msg.attributes ?? const {});
        attrs['extra'] = extra;
        msg.attributes = attrs;
      }
      final sent = await EMClient.getInstance.chatManager.sendMessage(msg);
      return _emitAndReturn(sent, forceSelf: true);
    } on EMError catch (e) {
      debugPrint('ImService sendText failed ${e.code} ${e.description}');
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
        'emote': {
          'emoticons_id': packId,
          'id': stickerId,
          'desc': name,
          'url': url,
        },
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
    if (!_sdkInited) await connectFromServer();
    final msg = EMMessage.createTxtSendMessage(
      targetId: peerEmUsername,
      content: text,
    );
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
    if (!_sdkInited) await connectFromServer();
    var local = path;
    if (local.startsWith('file://')) local = local.substring(7);
    final file = File(local);
    if (!file.existsSync()) return null;
    final msg = EMMessage.createImageSendMessage(
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
    if (!_sdkInited) await connectFromServer();
    var local = path;
    if (local.startsWith('file://')) local = local.substring(7);
    final file = File(local);
    if (!file.existsSync()) return null;
    final msg = EMMessage.createVoiceSendMessage(
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
    EMMessage msg,
    String peerEmUsername, {
    bool isGroup = false,
  }) async {
    msg.status = MessageStatus.FAIL;
    final convType =
        isGroup ? EMConversationType.GroupChat : EMConversationType.Chat;
    try {
      final conv = await EMClient.getInstance.chatManager.getConversation(
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
          debugPrint('ImService persist failed msg: $error');
        }
      }
    } catch (error) {
      debugPrint('ImService _persistFailed: $error');
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
    if (!_sdkInited) await connectFromServer();
    final convType =
        isGroup ? EMConversationType.GroupChat : EMConversationType.Chat;
    try {
      final conv = await EMClient.getInstance.chatManager.getConversation(
        peerEmUsername,
        type: convType,
        createIfNeed: true,
      );
      final local = await conv?.loadMessage(id);
      if (local == null) return null;
      final sent = await EMClient.getInstance.chatManager.resendMessage(local);
      return _emitAndReturn(sent, forceSelf: true);
    } on EMError catch (e) {
      debugPrint('ImService resendFailed ${e.code} ${e.description}');
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
    if (!_sdkInited) await connectFromServer();
    try {
      final msg = EMMessage.createCustomSendMessage(
        targetId: peerEmUsername,
        event: 'im_follow_message',
        params: {'follow': followed ? '1' : '0'},
      );
      msg.chatType = ChatType.Chat;
      await _applyCommonAttrs(msg, peer: peer);
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
    ImPeerAttrs? peer,
  }) async {
    final path = filePath.trim();
    if (path.isEmpty || peerEmUsername.isEmpty) return null;
    if (durationSecs < 1) {
      throw StateError('Voice too short');
    }
    if (!_sdkInited) await connectFromServer();
    var local = stripFileUri(path);
    local = await persistOutgoingVoice(local);
    final file = File(local);
    if (!file.existsSync()) {
      throw StateError('Voice file missing: $local');
    }
    final msg = EMMessage.createVoiceSendMessage(
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
      final sent = await EMClient.getInstance.chatManager.sendMessage(msg);
      final out = _emitAndReturn(sent, forceSelf: true);
      if (out != null && out.id.isNotEmpty) {
        unawaited(_copyToVoiceCache(out.id, local));
      }
      return out;
    } on EMError catch (e) {
      debugPrint('ImService sendVoice failed ${e.code} ${e.description}');
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
    if (!_sdkInited) await connectFromServer();
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
    try {
      await _applyCommonAttrs(msg, peer: peer);
      final sent = await EMClient.getInstance.chatManager.sendMessage(msg);
      return _emitAndReturn(sent, forceSelf: true);
    } on EMError catch (e) {
      debugPrint('ImService sendImage failed ${e.code} ${e.description}');
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
  static Future<void> _applyCommonAttrs(
    EMMessage msg, {
    ImPeerAttrs? peer,
  }) async {
    final self = _currentEmUser ?? (await AuthSession.emUsername()) ?? '';
    if (self.isEmpty) return;
    final attrs = Map<String, dynamic>.from(msg.attributes ?? const {});
    attrs['emID'] = self;
    attrs['name'] = await AuthSession.nickname() ?? '';
    attrs['userid'] = _attrIdValue(await AuthSession.userId() ?? '');
    attrs['avatar'] = await AuthSession.avatarUrl() ?? '';
    final gender = (await AuthSession.gender())?.trim() ?? '';
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

      // 本地不足时从服务端补齐，但必须与本地合并，避免冲掉 FAIL 失败消息。
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
          final remote = cursorResult.data.reversed.toList();
          final byId = <String, EMMessage>{
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
          final merged = <EMMessage>[
            ...byId.values,
            for (final m in list)
              if (m.msgId.isEmpty) m,
          ];
          list = merged;
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

  /// 撤回发送成功的消息（支持私聊/群聊）。
  static Future<void> recallMessage(
    String messageId, {
    String? ext,
  }) async {
    final id = messageId.trim();
    if (id.isEmpty) return;
    if (!_sdkInited) await connectFromServer();
    try {
      await EMClient.getInstance.chatManager.recallMessage(id, ext: ext);
    } catch (error) {
      debugPrint('ImService recallMessage failed: $error');
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
    if (!_sdkInited) await connectFromServer();

    final type = isGroup ? EMConversationType.GroupChat : EMConversationType.Chat;
    try {
      final conv = await EMClient.getInstance.chatManager.getConversation(
        convId,
        type: type,
        createIfNeed: false,
      );
      await conv?.deleteMessage(msgId);
    } catch (error) {
      debugPrint('ImService deleteMessage failed: $error');
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
    if (event.isEmpty) return fallbackText.isNotEmpty ? fallbackText : '[Message]';
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
    for (final key in const ['text', 'content', 'msg', 'message', 'body', 'title']) {
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
            final value = '${map[nestedKey] ?? ''}'.trim();
            if (value.isNotEmpty && !value.startsWith('{') && !value.startsWith('[')) {
              return AppEmoji.normalize(value);
            }
          }
        }
      } catch (_) {}
    }
    return '';
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
      text = AppEmoji.normalize(body.content);
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

  static String _attrText(dynamic value) {
    if (value == null) return '';
    final text = '$value'.trim();
    if (text.isEmpty || text == 'null' || text == 'undefined') return '';
    return text;
  }

  static ({String name, String avatar, String uid, String gender})
      _senderFromAttributes(
    Map<String, dynamic>? attributes,
  ) {
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
    final sender = _senderFromAttributes(message.attributes);

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
      isGroup: message.chatType == ChatType.GroupChat,
      failed: message.status == MessageStatus.FAIL,
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
    final sender = _senderFromAttributes(message.attributes);

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
    var name = _displayJoinName(params['name'] ?? '');
    var uid = (params['uid'] ?? params['userId'] ?? '').trim();
    final raw = (params['content'] ?? '').trim();
    if (raw.startsWith('{')) {
      try {
        final decoded = jsonDecode(raw);
        if (decoded is Map) {
          final map = Map<String, dynamic>.from(decoded);
          final n = _displayJoinName(
            '${map['name'] ?? map['nickname'] ?? ''}',
          );
          final u = '${map['uid'] ?? map['userId'] ?? map['id'] ?? ''}'.trim();
          if (n.isNotEmpty) name = n;
          if (u.isNotEmpty) uid = u;
        }
      } catch (_) {}
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

  /// 供测试 / 热重启。
  static Future<void> dispose() async {
    await _noop?.cancel();
    await logout();
  }
}
