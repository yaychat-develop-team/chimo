import 'dart:convert';

import 'package:flutter/material.dart';

/// 一些数据转换工具，主要确保安全
abstract class TypeUtil {

  /// 转换成int
  /// 如果value是bool，则true转换成1， false为0
  static int parseInt(dynamic value, [int defaultValue = 0]) {
    if (value is int) return value;
    if (value is double) return value.toInt();
    if (value is bool) return value ? 1 : 0;
    if (value == null) return defaultValue;
    if (value == 'null') return defaultValue;
    if (value is String) {
      try {
        return double.parse(value).toInt();
      } catch (e) {
        return defaultValue;
      }
    }
    return defaultValue;
  }

  /// 解析bool类型
  /// - 如果为bool类型，则直接返回
  /// - 如果为num类型，则为0表示false，否则为true
  /// - 如果为String类型，则'true'表示true，否则转换Int类型， 判断是否为0
  static bool parseBool(dynamic value, [bool defaultValue = false]) {
    if (value == null) return defaultValue;
    if (value is bool) return value;
    if (value is num) return value > 0;
    if (value is String) {
      if (value.toLowerCase() == 'true') return true;
      return parseInt(value) > 0;
    }
    return defaultValue;
  }

  /// 转换成String
  /// 如果value是bool，则true转换成'1'， false为'0'
  /// 如果value是Map或List, Set，则转换成json字符串
  static String parseString(dynamic value, [String defaultValue = '']) {
    if (value == null) return '';
    if (value == 'null') return '';
    if (value is Map || value is List) return jsonEncode(value);
    if (value is Set) return jsonEncode(value.toList());
    return '$value';
  }

  /// 转换成double
  /// 如果value是bool，则true转换成1.0， false为0.0
  /// 如果value是String，则转换成double
  /// 如果value是int，则转换成double
  /// 如果value是double，则直接返回
  /// 如果value是其他类型，则返回0.0
  static double parseDouble(dynamic value, [double defaultValue = 0.0]) {
    if (value == null) return defaultValue;
    if (value is double) return value;
    if (value is int) return value.toDouble();
    if (value is String) {
      try {
        return double.parse(value);
      } catch (e) {
        return defaultValue;
      }
    }
    return defaultValue;
  }

  /// 解析list， value可以为字符串数组
  /// 如果value是字符串，则尝试解析成json数组
  /// 如果value是数组，则直接返回
  /// 如果value是null，则返回空数组
  /// 如果value是其他类型，则返回空数组
  /// 如果value是空字符串，则返回空数组
  static List<T> parseList<T>(dynamic value, T Function(dynamic e) f) {
    if (value == null) return [];
    List list = [];
    if (value is String && value.isNotEmpty) {
      try {
        list = jsonDecode(value);
      } catch (e) {
        list = [];
      }
    } else if (value is List) {
      list = value;
    }

    if (list.isNotEmpty) {
      return list.map((e) => f(e)).toList();
    } else {
      return [];
    }
  }

  static List<String> parseStringList(dynamic value) {
    if (value is List<String>) return value;
    return parseList(value, (e) => parseString(e));
  }

  static List<int> parseIntList(dynamic value) {
    if (value is List<int>) return value;
    return parseList(value, (e) => parseInt(e));
  }

  /// 解析Map，value可以是Map或JSON对象字符串
  /// 如果解析失败、字符串为空或JSON不是对象，则返回空Map
  static Map<String, dynamic> parseMap(dynamic value) {
    if (value == null) return {};
    if (value is Map<String, dynamic>) {
      return Map<String, dynamic>.from(value);
    }
    if (value is Map) {
      return value.map((key, value) => MapEntry(key.toString(), value));
    }
    if (value is! String) return {};

    final text = value.trim();
    if (text.isEmpty || text == 'null') return {};
    try {
      final decoded = jsonDecode(text);
      if (decoded is Map) {
        return decoded.map((key, value) => MapEntry(key.toString(), value));
      }
    } catch (_) {
      return {};
    }
    return {};
  }

  // 支持以下格式:
  // Color
  // int:
  //    0xRRGGBB
  //    0xAARRGGBB
  // string:
  //    #RGB
  //    #ARGB
  //    #RRGGBB
  //    #AARRGGBB
  //    0xRRGGBB
  //    0xAARRGGBB
  //    rgb(255, 0, 0)
  //    rgba(255, 0, 0, 0.5)
  //    rgb(100%, 0%, 0%)
  static Color? parseColor(Object? value) {
    if (value == null) {
      return null;
    }
    if (value is Color) {
      return value;
    }
    if (value is String) {
      final input = value.trim();
      if (input.isEmpty) {
        return null;
      }

      final rgbColor = _parseRgbColor(input);
      if (rgbColor != null) {
        return rgbColor;
      }

      final normalized = input.replaceFirst(RegExp(r'^#'), '').replaceFirst(RegExp(r'^0x', caseSensitive: false), '');
      final hex = _normalizeHexColor(normalized);
      if (hex == null) {
        return null;
      }

      final colorValue = int.tryParse(hex, radix: 16);
      return colorValue == null ? null : Color(colorValue);
    }
    if (value is int) {
      if (value < 0) {
        return null;
      }
      return Color(value <= 0xFFFFFF ? 0xFF000000 | value : value);
    }
    return null;
  }
}

String? _normalizeHexColor(String value) {
  final hex = value.trim();
  if (!RegExp(r'^[0-9a-fA-F]+$').hasMatch(hex)) {
    return null;
  }

  return switch (hex.length) {
    3 => 'FF${hex[0]}${hex[0]}${hex[1]}${hex[1]}${hex[2]}${hex[2]}',
    4 => '${hex[0]}${hex[0]}${hex[1]}${hex[1]}${hex[2]}${hex[2]}${hex[3]}${hex[3]}',
    6 => 'FF$hex',
    8 => hex,
    _ => null,
  };
}

Color? _parseRgbColor(String value) {
  final match = RegExp(
    r'^rgba?\(([^)]+)\)$',
    caseSensitive: false,
  ).firstMatch(value);
  if (match == null) {
    return null;
  }

  final parts = match.group(1)!.split(',').map((e) => e.trim()).toList();
  if (parts.length != 3 && parts.length != 4) {
    return null;
  }

  final red = _parseRgbComponent(parts[0]);
  final green = _parseRgbComponent(parts[1]);
  final blue = _parseRgbComponent(parts[2]);
  final alpha = parts.length == 4 ? _parseAlphaComponent(parts[3]) : 255;
  if (red == null || green == null || blue == null || alpha == null) {
    return null;
  }

  return Color.fromARGB(alpha, red, green, blue);
}

int? _parseRgbComponent(String value) {
  if (value.endsWith('%')) {
    final percent = double.tryParse(value.substring(0, value.length - 1));
    if (percent == null || percent < 0 || percent > 100) {
      return null;
    }
    return (percent * 255 / 100).round();
  }

  final component = int.tryParse(value);
  if (component == null || component < 0 || component > 255) {
    return null;
  }
  return component;
}

int? _parseAlphaComponent(String value) {
  if (value.endsWith('%')) {
    final percent = double.tryParse(value.substring(0, value.length - 1));
    if (percent == null || percent < 0 || percent > 100) {
      return null;
    }
    return (percent * 255 / 100).round();
  }

  final alpha = double.tryParse(value);
  if (alpha == null) {
    return null;
  }
  if (alpha >= 0 && alpha <= 1) {
    return (alpha * 255).round();
  }
  if (alpha >= 0 && alpha <= 255) {
    return alpha.round();
  }
  return null;
}
