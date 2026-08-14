import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

/// forya 自定义表情字体（PUA `U+E601`–`U+E62E`）。无此字体时群聊/私聊会显示方框。
abstract final class AppEmoji {
  static const String fontFamily = 'Emoji';
  static const String assetJson = 'assets/json/emojis.json';

  /// 与 forya `RegExp(r'^[\ue601-\ue62e]+$')` 一致。
  static final RegExp customOnly = RegExp(r'^[\ue601-\ue62e]+$');

  /// 任意位置包含自定义表情码点。
  static final RegExp customChar = RegExp(r'[\ue601-\ue62e]');

  static bool isCustomEmojiOnly(String text) {
    final t = normalize(text).trim();
    return t.isNotEmpty && customOnly.hasMatch(t);
  }

  static bool containsCustom(String text) => customChar.hasMatch(normalize(text));

  static bool _isCustomCode(int rune) => rune >= 0xE601 && rune <= 0xE62E;

  /// 还原环信 / JSON 里被写成 `\ue601` 的自定义表情，并去掉零宽字符。
  static String normalize(String raw) {
    var t = raw;
    t = t.replaceAllMapped(RegExp(r'\\u([eE][0-9a-fA-F]{3})'), (m) {
      return String.fromCharCode(int.parse(m[1]!, radix: 16));
    });
    t = t.replaceAllMapped(RegExp(r'&#x([eE][0-9a-fA-F]{3});', caseSensitive: false), (m) {
      return String.fromCharCode(int.parse(m[1]!, radix: 16));
    });
    t = t.replaceAll(RegExp(r'[\u200B-\u200D\uFEFF\u00AD]'), '');
    return t;
  }

  static TextStyle emojiStyleOf(TextStyle base) {
    return base.copyWith(
      fontFamily: fontFamily,
      fontFamilyFallback: [
        fontFamily,
        ...?base.fontFamilyFallback?.where((f) => f != fontFamily),
      ],
    );
  }

  /// 将文本拆成 span：PUA 段强制 [fontFamily]，避免 iOS fallback 失效成「?」。
  static TextSpan toSpan(String text, {TextStyle? style}) {
    final decoded = normalize(text);
    final base = style ?? const TextStyle();
    if (!containsCustom(decoded)) {
      return TextSpan(text: decoded, style: base);
    }
    final emojiStyle = emojiStyleOf(base);
    if (isCustomEmojiOnly(decoded)) {
      return TextSpan(text: decoded.trim(), style: emojiStyle);
    }

    final children = <InlineSpan>[];
    final buf = StringBuffer();
    var inEmoji = false;

    void flush() {
      if (buf.isEmpty) return;
      children.add(
        TextSpan(
          text: buf.toString(),
          style: inEmoji ? emojiStyle : base,
        ),
      );
      buf.clear();
    }

    for (final rune in decoded.runes) {
      final isEmoji = _isCustomCode(rune);
      if (buf.isEmpty) {
        inEmoji = isEmoji;
        buf.writeCharCode(rune);
        continue;
      }
      if (isEmoji == inEmoji) {
        buf.writeCharCode(rune);
        continue;
      }
      flush();
      inEmoji = isEmoji;
      buf.writeCharCode(rune);
    }
    flush();
    return TextSpan(style: base, children: children);
  }

  static List<String>? _glyphs;

  /// 表情面板用的自定义字形（每个字符串一个 PUA 码点）。
  static Future<List<String>> loadGlyphs() async {
    if (_glyphs != null) return _glyphs!;
    try {
      final raw = await rootBundle.loadString(assetJson);
      final map = jsonDecode(raw);
      if (map is! Map) {
        _glyphs = const [];
        return _glyphs!;
      }
      final list = map['glyphs'];
      if (list is! List) {
        _glyphs = const [];
        return _glyphs!;
      }
      final out = <String>[];
      for (final g in list) {
        if (g is! Map) continue;
        final dec = g['unicode_decimal'];
        int? code;
        if (dec is int) {
          code = dec;
        } else if (dec != null) {
          code = int.tryParse('$dec');
        }
        if (code == null) {
          final hex = '${g['unicode'] ?? ''}'.trim();
          if (hex.isNotEmpty) {
            code = int.tryParse(hex, radix: 16);
          }
        }
        if (code == null || code <= 0) continue;
        out.add(String.fromCharCode(code));
      }
      _glyphs = out;
    } catch (_) {
      _glyphs = const [];
    }
    return _glyphs!;
  }
}

extension AppEmojiTextStyle on TextStyle {
  /// 对齐 forya `withEmoji`：优先回落自定义表情字体。
  ///
  /// 展示含 PUA 的文案请优先用 [AppEmojiText]（强制 fontFamily），
  /// 本扩展主要用于 [TextField] 等无法拆 span 的场景。
  TextStyle get withAppEmoji {
    // iOS 对 PUA 常不走 fallback，输入框混排时仍尽量把 Emoji 放最前。
    final primary = fontFamily;
    return copyWith(
      fontFamilyFallback: [
        AppEmoji.fontFamily,
        if (primary != null &&
            primary.isNotEmpty &&
            primary != AppEmoji.fontFamily)
          primary,
        ...?fontFamilyFallback?.where((f) => f != AppEmoji.fontFamily),
      ],
    );
  }

  /// 纯自定义表情：直接指定字体（比 fallback 可靠）。
  TextStyle get withAppEmojiFont => copyWith(fontFamily: AppEmoji.fontFamily);
}

/// 安全展示可能含自定义表情的文本。
class AppEmojiText extends StatelessWidget {
  const AppEmojiText(
    this.text, {
    super.key,
    this.style,
    this.maxLines,
    this.overflow,
    this.textAlign,
    this.softWrap,
  });

  final String text;
  final TextStyle? style;
  final int? maxLines;
  final TextOverflow? overflow;
  final TextAlign? textAlign;
  final bool? softWrap;

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      AppEmoji.toSpan(text, style: style),
      maxLines: maxLines,
      overflow: overflow ?? TextOverflow.clip,
      textAlign: textAlign ?? TextAlign.start,
      softWrap: softWrap ?? true,
    );
  }
}
