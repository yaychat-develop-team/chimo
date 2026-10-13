import 'package:flutter/material.dart';

import '../../../../common/theme/app_colors.dart';
import '../../../../common/utils/time_fmt.dart';
import '../../model/chat_line.dart';

/// 时间分隔那一行的排版与文案。私聊灰 B0 / w500，群聊灰 AE / w400；
/// 没有统一（同 `ChatBubbleStyle` / `ChatImageStyle` 的理由：统一等于静默视觉回归）。
///
/// **注意区分**：「长什么样 / 写什么字」两边各一份（本类），
/// 「什么时候插一条」只有一份（[ChatTimestampLabel.shouldShow]）。
class ChatTimestampStyle {
  const ChatTimestampStyle({
    required this.textStyle,
    required this.padding,
    required this.format,
  });

  final TextStyle textStyle;

  /// 标签自己的内边距。私聊靠下方 12 和外面那层 `top: 12` 撑开，
  final EdgeInsets padding;

  /// 毫秒 → 展示串。
  final String Function(int ms) format;

  /// 私聊消息流。[TimeFmt.chatSeparator]：小写 `yesterday`、跨年带年份。
  static const ChatTimestampStyle dm = ChatTimestampStyle(
    textStyle: TextStyle(
      color: AppColors.textGrayB0,
      fontSize: 12,
      fontWeight: FontWeight.w500,
      height: 1.2,
    ),
    padding: EdgeInsets.only(bottom: 12),
    format: TimeFmt.chatSeparator,
  );

  /// 群聊消息流。[TimeFmt.chatBubble]：大写 `Yesterday`、跨年**不**带年份。
  static const ChatTimestampStyle group = ChatTimestampStyle(
    textStyle: TextStyle(
      color: AppColors.textGrayAE,
      fontSize: 12,
      fontWeight: FontWeight.w400,
      height: 1.2,
    ),
    padding: EdgeInsets.symmetric(vertical: 4),
    format: TimeFmt.chatBubbleMs,
  );
}

/// 消息流里居中的时间分隔（私聊 `_DmMessagesFeed` 内联的那段 +
/// 群聊 `_TimestampLabel`， 合一）。插不插由 [shouldShow] 判，
///
/// [serverTimeMs] ≤ 0 时**不占位**：本地刚发出、还没拿到服务端时间的消息
/// `Jan 1 8:00 AM`，这里按私聊为基准收敛）。
class ChatTimestampLabel extends StatelessWidget {
  const ChatTimestampLabel({
    super.key,
    required this.serverTimeMs,
    required this.style,
  });

  final int serverTimeMs;
  final ChatTimestampStyle style;

  /// 「第 [index] 条消息上方要不要插一条时间」—— **全项目只此一份**。
  ///
  /// 以私聊为基准。规则：
  /// 1. 这条没有服务端时间（≤ 0）：只有它是第一条才插 —— 否则拿不到间隔，
  /// 插出来的会是 1970。
  /// 2. 第一条：总是插。
  /// 3. 上一条没有服务端时间：插 —— 间隔算不出来，宁可多插一条。
  /// 4. 其余：与上一条相差 ≥ 5 分钟才插（对齐常见 IM 节奏）。
  /// 取绝对值，因为历史合并后偶尔会有乱序。
  ///
  /// 因为 `sentAt` 会把 0 变成 1970，第 3 条的效果是一样的，
  /// 差别只在第 1 条（无服务端时间的消息会插出一条 1970 的时间）。
  static bool shouldShow(List<ChatLine> messages, int index) {
    if (index < 0 || index >= messages.length) return false;
    final t = messages[index].serverTimeMs;
    if (t <= 0) return index == 0;
    if (index == 0) return true;
    final prev = messages[index - 1].serverTimeMs;
    if (prev <= 0) return true;
    return (t - prev).abs() >= 5 * 60 * 1000;
  }

  @override
  Widget build(BuildContext context) {
    if (serverTimeMs <= 0) return const SizedBox.shrink();
    return Center(
      child: Padding(
        padding: style.padding,
        child: Text(
          style.format(serverTimeMs),
          textAlign: TextAlign.center,
          style: style.textStyle,
        ),
      ),
    );
  }
}
