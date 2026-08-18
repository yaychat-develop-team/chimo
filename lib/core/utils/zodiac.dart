/// 解析服务端生日（`yyyy-MM-dd` / 斜杠 / `yyyyMMdd` / unix 秒或毫秒）。
DateTime? parseBirthday(String birthday) {
  final raw = birthday.trim();
  if (raw.isEmpty || raw == '0' || raw.toLowerCase() == 'null') return null;
  final iso = DateTime.tryParse(raw);
  if (iso != null) return iso;
  final dashed = DateTime.tryParse(raw.replaceAll('/', '-'));
  if (dashed != null) return dashed;
  if (RegExp(r'^\d{8}$').hasMatch(raw)) {
    return DateTime.tryParse(
      '${raw.substring(0, 4)}-${raw.substring(4, 6)}-${raw.substring(6, 8)}',
    );
  }
  final n = int.tryParse(raw);
  // Unix 秒是 10 位、毫秒 13 位。7 位用户 id（如 1011231）不能当成时间戳，
  // 否则会落到 1970-01 被算成摩羯。
  if (n != null && n >= 1000000000) {
    final ms = n > 9999999999 ? n : n * 1000;
    return DateTime.fromMillisecondsSinceEpoch(ms, isUtc: true).toLocal();
  }
  return null;
}

/// 由生日得到西方星座名；无效 / 空生日返回空串（不展示假星座）。
String zodiacFromBirthday(String birthday) {
  final date = parseBirthday(birthday);
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
    _ => '',
  };
}

/// 资料卡星座文案。无生日 / 无星座时返回空串，不展示。
String zodiacChipLabel(String zodiac) {
  final z = zodiac.trim();
  if (z.isEmpty) return '';
  return '${zodiacEmoji(z)} $z';
}
