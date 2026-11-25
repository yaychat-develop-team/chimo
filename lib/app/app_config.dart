import 'package:flutter/foundation.dart';

/// [Http] 使用的后端环境。
enum ApiEnvironment { production, test, local }

/// Chimo 后端 API 主机配置。
abstract final class AppConfig {
  static const String productionBaseUrl = 'https://api.echimo.com/api/v1';
  static const String testBaseUrl = 'https://test-api.echimo.com/api/v1';
  static const String localBaseUrl = 'http://127.0.0.1:8080/api/v1';

  /// 是否调试包（可切测试服 / 显示 Debug Page）。
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
  static void init() {
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

  /// 未读缓存时的默认环境（仅 isDebug 包使用）。
  static ApiEnvironment get defaultDebugEnvironment =>
      kReleaseMode ? ApiEnvironment.production : ApiEnvironment.test;

  /// 内存中切换环境（测试 / CLI / box 尚未打开时）。
  static void useEnvironment(ApiEnvironment env) {
    if (!isDebug) {
      _environment = ApiEnvironment.production;
      return;
    }
    _environment = env;
  }
}
