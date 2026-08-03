part of '../chat_detail_page.dart';

enum _ChatSide { peer, self }

enum _ChatLineKind { text, voice, image, gift }

class _ChatLine {
  const _ChatLine({
    required this.side,
    this.kind = _ChatLineKind.text,
    this.text = '',
    this.voiceSeconds = 0,
    this.imageAssets = const [],
    this.giftId = 0,
    this.giftQty = 1,
    this.giftEmoji = '',
    this.giftName = '',
  });

  final _ChatSide side;
  final _ChatLineKind kind;
  final String text;
  final int voiceSeconds;
  final List<String> imageAssets;
  final int giftId;
  final int giftQty;
  final String giftEmoji;
  final String giftName;

  String get listPreview {
    if (kind == _ChatLineKind.voice) return '[Voice] $voiceSeconds"';
    if (kind == _ChatLineKind.image) {
      final n = imageAssets.length;
      return n <= 1 ? '[Image]' : '[Image ×$n]';
    }
    if (kind == _ChatLineKind.gift) {
      return '[Gift] $giftId x$giftQty';
    }
    return text;
  }
}

/// Design spec bubble sizes (DM message stream — Figma 55:274).
abstract final class _BubbleLayout {
  static const double avatar = 40;
  static const double avatarGap = 12;
  static const double padH = 20;
  static const double padV = 14;
  static const double peerMax = 243;
  static const double selfMax = 260;
  static const double sameGap = 10;
  static const double otherGap = 24;
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
}

/// Result from gift sheet → chat stream.
class _GiftSendResult {
  const _GiftSendResult({
    required this.id,
    required this.emoji,
    required this.name,
    required this.qty,
  });

  final int id;
  final String emoji;
  final String name;
  final int qty;
}

/// DM detail: black app bar + white message area (drag handle) + input bar.
