import 'package:shared_preferences/shared_preferences.dart';

import 'api_config.dart';

/// 通过 SharedPreferences 持久化 [ApiConfig.environment]。
///
/// 正式包（`DEBUG_MODE=false`）忽略本地缓存，始终正式服。
abstract final class ApiConfigStore {
  static const _prefsKey = 'api_environment';

  static Future<void> load() async {
    ApiConfig.bootstrapBuildFlags();
    if (!ApiConfig.isDebug) {
      ApiConfig.useEnvironment(ApiEnvironment.production);
      return;
    }
    try {
      final prefs = await SharedPreferences.getInstance();
      final raw = prefs.getString(_prefsKey);
      if (raw == null || raw.isEmpty) {
        ApiConfig.useEnvironment(ApiConfig.defaultDebugEnvironment);
        return;
      }
      ApiConfig.useEnvironment(switch (raw) {
        'production' => ApiEnvironment.production,
        'local' => ApiEnvironment.local,
        'test' => ApiEnvironment.test,
        _ => ApiConfig.defaultDebugEnvironment,
      });
    } catch (_) {
      ApiConfig.useEnvironment(ApiConfig.defaultDebugEnvironment);
    }
  }

  static Future<void> save(ApiEnvironment env) async {
    if (!ApiConfig.isDebug) {
      ApiConfig.useEnvironment(ApiEnvironment.production);
      return;
    }
    ApiConfig.useEnvironment(env);
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString(
        _prefsKey,
        switch (env) {
          ApiEnvironment.production => 'production',
          ApiEnvironment.test => 'test',
          ApiEnvironment.local => 'local',
        },
      );
    } catch (_) {}
  }
}
