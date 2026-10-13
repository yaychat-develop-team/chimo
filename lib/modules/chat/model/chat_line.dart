import '../../../app/service/im_service.dart' show ImQuoteMsg;
import '../../../common/theme/app_emoji.dart';

/// 消息在气泡里的一侧。
enum ChatSide { peer, self }

/// 消息类型。私聊与群聊**共用这一个枚举**：
enum ChatLineKind { text, voice, image, gift, emote, tip, join, recall }

/// 一行聊天消息 —— 私聊与群聊**同一个模型**。
///
/// 合并之前：私聊在 `part` 里有一个私有消息类，群聊另有一个私有的发送消息类。
/// 两个私有类带来两件事：
/// 1. 群聊想复用私聊的气泡只能复制粘贴 —— 3,000 行重复的直接原因；
/// 2. 私有类在测试文件里不可见，**一个气泡都写不了 widget test**。
///
/// 合并规则：字段以私聊模型为准（它更完整），群聊缺的设默认值；
/// 群聊多出来的发送者 / 入群字段并进来。构造方式保留两种写法：
/// 私聊用具名参数的 const 构造，群聊用 [ChatLine.text] 这一组命名构造 ——
/// **一个类、两种入口**，不是再包一层。
class ChatLine {
  const ChatLine({
    required this.side,
    this.kind = ChatLineKind.text,
    this.text = '',
    this.voiceSeconds = 0,

    /// 资源路径、绝对文件路径或 http(s) URL（图片 / 语音 / 表情）。
    this.mediaSource = '',
    this.imageAssets = const [],
    this.giftId = 0,
    this.giftQty = 1,
    this.giftEmoji = '',
    this.giftName = '',
    this.giftIconUrl = '',
    this.emoteUrl = '',
    this.emoteName = '',
    this.serverTimeMs = 0,
    this.msgId = '',
    this.failed = false,
    this.quoteMsgId = '',
    this.quoteShowText = '',
    this.quoteSendName = '',
    this.senderAvatar = '',
    this.senderName = '',
    this.senderUid = '',
    this.senderGender = '',
    this.joinName = '',
    this.joinUid = '',
  });

  // 群聊风格的命名构造
  //
  // `isSelf` → [side]，`at` → [serverTimeMs]。

  factory ChatLine.text(
    String text, {
    DateTime? at,
    String msgId = '',
    bool isSelf = true,
    String senderAvatar = '',
    String senderName = '',
    String senderUid = '',
    String senderGender = '',
    String quoteMsgId = '',
    String quoteShowText = '',
    String quoteSendName = '',
  }) => ChatLine(
    side: isSelf ? ChatSide.self : ChatSide.peer,
    text: text,
    serverTimeMs: _ms(at),
    msgId: msgId,
    senderAvatar: senderAvatar,
    senderName: senderName,
    senderUid: senderUid,
    senderGender: senderGender,
    quoteMsgId: quoteMsgId,
    quoteShowText: quoteShowText,
    quoteSendName: quoteSendName,
  );

  factory ChatLine.voice(
    int seconds, {
    DateTime? at,
    String msgId = '',
    bool isSelf = true,
    String mediaSource = '',
    String senderAvatar = '',
    String senderName = '',
    String senderUid = '',
    String senderGender = '',
  }) => ChatLine(
    side: isSelf ? ChatSide.self : ChatSide.peer,
    kind: ChatLineKind.voice,
    voiceSeconds: seconds,
    mediaSource: mediaSource,
    serverTimeMs: _ms(at),
    msgId: msgId,
    senderAvatar: senderAvatar,
    senderName: senderName,
    senderUid: senderUid,
    senderGender: senderGender,
  );

  factory ChatLine.image(
    String path, {
    DateTime? at,
    String msgId = '',
    bool isSelf = true,
    String senderAvatar = '',
    String senderName = '',
    String senderUid = '',
    String senderGender = '',
  }) => ChatLine(
    side: isSelf ? ChatSide.self : ChatSide.peer,
    kind: ChatLineKind.image,
    mediaSource: path,
    serverTimeMs: _ms(at),
    msgId: msgId,
    senderAvatar: senderAvatar,
    senderName: senderName,
    senderUid: senderUid,
    senderGender: senderGender,
  );

  factory ChatLine.emote(
    String path, {
    DateTime? at,
    String msgId = '',
    bool isSelf = true,
    String senderAvatar = '',
    String senderName = '',
    String senderUid = '',
    String senderGender = '',
  }) => ChatLine(
    side: isSelf ? ChatSide.self : ChatSide.peer,
    kind: ChatLineKind.emote,
    mediaSource: path,
    serverTimeMs: _ms(at),
    msgId: msgId,
    senderAvatar: senderAvatar,
    senderName: senderName,
    senderUid: senderUid,
    senderGender: senderGender,
  );

  /// 入群提示（群聊）。永远是对端一侧。
  factory ChatLine.join(
    String name, {
    String uid = '',
    DateTime? at,
    String msgId = '',
    String senderAvatar = '',
    String senderGender = '',
  }) => ChatLine(
    side: ChatSide.peer,
    kind: ChatLineKind.join,
    joinName: name,
    joinUid: uid,
    serverTimeMs: _ms(at),
    msgId: msgId,
    senderName: name,
    senderUid: uid,
    senderAvatar: senderAvatar,
    senderGender: senderGender,
  );

  /// 撤回提示。文案随 [isSelf] 变。
  factory ChatLine.recall({
    DateTime? at,
    String msgId = '',
    bool isSelf = true,
    String senderName = '',
  }) => ChatLine(
    side: isSelf ? ChatSide.self : ChatSide.peer,
    kind: ChatLineKind.recall,
    serverTimeMs: _ms(at),
    msgId: msgId,
    senderName: senderName,
    text: recallTextFor(isSelf: isSelf),
  );

  /// 撤回提示的文案 —— **全项目只此一份**。
  ///
  /// 私聊（`DmChatLogic.lineFromIm` 的 `recall` 分支）、群聊
  /// （[ChatLine.recall]）、以及 IM 没带文案时 `ChatRecallTip` 的回落，
  /// 三处都读这里。放在 model 而不是那个 widget 上，是因为两个生产者都在
  /// Controller 层，反过来 import widget 会把 `material.dart` 拖进去。
  static String recallTextFor({required bool isSelf}) =>
      isSelf ? 'You recalled a message.' : 'The sender recalled a message.';

  static int _ms(DateTime? at) => (at ?? DateTime.now()).millisecondsSinceEpoch;

  final ChatSide side;
  final ChatLineKind kind;
  final String text;
  final int voiceSeconds;
  final String mediaSource;
  final List<String> imageAssets;
  final int giftId;
  final int giftQty;
  final String giftEmoji;
  final String giftName;
  final String giftIconUrl;
  final String emoteUrl;
  final String emoteName;
  final int serverTimeMs;

  /// EaseMob 消息 id（历史分页游标）。
  final String msgId;

  /// 发送失败（如被对方拉黑），气泡旁显示红色感叹号。
  final bool failed;

  /// 引用回复展示文案（Reply name:text）。
  final String quoteMsgId;
  final String quoteShowText;
  final String quoteSendName;

  // 群聊：消息头像 / 昵称 / uid / 性别（私聊侧留空）。
  final String senderAvatar;
  final String senderName;
  final String senderUid;
  final String senderGender;

  // 群聊：入群提示的昵称与 uid。
  final String joinName;
  final String joinUid;

  bool get isSelf => side == ChatSide.self;

  /// 群聊侧原来直接存 `DateTime`；统一成毫秒后由这里换算。
  DateTime get sentAt => DateTime.fromMillisecondsSinceEpoch(serverTimeMs);

  String get quoteContent =>
      ImQuoteMsg.displayContent(sendName: quoteSendName, showText: quoteShowText);

  String quoteContentIn(List<ChatLine> messages) => ImQuoteMsg.displayContent(
    sendName: quoteSendName,
    showText: quoteShowText,
    resolvedPreview: _resolvedQuotePreview(messages),
  );

  String _resolvedQuotePreview(List<ChatLine> messages) {
    final qid = quoteMsgId.trim();
    if (qid.isEmpty) return '';
    for (final m in messages) {
      if (m.msgId == qid) return m.listPreview;
    }
    return '';
  }

  String get displayMedia {
    if (mediaSource.trim().isNotEmpty) return mediaSource.trim();
    if (emoteUrl.trim().isNotEmpty) return emoteUrl.trim();
    if (imageAssets.isNotEmpty) return imageAssets.first;
    return '';
  }

  /// 会话列表里的一行预览。
  String get listPreview {
    if (kind == ChatLineKind.voice) return '[Audio]';
    if (kind == ChatLineKind.image) {
      final n = imageAssets.length;
      return n <= 1 ? '[Photo]' : '[Photo ×$n]';
    }
    if (kind == ChatLineKind.gift) {
      return giftName.isEmpty ? '[Gift] $giftId x$giftQty' : '[Gift] $giftName x$giftQty';
    }
    if (kind == ChatLineKind.emote) return '[Smiley]';
    if (kind == ChatLineKind.tip) return text;
    return AppEmoji.normalize(text);
  }

  bool get hasSenderGender => normalizeGender(senderGender) != null;

  bool get senderIsMale => normalizeGender(senderGender) == 'male';

  /// 归一化为 `male` / `female`；未设置返回 `null`。
  static String? normalizeGender(String? raw) {
    final g = (raw ?? '').trim().toLowerCase();
    if (g == 'male' || g == 'm' || g == '1') return 'male';
    if (g == 'female' || g == 'f' || g == '2') return 'female';
    return null;
  }

  ChatLine copyWith({
    bool? failed,
    String? msgId,
    String? mediaSource,
    int? serverTimeMs,
    DateTime? sentAt,
    List<String>? imageAssets,
    String? senderAvatar,
    String? senderName,
    String? senderUid,
    String? senderGender,
    String? quoteMsgId,
    String? quoteShowText,
    String? quoteSendName,
  }) => ChatLine(
    side: side,
    kind: kind,
    text: text,
    voiceSeconds: voiceSeconds,
    mediaSource: mediaSource ?? this.mediaSource,
    imageAssets: imageAssets ?? this.imageAssets,
    giftId: giftId,
    giftQty: giftQty,
    giftEmoji: giftEmoji,
    giftName: giftName,
    giftIconUrl: giftIconUrl,
    emoteUrl: emoteUrl,
    emoteName: emoteName,
    serverTimeMs: serverTimeMs ?? sentAt?.millisecondsSinceEpoch ?? this.serverTimeMs,
    msgId: msgId ?? this.msgId,
    failed: failed ?? this.failed,
    quoteMsgId: quoteMsgId ?? this.quoteMsgId,
    quoteShowText: quoteShowText ?? this.quoteShowText,
    quoteSendName: quoteSendName ?? this.quoteSendName,
    senderAvatar: senderAvatar ?? this.senderAvatar,
    senderName: senderName ?? this.senderName,
    senderUid: senderUid ?? this.senderUid,
    senderGender: senderGender ?? this.senderGender,
    joinName: joinName,
    joinUid: joinUid,
  );
}
