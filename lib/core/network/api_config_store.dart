import 'package:shared_preferences/shared_preferences.dart';

import 'api_config.dart';

/// 通过 SharedPreferences 持久化 [ApiConfig.environment]。
abstract final class ApiConfigStore {
  static const _prefsKey = 'api_environment';

  static Future<void> load() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final raw = prefs.getString(_prefsKey);
      ApiConfig.useEnvironment(switch (raw) {
        'production' => ApiEnvironment.production,
        'local' => ApiEnvironment.local,
        _ => ApiEnvironment.test,
      });
    } catch (_) {
      ApiConfig.useEnvironment(ApiEnvironment.test);
    }
  }

  static Future<void> save(ApiEnvironment env) async {
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
