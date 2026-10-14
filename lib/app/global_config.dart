import 'package:chimo/app/chimo_api.dart';
import 'package:chimo/main/chimo_app.dart';

import '../common/models/server_client/common/app.pb.dart';
import '../common/models/server_client/user.pb.dart';
import '../common/utils/cache_util.dart';

///全局共同使用的请求和属性
abstract class GlobalConfig {
  static GetSettingsResp? settingsResp;
  static ConfResp? confResp;

  ///默认为空才请求 如需更新force传true
  static Future<bool> refreshSettings({bool force = false}) async {
    if (settingsResp == null || force) {
      var settingsResult = await ChimoApis.app.settings();
      if (settingsResult.ok) {
        settingsResp = settingsResult.data;
      }
      return settingsResult.ok;
    }
    return true;
  }

  ///默认为空才请求 如需更新force传true
  static Future<bool> refreshConfInfo({bool force = false}) async {
    if (confResp == null || force) {
      var result = await ChimoApis.user.conf();
      if (result.ok) {
        confResp = result.data;
        CacheUtil.savePb(CacheKeys.confRespKey, confResp!);
      }

      confResp ??= CacheUtil.getPb(CacheKeys.confRespKey, ConfResp.create());
      return result.ok;
    }
    return true;
  }
}