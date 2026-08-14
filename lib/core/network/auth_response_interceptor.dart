import 'dart:convert';

import 'package:dio/dio.dart';

import 'api_client.dart';

/// 对齐 forya HeaderInterceptor 对 `user.not.login` / token 失效码的统一处理。
///
/// forya 用响应头 `x-df-rsp-code == 1001110004`；Chimo JSON 信封用
/// `message == user.not.login` 或 `code == 1001110004`。
///
/// 注意：不清空会话。会话恢复由 [NetworkBootstrap.withSessionRetry] /
/// [ApiGateway] 负责；拦截器内清会话会打断 refresh 重试。
class AuthResponseInterceptor extends Interceptor {
  AuthResponseInterceptor({this.onNotLogin});

  /// forya token 失效业务码。
  static const tokenExpiredCode = 1001110004;

  final Future<void> Function(RequestOptions options, ApiResponse response)?
      onNotLogin;

  static bool _handling = false;

  static bool isSessionMaintenancePath(Uri uri) {
    final path = uri.path;
    return path.contains('/user/open') ||
        path.contains('/auth/refresh-token');
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    final api = _envelopeFrom(response);
    final headerCode = response.headers.value('x-df-rsp-code');
    final notLogin = headerCode == '$tokenExpiredCode' ||
        (api != null &&
            (api.message == 'user.not.login' ||
                api.code == tokenExpiredCode));

    if (notLogin &&
        !isSessionMaintenancePath(response.requestOptions.uri) &&
        !_handling) {
      final hook = onNotLogin;
      if (hook != null && api != null) {
        _handling = true;
        hook(response.requestOptions, api).whenComplete(() {
          _handling = false;
        });
      }
    }

    handler.next(response);
  }

  static ApiResponse? _envelopeFrom(Response response) {
    final data = response.data;
    Map<String, dynamic>? json;
    if (data is Map<String, dynamic>) {
      json = data;
    } else if (data is Map) {
      json = data.map((key, value) => MapEntry('$key', value));
    } else if (data is String) {
      final text = data.trimLeft();
      if (!text.startsWith('{')) return null;
      try {
        final decoded = jsonDecode(data);
        if (decoded is Map<String, dynamic>) {
          json = decoded;
        } else if (decoded is Map) {
          json = decoded.map((key, value) => MapEntry('$key', value));
        }
      } catch (_) {
        return null;
      }
    }
    if (json == null) return null;
    return ApiResponse.fromJson(json, httpStatus: response.statusCode);
  }
}
