/// Phone helpers for auth APIs (forya uses `+86` on `/auth/sms-auth`).
abstract final class PhoneAuth {
  /// Digits only (strip spaces / leading `+86` / `86`).
  static String digitsOnly(String raw) {
    var p = raw.trim().replaceAll(RegExp(r'\s+'), '');
    if (p.startsWith('+86')) p = p.substring(3);
    if (p.startsWith('86') && p.length > 11) p = p.substring(2);
    return p.replaceAll(RegExp(r'\D'), '');
  }

  /// E.164-style CN number for sms-send / sms-auth.
  static String toApiPhone(String raw) {
    final digits = digitsOnly(raw);
    if (digits.isEmpty) return raw.trim();
    if (digits.startsWith('86') && digits.length > 11) {
      return '+$digits';
    }
    return '+86$digits';
  }
}
