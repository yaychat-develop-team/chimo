/// 认证接口的手机号（`/auth/phone-auth` 使用 `+86`）。
abstract final class PhoneUtils {
  /// 只留数字，去掉空格和前导 `+86` / `86`。
  static String digitsOnly(String raw) {
    var phone = raw.trim().replaceAll(RegExp(r'\s+'), '');
    if (phone.startsWith('+86')) phone = phone.substring(3);
    if (phone.startsWith('86') && phone.length > 11) phone = phone.substring(2);
    return phone.replaceAll(RegExp(r'\D'), '');
  }

  /// send-phone-code / phone-auth 用的中国号码。
  static String toApiPhone(String raw) {
    final digits = digitsOnly(raw);
    if (digits.isEmpty) return raw.trim();
    if (digits.startsWith('86') && digits.length > 11) return '+$digits';
    return '+86$digits';
  }
}
