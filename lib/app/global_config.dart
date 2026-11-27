import 'package:chimo/app/chimo_api.dart';

import '../common/models/server_client/common/app.pb.dart';
import '../common/models/server_client/user.pb.dart';
import 'storage/app_storage.dart';

/// 全局共同使用的请求和属性。
abstract class GlobalConfig {
  static GetSettingsResp? settingsResp;
  static ConfResp? confResp;

  /// 默认为空才请求；如需更新 [force] 传 true。
  static Future<bool> refreshSettings({bool force = false}) async {
    if (settingsResp == null || force) {
      final settingsResult = await ChimoApis.app.settings();
      if (settingsResult.ok) {
        settingsResp = settingsResult.data;
      }
      return settingsResult.ok;
    }
    return true;
  }

  /// 默认为空才请求；如需更新 [force] 传 true。
  static Future<bool> refreshConfInfo({bool force = false}) async {
    if (confResp == null || force) {
      final result = await ChimoApis.user.conf();
      if (result.ok) {
        confResp = result.data;
        await AppStorage.savePb(AppStorage.settings, StorageKeys.confResp, confResp);
      }

      confResp ??= AppStorage.getPb(
        AppStorage.settings,
        StorageKeys.confResp,
        ConfResp.create(),
      );
      return result.ok;
    }
    return true;
  }
}
