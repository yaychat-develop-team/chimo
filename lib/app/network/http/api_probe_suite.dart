import 'api_client.dart';
import '../../app_config.dart';

/// 探测单个接口的结果。
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

/// 对已配置的 base URL 运行 D:\forya 所用的核心接口探测。
class ApiProbeSuite {
  ApiProbeSuite(this.client);

  final ApiClient client;

  Future<List<ApiProbeResult>> run() async {
    final checks = <(String, String, Future<ApiResponse> Function())>[
      ('userOpen', '/user/open', () => client.post('/user/open', bizParam: {'open': false})),
      ('loginPlatforms', '/auth/login-platforms', () => client.get('/auth/login-platforms')),
      ('appSettings', '/app/settings', () => client.get('/app/settings')),
      ('splashList', '/app/splash_list', () => client.get('/app/splash_list')),
      (
        'versionCheck',
        '/app/version-check',
        () => client.get('/app/version-check', query: {'version': '1.0.0'}),
      ),
      ('homeMain', '/home_page/main', () => client.get('/home_page/main')),
      ('bannerList', '/banner/list', () => client.get('/banner/list', query: {'type': '1'})),
      ('groupTypeList', '/chat/group/getTypeList', () => client.get('/chat/group/getTypeList')),
      (
        'groupList',
        '/chat/group/list',
        () => client.get('/chat/group/list', query: {'pageNum': '1', 'pageSize': '10'}),
      ),
      ('myGroups', '/chat/group/myGroups', () => client.get('/chat/group/myGroups')),
      ('userInfo', '/user/info', () => client.get('/user/info')),
      ('userConf', '/user/conf', () => client.get('/user/conf')),
    ];

    final results = <ApiProbeResult>[];
    for (final (name, path, call) in checks) {
      try {
        final response = await call();
        // 后端可达且命中已知鉴权门控时，视为探测成功。
        final ok =
            response.reachable ||
            response.message == 'user.not.login' ||
            response.httpStatus == 200;
        results.add(ApiProbeResult(name: name, path: path, response: response, ok: ok));
      } catch (error) {
        results.add(
          ApiProbeResult(
            name: name,
            path: path,
            response: ApiResponse(success: false, code: null, message: '$error', raw: const {}),
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
        // 避免惰性导入：调用方按需使用 ApiConfigStore。
      } catch (_) {
        AppConfig.useEnvironment(ApiEnvironment.test);
      }
    }
    final client = ApiClient();
    try {
      return await ApiProbeSuite(client).run();
    } finally {
      client.close();
    }
  }
}
