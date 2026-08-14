import 'dart:async';

import 'package:flutter/foundation.dart';

import '../auth/auth_session.dart';
import '../im/im_service.dart';
import 'api_client.dart';
import 'auth_request_headers.dart';
import 'api_config.dart';
import 'api_config_store.dart';
import 'auth_response_interceptor.dart';
import 'chimo_api.dart';
import 'header_interceptor.dart';
import 'proxy_config_store.dart';

/// 应用级网络启动：加载环境与可选心跳。
abstract final class NetworkBootstrap {
  static ApiClient? _client;
  static ChimoApi? _api;
  static Timer? _heartbeat;
  static String? authToken;

  /// 登出 / token 失效时清空内存态（如会话列表），由 [AppProviders] 注册。
  static void Function()? onSessionCleared;

  static ApiClient get client => _client ??= _createClient();

  static ChimoApi get api => _api ??= ChimoApi(client);

  static ApiClient _createClient() {
    final client = ApiClient(
      interceptors: [
        HeaderInterceptor(tokenProvider: () => authToken),
        // 仅观测业务未登录；真正清会话仍由 ApiGateway（retry 之后）负责。
        AuthResponseInterceptor(
          onNotLogin: (options, response) async {
            debugPrint(
              'AuthResponseInterceptor not-login '
              '${options.uri.path} code=${response.code}',
            );
          },
        ),
      ],
    );
    ProxyConfigStore.configureDio(client.dio);
    return client;
  }

  /// 代理变更后重建 HTTP 客户端（对齐 forya `JRNetwork.updateProxy`）。
  static Future<void> rebuildHttpClient() async {
    await ProxyConfigStore.load();
    final old = _client;
    _client = _createClient();
    _api = ChimoApi(client);
    try {
      old?.close();
    } catch (_) {}
  }

  static Future<ApiResponse> initialize({bool startHeartbeat = true}) async {
    await ApiConfigStore.load();
    await ProxyConfigStore.load();
    await AuthRequestHeaders.initialize();
    // 确保首次请求使用已加载的代理配置。
    await rebuildHttpClient();
    authToken = await AuthSession.token();
    debugPrint(
      'NetworkBootstrap baseUrl=${ApiConfig.baseUrl} hasToken=${authToken != null}'
      ' proxy=${ProxyConfigStore.isConfigured ? '${ProxyConfigStore.ip}:${ProxyConfigStore.port}' : 'off'}',
    );

    // 对齐 forya LoginManager 自动登录：冷启动时刷新 token。
    if (authToken != null && authToken!.isNotEmpty) {
      await _tryRefreshToken(clearOnFailure: false);
    }

    final result = await api.userOpen(open: false);
    if (!result.success && result.message == 'user.not.login') {
      // 仅在 open 确认本地 token 已失效后才清空。
      await clearSession();
    } else if (result.success ||
        (authToken != null && authToken!.isNotEmpty)) {
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
      authToken = await AuthSession.token();
    }
    if (authToken == null || authToken!.isEmpty) return false;
    if (!tryRefresh) return true;
    return _tryRefreshToken(clearOnFailure: false);
  }

  /// 尝试后若仍存在可用 token 则返回 true。
  static Future<bool> _tryRefreshToken({required bool clearOnFailure}) async {
    try {
      final refresh = await api.refreshToken();
      if (refresh.success) {
        final next = _tokenFromData(refresh.data);
        if (next != null) {
          await applySessionToken(next);
          await AuthSession.markLoggedIn(token: next);
          debugPrint('NetworkBootstrap token refreshed');
          return true;
        }
        // 刷新成功但无新 token —— 保留当前 token。
        return authToken != null && authToken!.isNotEmpty;
      }

      // `unauthorized registration` 等并不总表示 JWT 已死；
      // 仅在明确 not-login 时清空。
      if (refresh.message == 'user.not.login') {
        debugPrint('NetworkBootstrap refresh: user.not.login');
        if (clearOnFailure) await clearSession();
        return false;
      }
      debugPrint(
        'NetworkBootstrap refresh failed (keep token): '
        '${refresh.message} code=${refresh.code}',
      );
      return authToken != null && authToken!.isNotEmpty;
    } catch (error, stack) {
      debugPrint('NetworkBootstrap refresh error: $error\n$stack');
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
    var res = await api.userOpen(open: false);
    if (res.success) return;
    if (res.message != 'user.not.login') return;

    // 软恢复：磁盘 token / 刷新，再探测一次。
    final ok = await ensureSession(tryRefresh: true);
    if (!ok) {
      await clearSession();
      return;
    }
    res = await api.userOpen(open: false);
    if (!res.success && res.message == 'user.not.login') {
      await clearSession();
    }
  }

  /// 首次调用返回 `user.not.login` 时，做一次会话恢复后重跑 [request]。
  static Future<ApiResponse> withSessionRetry(
    Future<ApiResponse> Function() request,
  ) async {
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
    await AuthSession.clear();
    try {
      await ImService.logout().timeout(const Duration(seconds: 3));
    } catch (_) {}
    try {
      onSessionCleared?.call();
    } catch (error) {
      debugPrint('NetworkBootstrap onSessionCleared: $error');
    }
  }

  static void dispose() {
    _heartbeat?.cancel();
    _heartbeat = null;
    _client?.close();
    _client = null;
    _api = null;
  }
}
