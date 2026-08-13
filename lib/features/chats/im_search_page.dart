import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:im_flutter_sdk/im_flutter_sdk.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../core/constants/app_assets.dart';
import '../../core/im/im_system_accounts.dart';
import '../../core/theme/app_colors.dart';
import '../../core/utils/chat_time_label.dart';
import '../../core/widgets/app_asset_image.dart';
import '../../core/widgets/network_or_asset_avatar.dart';
import 'chat_detail_page.dart';
import 'data/chats_list_controller.dart';
import 'models/chat_conversation.dart';

/// IM 搜索：会话昵称 + 近 30 天文本消息（对齐 forya ImSearchPage 逻辑，页面样式不追求还原）。
class ImSearchPage extends StatefulWidget {
  const ImSearchPage({
    super.key,
    this.chatsController,
    this.scopeConversation,
  });

  final ChatsListController? chatsController;

  /// 非空时仅搜该会话内消息（私聊「更多 → Search」）。
  final ChatConversation? scopeConversation;

  @override
  State<ImSearchPage> createState() => _ImSearchPageState();
}

class _ImSearchPageState extends State<ImSearchPage> {
  final TextEditingController _controller = TextEditingController();
  final FocusNode _focusNode = FocusNode();
  final List<String> _history = [];

  /// 0 = 历史，1 = 空结果，2 = 有结果。
  int _showIndex = 0;
  bool _searching = false;
  String _keyword = '';
  List<ChatConversation> _contacts = [];
  List<_HistoryHit> _historyHits = [];
  List<_MsgHit> _scopedMsgs = [];
  Timer? _debounce;
  int _seq = 0;

  static const _historyPrefsKey = 'imSearchHistoryKey';

  bool get _scoped => widget.scopeConversation != null;

  @override
  void initState() {
    super.initState();
    _controller.addListener(() => setState(() {}));
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) _focusNode.requestFocus();
      unawaited(_loadHistory());
    });
  }

  @override
  void dispose() {
    _debounce?.cancel();
    _controller.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  Future<void> _loadHistory() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final saved = prefs.getStringList(_historyPrefsKey) ?? const [];
      if (!mounted || saved.isEmpty) return;
      setState(() {
        _history
          ..clear()
          ..addAll(saved);
      });
    } catch (_) {}
  }

  Future<void> _persistHistory() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setStringList(_historyPrefsKey, List<String>.from(_history));
    } catch (_) {}
  }

  void _addHistory(String query) {
    setState(() {
      _history.remove(query);
      _history.insert(0, query);
      if (_history.length > 20) {
        _history.removeRange(20, _history.length);
      }
    });
    unawaited(_persistHistory());
  }

  void _removeHistory(String query) {
    setState(() => _history.remove(query));
    unawaited(_persistHistory());
  }

  void _clearHistory() {
    setState(() => _history.clear());
    unawaited(_persistHistory());
  }

  String _emIdOf(ChatConversation c) {
    final em = c.emUserName.trim();
    if (em.isNotEmpty) return em;
    return c.id;
  }

  ChatConversation? _findByEmId(String conversationId) {
    final list = widget.chatsController?.conversations ?? const [];
    for (final c in list) {
      if (_emIdOf(c) == conversationId || c.id == conversationId) return c;
    }
    return null;
  }

  void _onChanged(String value) {
    _debounce?.cancel();
    final q = value.trim();
    if (q.isEmpty) {
      setState(() {
        _showIndex = 0;
        _contacts = [];
        _historyHits = [];
        _scopedMsgs = [];
        _keyword = '';
        _searching = false;
      });
      return;
    }
    _debounce = Timer(const Duration(milliseconds: 500), () {
      unawaited(_search(q));
    });
  }

  Future<void> _search(String raw) async {
    final keyword = raw.trim();
    if (keyword.isEmpty) {
      setState(() {
        _showIndex = 0;
        _contacts = [];
        _historyHits = [];
        _scopedMsgs = [];
        _keyword = '';
      });
      return;
    }

    final seq = ++_seq;
    setState(() {
      _searching = true;
      _keyword = keyword;
    });
    _addHistory(keyword);

    final contacts = <ChatConversation>[];
    final historyHits = <_HistoryHit>[];
    final scopedMsgs = <_MsgHit>[];

    final conversations =
        widget.chatsController?.conversations ?? const <ChatConversation>[];

    final lower = keyword.toLowerCase();
    final since = DateTime.now()
        .subtract(const Duration(days: 30))
        .millisecondsSinceEpoch;

    if (!_scoped) {
      for (final c in conversations) {
        if (c.isSystem) continue;
        if (c.title.toLowerCase().contains(lower)) {
          contacts.add(c);
        }
      }
    }

    try {
      final List<EMMessage> emMessages;
      if (_scoped) {
        final scope = widget.scopeConversation!;
        final emId = _emIdOf(scope);
        final type = scope.badge == ChatBadgeType.group
            ? EMConversationType.GroupChat
            : EMConversationType.Chat;
        final emConv = await EMClient.getInstance.chatManager.getConversation(
          emId,
          type: type,
        );
        emMessages = emConv == null
            ? const []
            : await emConv.loadMessagesWithKeyword(
                keyword,
                searchScope: MessageSearchScope.Content,
                count: 50,
                timestamp: since,
                direction: EMSearchDirection.Down,
              );
      } else {
        emMessages =
            await EMClient.getInstance.chatManager.loadMessagesWithKeyword(
          keyword,
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

      if (_scoped) {
        final scope = widget.scopeConversation!;
        for (final m in filtered) {
          final text = _txtOf(m);
          if (text.isEmpty) continue;
          scopedMsgs.add(_MsgHit(conversation: scope, message: m, text: text));
        }
      } else {
        final byConv = <String, List<_MsgHit>>{};
        for (final m in filtered) {
          final cid = m.conversationId;
          if (cid == null || cid.isEmpty) continue;
          final conv = _findByEmId(cid);
          if (conv == null) continue;
          final text = _txtOf(m);
          if (text.isEmpty) continue;
          byConv
              .putIfAbsent(cid, () => [])
              .add(_MsgHit(conversation: conv, message: m, text: text));
        }
        for (final entry in byConv.entries) {
          historyHits.add(
            _HistoryHit(
              conversation: entry.value.first.conversation,
              messages: entry.value,
            ),
          );
        }
        if (historyHits.length > 50) {
          historyHits.removeRange(50, historyHits.length);
        }
      }
    } catch (_) {
      // 本地库不可用时仍展示昵称命中。
    }

    if (!mounted || seq != _seq) return;

    final hasContacts = contacts.isNotEmpty;
    final hasHistory = historyHits.isNotEmpty;
    final hasScoped = scopedMsgs.isNotEmpty;
    final hasAny = _scoped ? hasScoped : (hasContacts || hasHistory);

    setState(() {
      _searching = false;
      _contacts = contacts;
      _historyHits = historyHits;
      _scopedMsgs = scopedMsgs;
      _showIndex = hasAny ? 2 : 1;
    });
  }

  static String _txtOf(EMMessage m) {
    final body = m.body;
    if (body is EMTextMessageBody) return body.content.trim();
    return '';
  }

  void _openChat(ChatConversation conversation) {
    Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder: (_) => ChatDetailPage(
          conversation: conversation,
          chatsController: widget.chatsController,
        ),
      ),
    );
  }

  void _openHistoryHit(_HistoryHit hit) {
    if (hit.messages.length == 1) {
      _openChat(hit.conversation);
      return;
    }
    Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder: (_) => _ImSearchMsgListPage(
          keyword: _keyword,
          hit: hit,
          chatsController: widget.chatsController,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 8),
            _buildTopBar(),
            if (_searching)
              const LinearProgressIndicator(
                minHeight: 2,
                color: AppColors.primaryBright,
                backgroundColor: Colors.transparent,
              ),
            Expanded(child: _buildBody()),
          ],
        ),
      ),
    );
  }

  Widget _buildTopBar() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 0, 8, 8),
      child: Row(
        children: [
          Expanded(
            child: Container(
              height: 44,
              padding: const EdgeInsets.symmetric(horizontal: 14),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(22),
                border: Border.all(color: const Color(0xFF3A3A3A)),
              ),
              child: Row(
                children: [
                  const AppAssetImage(
                    AppAssets.msgSearch,
                    width: 18,
                    height: 18,
                    color: AppColors.textTertiary,
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: TextField(
                      controller: _controller,
                      focusNode: _focusNode,
                      style: const TextStyle(
                        color: AppColors.textPrimary,
                        fontSize: 15,
                      ),
                      cursorColor: AppColors.primaryBright,
                      textInputAction: TextInputAction.search,
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(64),
                      ],
                      decoration: InputDecoration(
                        isDense: true,
                        border: InputBorder.none,
                        hintText: _scoped
                            ? 'Search messages'
                            : 'Search contacts or messages',
                        hintStyle: const TextStyle(
                          color: AppColors.textTertiary,
                          fontSize: 15,
                        ),
                      ),
                      onChanged: _onChanged,
                      onSubmitted: (v) {
                        _debounce?.cancel();
                        unawaited(_search(v));
                      },
                    ),
                  ),
                  if (_controller.text.isNotEmpty)
                    GestureDetector(
                      onTap: () {
                        _controller.clear();
                        _onChanged('');
                      },
                      child: const Icon(
                        Icons.close,
                        size: 18,
                        color: AppColors.textTertiary,
                      ),
                    ),
                ],
              ),
            ),
          ),
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text(
              'Cancel',
              style: TextStyle(color: AppColors.textSecondary),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBody() {
    switch (_showIndex) {
      case 1:
        return const Center(
          child: Text(
            'Sorry. No relevant content.',
            style: TextStyle(color: AppColors.textSecondary, fontSize: 14),
          ),
        );
      case 2:
        return _buildResults();
      default:
        return _buildHistoryPanel();
    }
  }

  Widget _buildHistoryPanel() {
    if (_history.isEmpty) {
      return const SizedBox.shrink();
    }
    return ListView(
      padding: const EdgeInsets.fromLTRB(16, 8, 16, 24),
      children: [
        Row(
          children: [
            const Expanded(
              child: Text(
                'Search history',
                style: TextStyle(
                  color: AppColors.textSecondary,
                  fontSize: 13,
                ),
              ),
            ),
            GestureDetector(
              onTap: _clearHistory,
              child: const Text(
                'Clear',
                style: TextStyle(
                  color: AppColors.textTertiary,
                  fontSize: 13,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: [
            for (final h in _history)
              GestureDetector(
                onTap: () {
                  _controller.text = h;
                  _controller.selection = TextSelection.collapsed(
                    offset: h.length,
                  );
                  unawaited(_search(h));
                },
                onLongPress: () => _removeHistory(h),
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  decoration: BoxDecoration(
                    color: const Color(0xFF1C1C1E),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Text(
                    h,
                    style: const TextStyle(
                      color: AppColors.textPrimary,
                      fontSize: 13,
                    ),
                  ),
                ),
              ),
          ],
        ),
      ],
    );
  }

  Widget _buildResults() {
    if (_scoped) {
      return ListView.separated(
        padding: const EdgeInsets.fromLTRB(16, 12, 16, 24),
        itemCount: _scopedMsgs.length + 1,
        separatorBuilder: (_, _) => const SizedBox(height: 8),
        itemBuilder: (context, index) {
          if (index == 0) {
            return const Text(
              'Related chat records',
              style: TextStyle(color: AppColors.textSecondary, fontSize: 14),
            );
          }
          final hit = _scopedMsgs[index - 1];
          return _MsgRow(
            keyword: _keyword,
            hit: hit,
            onTap: () => _openChat(hit.conversation),
          );
        },
      );
    }

    return ListView(
      padding: const EdgeInsets.fromLTRB(16, 12, 16, 24),
      children: [
        if (_contacts.isNotEmpty) ...[
          const Text(
            'Contacts',
            style: TextStyle(color: AppColors.textPrimary, fontSize: 14),
          ),
          const SizedBox(height: 8),
          for (final c in _contacts) ...[
            _ContactRow(
              conversation: c,
              onChat: () => _openChat(c),
            ),
            const SizedBox(height: 8),
          ],
          const SizedBox(height: 12),
        ],
        if (_historyHits.isNotEmpty) ...[
          const Text(
            'Chat history',
            style: TextStyle(color: AppColors.textPrimary, fontSize: 14),
          ),
          const SizedBox(height: 8),
          for (final hit in _historyHits) ...[
            _HistoryRow(
              hit: hit,
              onTap: () => _openHistoryHit(hit),
            ),
            const SizedBox(height: 8),
          ],
        ],
      ],
    );
  }
}

class _HistoryHit {
  const _HistoryHit({
    required this.conversation,
    required this.messages,
  });

  final ChatConversation conversation;
  final List<_MsgHit> messages;
}

class _MsgHit {
  const _MsgHit({
    required this.conversation,
    required this.message,
    required this.text,
  });

  final ChatConversation conversation;
  final EMMessage message;
  final String text;
}

class _ContactRow extends StatelessWidget {
  const _ContactRow({
    required this.conversation,
    required this.onChat,
  });

  final ChatConversation conversation;
  final VoidCallback onChat;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 64,
      child: Row(
        children: [
          ClipOval(
            child: NetworkOrAssetAvatar(
              asset: conversation.avatarAsset,
              url: conversation.avatarUrl,
              width: 42,
              height: 42,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              conversation.title,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                color: AppColors.textPrimary,
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          TextButton(
            onPressed: onChat,
            style: TextButton.styleFrom(
              foregroundColor: AppColors.primaryBright,
              padding: const EdgeInsets.symmetric(horizontal: 12),
            ),
            child: const Text('Chat'),
          ),
        ],
      ),
    );
  }
}

class _HistoryRow extends StatelessWidget {
  const _HistoryRow({
    required this.hit,
    required this.onTap,
  });

  final _HistoryHit hit;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final count = hit.messages.length;
    return InkWell(
      onTap: onTap,
      child: SizedBox(
        height: 64,
        child: Row(
          children: [
            ClipOval(
              child: NetworkOrAssetAvatar(
                asset: hit.conversation.avatarAsset,
                url: hit.conversation.avatarUrl,
                width: 42,
                height: 42,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    hit.conversation.title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      color: AppColors.textPrimary,
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    count == 1
                        ? hit.messages.first.text
                        : '$count related messages',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      color: AppColors.textSecondary,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
            const Icon(
              Icons.chevron_right,
              color: AppColors.textTertiary,
            ),
          ],
        ),
      ),
    );
  }
}

class _MsgRow extends StatelessWidget {
  const _MsgRow({
    required this.keyword,
    required this.hit,
    required this.onTap,
  });

  final String keyword;
  final _MsgHit hit;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final ms = hit.message.serverTime;
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipOval(
              child: NetworkOrAssetAvatar(
                asset: hit.conversation.avatarAsset,
                url: hit.conversation.avatarUrl,
                width: 42,
                height: 42,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          hit.conversation.title,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            color: AppColors.textPrimary,
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      if (ms > 0)
                        Text(
                          ChatTimeLabel.forList(ms),
                          style: const TextStyle(
                            color: AppColors.textTertiary,
                            fontSize: 11,
                          ),
                        ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  _HighlightText(
                    text: hit.text,
                    keyword: keyword,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _HighlightText extends StatelessWidget {
  const _HighlightText({
    required this.text,
    required this.keyword,
  });

  final String text;
  final String keyword;

  @override
  Widget build(BuildContext context) {
    if (keyword.isEmpty) {
      return Text(
        text,
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
        style: const TextStyle(color: AppColors.textSecondary, fontSize: 13),
      );
    }
    final lower = text.toLowerCase();
    final key = keyword.toLowerCase();
    final spans = <TextSpan>[];
    var start = 0;
    while (true) {
      final i = lower.indexOf(key, start);
      if (i < 0) {
        spans.add(TextSpan(text: text.substring(start)));
        break;
      }
      if (i > start) {
        spans.add(TextSpan(text: text.substring(start, i)));
      }
      spans.add(
        TextSpan(
          text: text.substring(i, i + keyword.length),
          style: const TextStyle(color: AppColors.primaryBright),
        ),
      );
      start = i + keyword.length;
    }
    return Text.rich(
      TextSpan(
        style: const TextStyle(color: AppColors.textSecondary, fontSize: 13),
        children: spans,
      ),
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
    );
  }
}

class _ImSearchMsgListPage extends StatelessWidget {
  const _ImSearchMsgListPage({
    required this.keyword,
    required this.hit,
    this.chatsController,
  });

  final String keyword;
  final _HistoryHit hit;
  final ChatsListController? chatsController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(8, 4, 16, 8),
              child: Row(
                children: [
                  IconButton(
                    onPressed: () => Navigator.of(context).pop(),
                    icon: const Icon(
                      Icons.arrow_back_ios_new,
                      size: 18,
                      color: AppColors.textPrimary,
                    ),
                  ),
                  Expanded(
                    child: Text(
                      hit.conversation.title,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        color: AppColors.textPrimary,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView.separated(
                padding: const EdgeInsets.fromLTRB(16, 8, 16, 24),
                itemCount: hit.messages.length,
                separatorBuilder: (_, _) => const SizedBox(height: 4),
                itemBuilder: (context, index) {
                  final msg = hit.messages[index];
                  return _MsgRow(
                    keyword: keyword,
                    hit: msg,
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute<void>(
                          builder: (_) => ChatDetailPage(
                            conversation: hit.conversation,
                            chatsController: chatsController,
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
