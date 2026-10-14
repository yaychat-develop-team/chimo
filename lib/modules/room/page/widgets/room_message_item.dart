import 'dart:math' as math;

import 'package:flutter/material.dart';

import '../../../../common/constants/app_assets.dart';
import '../../../../common/theme/app_colors.dart';
import '../../../../common/theme/app_emoji.dart';
import '../../../../common/widgets/app_image.dart';
import '../../model/room_message.dart';
import 'room_sender_tags.dart';

/// 公屏一行。样式对齐 Oumi：三圆角气泡、进房条、礼物、卡片和冠名。
class RoomMessageItem extends StatelessWidget {
  const RoomMessageItem({super.key, required this.message, this.onSender, this.onLink});

  final RoomMessage message;
  final VoidCallback? onSender;
  final void Function(String link)? onLink;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 5),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (message.showSender) ...[
            _avatar(onTap: _openSender),
            const SizedBox(width: 6),
          ],
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                if (message.showSender) ...[
                  RoomSenderTagsView(tags: message.tags, name: message.sender, carIcon: message.carIcon),
                  const SizedBox(height: 4),
                ],
                _body(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _body() {
    switch (message.kind) {
      case RoomMessageKind.gift:
        return _gift();
      case RoomMessageKind.join:
        return _join();
      case RoomMessageKind.qa:
        return _qa();
      case RoomMessageKind.pet:
        return _pet();
      case RoomMessageKind.activity:
        return _activity();
      case RoomMessageKind.card:
        return _card();
      case RoomMessageKind.heart:
        return _heart();
      case RoomMessageKind.named:
        return _named();
      case RoomMessageKind.text:
        return _text();
    }
  }

  Widget _text() {
    final body = _pieces();
    if (message.quote.isEmpty) return _bubble(body);
    final color = _textColor().withValues(alpha: 0.5);
    return _bubble(
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
        style: const TextStyle(color: AppColors.textPrimary, fontSize: 12, fontWeight: FontWeight.w500, height: 1.2),
      );
    }
    return RichText(
      text: TextSpan(children: message.pieces.map(_span).toList()),
    );
  }

  InlineSpan _span(RoomShowPiece piece) {
    if (piece.kind == RoomPieceKind.icon) {
      final width = piece.size <= 0 ? 28.0 : piece.size.toDouble();
      return WidgetSpan(
        alignment: PlaceholderAlignment.middle,
        child: AppImage(piece.url, width: width, fit: BoxFit.fitWidth),
      );
    }
    if (piece.kind == RoomPieceKind.emote) {
      if (piece.url.isEmpty) return const TextSpan(text: '');
      return WidgetSpan(
        alignment: PlaceholderAlignment.middle,
        child: AppImage(piece.url, width: 65, fit: BoxFit.fitWidth),
      );
    }
    if (piece.gradient && message.bubbleColors.isEmpty) {
      final size = piece.size > 0 ? piece.size.toDouble() : 12.0;
      return WidgetSpan(
        alignment: PlaceholderAlignment.middle,
        child: ShaderMask(
          blendMode: BlendMode.srcIn,
          shaderCallback: (bounds) => AppColors.brandTextGradient.createShader(bounds),
          child: Text(piece.text, style: TextStyle(fontSize: size, color: AppColors.textPrimary)),
        ),
      );
    }
    var style = TextStyle(
      fontSize: piece.emoji ? 28 : (piece.size > 0 ? piece.size.toDouble() : 12),
      fontWeight: piece.emoji ? FontWeight.w400 : _weight(piece.weight),
      letterSpacing: piece.emoji ? 1.5 : null,
      height: 1.2,
      color: _pieceColor(piece),
    );
    if (piece.giftCount) {
      style = style.copyWith(
        fontSize: 14,
        fontWeight: FontWeight.w800,
        fontStyle: FontStyle.italic,
        color: message.bubbleColors.isEmpty ? AppColors.roomGiftCount : style.color,
      );
    }
    return AppEmoji.toSpan(piece.text, style: style);
  }

  Widget _gift() {
    final bubble = _bubble(
      Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Flexible(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text('Send ', style: TextStyle(color: AppColors.textPrimary, fontSize: 12)),
                    Flexible(
                      child: Text(
                        message.giftTo,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(color: AppColors.giftGold, fontSize: 12, fontWeight: FontWeight.w600),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 2),
                Text(
                  message.giftName,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(color: AppColors.roomMsgSub, fontSize: 12),
                ),
              ],
            ),
          ),
          const SizedBox(width: 6),
          if (message.giftIcon.trim().isNotEmpty)
            AppImage(message.giftIcon, width: 42, height: 42, fit: BoxFit.contain),
        ],
      ),
    );
    final boxed = message.boxIcon.trim().isEmpty
        ? bubble
        : Stack(
            clipBehavior: Clip.none,
            children: [
              Padding(padding: const EdgeInsetsDirectional.only(bottom: 6, end: 8), child: bubble),
              PositionedDirectional(
                bottom: 0,
                end: 0,
                child: AppImage(message.boxIcon, width: 24, height: 24, fit: BoxFit.contain),
              ),
            ],
          );
    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Flexible(child: boxed),
        const SizedBox(width: 5),
        const Padding(
          padding: EdgeInsets.only(top: 10),
          child: Text('×', style: TextStyle(color: AppColors.textPrimary, fontSize: 10, height: 1, fontWeight: FontWeight.w700)),
        ),
        const SizedBox(width: 1),
        Text(
          '${message.giftCount}',
          style: const TextStyle(
            color: AppColors.textPrimary,
            fontSize: 24,
            fontWeight: FontWeight.w700,
            fontStyle: FontStyle.italic,
          ),
        ),
      ],
    );
  }

  Widget _join() {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        width: 220,
        height: 44,
        padding: const EdgeInsetsDirectional.only(start: 4, top: 4, bottom: 4),
        decoration: const ShapeDecoration(shape: StadiumBorder(), gradient: AppColors.roomJoinBanner),
        child: Row(
          children: [
            GestureDetector(onTap: _openSender, child: _face(message.avatar, 36)),
            const SizedBox(width: 6),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Flexible(
                        child: GestureDetector(
                          onTap: _openSender,
                          child: Text(
                            message.sender,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(color: AppColors.roomJoinHere, fontSize: 12, fontWeight: FontWeight.w500),
                          ),
                        ),
                      ),
                      const Text(' is here!', style: TextStyle(color: AppColors.textPrimary, fontSize: 12, fontWeight: FontWeight.w500)),
                    ],
                  ),
                  const Text(
                    "Who's gonna greet first~",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(color: AppColors.textPrimary, fontSize: 12, fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _qa() {
    final qa = message.qa;
    if (qa == null) return const SizedBox.shrink();
    return Container(
      decoration: const BoxDecoration(
        color: AppColors.roomQaFill,
        borderRadius: BorderRadiusDirectional.only(
          topEnd: Radius.circular(12),
          bottomStart: Radius.circular(12),
          bottomEnd: Radius.circular(12),
        ),
      ),
      padding: const EdgeInsets.only(bottom: 6),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 4),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Text(qa.question, style: const TextStyle(color: AppColors.textPrimary, fontSize: 12)),
          ),
          const SizedBox(height: 6),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 8),
            height: 0.5,
            color: AppColors.roomTag,
          ),
          const SizedBox(height: 6),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Text.rich(
              TextSpan(
                style: const TextStyle(color: AppColors.textPrimary, fontSize: 12),
                children: [
                  const TextSpan(text: 'I choose '),
                  TextSpan(text: qa.answer, style: const TextStyle(color: AppColors.roomJoinHere)),
                  const TextSpan(text: '.'),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _pet() {
    final pet = message.pet;
    if (pet == null) return const SizedBox.shrink();
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppImage(pet.icon, width: 30, height: 30, fit: BoxFit.contain),
        const SizedBox(width: 8),
        Flexible(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(pet.name, style: const TextStyle(color: AppColors.roomMsgSub, fontSize: 11)),
                  const SizedBox(width: 6),
                  Container(
                    height: 16,
                    constraints: const BoxConstraints(maxWidth: 120),
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    alignment: Alignment.center,
                    decoration: const ShapeDecoration(shape: StadiumBorder(), color: AppColors.roomPetTag),
                    child: Text(
                      pet.tag,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(color: AppColors.joinName, fontSize: 11),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 4),
              Container(
                constraints: const BoxConstraints(maxWidth: 213),
                padding: const EdgeInsets.all(8),
                decoration: const BoxDecoration(
                  color: AppColors.roomBarFill,
                  borderRadius: BorderRadiusDirectional.only(
                    topEnd: Radius.circular(12),
                    bottomStart: Radius.circular(12),
                    bottomEnd: Radius.circular(12),
                  ),
                ),
                child: Text(pet.text, style: const TextStyle(color: AppColors.textPrimary, fontSize: 12, fontWeight: FontWeight.w500)),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _activity() {
    return GestureDetector(
      onTap: () => _openLink(message.link),
      child: Container(
        width: 222,
        padding: const EdgeInsets.all(8),
        decoration: const BoxDecoration(
          borderRadius: BorderRadiusDirectional.only(
            topEnd: Radius.circular(12),
            bottomStart: Radius.circular(12),
            bottomEnd: Radius.circular(12),
          ),
          gradient: AppColors.roomActivityFill,
        ),
        child: Row(
          children: [
            Container(
              width: 60,
              height: 60,
              alignment: Alignment.center,
              decoration: BoxDecoration(gradient: AppColors.roomActivityIcon, borderRadius: BorderRadius.circular(16)),
              child: AppImage(message.cover, width: 50, fit: BoxFit.fitWidth),
            ),
            const SizedBox(width: 10),
            const Flexible(
              child: Text(
                "Don't miss out on this great event. Come join me now!",
                style: TextStyle(color: AppColors.textPrimary, fontSize: 12),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _card() {
    final card = message.card;
    if (card == null) return const SizedBox.shrink();
    return GestureDetector(
      onTap: () => _openLink(card.link),
      child: SizedBox(
        height: 70,
        child: DecoratedBox(
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(12),
              bottomLeft: Radius.circular(12),
              bottomRight: Radius.circular(12),
            ),
            gradient: AppColors.roomCardBanner,
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              children: [
                if (card.cover.isNotEmpty)
                  ClipRRect(
                    borderRadius: BorderRadius.circular(4),
                    child: AppImage(card.cover, width: 56, height: 56, fit: BoxFit.cover),
                  ),
                if (card.cover.isNotEmpty) const SizedBox(width: 10),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        card.title,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(color: AppColors.textPrimary, fontSize: 12),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        card.content,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(color: AppColors.textPrimary, fontSize: 10),
                      ),
                      const SizedBox(height: 7),
                      Row(
                        children: [
                          if (card.label.isNotEmpty)
                            Container(
                              height: 14,
                              padding: const EdgeInsets.symmetric(horizontal: 4),
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(2),
                                border: Border.all(color: AppColors.textPrimary),
                              ),
                              child: Text(card.label, style: const TextStyle(color: AppColors.textPrimary, fontSize: 8, height: 1)),
                            ),
                          if (card.label.isNotEmpty) const SizedBox(width: 8),
                          Flexible(
                            child: Text(
                              '${card.count} people',
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(color: AppColors.textPrimary, fontSize: 10),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _heart() {
    final heart = message.heart;
    if (heart == null) return const SizedBox.shrink();
    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: SizedBox(
        width: 220,
        height: 138,
        child: Stack(
          fit: StackFit.expand,
          children: [
            if (heart.photo.isNotEmpty) AppImage(heart.photo, width: 220, height: 138, fit: BoxFit.cover),
            const DecoratedBox(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [AppColors.transparent, AppColors.background],
                ),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(8), bottomRight: Radius.circular(8)),
                    gradient: AppColors.roomHeartBadge,
                  ),
                  child: const Text('HeartLink Card', style: TextStyle(color: AppColors.textPrimary, fontSize: 12, fontWeight: FontWeight.w600)),
                ),
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: Row(
                    children: [
                      Text(heart.name, style: const TextStyle(color: AppColors.textPrimary, fontSize: 14, fontWeight: FontWeight.w700)),
                      const SizedBox(width: 4),
                      _sex(heart.gender, age: heart.age),
                    ],
                  ),
                ),
                const SizedBox(height: 4),
                Container(
                  height: 18,
                  margin: const EdgeInsets.symmetric(horizontal: 12),
                  padding: const EdgeInsets.only(right: 10),
                  decoration: const ShapeDecoration(shape: StadiumBorder(), color: AppColors.roomBarFill),
                  child: const Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(width: 8),
                      Text('Telegram:', style: TextStyle(color: AppColors.textPrimary, fontSize: 10)),
                      Text('****', style: TextStyle(color: AppColors.textPrimary, fontSize: 10, fontWeight: FontWeight.w700, fontStyle: FontStyle.italic)),
                      SizedBox(width: 10),
                      Text('Locked', style: TextStyle(color: AppColors.roomHeartLock, fontSize: 10)),
                    ],
                  ),
                ),
                const SizedBox(height: 12),
                Container(
                  height: 28,
                  margin: const EdgeInsets.symmetric(horizontal: 12),
                  alignment: Alignment.center,
                  decoration: const ShapeDecoration(shape: StadiumBorder(), color: AppColors.textPrimary),
                  child: const Text(
                    'Spark or Skip',
                    style: TextStyle(color: AppColors.roomNewMsgText, fontSize: 13, fontWeight: FontWeight.w600),
                  ),
                ),
                const SizedBox(height: 8),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _named() {
    return SizedBox(
      width: 255,
      height: 24,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          const DecoratedBox(
            decoration: BoxDecoration(color: AppColors.roomChip, borderRadius: BorderRadius.all(Radius.circular(12))),
            child: SizedBox(width: 255, height: 24),
          ),
          Positioned(
            left: -8,
            top: -8,
            child: Transform.rotate(
              angle: -math.pi / 4,
              child: const AppImage(AppAssets.roomKing, width: 16, fit: BoxFit.contain),
            ),
          ),
          PositionedDirectional(
            start: 0,
            top: -3,
            child: GestureDetector(
              onTap: _openSender,
              child: Container(
                width: 30,
                height: 30,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: AppColors.roomNamedRing),
                ),
                child: _face(message.avatar, 28),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsetsDirectional.only(start: 34, end: 17),
            child: Row(
              children: [
                ShaderMask(
                  blendMode: BlendMode.srcIn,
                  shaderCallback: (bounds) => AppColors.roomNamedTitle.createShader(bounds),
                  child: Text(
                    message.text,
                    maxLines: 1,
                    style: const TextStyle(
                      color: AppColors.textPrimary,
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                      shadows: [Shadow(color: AppColors.roomGlass, blurRadius: 2, offset: Offset(0, 1))],
                    ),
                  ),
                ),
                const SizedBox(width: 9),
                Flexible(
                  child: Text(
                    message.sender,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      color: AppColors.roomNamedNick,
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                      shadows: [Shadow(color: AppColors.roomGlass, blurRadius: 2, offset: Offset(0, 1))],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _bubble(Widget child) {
    final skin = message.bubbleUrl.trim();
    if (skin.isNotEmpty && message.kind != RoomMessageKind.gift) {
      return Container(
        constraints: const BoxConstraints(minWidth: 59, minHeight: 46),
        padding: const EdgeInsets.symmetric(horizontal: 26, vertical: 14),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(skin, scale: 3),
            centerSlice: const Rect.fromLTWH(28, 22, 1, 1),
            fit: BoxFit.fill,
          ),
        ),
        child: child,
      );
    }
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      decoration: BoxDecoration(color: AppColors.roomBarFill, borderRadius: _radius),
      child: child,
    );
  }

  BorderRadiusGeometry get _radius {
    if (!message.showSender) return BorderRadius.circular(16);
    return const BorderRadiusDirectional.only(
      topEnd: Radius.circular(12),
      bottomStart: Radius.circular(12),
      bottomEnd: Radius.circular(12),
    );
  }

  Widget _avatar({VoidCallback? onTap}) {
    return GestureDetector(onTap: onTap, child: _framed(message.avatar, message.avatarFrame));
  }

  Widget _framed(String url, String frame) {
    final face = _face(url, 36);
    if (frame.trim().isEmpty) return face;
    return Stack(
      alignment: Alignment.center,
      children: [
        face,
        IgnorePointer(child: AppImage(frame, width: 36 * 1.3, height: 36 * 1.3, fit: BoxFit.contain)),
      ],
    );
  }

  Widget _face(String url, double size) {
    return ClipOval(
      child: url.trim().isEmpty
          ? ColoredBox(color: AppColors.roomEmptySeat, child: SizedBox(width: size, height: size))
          : AppImage(url, width: size, height: size, fit: BoxFit.cover),
    );
  }

  Widget _sex(String gender, {int age = 0}) {
    final value = gender.trim().toLowerCase();
    if (value.isEmpty) return const SizedBox.shrink();
    final male = value == 'male';
    return Container(
      height: 16,
      margin: const EdgeInsets.only(right: 4),
      padding: const EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
        color: male ? AppColors.roomMale : AppColors.roomFemale,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(male ? Icons.male : Icons.female, size: 12, color: AppColors.textPrimary),
          if (age > 0) ...[
            const SizedBox(width: 2),
            Text('$age', style: const TextStyle(color: AppColors.textPrimary, fontSize: 11, fontWeight: FontWeight.w600, height: 1)),
          ],
        ],
      ),
    );
  }

  void _openSender() {
    final uid = message.senderUid;
    if (uid.isEmpty || uid == '0') return;
    onSender?.call();
  }

  void _openLink(String link) {
    if (link.trim().isEmpty) return;
    onLink?.call(link);
  }

  Color _textColor() => _bubbleColors().first;

  Color _themeColor() => _bubbleColors().last;

  List<Color> _bubbleColors() {
    final raw = message.bubbleColors.trim();
    if (raw.isEmpty) return const [AppColors.textPrimary, AppColors.giftGold];
    final colors = raw.split(',').map(_parseColor).whereType<Color>().toList();
    if (colors.isEmpty) return const [AppColors.textPrimary, AppColors.giftGold];
    if (colors.length == 1) return [colors.first, colors.first];
    return colors;
  }

  Color _pieceColor(RoomShowPiece piece) {
    if (message.bubbleColors.isNotEmpty) return piece.accent ? _themeColor() : _textColor();
    if (piece.accent) return _parseColor(piece.color) ?? AppColors.giftGold;
    return _parseColor(piece.color) ?? AppColors.textPrimary;
  }

  FontWeight _weight(int weight) {
    if (weight <= 0 || weight > FontWeight.values.length) return FontWeight.w500;
    return FontWeight.values[weight - 1];
  }

  Color? _parseColor(String raw) {
    var hex = raw.trim();
    if (hex.isEmpty) return null;
    if (hex.startsWith('#')) hex = hex.substring(1);
    if (hex.startsWith('0x') || hex.startsWith('0X')) hex = hex.substring(2);
    if (hex.length == 6) hex = 'FF$hex';
    if (hex.length != 8) return null;
    final value = int.tryParse(hex, radix: 16);
    if (value == null) return null;
    return Color(value);
  }
}
