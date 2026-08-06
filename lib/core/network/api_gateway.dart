import 'api_client.dart';
import 'api_result.dart';
import 'network_bootstrap.dart';

/// Unified request path: session retry → map → optional not-login clear.
abstract final class ApiGateway {
  static Future<ApiResult<T>> request<T>(
    Future<ApiResponse> Function() call, {
    required T Function(ApiResponse res) map,
    bool clearSessionOnNotLogin = true,
  }) async {
    final res = await NetworkBootstrap.withSessionRetry(call);
    if (!res.success) {
      if (clearSessionOnNotLogin && res.message == 'user.not.login') {
        await NetworkBootstrap.handleNotLogin();
      }
      return ApiResult.fail(res.message, code: res.code);
    }
    try {
      return ApiResult.ok(map(res), res.message, res.code);
    } catch (error) {
      return ApiResult.fail('$error', code: res.code);
    }
  }

  /// Success with no mapped payload (mutations / fire-and-forget confirms).
  static Future<ApiResult<void>> action(
    Future<ApiResponse> Function() call, {
    bool clearSessionOnNotLogin = true,
  }) async {
    final res = await NetworkBootstrap.withSessionRetry(call);
    if (!res.success) {
      if (clearSessionOnNotLogin && res.message == 'user.not.login') {
        await NetworkBootstrap.handleNotLogin();
      }
      return ApiResult.fail(res.message, code: res.code);
    }
    return ApiResult.ok(null, res.message, res.code);
  }
}
