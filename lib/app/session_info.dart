import 'package:chimo/app/chimo_api.dart';
import 'package:chimo/app/region_config.dart';
import 'package:chimo/app/service/im_service.dart';
import 'package:chimo/common/utils/app_log.dart';

import '../common/models/server_client/login.pb.dart';
import '../common/models/server_client/user.pb.dart';
import 'app_jumper.dart';
import 'global_config.dart';
import 'storage/app_storage.dart';

/// 记录用户登录信息和状态（内存态）；持久化只走 [AppStorage.user]。
abstract class SessionInfo {
  static User? _currentUser;
  static AuthRsp? _authRsp;

  static void setAuthRsp(AuthRsp? authRsp) {
    _authRsp = authRsp;
    AppStorage.savePb(
      AppStorage.user,
      StorageKeys.authInfo(RegionConfig.regionCode),
      authRsp,
    );
  }

  static User? get currentUser => _currentUser;

  static String? get token => _authRsp?.token;

  static bool get hasLogin => _currentUser != null && token?.isNotEmpty == true;

  static int get uid => currentUser?.id.toInt() ?? 0;

  static Future<bool> refreshUserInfo() async {
    var result = await ChimoApis.user.profile();
    if (result.ok) {
      _currentUser = result.data?.user;
      AppStorage.savePb(AppStorage.user, StorageKeys.lastUserInfo, _currentUser);
    }
    return result.ok;
  }

  static void clear() {
    _currentUser = null;
    _authRsp = null;
    AppStorage.remove(AppStorage.user, StorageKeys.lastUserInfo);
  }

  /// 根据本地缓存 token 自动登录。
  static Future<bool> authLogin([String cause = '']) async {
    try {
      final authRsp = AppStorage.getPb(
        AppStorage.user,
        StorageKeys.authInfo(RegionConfig.regionCode),
        AuthRsp.create(),
      );
      if (authRsp == null || authRsp.token.isNotEmpty != true) return false;
      setAuthRsp(authRsp);

      final rsp = await ChimoApis.auth.refreshToken();
      if (!rsp.ok) return false;
      final result = await loginSuccessUpdateInfo(rsp.data?.authInfo);
      if (!result) return false;
    } catch (e) {
      AppLog.e('authLogin:', error: e);
    }
    return false;
  }

  /// 登录成功更新用户信息。
  static Future<bool> loginSuccessUpdateInfo(AuthRsp? authRsp) async {
    setAuthRsp(authRsp);
    final result = await refreshUserInfo();
    if (!result) return false;
    await GlobalConfig.refreshConfInfo();
    await GlobalConfig.refreshSettings(force: true);
    // 新注册用户立刻进聊天时，环信必须已登录，否则发消息 201 Not login。
    await ImService.connectFromServer();
    return true;
  }

  static Future logout(bool changeAccount) async {
    AppLog.d('start logout $uid');
    if (!changeAccount) {
      await AppStorage.remove(
        AppStorage.user,
        StorageKeys.authInfo(RegionConfig.regionCode),
      );
    }
    await AppStorage.remove(AppStorage.user, StorageKeys.lastUserInfo);
    await ImService.logout().timeout(const Duration(seconds: 3));
    clear();
  }

  static Future logoutToLoginPage(bool changeAccount) async {
    await SessionInfo.logout(changeAccount);
    AppJumper.toLoginAndClear();
  }
}
