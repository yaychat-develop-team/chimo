import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../app/app_jumper.dart';
import '../../../common/constants/app_assets.dart';
import '../../../common/theme/app_colors.dart';
import '../../../common/theme/app_input.dart';
import '../../../common/theme/app_text.dart';
import '../../../common/widgets/app_image.dart';
import '../../../common/widgets/app_scaffold.dart';
import '../../../common/widgets/gender_age_chip.dart';
import '../logic/home_search_logic.dart';
import '../model/search_user.dart';

class HomeSearchPage extends StatefulWidget {
  const HomeSearchPage({super.key});

  @override
  State<HomeSearchPage> createState() => _HomeSearchPageState();
}

class _HomeSearchPageState extends State<HomeSearchPage> {
  final TextEditingController _controller = TextEditingController();
  final FocusNode _focusNode = FocusNode();

  /// 这里只剩输入框与焦点这两个 widget 资源；「收起键盘」要 `BuildContext`，
  /// 所以由 Controller 通过 [HomeSearchLogic.onUnfocus] 回调过来。
  late final HomeSearchLogic logic;
  bool _ownsController = false;

  @override
  void initState() {
    super.initState();
    if (Get.isRegistered<HomeSearchLogic>()) {
      logic = Get.find<HomeSearchLogic>();
    } else {
      logic = Get.put(HomeSearchLogic());
      _ownsController = true;
    }
    _controller.addListener(_onInputChanged);
    // 钩子要在 Controller 的 onReady（首帧后）之前挂上。
    logic.onUnfocus = _unfocus;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) _focusNode.requestFocus();
    });
  }

  @override
  void dispose() {
    // Controller 可能比 widget 活得久，钩子必须摘掉。
    logic.onUnfocus = null;
    logic.cancelDebounce();
    _controller.removeListener(_onInputChanged);
    _controller.dispose();
    _focusNode.dispose();
    if (_ownsController && Get.isRegistered<HomeSearchLogic>()) {
      Get.delete<HomeSearchLogic>();
    }
    super.dispose();
  }

  void _unfocus() {
    if (!mounted) return;
    FocusScope.of(context).unfocus();
  }

  void _onInputChanged() {
    // 清空按钮的显隐只看输入框，跟 Rx 无关，所以这一层还得 setState。
    setState(() {});
    logic.onInputChanged(_controller.text);
  }

  void _clearInput() {
    logic.clearInput();
    _controller.clear();
    _focusNode.requestFocus();
  }

  void _onHistoryTap(String item) {
    if (logic.editingHistory.value) return;
    logic.cancelDebounce();
    _controller.text = item;
    _controller.selection = TextSelection.collapsed(offset: item.length);
    // 上一行改文本会让输入监听再排一次防抖；[HomeSearchLogic.onHistoryTap]
    // 里会再取消一次然后立即搜索。
    logic.onHistoryTap(item);
  }

  @override
  Widget build(BuildContext context) {
    final hasText = _controller.text.isNotEmpty;

    return ChimoScaffold(
      showNav: false,
      // 整页一个 Obx：原版每次 setState 也是整页重建，收窄反而改了行为。
      body: Obx(() {
        // 提交后显示结果 / 空态 / 加载；清空输入回到 History。
        final showResults = logic.hasSearched.value;
        final result = logic.result.value;
        final editingHistory = logic.editingHistory.value;
        final history = logic.history.toList();

        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 8, 8, 0),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 40,
                      padding: const EdgeInsets.symmetric(horizontal: 14),
                      decoration: BoxDecoration(
                        color: AppColors.tagBackground,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Row(
                        children: [
                          const AppImage(
                            AppAssets.msgSearch,
                            width: 16,
                            height: 16,
                            color: AppColors.textTertiary,
                            fit: BoxFit.contain,
                          ),
                          const SizedBox(width: 8),
                          Expanded(
                            child: TextField(
                              controller: _controller,
                              focusNode: _focusNode,
                              keyboardType: TextInputType.number,
                              style: const TextStyle(color: AppColors.textPrimary, fontSize: 15),
                              cursorColor: AppColors.primaryBright,
                              cursorWidth: 1.5,
                              textInputAction: TextInputAction.search,
                              inputFormatters: [
                                FilteringTextInputFormatter.digitsOnly,
                                LengthLimitingTextInputFormatter(64),
                              ],
                              onSubmitted: (v) => unawaited(logic.submit(v)),
                              decoration: const AppInputDecoration(
                                isDense: true,
                                hintText: 'Search contacts or mess...',
                                hintStyle: TextStyle(color: AppColors.textTertiary, fontSize: 15),
                              ),
                            ),
                          ),
                          if (hasText)
                            GestureDetector(
                              onTap: _clearInput,
                              behavior: HitTestBehavior.opaque,
                              child: const Padding(
                                padding: EdgeInsets.only(left: 6),
                                child: Icon(
                                  Icons.cancel_rounded,
                                  size: 18,
                                  color: AppColors.textTertiary,
                                ),
                              ),
                            ),
                        ],
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () => AppJumper.back(),
                    style: TextButton.styleFrom(
                      foregroundColor: AppColors.textPrimary,
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      minimumSize: const Size(0, 40),
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    ),
                    child: const Text(
                      'Cancel',
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                    ),
                  ),
                ],
              ),
            ),
            if (showResults)
              Expanded(
                child: logic.searching.value
                    ? const Center(
                        child: SizedBox(
                          width: 28,
                          height: 28,
                          child: CircularProgressIndicator(strokeWidth: 2.4),
                        ),
                      )
                    : result == null
                    ? const _SearchEmptyState()
                    : _UsersResult(
                        user: result,
                        onFollow: () => unawaited(logic.follow(result)),
                        onChat: () => logic.openChat(result),
                        onProfile: () => logic.openProfile(result),
                      ),
              )
            else ...[
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 24, 16, 8),
                child: Row(
                  children: [
                    const Expanded(
                      child: Text(
                        'History',
                        style: TextStyle(
                          color: AppColors.textSecondary,
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    if (editingHistory) ...[
                      GestureDetector(
                        onTap: logic.clearAllHistory,
                        behavior: HitTestBehavior.opaque,
                        child: const Padding(
                          padding: EdgeInsets.symmetric(vertical: 6, horizontal: 4),
                          child: Text('Clear All', style: AppText.body),
                        ),
                      ),
                      Container(
                        width: 1,
                        height: 12,
                        margin: const EdgeInsets.symmetric(horizontal: 10),
                        color: AppColors.surfaceGray,
                      ),
                      GestureDetector(
                        onTap: logic.exitEditHistory,
                        behavior: HitTestBehavior.opaque,
                        child: const Padding(
                          padding: EdgeInsets.symmetric(vertical: 6, horizontal: 4),
                          child: Text(
                            'Done',
                            style: TextStyle(
                              color: AppColors.textPrimary,
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ),
                    ] else
                      IconButton(
                        onPressed: history.isEmpty ? null : logic.enterEditHistory,
                        padding: EdgeInsets.zero,
                        constraints: const BoxConstraints(minWidth: 36, minHeight: 36),
                        icon: AppImage(
                          AppAssets.msgDelete,
                          width: 22,
                          height: 22,
                          color: history.isEmpty ? AppColors.textTertiary : AppColors.textSecondary,
                        ),
                      ),
                  ],
                ),
              ),
              if (history.isNotEmpty)
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 4, 16, 16),
                  child: Wrap(
                    spacing: 10,
                    runSpacing: 10,
                    children: history
                        .map(
                          (item) => _HistoryChip(
                            label: item,
                            editing: editingHistory,
                            onTap: () => _onHistoryTap(item),
                            onDelete: () => logic.removeHistoryItem(item),
                          ),
                        )
                        .toList(),
                  ),
                ),
            ],
          ],
        );
      }),
    );
  }
}

class _SearchEmptyState extends StatelessWidget {
  const _SearchEmptyState();

  @override
  Widget build(BuildContext context) {
    // 对齐 forya `JREmptyView(desc: 'Sorry. No relevant content.')`，
    // 使用 `empty_no_search` 插图。
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            AppImage(AppAssets.emptyNoSearch, width: 220, height: 160, fit: BoxFit.contain),
            const SizedBox(height: 10),
            const Text(
              'Sorry. No relevant content.',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white70, fontSize: 14, fontWeight: FontWeight.w500),
            ),
          ],
        ),
      ),
    );
  }
}

class _UsersResult extends StatelessWidget {
  const _UsersResult({
    required this.user,
    required this.onFollow,
    required this.onChat,
    required this.onProfile,
  });

  final SearchUser user;
  final VoidCallback onFollow;
  final VoidCallback onChat;
  final VoidCallback onProfile;

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.fromLTRB(16, 24, 16, 16),
      children: [
        const Text(
          'Users',
          style: TextStyle(color: AppColors.textPrimary, fontSize: 17, fontWeight: FontWeight.w700),
        ),
        const SizedBox(height: 16),
        Row(
          children: [
            GestureDetector(
              onTap: onProfile,
              behavior: HitTestBehavior.opaque,
              child: ClipOval(
                child: AppImage(
                  user.avatarUrl,
                  fallbackAsset: user.avatarAsset,
                  width: 52,
                  height: 52,
                  fit: BoxFit.cover,
                  fadeIn: Duration.zero,
                ),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: GestureDetector(
                onTap: onProfile,
                behavior: HitTestBehavior.opaque,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Flexible(
                          child: Text(
                            user.nickname,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: AppText.title,
                          ),
                        ),
                        if (user.hasGender) ...[
                          const SizedBox(width: 8),
                          GenderAgeChip(isMale: user.isMale, age: user.age),
                        ],
                      ],
                    ),
                    const SizedBox(height: 6),
                    Text(
                      'ID:${user.userId}',
                      style: const TextStyle(
                        color: AppColors.textSecondary,
                        fontSize: 13,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            if (user.relation != SearchRelation.self) ...[
              const SizedBox(width: 10),
              if (user.relation == SearchRelation.notFollowing)
                _FollowAction(onTap: onFollow)
              else
                _ChatAction(onTap: onChat),
            ],
          ],
        ),
      ],
    );
  }
}

class _FollowAction extends StatelessWidget {
  const _FollowAction({required this.onTap});

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16),
        child: Ink(
          height: 32,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          decoration: BoxDecoration(
            color: AppColors.accentNeon,
            borderRadius: BorderRadius.circular(16),
          ),
          child: const Center(
            child: Text(
              'Follow',
              style: TextStyle(color: Colors.black, fontSize: 14, fontWeight: FontWeight.w800),
            ),
          ),
        ),
      ),
    );
  }
}

class _ChatAction extends StatelessWidget {
  const _ChatAction({required this.onTap});

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16),
        child: Ink(
          height: 32,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          decoration: BoxDecoration(
            color: AppColors.chipGreenDark,
            borderRadius: BorderRadius.circular(16),
          ),
          child: const Center(
            child: Text(
              'Chat',
              style: TextStyle(
                color: AppColors.accentNeon,
                fontSize: 14,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _HistoryChip extends StatelessWidget {
  const _HistoryChip({
    required this.label,
    required this.editing,
    required this.onTap,
    required this.onDelete,
  });

  final String label;
  final bool editing;
  final VoidCallback onTap;
  final VoidCallback onDelete;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: editing ? null : onTap,
      child: Container(
        padding: EdgeInsets.fromLTRB(14, 8, editing ? 8 : 14, 8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18),
          border: Border.all(color: AppColors.surfaceGray, width: 1),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(label, style: AppText.label),
            if (editing) ...[
              const SizedBox(width: 6),
              GestureDetector(
                onTap: onDelete,
                behavior: HitTestBehavior.opaque,
                child: const Padding(
                  padding: EdgeInsets.all(2),
                  child: Icon(Icons.close_rounded, size: 14, color: AppColors.textSecondary),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
