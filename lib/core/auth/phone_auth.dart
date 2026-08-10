/// 认证 API 的手机号工具（forya 在 `/auth/sms-auth` 使用 `+86`）。
abstract final class PhoneAuth {
  /// 仅保留数字（去除空格 / 前导 `+86` / `86`）。
  static String digitsOnly(String raw) {
    var p = raw.trim().replaceAll(RegExp(r'\s+'), '');
    if (p.startsWith('+86')) p = p.substring(3);
    if (p.startsWith('86') && p.length > 11) p = p.substring(2);
    return p.replaceAll(RegExp(r'\D'), '');
  }

  /// 用于 sms-send / sms-auth 的 E.164 风格中国号码。
  static String toApiPhone(String raw) {
    final digits = digitsOnly(raw);
    if (digits.isEmpty) return raw.trim();
    if (digits.startsWith('86') && digits.length > 11) {
      return '+$digits';
    }
    return '+86$digits';
  }
}
