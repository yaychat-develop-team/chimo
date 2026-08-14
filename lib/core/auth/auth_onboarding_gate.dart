import '../network/network_bootstrap.dart';
import 'auth_session.dart';

/// 判断登录后是否应跳过引导直接进入首页。
///
/// 手机 / 邮箱 / Apple 未完成资料时一律进入同一条完善资料流程
///（性别+生日 → 头像+昵称 → 欢迎 → 部落）。
///
/// 邮箱注册常返回 `isRegister: true`，但昵称仍是邮箱地址——这类仍须走引导；
/// 不要仅依赖 `isRegister`。
/// 用户在引导中点 Skip 进入首页后，[AuthSession.isOnboardingCompleted] 为 true。
abstract final class AuthOnboardingGate {
  /// `true` → 进入壳/首页；`false` → 资料设置引导。
  static Future<bool> shouldEnterHome(
    Map<String, dynamic> authData, {
    String? email,
  }) async {
    // 已跳过 / 走完引导：直接进首页，无需资料齐全。
    if (await AuthSession.isOnboardingCompleted()) return true;

    // AuthRsp 明确标记为新用户。
    if (_readBool(authData['newUser']) == true) return false;

    try {
      final res = await NetworkBootstrap.api.userInfo();
      if (res.success && res.data is Map) {
        final data = Map<String, dynamic>.from(res.data as Map);
        final user = data['user'];
        final map = user is Map
            ? Map<String, dynamic>.from(user)
            : data;

        // 不完整的占位资料一律需要引导，即使服务端标了 `isRegister: true`
        // （邮箱登录后很常见）。
        if (!_profileLooksComplete(map, email: email)) return false;

        final registered = _readBool(map['isRegister']);
        if (registered == false) return false;
        return true;
      }
    } catch (_) {
      // 回退到登录载荷。
    }

    return _profileLooksComplete(authData, email: email);
  }

  /// 仅看原始字段——不要用 [MeProfile]（它会把空性别默认成 Male）。
  static bool _profileLooksComplete(
    Map<String, dynamic> data, {
    String? email,
  }) {
    final nick =
        '${data['nickName'] ?? data['nickname'] ?? ''}'.trim();
    final gender = '${data['gender'] ?? ''}'.trim().toLowerCase();
    final birthday = '${data['birthday'] ?? ''}'.trim();
    if (nick.isEmpty || gender.isEmpty) return false;

    // 未设置 / 未知性别码视为未完成。
    if (gender == '0' || gender == 'unknown' || gender == 'null') {
      return false;
    }

    // 邮箱登录占位：昵称经常就是邮箱地址。
    if (nick.contains('@')) return false;
    final mail = (email ?? '').trim().toLowerCase();
    if (mail.isNotEmpty && nick.toLowerCase() == mail) return false;

    // 资料设置会采集生日；缺失 → 仍需引导。
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
