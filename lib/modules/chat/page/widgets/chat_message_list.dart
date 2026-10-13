import 'package:flutter/material.dart';

import '../../../../common/constants/app_assets.dart';
import '../../../../common/theme/app_colors.dart';
import '../../../../common/widgets/app_image.dart';
import '../../../profile/page/album_photo_viewer_page.dart';
import '../../model/chat_line.dart';
import 'chat_bubble.dart';
import 'chat_emote_bubble.dart';
import 'chat_gift_card.dart';
import 'chat_image_bubble.dart';
import 'chat_join_tip.dart';
import 'chat_recall_tip.dart';
import 'chat_timestamp_label.dart';
import 'chat_voice_bubble.dart';

/// 头像从哪儿取。
enum ChatAvatarSource {
  /// 会话级：对方一张、自己一张。私聊用 —— 一条私聊消息不带发送者信息。
  conversation,

  /// 每条消息自带 `ChatLine.senderAvatar`。群聊用 —— 连续两条对方消息
  /// 很可能不是同一个人。
  sender,
}

/// 消息流的排版差异表。
///
/// 私聊与群聊的差异**全部**收在这里，[ChatMessageList] 自身没有 `isGroup`
/// 分支。和 `ChatBubbleStyle` / `ChatImageStyle` 一个理由：把两边不同的值统一
/// 成「看起来对的那个」是评审看不见的静默视觉回归。
///
/// | 项 | 私聊 | 群聊 |
/// | --- | --- | --- |
/// | [padding] | 14 / 8 / 14 / 24 | 16 / 12 / 16 / 20 |
/// | [emptyPadding] | null（居中、不可滚动） | 16 / 48 / 16 / 20（可滚动） |
/// | [emptyTextStyle] | C9 · 14 · w500 | AE · 14 · w500 · h1.4 |
/// | [showAvatarAt] | [ChatMessageList.avatarBySide] | [ChatMessageList.avatarBySender] |
/// | [avatarBorderRadius] | null（正圆） | 8 |
/// | [avatarSource] | conversation | sender |
/// | [bubbleMaxWidth] | null（下面两项分别管） | 260（四种气泡统一约束） |
/// | [selfTextMaxWidth] / [peerTextMaxWidth] | 260 / 243 | null |
/// | [selfRowFlexible] | true | **false**（见字段说明，是缺陷不是设计） |
/// | [anchorLongPressToRow] | true（菜单锚整行） | false（锚气泡） |
/// | [gapAboveTimestamp] | 12 | 14 |
/// | [gapBelowTimestamp] | 0 | 10 |
/// | [gapSameSide] / [gapOtherSide] / [gapSameSideMedia] | 6 / 20 / 4 | 10 / 10 / 10 |
/// | [flushFirstItem] | false | true |
class ChatMessageListStyle {
  const ChatMessageListStyle({
    required this.padding,
    required this.emptyTextStyle,
    required this.showAvatarAt,
    required this.avatarSource,
    required this.bubbleStyle,
    required this.imageStyle,
    required this.timestampStyle,
    required this.recallTextStyle,
    required this.gapAboveTimestamp,
    required this.gapBelowTimestamp,
    required this.gapSameSide,
    required this.gapOtherSide,
    required this.gapSameSideMedia,
    this.emptyPadding,
    this.avatarBorderRadius,
    this.bubbleMaxWidth,
    this.selfTextMaxWidth,
    this.peerTextMaxWidth,
    this.selfRowFlexible = true,
    this.anchorLongPressToRow = true,
    this.flushFirstItem = false,
  });

  /// 列表内边距。
  final EdgeInsets padding;

  /// 空态内边距。**null 有语义**：空态是居中的一块（`Center`），不可滚动、
  /// 不挂 `ScrollController`；非 null 时空态是一个只有一行字的可滚动列表。
  final EdgeInsets? emptyPadding;

  final TextStyle emptyTextStyle;

  /// 这一条要不要画头像（也决定群聊要不要画发送者名字那一行）。
  ///
  /// 两边的分组规则**不能合成一条**：私聊按「换边」，群聊按「换人」。
  /// 把群聊那条用到私聊上，连续两条对方消息会各画一次头像
  /// （私聊 `senderUid` / `senderName` 都是空 → 落到「都不是自己就算换人」）。
  /// 所以这里是一个函数字段，两条规则都是可单测的静态方法。
  final bool Function(List<ChatLine> lines, int index) showAvatarAt;

  /// 头像圆角。null = 正圆（`ClipOval`）。
  final BorderRadius? avatarBorderRadius;

  final ChatAvatarSource avatarSource;

  final ChatBubbleStyle bubbleStyle;
  final ChatImageStyle imageStyle;
  final ChatTimestampStyle timestampStyle;

  /// 撤回提示的字重（`ChatRecallTip.dmStyle` / `.groupStyle`）。
  final TextStyle recallTextStyle;

  /// 气泡在**外层**统一约束的最大宽度。群聊四种气泡共用 260。
  final double? bubbleMaxWidth;

  /// 文字气泡自己那侧 / 对方那侧的最大宽度（私聊两个值不一样，
  /// 传进 `ChatBubble.maxWidth`）。
  final double? selfTextMaxWidth;
  final double? peerTextMaxWidth;

  /// 自己那一行的气泡要不要包一层 `Flexible`。
  ///
  /// **群聊是 false，这是照抄现状、不是设计**：群聊自己那行没有 `Flexible`，
  /// 一条 260 宽的气泡加 40 头像加 10 间距加左右各 16 内边距 = 342，
  /// 窄屏（≤ 320pt）会溢出约 22px。改成 true 会连带改变换行宽度，
  /// 属于「这一步之后必须完全一致」之外的修复，留给单独一刀。
  final bool selfRowFlexible;

  /// 长按菜单的锚点：true 锚**整行**（私聊现状），false 锚**气泡**（群聊现状）。
  /// 决定弹出层贴在哪儿，两边视觉不同，不统一。
  final bool anchorLongPressToRow;

  /// 时间标签**上方**的间距。
  final double gapAboveTimestamp;

  /// 时间标签与它下面那条消息之间的间距。私聊是 0 —— 私聊的间距做在
  /// `ChatTimestampStyle.dm.padding` 的 `bottom: 12` 里。
  final double gapBelowTimestamp;

  /// 同侧连发 / 换边 / 同侧且两条都是媒体（图片·语音·表情）。
  /// 群聊三个都是 10，等于「不分情况」。
  final double gapSameSide;
  final double gapOtherSide;
  final double gapSameSideMedia;

  /// 第一条要不要贴顶（连时间标签上方那一格也不留）。群聊是 true。
  final bool flushFirstItem;

  /// 第 [index] 条上方留多少。
  ///
  /// 否则给 10」—— 三个 gap 都填 10 之后这里跑出来的结果和它一模一样。
  double gapAbove(List<ChatLine> lines, int index, {required bool showTimestamp}) {
    if (index <= 0) {
      // 群聊第一条贴顶；私聊第一条永远有时间标签（`shouldShow` 在 index 0
      // 总是 true），所以走 gapAboveTimestamp。
      return flushFirstItem ? 0 : (showTimestamp ? gapAboveTimestamp : 0);
    }
    if (showTimestamp) return gapAboveTimestamp;
    final line = lines[index];
    final prev = lines[index - 1];
    if (line.side != prev.side) return gapOtherSide;
    return isMedia(line) && isMedia(prev) ? gapSameSideMedia : gapSameSide;
  }

  /// 图片 / 语音 / 表情算一类：同侧连着两条媒体时上方留得更窄。
  static bool isMedia(ChatLine line) =>
      line.kind == ChatLineKind.image ||
      line.kind == ChatLineKind.voice ||
      line.kind == ChatLineKind.emote;

  /// 两条消息是不是同一个人发的（群聊头像分组用）。
  ///
  /// uid 优先，其次昵称；两样都没有时只认「都是自己」。
  static bool sameSender(ChatLine a, ChatLine b) {
    if (a.isSelf != b.isSelf) return false;
    final au = a.senderUid.trim();
    final bu = b.senderUid.trim();
    if (au.isNotEmpty && bu.isNotEmpty) return au == bu;
    final an = a.senderName.trim();
    final bn = b.senderName.trim();
    if (an.isNotEmpty && bn.isNotEmpty) return an == bn;
    return a.isSelf && b.isSelf;
  }

  /// 私聊消息流的排版（合一前是 `_DmMessagesFeed` 里那堆常量）。
  ///
  /// **`static final` 而不是 `const`**：它持有 `ChatImageStyle.dm`，那里面
  /// 6% 黑的投影是 `withValues` 算出来的，不是常量（和
  /// `chat_timestamp_label.dart` 里同一个不对称）。
  static final ChatMessageListStyle dm = ChatMessageListStyle(
    padding: const EdgeInsets.fromLTRB(14, 8, 14, 24),
    emptyTextStyle: const TextStyle(
      color: AppColors.textGrayC9,
      fontSize: 14,
      fontWeight: FontWeight.w500,
    ),
    showAvatarAt: ChatMessageList.avatarBySide,
    avatarSource: ChatAvatarSource.conversation,
    bubbleStyle: ChatBubbleStyle.dm,
    imageStyle: ChatImageStyle.dm,
    timestampStyle: ChatTimestampStyle.dm,
    recallTextStyle: ChatRecallTip.dmStyle,
    selfTextMaxWidth: 260,
    peerTextMaxWidth: 243,
    gapAboveTimestamp: 12,
    gapBelowTimestamp: 0,
    gapSameSide: 6,
    gapOtherSide: 20,
    gapSameSideMedia: 4,
  );

  /// 群聊消息流的排版（合一前是 `_MessagesFeed` + `_GroupChatBubble`）。
  static const ChatMessageListStyle group = ChatMessageListStyle(
    padding: EdgeInsets.fromLTRB(16, 12, 16, 20),
    emptyPadding: EdgeInsets.fromLTRB(16, 48, 16, 20),
    emptyTextStyle: TextStyle(
      color: AppColors.textGrayAE,
      fontSize: 14,
      fontWeight: FontWeight.w500,
      height: 1.4,
    ),
    showAvatarAt: ChatMessageList.avatarBySender,
    avatarBorderRadius: BorderRadius.all(Radius.circular(8)),
    avatarSource: ChatAvatarSource.sender,
    bubbleStyle: ChatBubbleStyle.group,
    imageStyle: ChatImageStyle.group,
    timestampStyle: ChatTimestampStyle.group,
    recallTextStyle: ChatRecallTip.groupStyle,
    bubbleMaxWidth: 260,
    selfRowFlexible: false,
    anchorLongPressToRow: false,
    flushFirstItem: true,
    gapAboveTimestamp: 14,
    gapBelowTimestamp: 10,
    gapSameSide: 10,
    gapOtherSide: 10,
    gapSameSideMedia: 10,
  );
}

/// 装气泡的那个列表 —— 私聊 `_DmMessagesFeed` 与群聊 `_MessagesFeed` 合一
///
/// 这一层管的东西：滚动容器、空态、顶部「加载更早」转圈、**时间标签插入**、
/// **条目间距**、**头像分组**、行结构（头像 + 发送者名 + 失败重发图标）、
/// `kind → 气泡` 那张表、条目 `GlobalKey`、长按锚点。
///
/// 不管的：滚动位置、上拉触发、滚到底部 —— 那些在页面与
/// `ChatBaseLogic` 里，这里只接一个 [scrollController]（ticket 第 2 条）。
///
/// 两边的差异一律走 [ChatMessageListStyle]，类里没有 `isGroup`。
class ChatMessageList extends StatelessWidget {
  const ChatMessageList({
    super.key,
    required this.lines,
    required this.scrollController,
    required this.style,
    this.peerAvatar = '',
    this.peerAvatarUrl,
    this.selfAvatarUrl,
    this.showSenderName = false,
    this.locked = false,
    this.historyLoading = false,
    this.historyHasMore = false,
    this.onBlankTap,
    this.onRetry,
    this.onAvatarTap,
    this.onMessageLongPress,
    this.onQuoteTap,
    this.messageKeyFor,
  });

  /// 已经排好序的消息（旧 → 新）。**传普通 List**：`.obs` 不跨层
  /// （命名规则 3.2 第 3 条），页面在 `Obx` 里 `.toList()` 后传下来。
  final List<ChatLine> lines;

  final ScrollController scrollController;

  final ChatMessageListStyle style;

  /// 对方头像（会话级）—— `ChatAvatarSource.conversation` 才用。
  /// [peerAvatar] 是本地兜底图，[peerAvatarUrl] 是网络地址。
  final String peerAvatar;
  final String? peerAvatarUrl;

  /// 自己的头像（会话级）。
  final String? selfAvatarUrl;

  /// 对方气泡上方画发送者名字 + 性别标 —— 群聊 true。
  final bool showSenderName;

  /// 未加入社区：语音不给播、图片不给点大图。私聊恒 false。
  final bool locked;

  final bool historyLoading;
  final bool historyHasMore;

  /// 点消息之外的空白（收起表情 / 更多面板）。
  final VoidCallback? onBlankTap;

  /// 点失败感叹号重发。**为 null 时那个图标根本不画** —— 群聊没有重发。
  final ValueChanged<int>? onRetry;

  /// 点头像（群聊：入群提示里的昵称也走它）。自己那侧不给点。
  final ValueChanged<ChatLine>? onAvatarTap;

  /// 长按消息。[Rect] 是菜单锚点，锚哪儿看
  /// [ChatMessageListStyle.anchorLongPressToRow]。
  final void Function(ChatLine line, Rect anchor)? onMessageLongPress;

  /// 点引用条跳原消息。
  final ValueChanged<String>? onQuoteTap;

  /// 按 msgId 拿条目的 `GlobalKey`（页面用它 `ensureVisible` 定位引用）。
  final GlobalKey Function(String msgId)? messageKeyFor;

  /// 头像那一格的尺寸与它到气泡的间距 —— 两边一样，所以是普通常量，
  /// 不进样式包。
  static const double avatarSize = 40;
  static const double avatarGap = 10;

  /// 头像分组规则 · 私聊：**换边就画**。
  ///
  /// 往前找上一条时跳过撤回提示（`tip`）：那种行不占头像那一格，让它参与
  /// 判断会把同一个人的连续消息拆成两组、多画一个头像。
  static bool avatarBySide(List<ChatLine> lines, int index) {
    if (index < 0 || index >= lines.length) return false;
    if (lines[index].kind == ChatLineKind.tip) return false;
    var prev = index - 1;
    while (prev >= 0 && lines[prev].kind == ChatLineKind.tip) {
      prev--;
    }
    if (prev < 0) return true;
    return lines[index].side != lines[prev].side;
  }

  /// 头像分组规则 · 群聊：**换人、换消息类型、或上一条是入群 / 撤回提示**就画。
  static bool avatarBySender(List<ChatLine> lines, int index) {
    if (index < 0 || index >= lines.length) return false;
    if (index == 0) return true;
    final line = lines[index];
    final prev = lines[index - 1];
    if (prev.kind == ChatLineKind.join || prev.kind == ChatLineKind.recall) {
      return true;
    }
    if (!ChatMessageListStyle.sameSender(line, prev)) return true;
    return line.kind != prev.kind;
  }

  @override
  Widget build(BuildContext context) {
    if (lines.isEmpty) return _empty();

    // 顶部转圈占 index 0：转着的时候占位，还有更多也占位（不然一到顶就
    // 「跳」一格）。私聊群聊都是这条。
    final showTopLoader = historyLoading || historyHasMore;
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: onBlankTap,
      child: ListView.builder(
        controller: scrollController,
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        padding: style.padding,
        itemCount: lines.length + (showTopLoader ? 1 : 0),
        itemBuilder: (context, index) {
          if (showTopLoader && index == 0) return _topLoader;
          return _item(context, showTopLoader ? index - 1 : index);
        },
      ),
    );
  }

  Widget _empty() {
    final text = Text('No messages yet', textAlign: TextAlign.center, style: style.emptyTextStyle);
    final padding = style.emptyPadding;
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: onBlankTap,
      child: padding == null
          // 私聊空态：居中一行字，**不可滚动、不挂 controller**。
          ? Center(child: text)
          : ListView(controller: scrollController, padding: padding, children: [text]),
    );
  }

  static const Widget _topLoader = Padding(
    padding: EdgeInsets.symmetric(vertical: 12),
    child: Center(
      child: SizedBox(
        width: 22,
        height: 22,
        child: CircularProgressIndicator(strokeWidth: 2, color: AppColors.textGrayB0),
      ),
    ),
  );

  Widget _item(BuildContext listContext, int index) {
    final line = lines[index];
    final showTimestamp = ChatTimestampLabel.shouldShow(lines, index);
    final gapBelowLabel = style.gapBelowTimestamp;
    return KeyedSubtree(
      // 只有拿到 msgId 的才挂 key：本地待发消息还没有 id，挂了会撞。
      key: line.msgId.isNotEmpty ? messageKeyFor?.call(line.msgId) : null,
      child: Padding(
        padding: EdgeInsets.only(top: style.gapAbove(lines, index, showTimestamp: showTimestamp)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            if (showTimestamp) ...[
              ChatTimestampLabel(serverTimeMs: line.serverTimeMs, style: style.timestampStyle),
              if (gapBelowLabel > 0) SizedBox(height: gapBelowLabel),
            ],
            // 这一层 Builder 的 context 就是「整行」—— 私聊的长按菜单锚在它上。
            Builder(builder: (rowContext) => _row(listContext, rowContext, line, index)),
          ],
        ),
      ),
    );
  }

  /// 一条消息的那一行。[rowContext] 是整行的 context（私聊长按锚点）。
  Widget _row(BuildContext listContext, BuildContext rowContext, ChatLine line, int index) {
    final isSelf = line.isSelf;
    final showAvatar = style.showAvatarAt(lines, index);

    // 自己排版、不进「头像 + 气泡」那一行的三种。
    switch (line.kind) {
      case ChatLineKind.join:
        // 群聊独有。点昵称和点头像同一个动作。
        return ChatJoinTip(
          name: line.joinName,
          onNameTap: onAvatarTap == null ? null : () => onAvatarTap!(line),
        );
      case ChatLineKind.tip:
      case ChatLineKind.recall:
        // 私聊的撤回走 tip，群聊走 recall。
        return ChatRecallTip(isSelf: isSelf, text: line.text, style: style.recallTextStyle);
      case ChatLineKind.gift:
        // 私聊独有。卡片自己排左右两栏，头像那一格由这里给。
        return ChatGiftCard(
          isSelf: isSelf,
          giftId: line.giftId,
          qty: line.giftQty,
          emoji: line.giftEmoji,
          giftName: line.giftName,
          giftIconUrl: line.giftIconUrl,
          avatar: showAvatar ? _avatar(line) : const SizedBox(width: avatarSize),
        );
      case ChatLineKind.text:
      case ChatLineKind.voice:
      case ChatLineKind.image:
      case ChatLineKind.emote:
        break;
    }

    Widget bubble = switch (line.kind) {
      ChatLineKind.voice => ChatVoiceBubble(
        isSelf: isSelf,
        seconds: line.voiceSeconds,
        mediaSource: line.mediaSource,
        msgId: line.msgId,
        locked: locked,
      ),
      ChatLineKind.image => ChatImageBubble(
        source: line.displayMedia,
        isSelf: isSelf,
        style: style.imageStyle,
        locked: locked,
      ),
      ChatLineKind.emote => ChatEmoteBubble(source: line.displayMedia),
      // 上面的 switch 已经把 join / tip / recall / gift 挡在外面，这里只剩 text。
      _ => ChatBubble(
        isSelf: isSelf,
        text: line.text,
        style: style.bubbleStyle,
        quoteContent: line.quoteContentIn(lines),
        quoteMsgId: line.quoteMsgId,
        onQuoteTap: onQuoteTap,
        maxWidth: isSelf ? style.selfTextMaxWidth : style.peerTextMaxWidth,
      ),
    };

    final bubbleMaxWidth = style.bubbleMaxWidth;
    if (bubbleMaxWidth != null) {
      // 群聊：四种气泡在外面统一约束（所以 ChatBubble 不传 maxWidth）。
      bubble = ConstrainedBox(
        constraints: BoxConstraints(maxWidth: bubbleMaxWidth),
        child: bubble,
      );
    }
    bubble = _interactive(listContext, rowContext, line, bubble);

    if (isSelf) {
      Widget body = bubble;
      if (line.failed && onRetry != null) {
        // 失败感叹号紧贴气泡左侧，勿与 Flexible 并列否则会被撑到最左。
        body = Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () => onRetry!(index),
              behavior: HitTestBehavior.opaque,
              child: const Padding(
                padding: EdgeInsets.all(4),
                child: Icon(Icons.error, color: AppColors.dangerBright, size: 20),
              ),
            ),
            const SizedBox(width: 2),
            bubble,
          ],
        );
      }
      return Row(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (style.selfRowFlexible)
            Flexible(
              child: Align(alignment: Alignment.centerRight, child: body),
            )
          else
            body,
          const SizedBox(width: avatarGap),
          showAvatar ? _avatar(line) : const SizedBox(width: avatarSize),
        ],
      );
    }

    final nameRow = showSenderName && showAvatar ? _SenderNameRow(line: line) : null;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        showAvatar ? _avatar(line) : const SizedBox(width: avatarSize),
        const SizedBox(width: avatarGap),
        Flexible(
          child: nameRow == null
              ? Align(alignment: Alignment.centerLeft, child: bubble)
              : Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [nameRow, const SizedBox(height: 6), bubble],
                ),
        ),
      ],
    );
  }

  /// 图片点大图 + 长按菜单。
  ///
  /// 但 `Row` / `Align` / `Flexible` 的空白本身不参与命中，所以有效热区
  /// 本来就只有气泡；差别只剩「锚点取谁的 `RenderBox`」，那一项进样式包
  /// （[ChatMessageListStyle.anchorLongPressToRow]）。
  ///
  /// 能走到这里的只有 text / voice / image / emote —— 另外四种在 [_row]
  /// 上面就返回了。
  Widget _interactive(
    BuildContext listContext,
    BuildContext rowContext,
    ChatLine line,
    Widget bubble,
  ) {
    final longPress = onMessageLongPress;
    // 未加入社区：图片不给点大图（群聊 isJoined == false）。
    final canOpenImage = line.kind == ChatLineKind.image && !locked;
    if (longPress == null && !canOpenImage) return bubble;
    return Builder(
      builder: (bubbleContext) => GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: canOpenImage ? () => _openImageViewer(listContext, line) : null,
        onLongPress: longPress == null
            ? null
            : () {
                final rect = _anchorRect(style.anchorLongPressToRow ? rowContext : bubbleContext);
                if (rect != null) longPress(line, rect);
              },
        child: bubble,
      ),
    );
  }

  /// 会话内所有图片一起进大图查看器，停在点的那张。
  void _openImageViewer(BuildContext context, ChatLine line) {
    final paths = [
      for (final m in lines)
        if (m.kind == ChatLineKind.image && m.displayMedia.trim().isNotEmpty) m.displayMedia.trim(),
    ];
    final initial = paths.indexOf(line.displayMedia.trim());
    AlbumPhotoViewerPage.open(
      context,
      paths: paths,
      initialIndex: initial < 0 ? 0 : initial,
      showPageIndicator: false,
    );
  }

  Widget _avatar(ChatLine line) {
    final String? url;
    final String asset;
    if (style.avatarSource == ChatAvatarSource.sender) {
      url = line.senderAvatar;
      asset = AppAssets.avatarPlace;
    } else if (line.isSelf) {
      url = selfAvatarUrl;
      asset = AppAssets.avatarPlace;
    } else {
      url = peerAvatarUrl;
      asset = peerAvatar;
    }
    final Widget avatar = _ChatAvatar(
      url: url,
      asset: asset,
      borderRadius: style.avatarBorderRadius,
    );
    final tap = onAvatarTap;
    // 自己那侧不给点（点了也是自己）。
    if (tap == null || line.isSelf) return avatar;
    return GestureDetector(onTap: () => tap(line), behavior: HitTestBehavior.opaque, child: avatar);
  }

  static Rect? _anchorRect(BuildContext context) {
    final box = context.findRenderObject() as RenderBox?;
    if (box == null || !box.hasSize) return null;
    return box.localToGlobal(Offset.zero) & box.size;
  }
}

class _ChatAvatar extends StatelessWidget {
  const _ChatAvatar({required this.url, required this.asset, this.borderRadius});

  final String? url;
  final String asset;

  /// null = 正圆。
  final BorderRadius? borderRadius;

  @override
  Widget build(BuildContext context) {
    final image = AppImage(
      url,
      fallbackAsset: asset,
      width: ChatMessageList.avatarSize,
      height: ChatMessageList.avatarSize,
      fit: BoxFit.cover,
      // 头像不做淡入：列表滚动时每次复用都闪一下。
      fadeIn: Duration.zero,
    );
    final radius = borderRadius;
    if (radius == null) return ClipOval(child: image);
    return ClipRRect(borderRadius: radius, child: image);
  }
}

/// 对方昵称 + 性别图标（对齐 forya `SexAgeLabel isOnlySex`）。群聊才画。
class _SenderNameRow extends StatelessWidget {
  const _SenderNameRow({required this.line});

  final ChatLine line;

  @override
  Widget build(BuildContext context) {
    final name = line.senderName.trim().isEmpty ? 'User' : line.senderName.trim();
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Flexible(
          child: Text(
            name,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              color: AppColors.textGrayAE,
              fontSize: 12,
              fontWeight: FontWeight.w500,
              height: 1.2,
            ),
          ),
        ),
        if (line.hasSenderGender) ...[
          const SizedBox(width: 2),
          AppImage(
            line.senderIsMale ? AppAssets.genderMan : AppAssets.genderWoman,
            width: 16,
            height: 16,
          ),
        ],
      ],
    );
  }
}
