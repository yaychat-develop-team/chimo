import 'package:chimo/app/chimo_api.dart';
import 'package:chimo/app/region_config.dart';
import 'package:chimo/app/service/im_service.dart';
import 'package:chimo/common/utils/app_log.dart';

import '../common/models/server_client/login.pb.dart';
import '../common/models/server_client/user.pb.dart';
import '../common/utils/cache_util.dart';
import 'app_jumper.dart';
import 'global_config.dart';

///记录用户登录信息和状态
abstract class SessionInfo {
  static User? _currentUser;
  static AuthRsp? _authRsp;

  static void setAuthRsp(AuthRsp? authRsp) {
    _authRsp = authRsp;
    CacheUtil.savePb(CacheKeys.authInfoKey(RegionConfig.regionCode), authRsp);
  }

  static User? get currentUser => _currentUser;

  static String? get token => _authRsp?.token;

  static bool get hasLogin => _currentUser != null && token?.isNotEmpty == true;

  static int get uid => currentUser?.id.toInt() ?? 0;

  static Future<bool> refreshUserInfo() async {
    var result = await ChimoApis.user.profile();
    if (result.ok) {
      _currentUser = result.data?.user;
      CacheUtil.savePb(CacheKeys.lastUserInfoKey, _currentUser);
    }
    return result.ok;
  }

  static void clear() {
    _currentUser = null;
    _authRsp = null;
    CacheUtil.removeObject(CacheKeys.lastUserInfoKey);
  }

  ///根据本地缓存token 自动登录
  static Future<bool> authLogin([String cause = ""]) async {
    try {
      AuthRsp? authRsp = CacheUtil.getPb(
        CacheKeys.authInfoKey(RegionConfig.regionCode),
        AuthRsp.create(),
      );
      if (authRsp == null || authRsp.token.isNotEmpty != true) return false;
      setAuthRsp(authRsp);

      ///刷新
      var rsp = await ChimoApis.auth.refreshToken();
      if (!rsp.ok) return false;
      bool result = await loginSuccessUpdateInfo(rsp.data?.authInfo);
      if (!result) return false;
    } catch (e) {
      AppLog.e('authLogin:', error: e);
    }
    return false;
  }

  ///登录成功更新用户信息
  static Future<bool> loginSuccessUpdateInfo(AuthRsp? authRsp) async {
    setAuthRsp(authRsp);
    var result = await refreshUserInfo();
    if (!result) return false;
    await GlobalConfig.refreshConfInfo();
    await GlobalConfig.refreshSettings(force: true);
    return true;
  }

  static Future logout(bool changeAccount) async {
    AppLog.d("start logout $uid");
    if (!changeAccount) {
      CacheUtil.removeObject(CacheKeys.authInfoKey(RegionConfig.regionCode));
    }
    CacheUtil.removeObject(CacheKeys.lastUserInfoKey);
    await ImService.logout().timeout(const Duration(seconds: 3));
    clear();
  }

  static Future logoutToLoginPage(bool changeAccount) async {
    await SessionInfo.logout(changeAccount);
    AppJumper.toLoginAndClear();
  }
}
