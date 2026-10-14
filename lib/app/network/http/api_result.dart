/// 业务 API 调用的类型化结果（信封解析 + DTO 映射之后）。
class ApiResult<T> {
  const ApiResult._({
    required this.ok,
    required this.message,
    this.data,
    this.code,
    this.sysTime,
  });

  factory ApiResult.ok([T? data, String message = '', int? code, String? sysTime]) {
    return ApiResult._(
      ok: true,
      data: data,
      message: message,
      code: code,
      sysTime: sysTime,
    );
  }

  factory ApiResult.fail(String message, {int? code, T? data, String? sysTime}) {
    return ApiResult._(
      ok: false,
      data: data,
      message: message,
      code: code,
      sysTime: sysTime,
    );
  }

  final bool ok;
  final T? data;
  final String message;
  final int? code;
  final String? sysTime;

  bool get success => ok;

  bool get isNotLogin => message == 'user.not.login' || code == 1001110004;

  /// 数据转换映射
  ApiResult<R> map<R>(R Function(T data) mapper) {
    if (!ok) {
      return ApiResult.fail(message, code: code, sysTime: sysTime);
    }
    if (data == null) {
      return ApiResult.fail('Data is null', code: code, sysTime: sysTime);
    }
    try {
      return ApiResult.ok(mapper(data as T), message, code, sysTime);
    } catch (e) {
      return ApiResult.fail('$e', code: code, sysTime: sysTime);
    }
  }

  /// 允许可空数据的转换映射
  ApiResult<R?> mapOrNull<R>(R? Function(T? data) mapper) {
    if (!ok) {
      return ApiResult.fail(message, code: code, sysTime: sysTime);
    }
    try {
      return ApiResult.ok(mapper(data), message, code, sysTime);
    } catch (e) {
      return ApiResult.fail('$e', code: code, sysTime: sysTime);
    }
  }

  @override
  String toString() => 'ApiResult(ok: $ok, code: $code, message: $message, data: $data)';
}
