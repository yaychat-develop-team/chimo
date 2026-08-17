import 'package:flutter/foundation.dart';

/// [ApiClient] 使用的后端环境。
enum ApiEnvironment {
  production,
  test,
  local,
}

/// Chimo 后端 API 主机配置。
///
/// 对齐 forya `GlobalConfig.isDebug` / `UrlConfig.init`：
/// - 打包 `--dart-define=DEBUG_MODE=false`（正式包）→ 固定正式服
/// - `DEBUG_MODE=true`（或本地 debug 跑）→ 可切环境；未持久化时
///   Release 默认正式、Debug 默认测试
///
/// 持久化放在 [ApiConfigStore]（Flutter prefs），本文件保持
/// 可被普通 `dart run` 工具使用。
abstract final class ApiConfig {
  static const String productionBaseUrl = 'https://api.echimo.com/api/v1';
  static const String testBaseUrl = 'https://test-api.echimo.com/api/v1';
  static const String localBaseUrl = 'http://127.0.0.1:8080/api/v1';

  /// 是否调试包（可切测试服 / 显示 Debug Page）。
  /// 由 [bootstrapBuildFlags] 根据 `DEBUG_MODE` 与 assert(kDebugMode) 设置。
  static bool isDebug = false;

  static ApiEnvironment _environment = ApiEnvironment.test;

  static ApiEnvironment get environment => _environment;

  /// 当前是否走正式服（对齐 forya `GlobalConfig.isOfficial`）。
  static bool get isOfficial {
    if (!isDebug) return true;
    return _environment == ApiEnvironment.production;
  }

  static String get baseUrl => switch (_environment) {
        ApiEnvironment.production => productionBaseUrl,
        ApiEnvironment.test => testBaseUrl,
        ApiEnvironment.local => localBaseUrl,
      };

  /// 对齐 forya `GlobalConfig.init`：读取打包注入的 `DEBUG_MODE`。
  static void bootstrapBuildFlags() {
    const enableDebug = bool.fromEnvironment('DEBUG_MODE');
    // 本地 `flutter run`（kDebugMode）始终可调试。
    assert(() {
      isDebug = true;
      return true;
    }());
    if (enableDebug) {
      isDebug = true;
    }
  }

  /// 未读 prefs 时的默认环境（仅 isDebug 包使用）。
  static ApiEnvironment get defaultDebugEnvironment =>
      kReleaseMode ? ApiEnvironment.production : ApiEnvironment.test;

  /// 内存中切换环境（测试 / CLI / prefs 尚未就绪时）。
  static void useEnvironment(ApiEnvironment env) {
    if (!isDebug) {
      _environment = ApiEnvironment.production;
      return;
    }
    _environment = env;
  }
}
