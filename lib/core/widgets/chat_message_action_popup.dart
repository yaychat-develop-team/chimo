import 'dart:async';
import 'dart:math' as math;

import 'package:flutter/material.dart';

/// 对齐原版消息长按菜单：Copy / replay / Recall / Delete。
enum ChatMessageAction { copy, replay, recall, delete }

/// 深色气泡菜单，三角指向被长按的消息。
abstract final class ChatMessageActionPopup {
  static Future<ChatMessageAction?> show({
    required BuildContext context,
    required Rect anchor,
    required List<ChatMessageAction> actions,
  }) {
    if (actions.isEmpty) return Future<ChatMessageAction?>.value(null);
    final overlay = Overlay.maybeOf(context, rootOverlay: true);
    if (overlay == null) return Future<ChatMessageAction?>.value(null);

    final completer = Completer<ChatMessageAction?>();
    late OverlayEntry entry;
    void finish(ChatMessageAction? action) {
      if (completer.isCompleted) return;
      entry.remove();
      completer.complete(action);
    }

    entry = OverlayEntry(
      builder: (ctx) => _ChatMessageActionOverlay(
        anchor: anchor,
        actions: actions,
        onSelect: finish,
      ),
    );
    overlay.insert(entry);
    return completer.future;
  }
}

class _ChatMessageActionOverlay extends StatelessWidget {
  const _ChatMessageActionOverlay({
    required this.anchor,
    required this.actions,
    required this.onSelect,
  });

  final Rect anchor;
  final List<ChatMessageAction> actions;
  final ValueChanged<ChatMessageAction?> onSelect;

  static const double _itemWidth = 68;
  static const double _barHeight = 58;
  static const double _triangle = 7;
  static const double _gap = 8;

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.sizeOf(context);
    final padding = MediaQuery.paddingOf(context);
    final menuWidth = (actions.length * _itemWidth).clamp(136.0, media.width - 24);
    var left = anchor.center.dx - menuWidth / 2;
    left = left.clamp(12.0, media.width - menuWidth - 12);

    final preferAbove = anchor.top - _barHeight - _triangle - _gap > padding.top + 8;
    final top = preferAbove
        ? anchor.top - _barHeight - _triangle - _gap
        : anchor.bottom + _gap;

    return Stack(
      children: [
        Positioned.fill(
          child: GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: () => onSelect(null),
            child: const ColoredBox(color: Colors.transparent),
          ),
        ),
        Positioned(
          left: left,
          top: top,
          width: menuWidth,
          child: Material(
            color: Colors.transparent,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (!preferAbove)
                  _Triangle(
                    up: true,
                    width: menuWidth,
                    dx: anchor.center.dx - left,
                  ),
                _ActionBar(
                  actions: actions,
                  onSelect: onSelect,
                  itemWidth: _itemWidth,
                  height: _barHeight,
                ),
                if (preferAbove)
                  _Triangle(
                    up: false,
                    width: menuWidth,
                    dx: anchor.center.dx - left,
                  ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class _ActionBar extends StatelessWidget {
  const _ActionBar({
    required this.actions,
    required this.onSelect,
    required this.itemWidth,
    required this.height,
  });

  final List<ChatMessageAction> actions;
  final ValueChanged<ChatMessageAction> onSelect;
  final double itemWidth;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      decoration: BoxDecoration(
        color: const Color(0xE62A2A2A),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          for (final action in actions)
            SizedBox(
              width: itemWidth,
              child: InkWell(
                onTap: () => onSelect(action),
                borderRadius: BorderRadius.circular(12),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(_iconOf(action), color: Colors.white, size: 20),
                    const SizedBox(height: 4),
                    Text(
                      _labelOf(action),
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 11,
                        fontWeight: FontWeight.w400,
                        height: 1.1,
                      ),
                    ),
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }

  static IconData _iconOf(ChatMessageAction action) {
    return switch (action) {
      ChatMessageAction.copy => Icons.content_copy_outlined,
      ChatMessageAction.replay => Icons.reply,
      ChatMessageAction.recall => Icons.replay,
      ChatMessageAction.delete => Icons.delete_outline,
    };
  }

  static String _labelOf(ChatMessageAction action) {
    return switch (action) {
      ChatMessageAction.copy => 'Copy',
      ChatMessageAction.replay => 'replay',
      ChatMessageAction.recall => 'Recall',
      ChatMessageAction.delete => 'Delete',
    };
  }
}

class _Triangle extends StatelessWidget {
  const _Triangle({
    required this.up,
    required this.width,
    required this.dx,
  });

  final bool up;
  final double width;
  final double dx;

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size(width, 7),
      painter: _TrianglePainter(
        up: up,
        color: const Color(0xE62A2A2A),
        dx: dx,
      ),
    );
  }
}

class _TrianglePainter extends CustomPainter {
  const _TrianglePainter({
    required this.up,
    required this.color,
    required this.dx,
  });

  final bool up;
  final Color color;
  final double dx;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = color;
    final x = dx.clamp(10.0, math.max(10.0, size.width - 10)).toDouble();
    final path = Path();
    if (up) {
      path
        ..moveTo(x - 7, size.height)
        ..lineTo(x, 0)
        ..lineTo(x + 7, size.height);
    } else {
      path
        ..moveTo(x - 7, 0)
        ..lineTo(x, size.height)
        ..lineTo(x + 7, 0);
    }
    path.close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant _TrianglePainter oldDelegate) =>
      oldDelegate.up != up || oldDelegate.dx != dx || oldDelegate.color != color;
}
