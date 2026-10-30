import 'package:flutter/material.dart';

import '../../../../../common/theme/app_colors.dart';
import '../../../../../common/theme/app_emoji.dart';
import '../../../model/room_message.dart';
import 'room_barrage_host.dart';
import 'package:chimo/common/utils/chimo.dart';

/// 普通文本 / 富文本公屏（含引用）。
class RoomBarrageTextBody extends StatelessWidget {
  const RoomBarrageTextBody({super.key, required this.host});

  final RoomBarrageHost host;

  RoomMessage get message => host.message;

  @override
  Widget build(BuildContext context) {
    final body = _pieces();
    if (message.quote.isEmpty) return host.bubble(body);
    final color = host.textColor().withValues(alpha: 0.5);
    return host.bubble(
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: const EdgeInsetsDirectional.only(start: 5),
            decoration: BoxDecoration(
              border: BorderDirectional(start: BorderSide(color: color, width: 2)),
            ),
            child: Text(
              message.quote,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(color: color, fontSize: 11, fontWeight: FontWeight.w400),
            ),
          ),
          const SizedBox(height: 5),
          body,
        ],
      ),
    );
  }

  Widget _pieces() {
    if (message.pieces.isEmpty) {
      return AppEmojiText(
        message.text,
        style: const TextStyle(
          color: AppColors.white,
          fontSize: 12,
          fontWeight: FontWeight.w500,
          height: 1.2,
        ),
      );
    }
    return RichText(text: TextSpan(children: message.pieces.map(_span).toList()));
  }

  InlineSpan _span(RoomShowPiece piece) {
    if (piece.kind == RoomPieceKind.icon) {
      final width = piece.size <= 0 ? 28.0 : piece.size.toDouble();
      return WidgetSpan(
        alignment: PlaceholderAlignment.middle,
        child: Chimo.image(piece.url, width: width, fit: BoxFit.fitWidth),
      );
    }
    if (piece.kind == RoomPieceKind.emote) {
      if (piece.url.isEmpty) return const TextSpan(text: '');
      return WidgetSpan(
        alignment: PlaceholderAlignment.middle,
        child: Chimo.image(piece.url, width: 65, fit: BoxFit.fitWidth),
      );
    }
    if (piece.gradient && message.bubbleColors.isEmpty) {
      final size = piece.size > 0 ? piece.size.toDouble() : 12.0;
      return WidgetSpan(
        alignment: PlaceholderAlignment.middle,
        child: ShaderMask(
          blendMode: BlendMode.srcIn,
          shaderCallback: (bounds) => AppColors.primaryGradient.createShader(bounds),
          child: Text(
            piece.text,
            style: TextStyle(fontSize: size, color: AppColors.white),
          ),
        ),
      );
    }
    var style = TextStyle(
      fontSize: piece.emoji ? 28 : (piece.size > 0 ? piece.size.toDouble() : 12),
      fontWeight: piece.emoji ? FontWeight.w400 : RoomBarrageHost.weight(piece.weight),
      letterSpacing: piece.emoji ? 1.5 : null,
      height: 1.2,
      color: host.pieceColor(piece),
    );
    if (piece.giftCount) {
      style = style.copyWith(
        fontSize: 14,
        fontWeight: FontWeight.w800,
        fontStyle: FontStyle.italic,
        color: message.bubbleColors.isEmpty ? AppColors.green29EEAA : style.color,
      );
    }
    if (_pieceTappable(piece)) {
      return WidgetSpan(
        alignment: PlaceholderAlignment.middle,
        child: GestureDetector(
          onTap: () => host.openPiece(piece),
          behavior: HitTestBehavior.opaque,
          child: Text(piece.text, style: style),
        ),
      );
    }
    return AppEmoji.toSpan(piece.text, style: style);
  }

  bool _pieceTappable(RoomShowPiece piece) {
    if (piece.tapUid.isNotEmpty && piece.tapUid != '0') return true;
    if (piece.tapLink.isNotEmpty) return true;
    return piece.accent && !piece.gradient && host.hasSender;
  }
}
