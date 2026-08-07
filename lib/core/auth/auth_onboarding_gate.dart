import '../network/network_bootstrap.dart';

/// Decides whether post-login should skip onboarding and enter home.
///
/// Callers pick the destination:
/// - phone incomplete → profile setup / almost-in
/// - email incomplete → Edit Profile onboarding
/// - complete profile → home
///
/// Email signup often returns `isRegister: true` while nickname is still the
/// email address — those must still onboard; do not trust `isRegister` alone.
abstract final class AuthOnboardingGate {
  /// `true` → go shell/home; `false` → profile setup onboarding.
  static Future<bool> shouldEnterHome(
    Map<String, dynamic> authData, {
    String? email,
  }) async {
    // Explicit new-user from AuthRsp.
    if (_readBool(authData['newUser']) == true) return false;

    try {
      final res = await NetworkBootstrap.api.userInfo();
      if (res.success && res.data is Map) {
        final data = Map<String, dynamic>.from(res.data as Map);
        final user = data['user'];
        final map = user is Map
            ? Map<String, dynamic>.from(user)
            : data;

        // Incomplete placeholder profiles always need onboarding, even when the
        // server marks `isRegister: true` (common after email-auth).
        if (!_profileLooksComplete(map, email: email)) return false;

        final registered = _readBool(map['isRegister']);
        if (registered == false) return false;
        return true;
      }
    } catch (_) {
      // Fall through to auth payload.
    }

    return _profileLooksComplete(authData, email: email);
  }

  /// Raw fields only — do not use [MeProfile] (it defaults empty gender to Male).
  static bool _profileLooksComplete(
    Map<String, dynamic> data, {
    String? email,
  }) {
    final nick =
        '${data['nickName'] ?? data['nickname'] ?? ''}'.trim();
    final gender = '${data['gender'] ?? ''}'.trim().toLowerCase();
    final birthday = '${data['birthday'] ?? ''}'.trim();
    if (nick.isEmpty || gender.isEmpty) return false;

    // Treat unset / unknown gender codes as incomplete.
    if (gender == '0' || gender == 'unknown' || gender == 'null') {
      return false;
    }

    // Email auth placeholders: nickname is often the email address.
    if (nick.contains('@')) return false;
    final mail = (email ?? '').trim().toLowerCase();
    if (mail.isNotEmpty && nick.toLowerCase() == mail) return false;

    // Profile-setup collects birthday; missing → still onboarding.
    if (birthday.isEmpty) return false;

    return true;
  }

  static bool? _readBool(Object? value) {
    if (value == null) return null;
    if (value is bool) return value;
    if (value is num) return value != 0;
    final text = '$value'.trim().toLowerCase();
    if (text == 'true' || text == '1') return true;
    if (text == 'false' || text == '0') return false;
    return null;
  }
}
