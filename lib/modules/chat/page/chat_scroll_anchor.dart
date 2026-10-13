import 'package:flutter/material.dart';

import '../model/chat_line.dart';

class ChatScrollAnchor {
  ChatScrollAnchor({required this.isAlive});

  /// 页面还在不在（`State.mounted`）。
  ///
  /// 不能省：`force` 那条路径带 8 次 50ms 的延时重试，页面可能在中途就没了。
  final bool Function() isAlive;

  final ScrollController controller = ScrollController();

  final Map<String, GlobalKey> _itemKeys = {};

  /// 每条消息一个 `GlobalKey`，[scrollToMessage] 靠它拿到那条的 `BuildContext`。
  GlobalKey keyFor(String msgId) => _itemKeys.putIfAbsent(msgId, GlobalKey.new);

  void dispose() => controller.dispose();

  void _jump({required bool animate}) {
    if (!isAlive() || !controller.hasClients) return;
    final max = controller.position.maxScrollExtent;
    // 内容短于视口：停在 0，使消息落在把手下方。
    if (max <= 0) return;
    if (animate) {
      controller.animateTo(
        max,
        duration: const Duration(milliseconds: 240),
        curve: Curves.easeOut,
      );
    } else {
      controller.jumpTo(max);
    }
  }

  /// 滚到最后一条。
  ///
  /// [force] 走「反复 jump 到布局稳定」那条路径（进会话、插入历史之后）：一次
  /// `jumpTo` 会被后续到达的图片 / 语音条改变的 `maxScrollExtent` 甩在半路上，
  /// 所以 8 次 × 50ms 追着跳。[onSettled] 在最后一次之后调 —— 私聊用它把
  /// 「首帧不许上拉」的开关放回去；页面中途 dispose 就不会调（和搬之前一致）。
  void scrollToBottom({
    bool force = false,
    bool animated = false,
    VoidCallback? onSettled,
  }) {
    if (force) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _jump(animate: false);
        var left = 8;
        void retry() {
          Future<void>.delayed(const Duration(milliseconds: 50), () {
            if (!isAlive()) return;
            _jump(animate: false);
            left -= 1;
            if (left > 0) {
              retry();
            } else {
              onSettled?.call();
            }
          });
        }

        retry();
      });
      return;
    }

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _jump(animate: animated);
    });
  }

  /// 对齐 forya `chatController.scrollToMsg`：点击引用条定位原消息。
  ///
  /// 那条已经绘制过就直接 `ensureVisible`；被列表回收了（`GlobalKey` 上没有
  /// `context`）则按「第几条 / 共几条」估一个位置先跳过去，等它建出来再对齐。
  void scrollToMessage(String msgId, List<ChatLine> messages) {
    final id = msgId.trim();
    if (id.isEmpty) return;
    final index = messages.indexWhere((e) => e.msgId == id);
    if (index < 0) return;

    bool ensureVisible() {
      final ctx = _itemKeys[id]?.currentContext;
      if (ctx == null || !ctx.mounted) return false;
      Scrollable.ensureVisible(
        ctx,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
        alignment: 0.35,
      );
      return true;
    }

    if (ensureVisible()) return;
    if (!controller.hasClients) return;

    final pos = controller.position;
    final ratio = (index + 1) / messages.length;
    controller.jumpTo(
      (ratio * pos.maxScrollExtent).clamp(0.0, pos.maxScrollExtent),
    );

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!isAlive()) return;
      if (ensureVisible()) return;
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (isAlive()) ensureVisible();
      });
    });
  }

  // ------------------------------------------------- 上拉加载历史的滚动锚点
  //
  // 插入更早的消息会把内容顶高，视觉上列表会往下「跳」一屏。插入前记下位置，
  // 插入后按 `maxScrollExtent` 的增量补回去 —— 两个方法由 Controller 在
  // `loadImHistory` 里前后各调一次（经 View 上的两个钩子）。
  //
  // **只有私聊用**：群聊历史一次拉满一页、没有第二页，不存在插入。
  double _anchorPixels = 0;
  double _anchorMax = 0;

  void saveHistoryAnchor() {
    final has = controller.hasClients;
    _anchorPixels = has ? controller.position.pixels : 0.0;
    _anchorMax = has ? controller.position.maxScrollExtent : 0.0;
  }

  void restoreHistoryAnchor() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!isAlive() || !controller.hasClients) return;
      final delta = controller.position.maxScrollExtent - _anchorMax;
      controller.jumpTo(_anchorPixels + delta);
    });
  }
}
