part of '../chat_detail_page.dart';

enum _ChatSide { peer, self }

enum _ChatLineKind { text, voice, image, gift, emote, tip }

class _ChatLine {
  const _ChatLine({
    required this.side,
    this.kind = _ChatLineKind.text,
    this.text = '',
    this.voiceSeconds = 0,
    /// Asset path, absolute file path, or http(s) URL (image / voice / emote).
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

  /// EaseMob message id (cursor for history pagination).
  final String msgId;

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

/// Design spec bubble sizes (DM message stream — Figma 55:274 + forya media proportion).
abstract final class _BubbleLayout {
  static const double avatar = 40;
  static const double avatarGap = 10;
  static const double padH = 16;
  static const double padV = 12;
  static const double peerMax = 243;
  static const double selfMax = 260;
  /// Consecutive same-sender messages (especially media stack).
  static const double sameGap = 6;
  static const double sameMediaGap = 4;
  static const double otherGap = 20;
  /// Thumbnail-like media (closer to forya 110×~196).
  static const double imageW = 132;
  static const double imageH = 176;
  static const double imageRadius = 12;
  /// Sticker bubble (forya _EmoteItem: width 65, fitWidth).
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

/// Result from gift sheet → chat stream.
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

/// DM detail: black app bar + white message area (drag handle) + input bar.
