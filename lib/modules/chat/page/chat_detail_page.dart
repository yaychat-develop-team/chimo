import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../app/app_jumper.dart';
import '../../../app/service/im_service.dart';
import '../../../common/extensions/wire_view.dart';
import '../../../common/theme/app_colors.dart';
import '../../../common/theme/app_bottom_sheet.dart';
import '../../../common/utils/app_toast.dart';
import '../../../common/widgets/app_scaffold.dart';
import '../../../common/widgets/chat_message_action_popup.dart';
import '../model/chat_conversation.dart';
import 'chat_scroll_anchor.dart';
import '../logic/dm_chat_logic.dart';
import '../model/chat_line.dart';
import 'widgets/chat_input_bar.dart';
import 'widgets/dm/dm_app_bar.dart';
import 'widgets/dm/dm_chat_body.dart';
import 'widgets/gift_sheet.dart';

/// 私聊详情：黑色应用栏 + 白色消息区（拖动手柄）+ 输入栏。
class ChatDetailPage extends StatefulWidget {
  const ChatDetailPage({super.key, required this.conversation});

  final ChatConversation conversation;

  @override
  State<ChatDetailPage> createState() => _ChatDetailPageState();
}

class _ChatDetailPageState extends State<ChatDetailPage> with SingleTickerProviderStateMixin {
  final TextEditingController _inputController = TextEditingController();
  final GlobalKey<ChatInputBarState> _inputBarKey = GlobalKey<ChatInputBarState>();

  /// 滚动位置、消息 `GlobalKey`、上拉锚点 —— 与群聊共用一份。
  late final ChatScrollAnchor _anchor = ChatScrollAnchor(isAlive: () => mounted);

  /// 0 = 简介展开，1 = 简介收起（仅导航栏行）。
  late final AnimationController _introCollapse;

  /// 有 Moments 缩略图时简介更高；加大把手拖拽范围。
  static const double _introDragRange = 120;

  /// 会话的数据与动作都在 [DmChatLogic]：消息列表、
  /// 去重集合、历史分页、收发 / 重发 / 关注 / 拉黑 / 撤回 / 删除、IM 订阅。
  ///
  /// 本类只剩 widget 那一半：面板相位与简介动画、`GlobalKey`、
  /// `TextEditingController`，以及需要 `BuildContext` 的长按菜单与几个弹层。
  /// 页面自持 Controller：没有现成实例就自己 put、自己收。
  ///
  /// **按会话 id 打 tag**：聊天里再进另一个会话（或叠一层同会话）时，两个页面
  /// 各拿各的 Controller，pop 时也只回收自己那一份 —— 去掉 tag 会退化成
  /// 「B 页面显示 A 的消息」。
  late final DmChatLogic logic;
  bool _ownsController = false;

  String get _controllerTag => widget.conversation.id;

  @override
  void initState() {
    super.initState();
    if (Get.isRegistered<DmChatLogic>(tag: _controllerTag)) {
      logic = Get.find<DmChatLogic>(tag: _controllerTag);
    } else {
      logic = Get.put(DmChatLogic(seed: widget.conversation), tag: _controllerTag);
      _ownsController = true;
    }
    // ⚠️ 三个 hook 要第一时间挂上：`_c` 上面刚 put 出来，
    // 那一刻 Controller 的 `onInit`（内含 `unawaited(loadFromApi())`）就已经跑了。
    // 那条链在第一个 `await` 处让出，所以这里挂得上 —— 但别往后挪。
    logic.onScrollToBottom = _scrollToBottom;
    logic.onHistoryAnchorSave = _anchor.saveHistoryAnchor;
    logic.onHistoryAnchorRestore = _anchor.restoreHistoryAnchor;
    _introCollapse = AnimationController(vsync: this, duration: const Duration(milliseconds: 220));
    _anchor.controller.addListener(_onMessagesScroll);
  }

  @override
  void dispose() {
    // hook 必须摘掉：Controller 可能比 widget 活得久（路由动画期间），
    // 留着的话一次迟到的 onScrollToBottom 会摸到已 dispose 的 ScrollController。
    logic.onScrollToBottom = null;
    logic.onHistoryAnchorSave = null;
    logic.onHistoryAnchorRestore = null;
    _introCollapse.dispose();
    _inputController.dispose();
    _anchor.controller.removeListener(_onMessagesScroll);
    _anchor.dispose();
    if (_ownsController && Get.isRegistered<DmChatLogic>(tag: _controllerTag)) {
      Get.delete<DmChatLogic>(tag: _controllerTag);
    }
    super.dispose();
  }

  /// 滚到底：`force` 期间关掉上拉，否则和「跳到底部」竞态 —— 表现是刚进会话
  /// 就自动翻上一页。开关放回去要等最后一次 jump 之后（[ChatScrollAnchor] 的
  /// `onSettled`）。
  void _scrollToBottom({bool force = false, bool animated = false}) {
    if (force) logic.allowHistoryLoadMore.value = false;
    _anchor.scrollToBottom(
      force: force,
      animated: animated,
      onSettled: force ? () => logic.allowHistoryLoadMore.value = true : null,
    );
  }

  void _onMessagesScroll() {
    if (!logic.allowHistoryLoadMore.value) return;
    if (!_anchor.controller.hasClients) return;
    if (logic.historyLoading.value || !logic.historyHasMore.value) return;
    final peerEm = logic.imConversationId;
    if (peerEm.isEmpty) return;
    // 接近顶部 → 加载更早消息。
    if (_anchor.controller.position.pixels <= 64) {
      unawaited(logic.loadImHistory(peerEm, loadMore: true));
    }
  }

  void _onIntroDragUpdate(DragUpdateDetails details) {
    final next = (_introCollapse.value - details.delta.dy / _introDragRange).clamp(0.0, 1.0);
    _introCollapse.value = next;
  }

  void _onIntroDragEnd(DragEndDetails details) {
    final v = details.primaryVelocity ?? 0;
    if (v < -280) {
      _introCollapse.animateTo(1, curve: Curves.easeOutCubic);
    } else if (v > 280) {
      _introCollapse.animateTo(0, curve: Curves.easeOutCubic);
    } else {
      _introCollapse.animateTo(_introCollapse.value >= 0.5 ? 1 : 0, curve: Curves.easeOutCubic);
    }
  }

  /// 长按气泡：菜单里有哪几项留在 View（要 `BuildContext` 与气泡的 `Rect`），
  /// 撤回 / 删除那两刀在 [DmChatLogic]。
  Future<void> _onMessageLongPress(ChatLine line, Rect anchor) async {
    if (line.kind == ChatLineKind.gift || line.kind == ChatLineKind.tip) {
      return;
    }

    // 对齐原版 forya：
    //   Copy：仅文本；replay / recall / delete：文本、图片、语音
    //   Recall：自己发的 + 距 serverTime < 60 秒 + 有 msgId
    final nowMs = DateTime.now().millisecondsSinceEpoch;
    final withinRecallWindow = line.serverTimeMs > 0 && nowMs - line.serverTimeMs < 60 * 1000;
    final canCopy = line.kind == ChatLineKind.text && line.text.trim().isNotEmpty;
    final canReplay =
        canCopy ||
        line.kind == ChatLineKind.voice ||
        line.kind == ChatLineKind.image ||
        line.kind == ChatLineKind.emote;
    final actions = <ChatMessageAction>[
      if (canCopy) ChatMessageAction.copy,
      if (canReplay) ChatMessageAction.replay,
      if (line.side == ChatSide.self && line.msgId.isNotEmpty && withinRecallWindow)
        ChatMessageAction.recall,
      ChatMessageAction.delete,
    ];
    if (actions.isEmpty) return;

    final action = await ChatMessageActionPopup.show(
      context: context,
      anchor: anchor,
      actions: actions,
    );
    if (!mounted || action == null) return;

    switch (action) {
      case ChatMessageAction.copy:
        await Clipboard.setData(ClipboardData(text: line.text));
        AppToast.info('Saved to the clipboard');
        return;
      case ChatMessageAction.replay:
        final sendName = line.side == ChatSide.self ? 'You' : widget.conversation.title.trim();
        logic.quote.value = ImQuoteMsg(
          msgId: line.msgId,
          showText: line.listPreview,
          sendName: sendName.isEmpty ? 'User' : sendName,
        );
        return;
      case ChatMessageAction.recall:
        final recallId = line.msgId.trim();
        if (recallId.isEmpty) {
          AppToast.info('Cannot recall: missing msgId');
          return;
        }
        if (!await logic.recall(recallId)) {
          AppToast.info('Recall failed');
        }
        return;
      case ChatMessageAction.delete:
        final deleteId = line.msgId.trim();
        if (deleteId.isEmpty) {
          // 本地消息（尚无 msgId）直接从列表移除。
          final idx = logic.messages.indexOf(line);
          if (idx >= 0) logic.messages.removeAt(idx);
          return;
        }
        await logic.deleteForMe(deleteId);
        return;
    }
  }

  /// 清空输入框留在 View（`TextEditingController` 是 widget 的）；空串校验和
  /// 摘引用都在下面两层里 —— [ChatInputBar] 挡空串，
  /// [DmChatLogic.sendText] 在关系校验之后才摘引用。
  Future<void> _sendMessage(String text) async {
    _inputController.clear();
    await logic.sendText(text);
  }

  /// 礼物弹层与资料页那个是同一个。
  /// 键盘与面板已由 [ChatInputBar] 收好。
  Future<void> _showGiftSheet() async {
    final result = await AppBottomSheet.show<GiftSendResult>(
      isScrollControlled: true,
      child: GiftSheet(style: GiftSheetStyle.chat, receiverUid: logic.profileUid),
    );
    if (!mounted || result == null) return;
    logic.sendGift(
      id: result.id,
      qty: result.qty,
      emoji: result.emoji,
      name: result.name,
      iconUrl: result.iconUrl,
    );
  }

  Future<void> _openMoreMenu() async {
    final action = await AppBottomSheet.actions<_DmMoreAction>(
      buildItems: () => [
        AppSheetAction(
          label: 'Search',
          onTap: () => AppJumper.back(result: _DmMoreAction.search),
        ),
        AppSheetAction(
          label: logic.following.value ? 'Unfollow' : 'Follow',
          onTap: () => AppJumper.back(result: _DmMoreAction.follow),
        ),
        AppSheetAction(
          label: logic.blocked.value ? 'Unblock' : 'Block',
          destructive: !logic.blocked.value,
          onTap: () => AppJumper.back(result: _DmMoreAction.block),
        ),
        AppSheetAction(
          label: 'Report',
          destructive: true,
          onTap: () => AppJumper.back(result: _DmMoreAction.report),
        ),
      ],
    );
    if (!mounted || action == null) return;
    switch (action) {
      case _DmMoreAction.search:
        AppJumper.toImSearch(scopeConversation: logic.conversation.value);
      case _DmMoreAction.follow:
        await logic.toggleFollow();
      case _DmMoreAction.block:
        await logic.toggleBlock();
      case _DmMoreAction.report:
        AppJumper.toReport(reportedId: logic.relationUid);
      case _DmMoreAction.cancel:
        break;
    }
  }

  /// 资料页回来后要重问一次拉黑状态：在那边可能刚拉黑 / 解除
  /// （[DmChatLogic.refreshBlocked]）。
  void _openPeerProfile() {
    final profile = logic.previewProfile();
    unawaited(() async {
      await AppJumper.toProfile(profile.uid, preview: profile);
      if (!mounted) return;
      await logic.refreshBlocked();
    }());
  }

  @override
  Widget build(BuildContext context) {
    final topPadding = MediaQuery.paddingOf(context).top;
    final bottomPadding = MediaQuery.paddingOf(context).bottom;

    return ChimoScaffold(
      showNav: false,
      safeArea: false,
      backgroundColor: AppColors.backgroundDeep,
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          SizedBox(height: topPadding),
          AnimatedBuilder(
            animation: _introCollapse,
            builder: (context, _) {
              // Obx 套在里层：动画每帧重建走 AnimatedBuilder，
              // 关注 / 资料变化走 Obx，两条路互不干扰。
              return Obx(
                () => DmAppBar(
                  conversation: logic.conversation.value,
                  following: logic.following.value,
                  collapse: _introCollapse.value,
                  loading: logic.loadingPeer.value,
                  onFollowTap: () => unawaited(logic.toggleFollow()),
                  onAvatarTap: _openPeerProfile,
                  onMoreTap: () => unawaited(_openMoreMenu()),
                ),
              );
            },
          ),
          Expanded(
            child: Obx(
              () => DmChatBody(
                // `.toList()` 不是多余的：`DmChatBody` 的 build 在 Obx 的
                // builder 之外跑，光把 RxList 传下去登记不到依赖，消息变化
                // 不会重建。在 builder 里读一次列表才算订阅。
                messages: logic.messages.toList(),
                peerAvatar: logic.conversation.value.avatarAsset,
                peerAvatarUrl: logic.conversation.value.avatarUrl,
                selfAvatarUrl: logic.selfAvatarUrl.value,
                messagesScroll: _anchor.controller,
                historyLoading: logic.historyLoading.value,
                historyHasMore: logic.historyHasMore.value && logic.allowHistoryLoadMore.value,
                onHandleDragUpdate: _onIntroDragUpdate,
                onHandleDragEnd: _onIntroDragEnd,
                onBlankTap: () => _inputBarKey.currentState?.dismissComposer(),
                onFailedTap: (index) => unawaited(logic.onFailedTap(index)),
                onMessageLongPress: (line, anchor) => unawaited(_onMessageLongPress(line, anchor)),
                onQuoteTap: (msgId) => _anchor.scrollToMessage(msgId, logic.messages),
                messageKeyFor: _anchor.keyFor,
              ),
            ),
          ),
          // 引用条来自 `_c.quote`，所以这里得是 Obx。
          Obx(
            () => ChatInputBar(
              key: _inputBarKey,
              style: ChatInputBarStyle.dm,
              bottomInset: bottomPadding,
              controller: _inputController,
              quote: logic.quote.value,
              onClearQuote: logic.clearQuote,
              onSendText: (text) => unawaited(_sendMessage(text)),
              onSendVoice: logic.sendVoice,
              onSendImages: logic.sendImages,
              onGiftTap: () => unawaited(_showGiftSheet()),
              // 贴纸包（私聊独有）。取数在 Controller 上 —— 面板是公共组件，
              stickers: ChatStickerSource(
                loadPacks: logic.loadEmotePacks,
                loadStickers: logic.loadEmoteStickers,
                onSend: logic.sendEmote,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

enum _DmMoreAction { search, follow, block, report, cancel }
