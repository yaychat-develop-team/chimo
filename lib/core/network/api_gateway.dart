import 'api_client.dart';
import 'api_result.dart';
import 'network_bootstrap.dart';

/// 统一请求路径：会话重试 → 映射 → 可选的未登录清理。
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

  /// 成功且无映射载荷（变更操作 / 发后即忘的确认）。
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
