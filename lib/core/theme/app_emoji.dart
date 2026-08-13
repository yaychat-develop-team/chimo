import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

/// forya 自定义表情字体（PUA `U+E601`–`U+E62E`）。无此字体时群聊/私聊会显示方框。
abstract final class AppEmoji {
  static const String fontFamily = 'Emoji';
  static const String assetJson = 'assets/json/emojis.json';

  /// 与 forya `RegExp(r'^[\ue601-\ue62e]+$')` 一致。
  static final RegExp customOnly = RegExp(r'^[\ue601-\ue62e]+$');

  static bool isCustomEmojiOnly(String text) {
    final t = text.trim();
    return t.isNotEmpty && customOnly.hasMatch(t);
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
  /// 对齐 forya `withEmoji`：缺字形时回落到 [AppEmoji.fontFamily]。
  TextStyle get withAppEmoji => copyWith(
        fontFamilyFallback: [
          if (fontFamily != null && fontFamily!.isNotEmpty) fontFamily!,
          AppEmoji.fontFamily,
          ...?fontFamilyFallback,
        ],
      );
}
