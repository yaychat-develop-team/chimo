import 'dart:async';

import 'package:flutter/material.dart';

import '../../../../../common/constants/app_assets.dart';
import '../../../../../app/network/http/api_result.dart';
import '../../../../../common/models/server_client/emote.pb.dart';
import '../../../../../common/theme/app_colors.dart';
import '../../../../../common/theme/app_emoji.dart';
import '../../../../../common/widgets/app_image.dart';

/// 贴纸（表情包）的取数与发送。私聊传入，群聊传 null，面板就只剩 emoji 网格。
class ChatStickerSource {
  const ChatStickerSource({
    required this.loadPacks,
    required this.loadStickers,
    required this.onSend,
  });

  /// 贴纸包列表（tab 行）。
  final Future<ApiResult<List<Emoticons>>> Function() loadPacks;

  /// 某个包里的贴纸。面板按包 id 缓存，切回来不再请求。
  final Future<ApiResult<List<EmoteItem>>> Function(String packId) loadStickers;

  /// 点一张贴纸就直接发出去（不进输入框）。
  final void Function(Emoticons pack, EmoteItem sticker) onSend;
}

/// 底部「退格 + Send」那一对键的两套设计。
///
/// 这里**故意不拆成十来个尺寸字段**（`backspaceWidth` / `sendRadius` / …）：两边这
/// 一对键没有一项是相同的 —— 位置、形状、尺寸、图标来源、禁用态的表达方式全不一样，
/// 拆出来每个字段都只有一边在用，改另一边不起作用，是个纯陷阱。所以这是一个
/// 「选哪一套」的开关，具体长什么样各自写在一个 builder 里。
///
/// | | `.floatingPills`（私聊） | `.boxedRow`（群聊） |
/// |---|---|---|
/// | 位置 | 浮在 emoji 网格右下角（`end 16, bottom 10`），**贴纸 tab 上没有这两个键** | 网格下面单独一行（`16,0,16,10`），左边一个 `Spacer` |
/// | 退格 | 60×34 白色药丸 + `delete_icon`（宽 18，`fitWidth`） | 44×36 白底圆角 10 + `textGrayE5` 描边 + `Icons.backspace_outlined` 20 |
/// | Send | 60×36 药丸 `accentLime`，文案 `surfaceDark` 14 w500 | 高 36 左右各 18、圆角 18，文案 14 w800 |
/// | 禁用态 | 整块 `Opacity(0.5)`，底色不变 | 底色换 `textGrayE0`、文字换 `textGray99` |
///
/// 私聊那套浮在网格里，所以 emoji 网格的下内边距留了 56（`gridPadding`）给它腾位置 ——
/// 两个值是一对，改一个要改另一个。
enum ChatEmojiActions { floatingPills, boxedRow }

/// 表情面板两边的视觉差异。
///
/// | 字段 | `.dm` | `.group` |
/// |---|---|---|
/// | `panelColor` | `textGrayF5` | `textGrayF7` |
/// | `gridPadding` | `8,0,8,56`（下边给浮起来的两个键留位） | `12,12,12,8` |
/// | `glyphFontSize` | 24 | 26 |
/// | `actions` | `floatingPills` | `boxedRow` |
///
/// 贴纸 tab 行不在这张表里：它跟着 [ChatEmojiPanel.stickers] 走（给了就有，
/// 群聊不给），不是"样式"。
class ChatEmojiPanelStyle {
  const ChatEmojiPanelStyle({
    required this.panelColor,
    required this.gridPadding,
    required this.glyphFontSize,
    required this.actions,
  });

  final Color panelColor;
  final EdgeInsets gridPadding;
  final double glyphFontSize;
  final ChatEmojiActions actions;

  static const ChatEmojiPanelStyle dm = ChatEmojiPanelStyle(
    panelColor: AppColors.textGrayF5,
    gridPadding: EdgeInsets.fromLTRB(8, 0, 8, 56),
    glyphFontSize: 24,
    actions: ChatEmojiActions.floatingPills,
  );

  static const ChatEmojiPanelStyle group = ChatEmojiPanelStyle(
    panelColor: AppColors.textGrayF7,
    gridPadding: EdgeInsets.fromLTRB(12, 12, 12, 8),
    glyphFontSize: 26,
    actions: ChatEmojiActions.boxedRow,
  );
}

/// 表情面板：自定义 emoji 网格（PUA 字体）+ 私聊多出来的贴纸包 tab。
///
/// 面板自己的状态（选中哪个 tab、字形、贴纸缓存）就用 `setState` ——
/// 插字 / 退格 / 发送都回调给输入栏（光标位置和 `TextEditingController` 在那边）。
class ChatEmojiPanel extends StatefulWidget {
  const ChatEmojiPanel({
    super.key,
    required this.style,
    required this.bottomInset,
    required this.canSend,
    required this.onEmojiTap,
    required this.onBackspace,
    required this.onSend,
    this.stickers,
  });

  final ChatEmojiPanelStyle style;
  final double bottomInset;

  /// 输入框里有字 —— 右下角那个发送键亮不亮。
  final bool canSend;
  final ValueChanged<String> onEmojiTap;
  final VoidCallback onBackspace;
  final VoidCallback onSend;

  /// 贴纸包。null = 只有 emoji 网格（群聊），连 tab 行都不画，也不发请求。
  final ChatStickerSource? stickers;

  @override
  State<ChatEmojiPanel> createState() => _ChatEmojiPanelState();
}

class _ChatEmojiPanelState extends State<ChatEmojiPanel> {
  /// Tab 0 = 系统 / 自定义 emoji；1..n = 贴纸包。
  int _tab = 0;
  List<String> _glyphs = const [];
  bool _glyphsLoading = true;
  List<Emoticons> _packs = const [];
  final Map<String, List<EmoteItem>> _stickersByPack = {};
  final Set<String> _loadingPacks = {};
  bool _packsLoading = false;
  String? _packsError;

  @override
  void initState() {
    super.initState();
    unawaited(_loadGlyphs());
    if (widget.stickers != null) unawaited(_loadPacks());
  }

  Future<void> _loadGlyphs() async {
    final glyphs = await AppEmoji.loadGlyphs();
    if (!mounted) return;
    setState(() {
      _glyphs = glyphs;
      _glyphsLoading = false;
    });
  }

  Future<void> _loadPacks() async {
    final source = widget.stickers;
    if (source == null) return;
    setState(() {
      _packsLoading = true;
      _packsError = null;
    });
    try {
      final res = await source.loadPacks();
      if (!mounted) return;
      final packs = res.data ?? const [];
      setState(() {
        _packs = packs;
        _packsLoading = false;
        if (packs.isEmpty && !res.ok) {
          _packsError = res.message.isEmpty
              ? 'Failed to load stickers'
              : res.message;
        }
      });
    } catch (error) {
      if (!mounted) return;
      setState(() {
        _packsLoading = false;
        _packsError = '$error';
      });
    }
  }

  Future<void> _ensureStickers(Emoticons pack) async {
    final source = widget.stickers;
    if (source == null) return;
    if (_stickersByPack.containsKey(pack.id) ||
        _loadingPacks.contains(pack.id)) {
      return;
    }
    _loadingPacks.add(pack.id);
    setState(() {});
    try {
      final res = await source.loadStickers(pack.id);
      if (!mounted) return;
      final items = res.data ?? const [];
      setState(() {
        _stickersByPack[pack.id] = items;
        _loadingPacks.remove(pack.id);
      });
    } catch (_) {
      if (!mounted) return;
      setState(() {
        _stickersByPack[pack.id] = const [];
        _loadingPacks.remove(pack.id);
      });
    }
  }

  void _selectTab(int index) {
    if (index == _tab) return;
    setState(() => _tab = index);
    if (index > 0 && index <= _packs.length) {
      unawaited(_ensureStickers(_packs[index - 1]));
    }
  }

  // ------------------------------------------------------------- 贴纸 tab 行
  Widget _tabChip({
    required bool selected,
    required Widget child,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: Container(
        width: 32,
        height: 32,
        margin: const EdgeInsets.symmetric(horizontal: 5),
        decoration: BoxDecoration(
          color: selected ? Colors.white : Colors.transparent,
          borderRadius: BorderRadius.circular(8),
        ),
        alignment: Alignment.center,
        child: child,
      ),
    );
  }

  Widget _packCover(Emoticons pack) {
    const fallback = Icon(
      Icons.emoji_emotions_outlined,
      size: 18,
      color: AppColors.textGray99,
    );
    // cover 可能是完整 URL 也可能是 CDN 相对 key，交给 AppImage 判断。
    if (pack.cover.trim().isEmpty) return fallback;
    return AppImage(
      pack.cover,
      width: 22,
      height: 22,
      fit: BoxFit.contain,
      error: fallback,
    );
  }

  Widget _tabRow() {
    return SizedBox(
      height: 46,
      child: ListView(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.only(left: 10, right: 10),
        children: [
          _tabChip(
            selected: _tab == 0,
            onTap: () => _selectTab(0),
            child: AppImage(
              AppAssets.inputEmoji,
              width: 22,
              height: 22,
              fit: BoxFit.contain,
            ),
          ),
          if (_packsLoading)
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 8),
              child: Center(
                child: SizedBox(
                  width: 16,
                  height: 16,
                  child: CircularProgressIndicator(strokeWidth: 2),
                ),
              ),
            )
          else
            ..._packs.indexed.map((entry) {
              final (index, pack) = entry;
              return _tabChip(
                selected: _tab == index + 1,
                onTap: () => _selectTab(index + 1),
                child: _packCover(pack),
              );
            }),
        ],
      ),
    );
  }

  // ------------------------------------------------------- 退格 + Send 两套
  List<Widget> _pillActions() {
    return [
      GestureDetector(
        onTap: widget.onBackspace,
        child: Container(
          width: 60,
          height: 34,
          decoration: const ShapeDecoration(
            shape: StadiumBorder(),
            color: Colors.white,
          ),
          alignment: Alignment.center,
          child: AppImage(
            AppAssets.voiceDeleteIcon,
            width: 18,
            fit: BoxFit.fitWidth,
          ),
        ),
      ),
      const SizedBox(width: 10),
      GestureDetector(
        onTap: widget.canSend ? widget.onSend : null,
        child: Opacity(
          opacity: widget.canSend ? 1 : 0.5,
          child: Container(
            width: 60,
            height: 36,
            decoration: const ShapeDecoration(
              shape: StadiumBorder(),
              color: AppColors.accentLime,
            ),
            alignment: Alignment.center,
            child: const Text(
              'Send',
              style: TextStyle(
                color: AppColors.surfaceDark,
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
      ),
    ];
  }

  Widget _boxedActionRow() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 0, 16, 10),
      child: Row(
        children: [
          const Spacer(),
          GestureDetector(
            onTap: widget.onBackspace,
            child: Container(
              width: 44,
              height: 36,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: AppColors.textGrayE5),
              ),
              child: const Icon(
                Icons.backspace_outlined,
                size: 20,
                color: AppColors.textGray66,
              ),
            ),
          ),
          const SizedBox(width: 10),
          GestureDetector(
            onTap: widget.canSend ? widget.onSend : null,
            child: Container(
              height: 36,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: widget.canSend
                    ? AppColors.accentLime
                    : AppColors.textGrayE0,
                borderRadius: BorderRadius.circular(18),
              ),
              child: Text(
                'Send',
                style: TextStyle(
                  color: widget.canSend ? Colors.black : AppColors.textGray99,
                  fontSize: 14,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ------------------------------------------------------------------ 两个网格
  Widget _glyphGrid() {
    if (_glyphsLoading) {
      return const Center(
        child: SizedBox(
          width: 22,
          height: 22,
          child: CircularProgressIndicator(strokeWidth: 2),
        ),
      );
    }
    final grid = GridView.builder(
      padding: widget.style.gridPadding,
      physics: const BouncingScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 6,
        mainAxisSpacing: 4,
        crossAxisSpacing: 4,
      ),
      itemCount: _glyphs.length,
      itemBuilder: (context, index) {
        final emoji = _glyphs[index];
        return GestureDetector(
          onTap: () => widget.onEmojiTap(emoji),
          behavior: HitTestBehavior.opaque,
          child: Center(
            child: Text(
              emoji,
              style: TextStyle(
                fontSize: widget.style.glyphFontSize,
              ).withAppEmojiFont,
            ),
          ),
        );
      },
    );
    if (widget.style.actions != ChatEmojiActions.floatingPills) return grid;
    return Stack(
      children: [
        grid,
        PositionedDirectional(
          end: 16,
          bottom: 10,
          child: Row(mainAxisSize: MainAxisSize.min, children: _pillActions()),
        ),
      ],
    );
  }

  Widget _stickerGrid(ChatStickerSource source, Emoticons pack) {
    final loading =
        _loadingPacks.contains(pack.id) &&
        !_stickersByPack.containsKey(pack.id);
    final stickers = _stickersByPack[pack.id];
    if (loading || stickers == null) {
      return const Center(
        child: SizedBox(
          width: 22,
          height: 22,
          child: CircularProgressIndicator(
            strokeWidth: 2,
            color: AppColors.textGrayB0,
          ),
        ),
      );
    }
    if (stickers.isEmpty) {
      return const Center(
        child: Text(
          'No stickers',
          style: TextStyle(color: AppColors.textGrayAE, fontSize: 13),
        ),
      );
    }
    return GridView.builder(
      padding: const EdgeInsets.fromLTRB(8, 8, 8, 12),
      physics: const BouncingScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
        mainAxisSpacing: 4,
        crossAxisSpacing: 4,
      ),
      itemCount: stickers.length,
      itemBuilder: (context, index) {
        final sticker = stickers[index];
        final show = sticker.showUrl.trim();
        final thumb = show.isNotEmpty ? show : sticker.url.trim();
        return GestureDetector(
          onTap: () => source.onSend(pack, sticker),
          behavior: HitTestBehavior.opaque,
          child: Center(
            child: SizedBox(
              width: 50,
              height: 50,
              child: thumb.isEmpty
                  ? const ColoredBox(color: AppColors.textGrayEA)
                  : AppImage(
                      thumb,
                      width: 50,
                      height: 50,
                      fit: BoxFit.contain,
                      placeholder: const ColoredBox(
                        color: AppColors.textGrayF0,
                        child: Center(
                          child: SizedBox(
                            width: 16,
                            height: 16,
                            child: CircularProgressIndicator(strokeWidth: 2),
                          ),
                        ),
                      ),
                      error: const ColoredBox(
                        color: AppColors.textGrayEA,
                        child: Icon(
                          Icons.broken_image_outlined,
                          color: AppColors.textGray99,
                          size: 20,
                        ),
                      ),
                    ),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final style = widget.style;
    final source = widget.stickers;
    // 对齐 forya EmotePanel：emoji tab + 包 tab；贴纸 4 列。
    final showEmoji = _tab == 0;
    final packIndex = _tab - 1;
    final activePack = packIndex >= 0 && packIndex < _packs.length
        ? _packs[packIndex]
        : null;

    return ColoredBox(
      color: style.panelColor,
      child: Padding(
        padding: EdgeInsets.only(bottom: widget.bottomInset),
        child: Column(
          children: [
            if (source != null) _tabRow(),
            Expanded(
              child: source == null || showEmoji
                  ? _glyphGrid()
                  : activePack == null
                  ? Center(
                      child: Text(
                        _packsError ?? 'No sticker packs',
                        style: const TextStyle(
                          color: AppColors.textGrayAE,
                          fontSize: 13,
                        ),
                      ),
                    )
                  : _stickerGrid(source, activePack),
            ),
            if (style.actions == ChatEmojiActions.boxedRow) _boxedActionRow(),
          ],
        ),
      ),
    );
  }
}
