import 'dart:io';

import '../theme/app_emoji.dart';
import '../utils/json_read.dart';


/// 本地附件路径与可直接播放的远程 URL。
///
/// 从 IM 门面拆出来，是因为消息模型要判断「这条媒体能不能播」，
/// 又不该反向依赖整份连接与收发逻辑。
abstract final class ImPaths {
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
}

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

/// 对齐 forya `QuoteMsg`：引用回复元数据。
class ImQuoteMsg {
  const ImQuoteMsg({this.msgId = '', this.showText = '', this.sendName = ''});

  final String msgId;
  final String showText;
  final String sendName;

  /// 引用条内的预览文案（对齐 forya `[Smiley]` / `[Photo]` 等）。
  static String quotePreviewLabel(String raw) {
    var t = AppEmoji.normalize(raw).trim();
    if (t.isEmpty) return '';
    switch (t) {
      case '[Sticker]':
        return '[Smiley]';
      case '[Smiley]':
      case '[Photo]':
      case '[Audio]':
      case '[Image]':
      case '[Voice]':
        return t == '[Image]' ? '[Photo]' : (t == '[Voice]' ? '[Audio]' : t);
      default:
        break;
    }
    if (t.startsWith('[') && t.endsWith(']')) return t;

    // forya 异常占位：`----------: 😊`
    final colon = t.indexOf(':');
    if (colon > 0) {
      final head = t.substring(0, colon).trim();
      if (RegExp(r'^[-_\s·.]+$').hasMatch(head)) {
        t = t.substring(colon + 1).trim();
      }
    }
    return t;
  }

  /// 引用条展示：优先用本地消息算出的 preview，避免服务端存错成 `[Smiley]`。
  static String displayContent({
    required String sendName,
    required String showText,
    String resolvedPreview = '',
  }) {
    final preview = quotePreviewLabel(
      resolvedPreview.trim().isNotEmpty ? resolvedPreview : showText,
    );
    final name = sendName.trim();
    if (name.isEmpty && preview.isEmpty) return '';
    if (name.isEmpty) return 'Reply $preview';
    if (preview.isEmpty) return 'Reply $name:';
    return 'Reply $name:$preview';
  }

  String get showContent {
    return displayContent(sendName: sendName, showText: showText);
  }

  static ImQuoteMsg? fromAttributes(Map<String, dynamic>? attributes) {
    if (attributes == null || !attributes.containsKey('quoteMsg')) return null;
    final raw = attributes['quoteMsg'];
    if (raw is! Map) return null;
    final map = Map<String, dynamic>.from(raw);
    final msgId = JsonRead.str(map, 'msgId');
    final showText = JsonRead.str(map, 'showText');
    final sendName = JsonRead.str(map, 'sendName');
    if (msgId.isEmpty && showText.isEmpty && sendName.isEmpty) return null;
    return ImQuoteMsg(msgId: msgId, showText: showText, sendName: sendName);
  }

  Map<String, dynamic> toMap() => {
    'msgId': msgId,
    'showText': showText,
    'sendName': sendName,
  };
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
    this.quoteMsgId = '',
    this.quoteShowText = '',
    this.quoteSendName = '',
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

  /// 消息类型：`txt` | `image` | `voice` | `gift` | `follow` | `emote` | `join` | `custom` | `recall`
  final String msgType;

  /// forya `im_recall_message` 提示（区别于 SDK `onMessagesRecalledInfo`）。
  bool get isCustomRecall =>
      msgType == 'recall' &&
      (customEvent == 'im_recall_message' || customEvent == 'recallMessage');

  /// 环信 SDK 撤回回调：只删原消息，提示由 `im_recall_message` 展示。
  bool get isSdkRecall => msgType == 'recall' && !isCustomRecall;

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

  /// 引用回复（attributes.quoteMsg）。
  final String quoteMsgId;
  final String quoteShowText;
  final String quoteSendName;

  ImQuoteMsg? get quote {
    if (quoteMsgId.isEmpty && quoteShowText.isEmpty && quoteSendName.isEmpty) {
      return null;
    }
    return ImQuoteMsg(
      msgId: quoteMsgId,
      showText: quoteShowText,
      sendName: quoteSendName,
    );
  }

  String get quoteContent => quote?.showContent ?? '';

  /// GroupChat 与 Chat（私聊 / 系统）。
  final bool isGroup;

  /// 优先已有本地文件。环信 chatfiles URL 需要 secret，不能直接给播放器。
  String get playableOrDisplayUrl {
    final local = mediaLocalPath.trim();
    if (local.isNotEmpty) {
      try {
        final path = ImPaths.stripFileUri(local);
        if (ImPaths.localFileExists(path)) return path;
      } catch (_) {
        // 路径不合法 / 文件已被系统清掉：退回远程 URL。
      }
    }
    final remote = mediaRemoteUrl.trim();
    final thumb = thumbnailUrl.trim();
    if (ImPaths.isDirectPlayableUrl(remote)) return remote;
    if (ImPaths.isDirectPlayableUrl(thumb)) return thumb;
    if (local.isNotEmpty) return ImPaths.stripFileUri(local);
    if (remote.isNotEmpty) return remote;
    return thumb;
  }
}

/// 私聊历史一页，用于懒加载。
class ImHistoryPage {
  const ImHistoryPage({required this.messages, required this.hasMore});

  final List<ImChatMessage> messages;
  final bool hasMore;
}
