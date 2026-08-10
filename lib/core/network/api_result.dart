/// 业务 API 调用的类型化结果（信封解析 + DTO 映射之后）。
class ApiResult<T> {
  const ApiResult._({
    required this.ok,
    required this.message,
    this.data,
    this.code,
  });

  factory ApiResult.ok([T? data, String message = '', int? code]) {
    return ApiResult._(ok: true, data: data, message: message, code: code);
  }

  factory ApiResult.fail(String message, {int? code, T? data}) {
    return ApiResult._(ok: false, data: data, message: message, code: code);
  }

  final bool ok;
  final T? data;
  final String message;
  final int? code;

  bool get isNotLogin => message == 'user.not.login';
}
