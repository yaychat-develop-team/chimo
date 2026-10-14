/// 热度、麦位贡献。1000 以上保留一位小数，如 3.0K、332.4K。
String roomCount(int value) {
  if (value < 1000) return '$value';
  if (value < 1000000) return '${(value / 1000).toStringAsFixed(1)}K';
  return '${(value / 1000000).toStringAsFixed(1)}M';
}
