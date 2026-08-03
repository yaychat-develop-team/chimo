import 'api_client.dart';
import 'api_config.dart';
import 'chimo_api.dart';

/// Result of probing one endpoint.
class ApiProbeResult {
  const ApiProbeResult({
    required this.name,
    required this.path,
    required this.response,
    required this.ok,
  });

  final String name;
  final String path;
  final ApiResponse response;
  final bool ok;

  String get summary =>
      '$name  $path  →  ${ok ? 'OK' : 'FAIL'}  '
      '${response.message} (${response.code})';
}

/// Runs the core endpoints used by D:\forya against the configured base URL.
class ApiProbeSuite {
  ApiProbeSuite(this.api);

  final ChimoApi api;

  Future<List<ApiProbeResult>> run() async {
    final checks = <(String, String, Future<ApiResponse> Function())>[
      ('userOpen', '/user/open', () => api.userOpen()),
      ('loginPlatforms', '/auth/login-platforms', api.loginPlatforms),
      ('appSettings', '/app/settings', api.appSettings),
      ('splashList', '/app/splash_list', api.splashList),
      ('versionCheck', '/app/version-check', api.versionCheck),
      ('homeMain', '/home_page/main', api.homeMain),
      ('bannerList', '/banner/list', api.bannerList),
      ('groupTypeList', '/chat/group/getTypeList', api.groupTypeList),
      ('groupList', '/chat/group/list', api.groupList),
      ('myGroups', '/chat/group/myGroups', api.myGroups),
      ('userInfo', '/user/info', api.userInfo),
      ('userConf', '/user/conf', api.userConf),
    ];

    final results = <ApiProbeResult>[];
    for (final (name, path, call) in checks) {
      try {
        final response = await call();
        // Reachable backend + known auth gate counts as a successful probe.
        final ok = response.reachable ||
            response.message == 'user.not.login' ||
            response.httpStatus == 200;
        results.add(
          ApiProbeResult(name: name, path: path, response: response, ok: ok),
        );
      } catch (error) {
        results.add(
          ApiProbeResult(
            name: name,
            path: path,
            response: ApiResponse(
              success: false,
              code: null,
              message: '$error',
              raw: const {},
            ),
            ok: false,
          ),
        );
      }
    }
    return results;
  }

  static Future<List<ApiProbeResult>> runDefault({bool loadPrefs = false}) async {
    if (loadPrefs) {
      try {
        // Lazy import avoided: caller uses ApiConfigStore when needed.
      } catch (_) {
        ApiConfig.useEnvironment(ApiEnvironment.test);
      }
    }
    final client = ApiClient();
    final api = ChimoApi(client);
    try {
      return await ApiProbeSuite(api).run();
    } finally {
      client.close();
    }
  }
}
