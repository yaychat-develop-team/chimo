import 'dart:async';

import 'package:talker_dio_logger/talker_dio_logger.dart';

import '../storage/user_store.dart';
import '../service/im_service.dart';
import '../../common/utils/app_log.dart';
import '../../common/utils/log.dart';
import 'http/api_client.dart';
import 'http/auth_request_headers.dart';
import '../app_config.dart';
import 'config/api_store.dart';
import 'http/auth_response_interceptor.dart';
import 'http/header_interceptor.dart';
import 'config/proxy_store.dart';

/// 应用级网络启动：加载环境与可选心跳。
abstract final class NetworkBootstrap {
  static ApiClient? _client;
  static Timer? _heartbeat;
  static String? authToken;

  /// 已点火的冷启动引导。`main()` 只点火不 `await`，等结果这件事落在 Splash 页 ——
  /// 网络慢的时候 `await` 会把首帧一起拖成白屏。
  static Future<ApiResponse>? _ready;

  /// 登出 / token 失效时清空内存态（如会话列表），由 [AppProviders] 注册。
  static void Function()? onSessionCleared;

  static ApiClient get client => _client ??= _createClient();

  static ApiClient _createClient() {
    final client = ApiClient(
      interceptors: [
        HeaderInterceptor(tokenProvider: () => authToken),
        // 仅观测业务未登录；真正清会话仍由 ApiGateway（retry 之后）负责。
        AuthResponseInterceptor(
          onNotLogin: (options, response) async {
            AppLog.w(
              'AuthResponseInterceptor not-login '
              '${options.uri.path} code=${response.code}',
            );
          },
        ),
      ],
    );
    ProxyStore.configureDio(client.dio);
    final talker = loggerOrNull;
    if (talker != null) {
      client.dio.interceptors.add(
        TalkerDioLogger(
          talker: talker,
          settings: TalkerDioLoggerSettings(enabled: AppConfig.isDebug),
        ),
      );
    }
    return client;
  }

  /// 代理变更后重建 HTTP 客户端（对齐 forya `JRNetwork.updateProxy`）。
  static Future<void> rebuildHttpClient() async {
    ProxyStore.load();
    final old = _client;
    _client = _createClient();
    try {
      old?.close();
    } catch (_) {
      // 旧 client 已经关过 / 连接已断：新 client 已就位，无所谓。
    }
  }

  /// 点火冷启动引导但不等它 —— `main()` 用这个代替 `await initialize()`。
  ///
  /// 幂等：重复调用拿到的是同一个 `Future`，Splash 页重建也不会重打一遍请求。
  static Future<ApiResponse> start({bool startHeartbeat = true}) =>
      _ready ??= initialize(startHeartbeat: startHeartbeat);

  /// 已点火的引导；没点火时是 `null`（直接 pump Splash 的 widget test）。
  /// 拿到 `null` 的一方不要替 `main()` 点火，那会让测试打真实网络。
  static Future<ApiResponse>? get pending => _ready;

  /// 重来一次（Splash 的「重试」）：丢掉上一次的失败结果再点火。
  static Future<ApiResponse> restart({bool startHeartbeat = true}) {
    _ready = null;
    return start(startHeartbeat: startHeartbeat);
  }

  static Future<ApiResponse> initialize({bool startHeartbeat = true}) async {
    AppConfig.init();
    ApiStore.load();
    ProxyStore.load();
    await AuthRequestHeaders.initialize();
    // 确保首次请求使用已加载的代理配置。
    await rebuildHttpClient();
    authToken = UserStore.currentUser.token;
    AppLog.i(
      'NetworkBootstrap baseUrl=${AppConfig.baseUrl} '
      'isDebug=${AppConfig.isDebug} isOfficial=${AppConfig.isOfficial} '
      'hasToken=${authToken != null}'
      ' proxy=${ProxyStore.isConfigured ? '${ProxyStore.ip}:${ProxyStore.port}' : 'off'}',
    );

    // 对齐 forya LoginManager 自动登录：冷启动时刷新 token。
    if (authToken != null && authToken!.isNotEmpty) {
      await _tryRefreshToken(clearOnFailure: false);
    }

    final result = await client.post('/user/open', bizParam: {'open': false});
    if (!result.success && result.message == 'user.not.login') {
      // 仅在 open 确认本地 token 已失效后才清空。
      await clearSession();
    } else if (result.success || (authToken != null && authToken!.isNotEmpty)) {
      // 应用 token 有效后尽力登录环信。
      unawaited(ImService.connectFromServer());
    }
    if (startHeartbeat) {
      _heartbeat?.cancel();
      _heartbeat = Timer.periodic(const Duration(seconds: 30), (_) {
        unawaited(_heartbeatTick());
      });
    }
    return result;
  }

  /// 从磁盘恢复内存中的 token，并可选择再刷新一次。
  static Future<bool> ensureSession({bool tryRefresh = true}) async {
    if (authToken == null || authToken!.isEmpty) {
      authToken = UserStore.currentUser.token;
    }
    if (authToken == null || authToken!.isEmpty) return false;
    if (!tryRefresh) return true;
    return _tryRefreshToken(clearOnFailure: false);
  }

  /// 尝试后若仍存在可用 token 则返回 true。
  static Future<bool> _tryRefreshToken({required bool clearOnFailure}) async {
    try {
      final refresh = await client.get('/auth/refresh-token');
      if (refresh.success) {
        final next = _tokenFromData(refresh.data);
        if (next != null) {
          await applySessionToken(next);
          await UserStore.update((cache) => cache.patch(token: next));
          AppLog.i('NetworkBootstrap token refreshed');
          return true;
        }
        // 刷新成功但无新 token —— 保留当前 token。
        return authToken != null && authToken!.isNotEmpty;
      }

      // `unauthorized registration` 等并不总表示 JWT 已死；
      // 仅在明确 not-login 时清空。
      if (refresh.message == 'user.not.login') {
        AppLog.d('NetworkBootstrap refresh: user.not.login');
        if (clearOnFailure) await clearSession();
        return false;
      }
      AppLog.w(
        'NetworkBootstrap refresh failed (keep token): '
        '${refresh.message} code=${refresh.code}',
      );
      return authToken != null && authToken!.isNotEmpty;
    } catch (error, stack) {
      AppLog.e('NetworkBootstrap refresh error', error: error, stack: stack);
      return authToken != null && authToken!.isNotEmpty;
    }
  }

  static String? _tokenFromData(Object? data) {
    if (data is! Map) return null;
    final value = data['token'];
    if (value is String && value.isNotEmpty) return value;
    final text = '$value';
    return text.isEmpty || text == 'null' ? null : text;
  }

  static Future<void> _heartbeatTick() async {
    var res = await client.post('/user/open', bizParam: {'open': false});
    if (res.success) return;
    if (res.message != 'user.not.login') return;

    // 软恢复：磁盘 token / 刷新，再探测一次。
    final ok = await ensureSession(tryRefresh: true);
    if (!ok) {
      await clearSession();
      return;
    }
    res = await client.post('/user/open', bizParam: {'open': false});
    if (!res.success && res.message == 'user.not.login') {
      await clearSession();
    }
  }

  /// 首次调用返回 `user.not.login` 时，做一次会话恢复后重跑 [request]。
  static Future<ApiResponse> withSessionRetry(Future<ApiResponse> Function() request) async {
    final first = await request();
    if (first.success || first.message != 'user.not.login') return first;

    final recovered = await ensureSession(tryRefresh: true);
    if (!recovered) return first;
    return request();
  }

  static Future<void> applySessionToken(String? token) async {
    authToken = (token != null && token.isNotEmpty) ? token : null;
  }

  /// OTP / token 应用成功后 — 拉取环信凭证并登录。
  static Future<void> connectImAfterLogin() async {
    await ImService.connectFromServer();
  }

  /// 服务端报告 token 无效时清空本地会话。
  static Future<void> handleNotLogin() async {
    await clearSession();
  }

  /// 立即清空本地登录态；环信登出尽力而为并设短超时，
  /// 避免设置页「退出登录」卡住。
  static Future<void> clearSession() async {
    authToken = null;
    await UserStore.clear();
    try {
      await ImService.logout().timeout(const Duration(seconds: 3));
    } catch (_) {
      // 环信登出尽力而为并设了 3s 超时：登出本地态已经清了，
      // 卡在这里只会让「退出登录」按钮转圈（这正是加超时的原因）。
    }
    try {
      onSessionCleared?.call();
    } catch (error) {
      AppLog.w('NetworkBootstrap onSessionCleared', error: error);
    }
  }

  static void dispose() {
    _ready = null;
    _heartbeat?.cancel();
    _heartbeat = null;
    _client?.close();
    _client = null;
  }
}
