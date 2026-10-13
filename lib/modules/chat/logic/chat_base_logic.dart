import 'dart:async';

import 'package:get/get.dart';

import '../../../app/service/im_service.dart';
import '../../../common/utils/app_log.dart';
import 'chats_list_logic.dart';
import '../model/chat_line.dart';

/// 私聊与群聊共有的会话状态。
///
/// 放这里的东西只有一个判据：**私聊和群聊都需要，且不需要 `BuildContext`**。
/// 滚动位置、`GlobalKey`、面板相位、动画留在 View 里（那些是 widget 的事）。
///
/// 命名规则（3.2 第 3 条）：`.obs` 只活在字段上，不作为方法参数或返回值跨层。
abstract class ChatBaseLogic extends GetxController {
  /// 会话列表（未读 / 预览 / 置顶）—— Controller ↔ Controller，允许 `Get.find`。
  final ChatsListLogic chats = Get.find<ChatsListLogic>();

  /// 本地 + 环信历史合并后的消息流。**用 `RxList` 而不是普通 List**：
  /// `add` / `[i] = x` / `assignAll` 都会自动通知，不用再手写 `setState`。
  /// ⚠️ 别用 `messages.value.add(...)`（实测坑 4：那样不触发通知）。
  final RxList<ChatLine> messages = <ChatLine>[].obs;

  /// 已经并进 [messages] 的环信消息 id，用来去重（同一条消息可能既在
  /// 本地发送回执里、又在 IM 推送里到达）。
  final Set<String> seenMsgIds = {};

  /// 自己的头像（气泡右侧）。
  final RxnString selfAvatarUrl = RxnString();

  /// 正在引用（回复）的那条消息 —— 输入框上方那一条引用栏。
  ///
  /// 状态**。搬之前长按菜单要经 `GlobalKey` 调 `setQuote`、发送时再经
  /// `GlobalKey` 调 `takeQuote` 把它取走，一次发送要穿两趟 widget 树。
  final Rxn<ImQuoteMsg> quote = Rxn<ImQuoteMsg>();

  /// 取走引用并清空 —— 发送路径专用。
  ///
  /// ⚠️ **调用时机很关键**：必须在「这条能不能发」判完之后再调。私聊被对方拉黑
  /// 时发送会被挡下，引用条要留在原地供重发；先摘再判就丢了。
  ImQuoteMsg? takeQuote() {
    final q = quote.value;
    if (q != null) quote.value = null;
    return q;
  }

  void clearQuote() => quote.value = null;

  // ------------------------------------------------------------ 历史分页
  final RxBool historyHasMore = true.obs;
  final RxBool historyLoading = false.obs;

  /// 环信历史游标（最早那条的 msgId）。
  String historyCursor = '';

  /// 首帧滚到底之前不允许上拉加载 —— 否则和「滚到底部」竞态，
  /// 表现是刚进会话就自动翻上一页。
  ///
  /// 普通 `bool` 变了没人通知，上拉指示器会停在上一帧的状态。
  final RxBool allowHistoryLoadMore = false.obs;

  StreamSubscription<ImChatMessage>? _imSub;

  /// 订阅 IM 消息流。子类在 `onInit` 里调，[onMessage] 收各自的合并逻辑。
  void listenIm(void Function(ImChatMessage message) onMessage) {
    _imSub?.cancel();
    _imSub = ImService.messages.listen(onMessage);
  }

  @override
  void onClose() {
    _imSub?.cancel();
    _imSub = null;
    super.onClose();
  }

  // 消息流的几个纯操作
  //
  // 都是「按 msgId 找到那条再替换」这类，私聊群聊一模一样，

  /// 这条环信消息是否已经并进来过。
  bool isDuplicate(String msgId) => msgId.trim().isNotEmpty && seenMsgIds.contains(msgId.trim());

  /// 记下已并入的 msgId（[isDuplicate] 靠它）。
  void remember(String msgId) {
    final id = msgId.trim();
    if (id.isNotEmpty) seenMsgIds.add(id);
  }

  /// 追加一条（本地发出、或 IM 推来的新消息）。
  void append(ChatLine line) {
    remember(line.msgId);
    messages.add(line);
  }

  /// 历史消息插到最前面（上拉加载）。已存在的按 msgId 跳过。
  void prependHistory(List<ChatLine> older) {
    final fresh = [
      for (final line in older)
        if (!isDuplicate(line.msgId)) line,
    ];
    if (fresh.isEmpty) return;
    for (final line in fresh) {
      remember(line.msgId);
    }
    messages.insertAll(0, fresh);
  }

  /// 按 msgId 删掉那条，并把 id 从去重集合里摘掉。
  ///
  /// **两件事必须一起做**：只删 [messages] 不删 [seenMsgIds]，同一条消息
  /// 再被 IM 推来时会因为「已见过」被丢掉，表现是撤回后对方重发看不见。
  void removeByMsgId(String msgId) {
    final id = msgId.trim();
    if (id.isEmpty) return;
    messages.removeWhere((e) => e.msgId == id);
    seenMsgIds.remove(id);
  }

  /// 用 [replacement] 替换 msgId 相同的那条；找不到返回 false。
  bool replaceByMsgId(String msgId, ChatLine replacement) {
    final id = msgId.trim();
    if (id.isEmpty) return false;
    for (var i = messages.length - 1; i >= 0; i--) {
      if (messages[i].msgId != id) continue;
      messages[i] = replacement;
      return true;
    }
    return false;
  }

  /// 把最后 [count] 条「自己发出且还没拿到 msgId」的消息标成失败。
  ///
  /// 发送失败时用：那几条还没有 msgId（服务端没收到），只能从尾部倒着找。
  void markLastSelfFailed({int count = 1}) {
    var remaining = count;
    for (var i = messages.length - 1; i >= 0 && remaining > 0; i--) {
      final line = messages[i];
      if (line.side != ChatSide.self || line.failed || line.msgId.isNotEmpty) {
        continue;
      }
      messages[i] = line.copyWith(failed: true);
      remaining--;
    }
    if (remaining > 0) {
      AppLog.d('ChatBase markLastSelfFailed: 少标了 $remaining 条');
    }
  }

  /// 会话列表侧的同步：发出 / 收到一条后更新预览与未读。
  void syncListPreview(String conversationId, String preview);

  // 撤回 / 删除
  //
  // 私聊 3 处、群聊 3 处说的就是它们。两边的差别只有下面这两个值，
  // 所以整段收在基类，长按菜单在 View 里只留「哪几项可点」。

  /// 环信会话 id：私聊 = 对方环信账号，群聊 = 群 id。
  String get imConversationId;

  /// 这个会话在环信那边算不算群聊。
  ///
  /// ⚠️ **私聊侧不是常量 false**：会话列表里的群会话也能落到私聊详情页
  /// （`ChatConversation.badge == group`），撤回 / 删除要按它原本的会话类型走。
  bool get isGroupConversation;

  /// 撤回一条自己发的消息：环信撤回 → 本地移除 → 给对面发一条撤回提示。
  ///
  /// 返回 false = 环信那步就失败了，本地什么都没动，调用方弹「Recall failed」。
  Future<bool> recall(String msgId) async {
    final id = msgId.trim();
    if (id.isEmpty) return false;
    final ok = await ImService.recallMessage(id);
    if (!ok) return false;
    removeByMsgId(id);
    unawaited(
      ImService.sendRecallNotice(conversationId: imConversationId, isGroup: isGroupConversation),
    );
    return true;
  }

  /// 只删自己这一侧（对方还看得见）。
  ///
  /// 空 msgId 直接返回：那是还没拿到回执的本地消息，环信那边没有它
  /// （[ImService.deleteMessage] 自己也会挡），从列表里怎么摘由调用方决定。
  Future<void> deleteForMe(String msgId) async {
    final id = msgId.trim();
    if (id.isEmpty) return;
    await ImService.deleteMessage(
      conversationId: imConversationId,
      isGroup: isGroupConversation,
      messageId: id,
    );
    removeByMsgId(id);
  }
}
