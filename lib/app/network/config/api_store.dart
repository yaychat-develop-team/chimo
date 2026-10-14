import '../../storage/app_storage.dart';
import '../../app_config.dart';
import '../http/http.dart';

/// 通过 [AppStorage.settings] 持久化 [AppConfig.environment]。
///
/// 正式包（`DEBUG_MODE=false`）忽略本地缓存，始终正式服。
abstract final class ApiStore {
  static const _key = 'api_environment';

  /// 同步：box 已在 `main()` 里打开，取值命中内存。
  static void load() {
    if (!AppConfig.isDebug) {
      AppConfig.useEnvironment(ApiEnvironment.production);
      return;
    }
    final value = AppStorage.settings?.get(_key);
    final raw = value is String ? value : '';
    if (raw.isEmpty) {
      AppConfig.useEnvironment(AppConfig.defaultDebugEnvironment);
      return;
    }
    AppConfig.useEnvironment(switch (raw) {
      'production' => ApiEnvironment.production,
      'local' => ApiEnvironment.local,
      'test' => ApiEnvironment.test,
      _ => AppConfig.defaultDebugEnvironment,
    });
  }

  static Future<void> save(ApiEnvironment env) async {
    if (!AppConfig.isDebug) {
      AppConfig.useEnvironment(ApiEnvironment.production);
      Http.ins.updateBaseUrl();
      return;
    }
    AppConfig.useEnvironment(env);
    Http.ins.updateBaseUrl();
    await AppStorage.settings?.put(_key, switch (env) {
      ApiEnvironment.production => 'production',
      ApiEnvironment.test => 'test',
      ApiEnvironment.local => 'local',
    });
  }
}
