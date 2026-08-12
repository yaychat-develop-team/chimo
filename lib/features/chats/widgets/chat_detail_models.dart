part of '../chat_detail_page.dart';

enum _ChatSide { peer, self }

enum _ChatLineKind { text, voice, image, gift, emote, tip }

class _ChatLine {
  const _ChatLine({
    required this.side,
    this.kind = _ChatLineKind.text,
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
  });

  final _ChatSide side;
  final _ChatLineKind kind;
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

  _ChatLine copyWith({bool? failed, String? msgId}) {
    return _ChatLine(
      side: side,
      kind: kind,
      text: text,
      voiceSeconds: voiceSeconds,
      mediaSource: mediaSource,
      imageAssets: imageAssets,
      giftId: giftId,
      giftQty: giftQty,
      giftEmoji: giftEmoji,
      giftName: giftName,
      giftIconUrl: giftIconUrl,
      emoteUrl: emoteUrl,
      emoteName: emoteName,
      serverTimeMs: serverTimeMs,
      msgId: msgId ?? this.msgId,
      failed: failed ?? this.failed,
    );
  }

  String get displayMedia {
    if (mediaSource.trim().isNotEmpty) return mediaSource.trim();
    if (emoteUrl.trim().isNotEmpty) return emoteUrl.trim();
    if (imageAssets.isNotEmpty) return imageAssets.first;
    return '';
  }

  String get listPreview {
    if (kind == _ChatLineKind.voice) return '[Voice] $voiceSeconds"';
    if (kind == _ChatLineKind.image) {
      final n = imageAssets.length;
      return n <= 1 ? '[Image]' : '[Image ×$n]';
    }
    if (kind == _ChatLineKind.gift) {
      return giftName.isEmpty
          ? '[Gift] $giftId x$giftQty'
          : '[Gift] $giftName x$giftQty';
    }
    if (kind == _ChatLineKind.emote) {
      return emoteName.isEmpty ? '[Sticker]' : '[$emoteName]';
    }
    if (kind == _ChatLineKind.tip) return text;
    return text;
  }
}

/// 设计稿气泡尺寸（私聊消息流 — Figma 55:274 + forya 媒体比例）。
abstract final class _BubbleLayout {
  static const double avatar = 40;
  static const double avatarGap = 10;
  static const double padH = 16;
  static const double padV = 12;
  static const double peerMax = 243;
  static const double selfMax = 260;
  /// 连续同发送者消息间距（尤其媒体堆叠）。
  static const double sameGap = 6;
  static const double sameMediaGap = 4;
  static const double otherGap = 20;
  /// 缩略图式媒体（接近 forya 110×~196）。
  static const double imageW = 132;
  static const double imageH = 176;
  static const double imageRadius = 12;
  /// 贴纸气泡（forya _EmoteItem：宽 65，fitWidth）。
  static const double emoteSize = 65;
  static const Color peerColor = Color(0xFFF0F0F0);
  static const Color selfColor = Color(0xFFB8FF6A);
  static const Color peerText = Color(0xFF232518);
  static const TextStyle textStyle = TextStyle(
    color: Color(0xFF111111),
    fontSize: 14,
    fontWeight: FontWeight.w600,
    height: 20 / 14,
  );
  static const TextStyle peerTextStyle = TextStyle(
    color: peerText,
    fontSize: 14,
    fontWeight: FontWeight.w600,
    height: 20 / 14,
  );
  static const TextStyle timeStyle = TextStyle(
    color: Color(0xFFB0B0B0),
    fontSize: 12,
    fontWeight: FontWeight.w500,
    height: 1.2,
  );
}

/// 礼物面板结果 → 聊天消息流。
class _GiftSendResult {
  const _GiftSendResult({
    required this.id,
    required this.name,
    required this.qty,
    this.emoji = '',
    this.iconUrl = '',
    this.cost = 0,
  });

  final int id;
  final String emoji;
  final String name;
  final int qty;
  final String iconUrl;
  final int cost;
}

/// 私聊详情：黑色应用栏 + 白色消息区（拖动手柄）+ 输入栏。
