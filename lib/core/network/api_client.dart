import 'dart:convert';
import 'dart:typed_data';

import 'package:dio/dio.dart';

import 'api_config.dart';

/// echimo / forya 通用响应信封（JSON 或 protobuf 解码后的字段）。
class ApiResponse {
  const ApiResponse({
    required this.success,
    required this.code,
    required this.message,
    required this.raw,
    this.data,
    this.sysTime,
    this.httpStatus,
  });

  final bool success;
  final int? code;
  final String message;
  final Map<String, dynamic> raw;
  final Object? data;
  final String? sysTime;
  final int? httpStatus;

  bool get reachable =>
      httpStatus == 200 || message == 'user.not.login' || success;

  factory ApiResponse.fromJson(Map<String, dynamic> json, {int? httpStatus}) {
    return ApiResponse(
      success: json['success'] == true,
      code: json['code'] is int
          ? json['code'] as int
          : int.tryParse('${json['code']}'),
      message: '${json['message'] ?? ''}',
      data: json['data'],
      sysTime: json['sysTime']?.toString(),
      raw: json,
      httpStatus: httpStatus,
    );
  }
}

/// Dio 客户端：拦截器链对齐 forya `JRNetwork` + `HeaderInterceptor`。
///
/// - Content-Type: application/json
/// - Body: `{"bizParam":{...}}` 的 JSON 字符串
/// - Accept: 暂用 JSON（Chimo 尚无 BaseRsp proto）
class ApiClient {
  ApiClient({Dio? dio, List<Interceptor>? interceptors})
    : _dio =
          dio ??
          Dio(
            BaseOptions(
              baseUrl: ApiConfig.baseUrl,
              connectTimeout: const Duration(seconds: 10),
              receiveTimeout: const Duration(seconds: 10),
              sendTimeout: const Duration(seconds: 10),
              contentType: Headers.jsonContentType,
              responseType: ResponseType.plain,
              headers: {Headers.acceptHeader: Headers.jsonContentType},
            ),
          ) {
    if (interceptors != null && interceptors.isNotEmpty) {
      _dio.interceptors.addAll(interceptors);
    }
  }

  /// forya `JRNetwork.headerProto`（接入 BaseRsp 后再切回）
  static const acceptProto = 'application/x-protobuf';

  final Dio _dio;

  Dio get dio => _dio;

  Uri _uri(String path, [Map<String, String>? query]) {
    final normalized = path.startsWith('/') ? path : '/$path';
    final base = Uri.parse('${ApiConfig.baseUrl}$normalized');
    if (query == null || query.isEmpty) return base;
    // Uri.replace(queryParameters:) 会丢掉空值的 "="（变成 "keyword"
    // 而不是 "keyword="），而 echimo 列表接口与 forya 一样期望显式空关键字：
    // keyword=$searchStr。
    final merged = <String, String>{...base.queryParameters, ...query};
    final pairs = <String>[
      for (final e in merged.entries)
        '${Uri.encodeQueryComponent(e.key)}='
            '${Uri.encodeQueryComponent(e.value)}',
    ];
    return base.replace(query: pairs.join('&'));
  }

  Map<String, dynamic> _wrapBizParam(Map<String, dynamic> bizParam) {
    final payload = Map<String, dynamic>.from(bizParam);
    payload.putIfAbsent(
      'timestamp',
      () => DateTime.now().millisecondsSinceEpoch,
    );
    return {'bizParam': payload};
  }

  Future<ApiResponse> post(String path, {Map<String, dynamic>? bizParam}) {
    return _request(
      method: 'POST',
      uri: _uri(path),
      data: jsonEncode(_wrapBizParam(bizParam ?? const {})),
    );
  }

  Future<ApiResponse> get(String path, {Map<String, String>? query}) {
    return _request(method: 'GET', uri: _uri(path, query));
  }

  Future<ApiResponse> _request({
    required String method,
    required Uri uri,
    Object? data,
  }) async {
    // ignore: avoid_print
    print(
      'ApiClient $method $uri'
      '${data == null ? '' : ' body=$data'}',
    );

    try {
      final response = await _send(
        () => _dio.requestUri(
          uri,
          data: data,
          options: Options(method: method),
        ),
      );
      return _decode(response);
    } on DioException catch (error) {
      if (error.response != null) {
        return _decode(error.response!);
      }
      rethrow;
    }
  }

  /// 重试瞬时 TLS / socket 失败（模拟器网络不稳定）。
  Future<Response<dynamic>> _send(
    Future<Response<dynamic>> Function() call, {
    int maxAttempts = 3,
  }) async {
    Object? lastError;
    for (var attempt = 1; attempt <= maxAttempts; attempt++) {
      try {
        return await call();
      } catch (error) {
        lastError = error;
        final text = '$error';
        final retryable =
            text.contains('HandshakeException') ||
            text.contains('Connection terminated') ||
            text.contains('Connection closed') ||
            text.contains('SocketException') ||
            text.contains('ClientException') ||
            text.contains('Connection reset') ||
            (error is DioException &&
                (error.type == DioExceptionType.connectionError ||
                    error.type == DioExceptionType.connectionTimeout));
        // ignore: avoid_print
        print(
          'ApiClient transport error attempt=$attempt/$maxAttempts: $error',
        );
        if (!retryable || attempt == maxAttempts) rethrow;
        await Future<void>.delayed(Duration(milliseconds: 350 * attempt));
      }
    }
    throw lastError ?? StateError('ApiClient send failed');
  }

  ApiResponse _decode(Response<dynamic> response) {
    final contentType = response.headers.value(Headers.contentTypeHeader) ?? '';
    final rawBody = _bodyAsString(response.data);
    final preview = rawBody.length > 400
        ? '${rawBody.substring(0, 400)}…'
        : rawBody;
    // ignore: avoid_print
    print(
      'ApiClient ← ${response.statusCode} content-type=$contentType $preview',
    );

    final looksJson =
        rawBody.trimLeft().startsWith('{') ||
        rawBody.trimLeft().startsWith('[');
    if (contentType.contains(acceptProto) && !looksJson) {
      // ignore: avoid_print
      print('ApiClient protobuf body not decoded (no BaseRsp proto in Chimo)');
      final length = response.data is List<int>
          ? (response.data as List<int>).length
          : rawBody.length;
      return ApiResponse(
        success: false,
        code: response.statusCode,
        message: 'protobuf.response.unsupported',
        raw: {'bodyLength': length},
        httpStatus: response.statusCode,
      );
    }

    try {
      final decoded = rawBody.isEmpty ? null : jsonDecode(rawBody);
      if (decoded is Map<String, dynamic>) {
        return ApiResponse.fromJson(decoded, httpStatus: response.statusCode);
      }
      if (decoded is Map) {
        return ApiResponse.fromJson(
          decoded.map((key, value) => MapEntry('$key', value)),
          httpStatus: response.statusCode,
        );
      }
    } catch (error) {
      // ignore: avoid_print
      print('ApiClient decode failed: $error');
    }
    return ApiResponse(
      success: false,
      code: response.statusCode,
      message: 'invalid.response',
      raw: {'body': rawBody},
      httpStatus: response.statusCode,
    );
  }

  static String _bodyAsString(Object? data) {
    if (data == null) return '';
    if (data is String) return data;
    if (data is Uint8List) return utf8.decode(data);
    if (data is List<int>) return utf8.decode(data);
    if (data is Map || data is List) return jsonEncode(data);
    return '$data';
  }

  Future<ApiResponse> pingUserOpen({bool open = false}) {
    return post('/user/open', bizParam: {'open': open});
  }

  void close() => _dio.close(force: true);
}
