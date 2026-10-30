import 'package:flutter/material.dart';

import '../../../../common/constants/app_assets.dart';
import '../../../../common/theme/app_colors.dart';
import 'package:chimo/common/utils/chimo.dart';

/// 礼物消息卡片（对齐 forya `GiftItemV2`：padding 16、图标 56、间距 16、字号 14）。
///
/// 现在只有私聊会发礼物，仍然提成公开组件 —— 群聊要加的时候不用再写一遍
///
/// [avatar] 由 `ChatMessageList` 传进来：头像取哪个字段（会话级还是每条自带）、
/// 这一条要不要画，都是消息流那一层的事 —— 它按
/// `ChatMessageListStyle.avatarSource` / `showAvatarAt` 算好再塞进来。
class ChatGiftCard extends StatelessWidget {
  const ChatGiftCard({
    super.key,
    required this.isSelf,
    required this.giftId,
    required this.qty,
    required this.emoji,
    required this.avatar,
    this.giftName = '',
    this.giftIconUrl = '',
  });

  final bool isSelf;
  final int giftId;
  final int qty;
  final String emoji;
  final String giftName;
  final String giftIconUrl;

  /// 卡片旁边那一格头像（不显示头像时给等宽占位）。
  final Widget avatar;

  /// 头像与卡片的间距，和文本 / 图片气泡那一行一致。
  static const double _avatarGap = 10;

  static const _qtyYellow = AppColors.yellowFDF652;
  static const _labelStyle = TextStyle(
    color: AppColors.black1C1C1E,
    fontSize: 14,
    fontWeight: FontWeight.w600,
    height: 1.25,
  );

  Widget _giftIcon() {
    if (giftIconUrl.isNotEmpty) {
      return Chimo.image(
        giftIconUrl,
        width: 56,
        height: 56,
        fit: BoxFit.contain,
        error: Text(emoji.isEmpty ? '🎁' : emoji, style: const TextStyle(fontSize: 36, height: 1)),
      );
    }
    return Text(emoji.isEmpty ? '🎁' : emoji, style: const TextStyle(fontSize: 36, height: 1));
  }

  Widget _content() {
    final name = giftName.isNotEmpty ? giftName : (giftId > 0 ? '$giftId' : 'Gift');
    return LimitedBox(
      maxWidth: 200,
      child: Text.rich(
        TextSpan(
          children: [
            TextSpan(text: isSelf ? 'You sent\n' : 'Gift to you\n', style: _labelStyle),
            TextSpan(text: '$name ', style: _labelStyle),
            TextSpan(
              text: 'x $qty',
              style: const TextStyle(
                color: _qtyYellow,
                fontSize: 14,
                fontWeight: FontWeight.w800,
                fontStyle: FontStyle.italic,
                height: 1.25,
                shadows: [
                  Shadow(color: AppColors.gray80333333, blurRadius: 1, offset: Offset(0, 0.5)),
                ],
              ),
            ),
          ],
        ),
        maxLines: 2,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final card = Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: isSelf
                  ? const [AppColors.orange33FE8F19, AppColors.pink33FC1192]
                  : const [AppColors.pink33FC1192, AppColors.orange33FE8F19],
            ),
            borderRadius: BorderRadiusDirectional.only(
              topStart: Radius.circular(isSelf ? 16 : 0),
              topEnd: Radius.circular(isSelf ? 0 : 16),
              bottomStart: const Radius.circular(16),
              bottomEnd: const Radius.circular(16),
            ),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (isSelf) ...[
                _content(),
                const SizedBox(width: 16),
                _giftIcon(),
              ] else ...[
                _giftIcon(),
                const SizedBox(width: 16),
                _content(),
              ],
            ],
          ),
        ),
        // 对齐 forya 礼物气泡角上的 box-item 徽章。
        const PositionedDirectional(end: -8, bottom: -8, child: _GiftBoxBadge()),
      ],
    );

    if (isSelf) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          card,
          const SizedBox(width: _avatarGap),
          avatar,
        ],
      );
    }

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        avatar,
        const SizedBox(width: _avatarGap),
        card,
      ],
    );
  }
}

class _GiftBoxBadge extends StatelessWidget {
  const _GiftBoxBadge();

  @override
  Widget build(BuildContext context) {
    return Chimo.image(AppAssets.giftIcon, width: 28, height: 28, fit: BoxFit.contain);
  }
}
