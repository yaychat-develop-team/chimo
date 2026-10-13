import 'package:flutter/material.dart';

import '../../../../common/theme/app_colors.dart';
import '../../model/chat_line.dart';

/// 「某条消息被撤回了」那一行居中灰字（私聊 `ChatLineKind.tip` 那条内联的
/// `Center > Text` + 群聊 `_RecallTip`， 合一）。
///
/// 私聊在 `DmChatLogic.lineFromIm` 里写一遍、群聊在 `ChatLine.recall`
/// 工厂里写一遍、`_RecallTip` 自己又按 `isSelf` 拼一遍，三份字符串一样，
/// 但改一处不会同步另外两处。
///
/// 字重两边仍然不同（私聊 w400 / 群聊 w500），和 `ChatBubbleStyle` 一样按
/// 原样保留 —— 统一等于静默视觉回归。其余（颜色、字号、行高、内边距）本来就一致。
class ChatRecallTip extends StatelessWidget {
  const ChatRecallTip({
    super.key,
    required this.isSelf,
    required this.style,
    this.text = '',
  });

  /// 撤回的是不是自己发的 —— [text] 为空时用它挑文案。
  final bool isSelf;

  /// IM 推来的文案。空串时回落到 [ChatLine.recallTextFor]。
  ///
  /// 留这个参数是因为撤回提示是**服务端也会发**的一条消息：对方的 SDK
  /// 版本不同，文案可能和本地的不一样，收到什么就显示什么。
  final String text;

  final TextStyle style;

  /// 私聊消息流。
  static const TextStyle dmStyle = TextStyle(
    color: AppColors.textGrayAE,
    fontSize: 12,
    fontWeight: FontWeight.w400,
    height: 1.3,
  );

  /// 群聊消息流。
  static const TextStyle groupStyle = TextStyle(
    color: AppColors.textGrayAE,
    fontSize: 12,
    fontWeight: FontWeight.w500,
    height: 1.3,
  );

  String get displayText {
    final t = text.trim();
    return t.isNotEmpty ? t : ChatLine.recallTextFor(isSelf: isSelf);
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 4),
        child: Text(displayText, textAlign: TextAlign.center, style: style),
      ),
    );
  }
}
