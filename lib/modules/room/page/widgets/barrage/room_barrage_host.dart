import 'package:flutter/material.dart';

import '../../../../../common/constants/app_assets.dart';
import '../../../../../common/theme/app_colors.dart';
import '../../../../../common/widgets/app_image.dart';
import '../../../model/room_message.dart';
import 'package:chimo/common/utils/chimo.dart';

/// 公屏一行的共用能力：气泡、头像、颜色、资料卡 / 链接回调。
/// 各 kind 的 body 只负责布局，不复制这些细节。
class RoomBarrageHost {
  const RoomBarrageHost({required this.message, this.onProfile, this.onLink});

  final RoomMessage message;
  final void Function({required String uid, String name, String avatar})? onProfile;
  final void Function(String link)? onLink;

  bool get hasSender {
    final uid = message.senderUid;
    return uid.isNotEmpty && uid != '0';
  }

  void openSender() {
    openProfile(uid: message.senderUid, name: message.sender, avatar: message.avatar);
  }

  void openGiftTo() {
    openProfile(uid: message.giftToUid, name: message.giftTo);
  }

  void openPiece(RoomShowPiece piece) {
    if (piece.tapUid.isNotEmpty && piece.tapUid != '0') {
      openProfile(uid: piece.tapUid, name: piece.text, avatar: piece.tapAvatar);
      return;
    }
    final link = piece.tapLink.trim();
    if (link.isNotEmpty) {
      final uid = uidFromUserCardLink(link);
      if (uid.isNotEmpty) {
        openProfile(uid: uid, name: piece.text);
        return;
      }
      openLink(link);
      return;
    }
    if (piece.accent && hasSender) openSender();
  }

  /// yaychat `room_user_card?uid=`
  static String uidFromUserCardLink(String link) {
    final uri = Uri.tryParse(link.trim());
    if (uri == null) return '';
    final host = uri.host.toLowerCase();
    final path = uri.path.toLowerCase();
    final isCard =
        host == 'room_user_card' ||
        path == '/room_user_card' ||
        path.endsWith('room_user_card') ||
        link.contains('room_user_card');
    if (!isCard) return '';
    final uid = uri.queryParameters['uid'] ?? '';
    return uid == '0' ? '' : uid;
  }

  void openProfile({required String uid, String name = '', String avatar = ''}) {
    if (uid.isEmpty || uid == '0') return;
    onProfile?.call(uid: uid, name: name, avatar: avatar);
  }

  void openLink(String link) {
    if (link.trim().isEmpty) return;
    onLink?.call(link);
  }

  Widget bubble(Widget child) {
    final skin = message.bubbleUrl.trim();
    if (skin.isNotEmpty && message.type != RoomMessageType.gift) {
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
      decoration: BoxDecoration(color: AppColors.black30, borderRadius: radius),
      child: child,
    );
  }

  BorderRadiusGeometry get radius {
    if (!message.showSender) return BorderRadius.circular(16);
    return const BorderRadiusDirectional.only(
      topEnd: Radius.circular(12),
      bottomStart: Radius.circular(12),
      bottomEnd: Radius.circular(12),
    );
  }

  Widget avatar({VoidCallback? onTap}) {
    return GestureDetector(onTap: onTap, child: framed(message.avatar, message.avatarFrame));
  }

  Widget framed(String url, String frame) {
    final face = this.face(url, 36);
    if (frame.trim().isEmpty) return face;
    return Stack(
      alignment: Alignment.center,
      children: [
        face,
        IgnorePointer(
          child: Chimo.image(frame, width: 36 * 1.3, height: 36 * 1.3, fit: BoxFit.contain),
        ),
      ],
    );
  }

  Widget face(String url, double size) => AppImage.avatar(url, size: size);

  Widget sex(String gender, {int age = 0}) {
    final value = gender.trim().toLowerCase();
    if (value.isEmpty) return const SizedBox.shrink();
    final male = value == 'male';
    return Padding(
      padding: const EdgeInsets.only(right: 4),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Chimo.image(male ? AppAssets.roomMale : AppAssets.roomFemale, width: 16, height: 16),
          if (age > 0) ...[
            const SizedBox(width: 2),
            Text(
              '$age',
              style: const TextStyle(
                color: AppColors.white,
                fontSize: 11,
                fontWeight: FontWeight.w600,
                height: 1,
              ),
            ),
          ],
        ],
      ),
    );
  }

  Color textColor() => bubbleColors().first;

  Color themeColor() => bubbleColors().last;

  List<Color> bubbleColors() {
    final raw = message.bubbleColors.trim();
    if (raw.isEmpty) return const [AppColors.white, AppColors.green29EEAA];
    final colors = raw.split(',').map(parseColor).whereType<Color>().toList();
    if (colors.isEmpty) return const [AppColors.white, AppColors.green29EEAA];
    if (colors.length == 1) return [colors.first, colors.first];
    return colors;
  }

  Color pieceColor(RoomShowPiece piece) {
    if (message.bubbleColors.isNotEmpty) return piece.accent ? themeColor() : textColor();
    if (piece.accent) return parseColor(piece.color) ?? AppColors.green29EEAA;
    return parseColor(piece.color) ?? AppColors.white;
  }

  static FontWeight weight(int weight) {
    if (weight <= 0 || weight > FontWeight.values.length) return FontWeight.w500;
    return FontWeight.values[weight - 1];
  }

  static Color? parseColor(String raw) {
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
