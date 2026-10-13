/// 非时间的短展示文案。时间一律走 TimeFmt。
abstract final class TextFmt {
  /// `1 time` / `3 times`。不足 1 次也显示 `1 time`。
  static String times(int count) {
    if (count <= 1) return '1 time';
    return '$count times';
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
