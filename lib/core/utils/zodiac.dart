/// 由 `yyyy-MM-dd` 生日得到西方星座名；无效 / 空生日返回空串（不展示假星座）。
String zodiacFromBirthday(String birthday) {
  final date = DateTime.tryParse(birthday.trim());
  if (date == null) return '';
  final m = date.month;
  final d = date.day;
  if ((m == 3 && d >= 21) || (m == 4 && d <= 19)) return 'Aries';
  if ((m == 4 && d >= 20) || (m == 5 && d <= 20)) return 'Taurus';
  if ((m == 5 && d >= 21) || (m == 6 && d <= 20)) return 'Gemini';
  if ((m == 6 && d >= 21) || (m == 7 && d <= 22)) return 'Cancer';
  if ((m == 7 && d >= 23) || (m == 8 && d <= 22)) return 'Leo';
  if ((m == 8 && d >= 23) || (m == 9 && d <= 22)) return 'Virgo';
  if ((m == 9 && d >= 23) || (m == 10 && d <= 22)) return 'Libra';
  if ((m == 10 && d >= 23) || (m == 11 && d <= 21)) return 'Scorpio';
  if ((m == 11 && d >= 22) || (m == 12 && d <= 21)) return 'Sagittarius';
  if ((m == 12 && d >= 22) || (m == 1 && d <= 19)) return 'Capricorn';
  if ((m == 1 && d >= 20) || (m == 2 && d <= 18)) return 'Aquarius';
  return 'Pisces';
}

/// 与 forya 聊天卡片星座标签匹配的 Emoji 前缀。
String zodiacEmoji(String zodiac) {
  return switch (zodiac.toLowerCase()) {
    'aries' => '♈️',
    'taurus' => '♉️',
    'gemini' => '♊️',
    'cancer' => '♋️',
    'leo' => '♌️',
    'virgo' => '♍️',
    'libra' => '♎️',
    'scorpio' => '♏️',
    'sagittarius' => '♐️',
    'capricorn' || 'capricornus' => '♑️',
    'aquarius' => '♒️',
    'pisces' => '♓️',
    _ => '♑️',
  };
}
