/// 非时间的短展示文案。时间一律走 TimeFmt。
abstract final class TextFmt {
  /// `1 time` / `3 times`。不足 1 次也显示 `1 time`。
  static String times(int count) {
    if (count <= 1) return '1 time';
    return '$count times';
  }

  /// 千分位，如 `1,234` / `-8,000`。
  static String toCommaValue(Object? value) {
    final text = value?.toString() ?? '0';
    final negative = text.startsWith('-');
    final raw = negative ? text.substring(1) : text;
    final buffer = StringBuffer();
    for (var i = 0; i < raw.length; i++) {
      if (i > 0 && (raw.length - i) % 3 == 0) buffer.write(',');
      buffer.write(raw[i]);
    }
    return negative ? '-$buffer' : buffer.toString();
  }

  /// 紧凑社交计数，如 `208`、`1.2K`、`88K`、`1.5M`。
  static String compact(int value) {
    if (value < 1000) return '$value';
    if (value < 10000) {
      final k = value / 1000;
      final text = k == k.roundToDouble() ? '${k.toInt()}' : k.toStringAsFixed(1);
      return '${text}K';
    }
    if (value < 1000000) return '${value ~/ 1000}K';
    final m = value / 1000000;
    final text = m == m.roundToDouble() ? '${m.toInt()}' : m.toStringAsFixed(1);
    return '${text}M';
  }

  /// 房间热度 / 麦位贡献。1000 以上保留一位小数，如 `3.0K`、`332.4K`。
  static String roomCount(int value) {
    if (value < 1000) return '$value';
    if (value < 1000000) return '${(value / 1000).toStringAsFixed(1)}K';
    return '${(value / 1000000).toStringAsFixed(1)}M';
  }

  /// 万单位计数。≥1 万用 `13.56w`，否则原值。
  static String wan(int value) {
    if (value >= 10000) return '${(value / 10000).toStringAsFixed(2)}w';
    return '$value';
  }

  /// `12 B` / `1.5 KB` / `2.00 MB`。
  static String fileSize(int bytes) {
    if (bytes < 1024) return '$bytes B';
    if (bytes < 1024 * 1024) {
      return '${(bytes / 1024).toStringAsFixed(1)} KB';
    }
    return '${(bytes / (1024 * 1024)).toStringAsFixed(2)} MB';
  }
}
