import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../app/app_jumper.dart';
import '../../../common/constants/app_assets.dart';
import '../../../common/theme/app_colors.dart';
import '../../../common/theme/app_input.dart';
import '../../../common/widgets/app_image.dart';
import '../../../common/widgets/app_scaffold.dart';
import '../../../common/utils/time_fmt.dart';
import '../logic/im_search_logic.dart';
import '../model/chat_conversation.dart';
import '../model/im_search_hit.dart';

/// IM 搜索：会话昵称 + 近 30 天文本消息（对齐 forya ImSearchPage 逻辑，页面样式不追求还原）。
class ImSearchPage extends StatefulWidget {
  const ImSearchPage({super.key, this.scopeConversation});

  /// 搜索范围：非空 = 只搜这一个会话（私聊「更多 → Search」）。
  final ChatConversation? scopeConversation;

  @override
  State<ImSearchPage> createState() => _ImSearchPageState();
}

class _ImSearchPageState extends State<ImSearchPage> {
  /// 搜索、历史记录、环信本地库查询都在 [ImSearchLogic]。
  /// 页面自持 Controller：没有现成实例就自己 put、自己收。
  late final ImSearchLogic logic;
  bool _ownsController = false;

  final TextEditingController _controller = TextEditingController();
  final FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    if (Get.isRegistered<ImSearchLogic>()) {
      logic = Get.find<ImSearchLogic>();
    } else {
      logic = Get.put(ImSearchLogic(scopeConversation: widget.scopeConversation));
      _ownsController = true;
    }
    _controller.addListener(() => setState(() {}));
    // 历史记录由 Controller 的 onReady（首帧后）读，这里只抢焦点。
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) _focusNode.requestFocus();
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    _focusNode.dispose();
    if (_ownsController && Get.isRegistered<ImSearchLogic>()) {
      Get.delete<ImSearchLogic>();
    }
    super.dispose();
  }

  void _openHistoryHit(ImSearchConvHit hit) {
    if (hit.messages.length == 1) {
      logic.openChat(hit.conversation);
      return;
    }
    // （`app_pages.dart` import 不到它）。– 把聊天页拆开、这个类公开化之后再收。
    Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder: (_) => _ImSearchMsgListPage(keyword: logic.keyword.value, hit: hit),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ChimoScaffold(
      showNav: false,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(height: 8),
          _buildTopBar(),
          Obx(
            () => logic.searching.value
                ? const LinearProgressIndicator(
                    minHeight: 2,
                    color: AppColors.primaryBright,
                    backgroundColor: Colors.transparent,
                  )
                : const SizedBox.shrink(),
          ),
          Expanded(child: Obx(_buildBody)),
        ],
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
                border: Border.all(color: AppColors.outlineBright),
              ),
              child: Row(
                children: [
                  const AppImage(
                    AppAssets.msgSearch,
                    width: 18,
                    height: 18,
                    color: AppColors.textTertiary,
                    fit: BoxFit.contain,
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: TextField(
                      controller: _controller,
                      focusNode: _focusNode,
                      style: const TextStyle(color: AppColors.textPrimary, fontSize: 15),
                      cursorColor: AppColors.primaryBright,
                      textInputAction: TextInputAction.search,
                      inputFormatters: [LengthLimitingTextInputFormatter(64)],
                      decoration: AppInputDecoration(
                        isDense: true,
                        hintText: logic.scoped ? 'Search messages' : 'Search contacts or messages',
                        hintStyle: const TextStyle(color: AppColors.textTertiary, fontSize: 15),
                      ),
                      onChanged: logic.onChanged,
                      onSubmitted: (v) => unawaited(logic.submit(v)),
                    ),
                  ),
                  if (_controller.text.isNotEmpty)
                    GestureDetector(
                      onTap: () {
                        _controller.clear();
                        logic.onChanged('');
                      },
                      child: const Icon(Icons.close, size: 18, color: AppColors.textTertiary),
                    ),
                ],
              ),
            ),
          ),
          TextButton(
            onPressed: () => AppJumper.back(),
            child: const Text('Cancel', style: TextStyle(color: AppColors.textSecondary)),
          ),
        ],
      ),
    );
  }

  Widget _buildBody() {
    switch (logic.showIndex.value) {
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
    // `.toList()` 不是多余的：这里在 Obx 的 builder 里读一次才算订阅。
    final history = logic.history.toList();
    if (history.isEmpty) {
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
                style: TextStyle(color: AppColors.textSecondary, fontSize: 13),
              ),
            ),
            GestureDetector(
              onTap: logic.clearHistory,
              child: const Text(
                'Clear',
                style: TextStyle(color: AppColors.textTertiary, fontSize: 13),
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: history.map((h) {
            return GestureDetector(
              onTap: () {
                _controller.text = h;
                _controller.selection = TextSelection.collapsed(offset: h.length);
                unawaited(logic.search(h));
              },
              onLongPress: () => logic.removeHistory(h),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                decoration: BoxDecoration(
                  color: AppColors.surfaceSheet,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Text(h, style: const TextStyle(color: AppColors.textPrimary, fontSize: 13)),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }

  Widget _buildResults() {
    final keyword = logic.keyword.value;
    if (logic.scoped) {
      final scopedMsgs = logic.scopedMsgs.toList();
      return ListView.separated(
        padding: const EdgeInsets.fromLTRB(16, 12, 16, 24),
        itemCount: scopedMsgs.length + 1,
        separatorBuilder: (_, _) => const SizedBox(height: 8),
        itemBuilder: (context, index) {
          if (index == 0) {
            return const Text(
              'Related chat records',
              style: TextStyle(color: AppColors.textSecondary, fontSize: 14),
            );
          }
          final hit = scopedMsgs[index - 1];
          return _MsgRow(keyword: keyword, hit: hit, onTap: () => logic.openChat(hit.conversation));
        },
      );
    }

    final contacts = logic.contacts.toList();
    final historyHits = logic.historyHits.toList();
    return ListView(
      padding: const EdgeInsets.fromLTRB(16, 12, 16, 24),
      children: [
        if (contacts.isNotEmpty) ...[
          const Text('Contacts', style: TextStyle(color: AppColors.textPrimary, fontSize: 14)),
          const SizedBox(height: 8),
          ...contacts.map(
            (c) => Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: _ContactRow(conversation: c, onChat: () => logic.openChat(c)),
            ),
          ),
          const SizedBox(height: 12),
        ],
        if (historyHits.isNotEmpty) ...[
          const Text('Chat history', style: TextStyle(color: AppColors.textPrimary, fontSize: 14)),
          const SizedBox(height: 8),
          ...historyHits.map(
            (hit) => Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: _HistoryRow(hit: hit, onTap: () => _openHistoryHit(hit)),
            ),
          ),
        ],
      ],
    );
  }
}

class _ContactRow extends StatelessWidget {
  const _ContactRow({required this.conversation, required this.onChat});

  final ChatConversation conversation;
  final VoidCallback onChat;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 64,
      child: Row(
        children: [
          ClipOval(
            child: AppImage(
              conversation.avatarUrl,
              fallbackAsset: conversation.avatarAsset,
              width: 42,
              height: 42,
              fit: BoxFit.cover,
              fadeIn: Duration.zero,
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
  const _HistoryRow({required this.hit, required this.onTap});

  final ImSearchConvHit hit;
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
              child: AppImage(
                hit.conversation.avatarUrl,
                fallbackAsset: hit.conversation.avatarAsset,
                width: 42,
                height: 42,
                fit: BoxFit.cover,
                fadeIn: Duration.zero,
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
                    count == 1 ? hit.messages.first.text : '$count related messages',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(color: AppColors.textSecondary, fontSize: 12),
                  ),
                ],
              ),
            ),
            const Icon(Icons.chevron_right, color: AppColors.textTertiary),
          ],
        ),
      ),
    );
  }
}

class _MsgRow extends StatelessWidget {
  const _MsgRow({required this.keyword, required this.hit, required this.onTap});

  final String keyword;
  final ImSearchMsgHit hit;
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
              child: AppImage(
                hit.conversation.avatarUrl,
                fallbackAsset: hit.conversation.avatarAsset,
                width: 42,
                height: 42,
                fit: BoxFit.cover,
                fadeIn: Duration.zero,
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
                          TimeFmt.chatListPreview(ms),
                          style: const TextStyle(color: AppColors.textTertiary, fontSize: 11),
                        ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  _HighlightText(text: hit.text, keyword: keyword),
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
  const _HighlightText({required this.text, required this.keyword});

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
  const _ImSearchMsgListPage({required this.keyword, required this.hit});

  final String keyword;
  final ImSearchConvHit hit;

  @override
  Widget build(BuildContext context) {
    return ChimoScaffold(
      title: hit.conversation.title,
      body: ListView.separated(
        padding: const EdgeInsets.fromLTRB(16, 8, 16, 24),
        itemCount: hit.messages.length,
        separatorBuilder: (_, _) => const SizedBox(height: 4),
        itemBuilder: (context, index) {
          final msg = hit.messages[index];
          return _MsgRow(
            keyword: keyword,
            hit: msg,
            onTap: () {
              AppJumper.toChat(hit.conversation.id, preview: hit.conversation);
            },
          );
        },
      ),
    );
  }
}
