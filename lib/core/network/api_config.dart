/// [ApiClient] 使用的后端环境。
enum ApiEnvironment {
  production,
  test,
  local,
}

/// Chimo 后端 API 主机配置。
///
/// 持久化放在 [ApiConfigStore]（Flutter prefs），本文件保持
/// 可被普通 `dart run` 工具使用。
abstract final class ApiConfig {
  static const String productionBaseUrl = 'https://api.echimo.com/api/v1';
  static const String testBaseUrl = 'https://test-api.echimo.com/api/v1';
  static const String localBaseUrl = 'http://127.0.0.1:8080/api/v1';

  static ApiEnvironment _environment = ApiEnvironment.test;

  static ApiEnvironment get environment => _environment;

  static String get baseUrl => switch (_environment) {
        ApiEnvironment.production => productionBaseUrl,
        ApiEnvironment.test => testBaseUrl,
        ApiEnvironment.local => localBaseUrl,
      };

  /// 内存中切换环境（测试 / CLI / prefs 尚未就绪时）。
  static void useEnvironment(ApiEnvironment env) {
    _environment = env;
  }
}
