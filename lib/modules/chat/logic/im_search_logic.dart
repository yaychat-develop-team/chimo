import 'dart:async';

import 'package:get/get.dart';
import 'package:im_flutter_sdk/im_flutter_sdk.dart';

import '../../../app/app_jumper.dart';
import '../../../common/im/im_system_accounts.dart';
import '../../../app/storage/app_storage.dart';
import 'chats_list_logic.dart';
import '../model/chat_conversation.dart';
import '../model/im_search_hit.dart';

/// IM 搜索：会话昵称 + 近 30 天文本消息。
///
/// `AppStorage` 历史记录读写，以及直连环信本地库的 `loadMessagesWithKeyword`
///
/// **留在 View 的**：输入框 / 焦点，以及 `_ImSearchMsgListPage` 那个私有子页
class ImSearchLogic extends GetxController {
  ImSearchLogic({this.scopeConversation});

  /// 非空时仅搜该会话内消息（私聊「更多 → Search」）。
  final ChatConversation? scopeConversation;

  final ChatsListLogic chats = Get.find<ChatsListLogic>();

  final RxList<String> history = <String>[].obs;

  /// 0 = 历史，1 = 空结果，2 = 有结果。
  final RxInt showIndex = 0.obs;
  final RxBool searching = false.obs;
  final RxString keyword = ''.obs;
  final RxList<ChatConversation> contacts = <ChatConversation>[].obs;
  final RxList<ImSearchConvHit> historyHits = <ImSearchConvHit>[].obs;
  final RxList<ImSearchMsgHit> scopedMsgs = <ImSearchMsgHit>[].obs;

  Timer? _debounce;
  int _seq = 0;

  static const _historyKey = 'imSearchHistoryKey';

  bool get scoped => scopeConversation != null;

  @override
  void onReady() {
    super.onReady();
    loadHistory();
  }

  @override
  void onClose() {
    _debounce?.cancel();
    super.onClose();
  }

  void loadHistory() {
    final saved = AppStorage.settings?.get(_historyKey);
    if (saved is! List || saved.isEmpty || isClosed) return;
    history.assignAll(saved.whereType<String>());
  }

  Future<void> persistHistory() async {
    await AppStorage.settings?.put(_historyKey, List<String>.from(history));
  }

  void addHistory(String query) {
    history.remove(query);
    history.insert(0, query);
    if (history.length > 20) {
      history.removeRange(20, history.length);
    }
    unawaited(persistHistory());
  }

  void removeHistory(String query) {
    history.remove(query);
    unawaited(persistHistory());
  }

  void clearHistory() {
    history.clear();
    unawaited(persistHistory());
  }

  String emIdOf(ChatConversation c) {
    final em = c.emUserName.trim();
    if (em.isNotEmpty) return em;
    return c.id;
  }

  ChatConversation? findByEmId(String conversationId) {
    final list = chats.conversations;
    for (final c in list) {
      if (emIdOf(c) == conversationId || c.id == conversationId) return c;
    }
    return null;
  }

  void onChanged(String value) {
    _debounce?.cancel();
    final q = value.trim();
    if (q.isEmpty) {
      showIndex.value = 0;
      contacts.clear();
      historyHits.clear();
      scopedMsgs.clear();
      keyword.value = '';
      searching.value = false;
      return;
    }
    _debounce = Timer(const Duration(milliseconds: 500), () {
      unawaited(search(q));
    });
  }

  /// 提交（回车 / 点历史词）：先取消防抖再立即搜。
  Future<void> submit(String raw) async {
    _debounce?.cancel();
    await search(raw);
  }

  Future<void> search(String raw) async {
    final kw = raw.trim();
    if (kw.isEmpty) {
      showIndex.value = 0;
      contacts.clear();
      historyHits.clear();
      scopedMsgs.clear();
      keyword.value = '';
      return;
    }

    final seq = ++_seq;
    searching.value = true;
    keyword.value = kw;
    addHistory(kw);

    final hitContacts = <ChatConversation>[];
    final hitConvs = <ImSearchConvHit>[];
    final hitScoped = <ImSearchMsgHit>[];

    final conversations = chats.conversations;

    final lower = kw.toLowerCase();
    final since = DateTime.now().subtract(const Duration(days: 30)).millisecondsSinceEpoch;

    if (!scoped) {
      for (final c in conversations) {
        if (c.isSystem) continue;
        if (c.title.toLowerCase().contains(lower)) {
          hitContacts.add(c);
        }
      }
    }

    try {
      final List<EMMessage> emMessages;
      if (scoped) {
        final scope = scopeConversation!;
        final emId = emIdOf(scope);
        final type = scope.badge == ChatBadgeType.group
            ? EMConversationType.GroupChat
            : EMConversationType.Chat;
        final emConv = await EMClient.getInstance.chatManager.getConversation(emId, type: type);
        emMessages = emConv == null
            ? const []
            : await emConv.loadMessagesWithKeyword(
                kw,
                searchScope: MessageSearchScope.Content,
                count: 50,
                timestamp: since,
                direction: EMSearchDirection.Down,
              );
      } else {
        emMessages = await EMClient.getInstance.chatManager.loadMessagesWithKeyword(
          kw,
          searchScope: MessageSearchScope.Content,
          count: 500,
          timestamp: since,
          direction: EMSearchDirection.Down,
        );
      }

      final filtered = emMessages.where((m) {
        if (m.chatType != ChatType.Chat) return false;
        final cid = m.conversationId;
        if (ImSystemAccounts.isSystemAccount(cid)) return false;
        if (m.body.type != MessageType.TXT) return false;
        return true;
      }).toList();

      if (scoped) {
        final scope = scopeConversation!;
        for (final m in filtered) {
          final text = txtOf(m);
          if (text.isEmpty) continue;
          hitScoped.add(ImSearchMsgHit(conversation: scope, message: m, text: text));
        }
      } else {
        final byConv = <String, List<ImSearchMsgHit>>{};
        for (final m in filtered) {
          final cid = m.conversationId;
          if (cid == null || cid.isEmpty) continue;
          final conv = findByEmId(cid);
          if (conv == null) continue;
          final text = txtOf(m);
          if (text.isEmpty) continue;
          byConv
              .putIfAbsent(cid, () => [])
              .add(ImSearchMsgHit(conversation: conv, message: m, text: text));
        }
        for (final entry in byConv.entries) {
          hitConvs.add(
            ImSearchConvHit(conversation: entry.value.first.conversation, messages: entry.value),
          );
        }
        if (hitConvs.length > 50) {
          hitConvs.removeRange(50, hitConvs.length);
        }
      }
    } catch (_) {
      // 本地库不可用时仍展示昵称命中。
    }

    if (isClosed || seq != _seq) return;

    final hasContacts = hitContacts.isNotEmpty;
    final hasHistory = hitConvs.isNotEmpty;
    final hasScoped = hitScoped.isNotEmpty;
    final hasAny = scoped ? hasScoped : (hasContacts || hasHistory);

    searching.value = false;
    contacts.assignAll(hitContacts);
    historyHits.assignAll(hitConvs);
    scopedMsgs.assignAll(hitScoped);
    showIndex.value = hasAny ? 2 : 1;
  }

  static String txtOf(EMMessage m) {
    final body = m.body;
    if (body is EMTextMessageBody) return body.content.trim();
    return '';
  }

  void openChat(ChatConversation conversation) {
    AppJumper.toChat(conversation.id, preview: conversation);
  }
}
