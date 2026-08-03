/// Backend environment used by [ApiClient].
enum ApiEnvironment {
  production,
  test,
  local,
}

/// API host configuration for Chimo backends.
///
/// Persistence lives in [ApiConfigStore] (Flutter prefs) so this file stays
/// usable from plain `dart run` tools.
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

  /// In-memory switch (tests / CLI / before prefs are ready).
  static void useEnvironment(ApiEnvironment env) {
    _environment = env;
  }
}
