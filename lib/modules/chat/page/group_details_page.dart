import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../app/app_jumper.dart';
import '../../../app/service/im_service.dart';
import '../../../common/theme/app_colors.dart';
import '../../../common/theme/app_dialog.dart';
import '../../../common/utils/app_toast.dart';
import '../../../common/theme/app_bottom_sheet.dart';
import '../../../common/widgets/app_scaffold.dart';
import '../../../common/widgets/chat_message_action_popup.dart';
import '../../report/model/report_target.dart';
import '../../../common/extensions/wire_view.dart';
import '../../../common/models/server_client/group/group.pb.dart';
import '../../profile/page/widgets/chat_user_profile_sheet.dart';
import '../../profile/page/album_photo_viewer_page.dart';
import 'chat_scroll_anchor.dart';
import '../logic/group_chat_logic.dart';
import '../model/chat_line.dart';
import 'widgets/chat_input_bar.dart';
import 'widgets/group/group_backdrop.dart';
import 'widgets/group/group_chat_body.dart';
import 'widgets/group/group_details_app_bar.dart';
import 'widgets/group/group_join_bar.dart';
import 'widgets/group/group_profile_header.dart';

/// 群聊页：未加入 = 有限浏览 + 加入；已加入 = 消息 + 输入。
class GroupDetailsPage extends StatefulWidget {
  const GroupDetailsPage({super.key, required this.group, this.onMembershipChanged});

  final GroupInfo group;

  /// 加入状态回调（同步首页「我的群组」）：加入时建会话，离开只改身份、留会话。
  final ValueChanged<bool>? onMembershipChanged;

  @override
  State<GroupDetailsPage> createState() => _GroupDetailsPageState();
}

class _GroupDetailsPageState extends State<GroupDetailsPage> {
  /// 群聊的数据与动作都在 [GroupChatLogic]：消息流、
  /// 去重集合、成员身份、群相册、收发 / 撤回 / 删除、加群 / 退群、
  /// 发送者资料补全、IM 订阅。
  ///
  /// 本类只剩 widget 那一半：`TextEditingController`、`GlobalKey`，
  /// 以及几个需要 `BuildContext` 的弹层（长按菜单、成员、相册、资料）。
  late final GroupChatLogic logic;
  bool _ownsController = false;

  final TextEditingController _inputController = TextEditingController();
  final GlobalKey<ChatInputBarState> _inputBarKey = GlobalKey<ChatInputBarState>();

  /// 滚动位置、消息 `GlobalKey`、引用定位 —— 与私聊共用一份。
  late final ChatScrollAnchor _anchor = ChatScrollAnchor(isAlive: () => mounted);

  /// 防止短时间连点头像叠多层资料弹窗。这个开关要盖住整段「弹层打开到关闭」，
  /// 所以留在 View —— Controller 那边只管把资料查出来。
  bool _openingSenderProfile = false;

  GroupInfo get _group => widget.group;

  @override
  void initState() {
    super.initState();
    final tag = _group.gid;
    if (Get.isRegistered<GroupChatLogic>(tag: tag)) {
      logic = Get.find<GroupChatLogic>(tag: tag);
    } else {
      // Legacy Navigator.push call sites do not execute the GetPage binding.
      logic = Get.put(GroupChatLogic(group: _group), tag: tag);
      _ownsController = true;
    }
    // ⚠️ 两个 hook 要第一时间挂上：`_c` 是字段初始化时 `Get.find` 出来的，
    // 那一刻 Controller 的 `onInit`（内含 `unawaited(loadImHistory())`）就已经
    // 跑了。那条链在第一个 `await` 处让出，所以这里挂得上 —— 但别往后挪。
    logic.onScrollToBottom = _scrollToBottom;
    logic.onMembershipChanged = widget.onMembershipChanged;
  }

  @override
  void dispose() {
    // hook 必须摘掉：Controller 可能比 widget 活得久（路由动画期间），
    // 留着的话一次迟到的 onScrollToBottom 会摸到已 dispose 的 ScrollController。
    logic.onScrollToBottom = null;
    logic.onMembershipChanged = null;
    _inputController.dispose();
    _anchor.dispose();
    if (_ownsController && Get.isRegistered<GroupChatLogic>(tag: _group.gid)) {
      Get.delete<GroupChatLogic>(tag: _group.gid);
    }
    super.dispose();
  }

  /// 群聊没有上拉加载，所以非 `force` 那条永远是动画滚动（私聊那边按调用方给的
  /// `animated` 走）—— 差别只有这一个参数，滚动本身在 [ChatScrollAnchor]。
  void _scrollToBottom({bool force = false}) {
    _anchor.scrollToBottom(force: force, animated: true);
  }

  /// 长按气泡：菜单里有哪几项留在 View（要 `BuildContext` 与气泡的 `Rect`），
  /// 撤回 / 删除那两刀在 [GroupChatLogic]。
  Future<void> _onMessageLongPress(ChatLine message, Rect anchor) async {
    if (!logic.isJoined.value) return;
    if (message.kind == ChatLineKind.join || message.kind == ChatLineKind.recall) {
      return;
    }

    final canCopy = message.kind == ChatLineKind.text && message.text.trim().isNotEmpty;
    final canReplay =
        canCopy ||
        message.kind == ChatLineKind.voice ||
        message.kind == ChatLineKind.image ||
        message.kind == ChatLineKind.emote;
    // 对齐原版 forya：Recall 自己发+60s内+有msgId；Delete 无条件显示。
    final nowMs = DateTime.now().millisecondsSinceEpoch;
    final sentAtMs = message.sentAt.millisecondsSinceEpoch;
    final withinRecallWindow = sentAtMs > 0 && nowMs - sentAtMs < 60 * 1000;
    final actions = <ChatMessageAction>[
      if (canCopy) ChatMessageAction.copy,
      if (canReplay) ChatMessageAction.replay,
      if (message.isSelf && message.msgId.isNotEmpty && withinRecallWindow)
        ChatMessageAction.recall,
      ChatMessageAction.delete,
    ];
    if (actions.isEmpty) return;

    _inputBarKey.currentState?.dismissComposer();
    final action = await ChatMessageActionPopup.show(
      context: context,
      anchor: anchor,
      actions: actions,
    );
    if (!mounted || action == null) return;

    switch (action) {
      case ChatMessageAction.copy:
        await Clipboard.setData(ClipboardData(text: message.text));
        if (!mounted) return;
        AppToast.info('Saved to the clipboard');
        return;
      case ChatMessageAction.replay:
        final sendName = message.isSelf
            ? 'You'
            : (message.senderName.trim().isEmpty ? 'User' : message.senderName.trim());
        logic.quote.value = ImQuoteMsg(
          msgId: message.msgId,
          showText: message.listPreview,
          sendName: sendName,
        );
        return;
      case ChatMessageAction.recall:
        if (!await logic.recall(message.msgId)) {
          AppToast.info('Recall failed');
        }
        return;
      case ChatMessageAction.delete:
        await logic.deleteForMe(message.msgId);
        return;
    }
  }

  /// 清空输入框留在 View（`TextEditingController` 是 widget 的）。空串校验在
  /// [ChatInputBar] 里，「未加群」与摘引用在 [GroupChatLogic.sendText] 里。
  ///
  /// ⚠️ 顺序：原版第一句就是「未加入直接 return」，**排在空串校验之前** ——
  /// 否则非成员点发送会先弹一句「不能为空」。合并后空串校验挪到了输入栏，
  /// 但非成员根本看不到输入栏（整条换成了 Join 按钮），所以这个顺序无从触发。
  Future<void> _sendMessage(String text) async {
    _inputController.clear();
    await logic.sendText(text);
  }

  Future<void> _openMoreMenu() async {
    final action = await AppBottomSheet.actions<_GroupMoreAction>(
      buildItems: () => [
        AppSheetAction(
          label: 'Report',
          destructive: true,
          onTap: () => AppJumper.back(result: _GroupMoreAction.report),
        ),
        if (logic.isJoined.value)
          AppSheetAction(
            label: 'Leave Group',
            onTap: () async {
              final confirmed =
                  await AppDialog.show(
                    title: 'Leave this Group?',
                    content: 'You will no longer receive updates.',
                    confirmLabel: 'Leave',
                    buttons: DialogLoyoutStyle.horizontal,
                  ) ??
                  false;
              // 弹层现在由 AppDialog 开、不再有 builder context，改判页面自身。
              if (!mounted) return;
              if (confirmed) {
                AppJumper.back(result: _GroupMoreAction.leave);
              }
            },
          ),
      ],
    );
    if (!mounted || action == null) return;

    switch (action) {
      case _GroupMoreAction.report:
        AppJumper.toReport(reportedId: _group.gid, kind: ReportTargetKind.group);
      case _GroupMoreAction.leave:
        unawaited(logic.leave());
    }
  }

  void _openMembersSheet() {
    AppJumper.showGroupMembers(
      groupId: _group.gid,
      onMemberTap: (member) {
        AppJumper.back();
        WidgetsBinding.instance.addPostFrameCallback((_) {
          if (!mounted) return;
          AppJumper.toProfile(member.uid, preview: member);
        });
      },
    );
  }

  void _openPhotoViewer(int initialIndex) {
    final photos = logic.flatPhotos;
    if (!logic.isJoined.value || photos.isEmpty) return;
    // 查看器和私聊那套合一之后是公开类、已经在路由表里，例外就不需要了。
    AlbumPhotoViewerPage.open(context, paths: photos, initialIndex: initialIndex);
  }

  /// 点击对方头像：底部资料弹层（对齐 forya PersonalUnit.showBottom）。
  /// 资料的解析与列表补全在 [GroupChatLogic.resolveSenderProfile]。
  Future<void> _openSenderProfile(ChatLine message) async {
    if (message.isSelf) return;
    if (_openingSenderProfile) return;
    _openingSenderProfile = true;
    try {
      final profile = await logic.resolveSenderProfile(message);
      if (!mounted) return;
      await ChatUserProfileSheet.show(context, profile: profile);
    } finally {
      _openingSenderProfile = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    final topPadding = MediaQuery.paddingOf(context).top;
    final bottomPadding = MediaQuery.paddingOf(context).bottom;

    return ChimoScaffold(
      showNav: false,
      safeArea: false,
      backgroundColor: AppColors.background,
      // 对齐私聊：输入栏自行处理键盘 / 面板 inset（避免双重收缩）。
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            height: 260 + topPadding,
            child: GroupBackdrop(group: _group),
          ),
          // 成员身份 / 简介折叠 / 页签 / 消息 / 相册各改各的，
          // 拆成四个 Obx 反倒要把布局切碎。
          Obx(
            () => Column(
              children: [
                SizedBox(height: topPadding),
                GroupDetailsAppBar(
                  group: _group,
                  isJoined: logic.isJoined.value,
                  descExpanded: logic.descExpanded.value,
                  onMoreTap: _openMoreMenu,
                  onToggleDesc: () => logic.descExpanded.toggle(),
                ),
                // forya：`if (!_foldInfo) _groupInfoWidget` — 折叠整个头部，不是展开正文。
                if (logic.descExpanded.value)
                  GroupProfileHeader(
                    group: _group,
                    isJoined: logic.isJoined.value,
                    onCollapse: () => logic.descExpanded.value = false,
                    onMembersTap: _openMembersSheet,
                  ),
                // forya：提示 + 聊天共用一个圆角外壳；非成员外壳为
                // 半透明 lime `0x1FC0F600`，从白色面板上方露出。
                Expanded(
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      color: logic.isJoined.value ? Colors.white : AppColors.glowLime,
                      borderRadius: const BorderRadius.vertical(top: Radius.circular(22)),
                    ),
                    child: Column(
                      children: [
                        if (!logic.isJoined.value)
                          const SizedBox(
                            height: 43,
                            child: Center(
                              child: Text(
                                'Not a member? Viewing is limited to 10 messages',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: AppColors.accentLimeDim,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                        Expanded(
                          child: GroupChatBody(
                            tabIndex: logic.tabIndex.value,
                            isJoined: logic.isJoined.value,
                            sentMessages: logic.messages.toList(),
                            photos: logic.photoSections.value,
                            messagesScroll: _anchor.controller,
                            onTabChanged: (i) => logic.tabIndex.value = i,
                            onPhotoTap: _openPhotoViewer,
                            onSenderAvatarTap: _openSenderProfile,
                            onBlankTap: () => _inputBarKey.currentState?.dismissComposer(),
                            onMessageLongPress: _onMessageLongPress,
                            onQuoteTap: (msgId) => _anchor.scrollToMessage(msgId, logic.messages),
                            messageKeyFor: _anchor.keyFor,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                if (logic.isJoined.value)
                  ChatInputBar(
                    key: _inputBarKey,
                    style: ChatInputBarStyle.group,
                    bottomInset: bottomPadding,
                    controller: _inputController,
                    quote: logic.quote.value,
                    onClearQuote: logic.clearQuote,
                    onSendText: (text) => unawaited(_sendMessage(text)),
                    onSendVoice: logic.sendVoice,
                    onSendImages: logic.sendImages,
                    onPanelChanged: (open) {
                      // 语音/相册/表情面板打开时腾出纵向空间。
                      if (open && logic.descExpanded.value) {
                        logic.descExpanded.value = false;
                      }
                    },
                  )
                else
                  GroupJoinBar(bottomInset: bottomPadding, onTap: () => unawaited(logic.join())),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

enum _GroupMoreAction { report, leave }
