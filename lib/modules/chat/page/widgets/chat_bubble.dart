import 'package:flutter/material.dart';

import '../../../../common/theme/app_colors.dart';
import '../../../../common/theme/app_emoji.dart';

/// 一个都没统一 —— 统一成「看起来对的那个值」是静默视觉回归，review 看不出来
/// 要统一得先有设计结论，再改这里一个常量。
///
/// | | 私聊 [dm] | 群聊 [group] |
/// |---|---|---|
/// | 对方文字 | `promoText` 14 w600 | `surfaceDark` 15 w500 |
/// | 自己文字 | `surfaceDark` 14 w600 | 同对方 |
/// | 内边距 | 16 / 12 | 20 / 14 |
/// | 纯表情带引用条 | 否 | 是 |
///
/// 底色（对方 `textGrayF0` / 自己 `accentLimeSoft`）和圆角（尾角 4、其余 18）
/// 两边本来一致，直接写在 [ChatBubble] 里，不进这张表。
class ChatBubbleStyle {
  const ChatBubbleStyle({
    required this.peerTextStyle,
    required this.selfTextStyle,
    required this.padding,
    required this.pureEmojiKeepsQuote,
  });

  final TextStyle peerTextStyle;
  final TextStyle selfTextStyle;
  final EdgeInsets padding;

  /// 纯自定义表情（放大 28、不套气泡）时是否仍画引用条。
  final bool pureEmojiKeepsQuote;

  TextStyle textStyleFor({required bool isSelf}) =>
      isSelf ? selfTextStyle : peerTextStyle;

  /// 私聊消息流（Figma 55:274）。
  static const ChatBubbleStyle dm = ChatBubbleStyle(
    peerTextStyle: TextStyle(
      color: AppColors.promoText,
      fontSize: 14,
      fontWeight: FontWeight.w600,
      height: 20 / 14,
    ),
    selfTextStyle: TextStyle(
      color: AppColors.surfaceDark,
      fontSize: 14,
      fontWeight: FontWeight.w600,
      height: 20 / 14,
    ),
    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
    pureEmojiKeepsQuote: false,
  );

  /// 群聊消息流。
  static const ChatBubbleStyle group = ChatBubbleStyle(
    peerTextStyle: TextStyle(
      color: AppColors.surfaceDark,
      fontSize: 15,
      fontWeight: FontWeight.w500,
      height: 20 / 15,
    ),
    selfTextStyle: TextStyle(
      color: AppColors.surfaceDark,
      fontSize: 15,
      fontWeight: FontWeight.w500,
      height: 20 / 15,
    ),
    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 14),
    pureEmojiKeepsQuote: true,
  );
}

/// 文本 / forya 自定义表情（PUA）气泡，含可选的引用条。
///
/// 左右两侧只差底色、圆角朝向和文字样式，所以**不分两个类**，用 [isSelf] 区分 ——
/// 头像、失败重试、发送者昵称那一行不在这里： 起两边都由
/// `ChatMessageList` 包（合一前是私聊 `_ChatRow` / 群聊 `_GroupChatBubble`）。
class ChatBubble extends StatelessWidget {
  const ChatBubble({
    super.key,
    required this.isSelf,
    required this.text,
    required this.style,
    this.quoteContent = '',
    this.quoteMsgId = '',
    this.onQuoteTap,
    this.maxWidth,
  });

  final bool isSelf;
  final String text;
  final ChatBubbleStyle style;

  /// 被引用消息的预览文案，空串表示这条没有引用。
  final String quoteContent;
  final String quoteMsgId;

  /// 点引用条跳回原消息；为 null 时引用条不可点。
  final ValueChanged<String>? onQuoteTap;

  /// 气泡最大宽度。私聊按对方 / 自己各给一个值；群聊在外层统一约束，传 null。
  final double? maxWidth;

  static const Color _peerColor = AppColors.textGrayF0;
  static const Color _selfColor = AppColors.accentLimeSoft;

  /// 引用条 + 正文。引用为空时就只有正文。
  Widget _body(TextStyle textStyle) {
    final quote = quoteContent.trim();
    if (quote.isEmpty) {
      return AppEmojiText(text, style: textStyle);
    }
    final quotedId = quoteMsgId.trim();
    final quoteRow = Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 1,
          height: 12,
          margin: const EdgeInsets.only(top: 3),
          color: AppColors.textGray99,
        ),
        const SizedBox(width: 2),
        Flexible(
          child: AppEmojiText(
            quote,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              color: AppColors.textGray99,
              fontSize: 12,
              fontWeight: FontWeight.w400,
              height: 1.3,
            ),
          ),
        ),
      ],
    );
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (quotedId.isNotEmpty && onQuoteTap != null)
          GestureDetector(
            onTap: () => onQuoteTap!(quotedId),
            behavior: HitTestBehavior.opaque,
            child: quoteRow,
          )
        else
          quoteRow,
        const SizedBox(height: 2),
        AppEmojiText(text, style: textStyle),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final pureEmoji = AppEmoji.isCustomEmojiOnly(text);
    final base = style.textStyleFor(isSelf: isSelf);
    // 纯表情：放大到 28 且不套灰气泡，对齐 forya。
    final textStyle = pureEmoji
        ? base.copyWith(
            fontSize: 28,
            height: 1.2,
            letterSpacing: 1.5,
            fontWeight: FontWeight.w500,
          )
        : base;

    final Widget child;
    if (pureEmoji) {
      child = style.pureEmojiKeepsQuote
          ? _body(textStyle)
          : AppEmojiText(text, style: textStyle);
    } else {
      child = Container(
        padding: style.padding,
        decoration: BoxDecoration(
          color: isSelf ? _selfColor : _peerColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(isSelf ? 18 : 4),
            topRight: Radius.circular(isSelf ? 4 : 18),
            bottomLeft: const Radius.circular(18),
            bottomRight: const Radius.circular(18),
          ),
        ),
        child: _body(textStyle),
      );
    }

    final width = maxWidth;
    if (width == null) return child;
    return ConstrainedBox(
      constraints: BoxConstraints(maxWidth: width),
      child: child,
    );
  }
}
