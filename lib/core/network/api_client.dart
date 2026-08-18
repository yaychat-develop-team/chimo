import 'dart:convert';
import 'dart:typed_data';

import 'package:dio/dio.dart';

import 'api_config.dart';
import 'app_http_client.dart';
import 'proto/relation_list_proto.dart';

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
              connectTimeout: const Duration(seconds: 15),
              receiveTimeout: const Duration(seconds: 20),
              sendTimeout: const Duration(seconds: 20),
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
    // 对齐 forya：timestamp 只放 HTTP 头，不要塞进 bizParam。
    // UserInfoUpdateReq 没有 timestamp 字段，protobuf JSON 解析到未知字段会整单丢弃，
    // 表现为 newPic/delPic 接口成功但资料墙不变更。
    return {'bizParam': Map<String, dynamic>.from(bizParam)};
  }

  Future<ApiResponse> post(
    String path, {
    Map<String, dynamic>? bizParam,
    String? accept,
  }) {
    return _request(
      method: 'POST',
      uri: _uri(path),
      data: jsonEncode(_wrapBizParam(bizParam ?? const {})),
      accept: accept,
    );
  }

  Future<ApiResponse> get(
    String path, {
    Map<String, String>? query,
    String? accept,
  }) {
    return _request(method: 'GET', uri: _uri(path, query), accept: accept);
  }

  Future<ApiResponse> _request({
    required String method,
    required Uri uri,
    Object? data,
    String? accept,
  }) async {
    // ignore: avoid_print
    print(
      'ApiClient $method $uri'
      '${data == null ? '' : ' body=$data'}'
      '${accept == null ? '' : ' accept=$accept'}',
    );

    try {
      final response = await _send(
        () => _dio.requestUri(
          uri,
          data: data,
          options: Options(
            method: method,
            headers: {
              if (accept != null) Headers.acceptHeader: accept,
            },
            responseType: accept == acceptProto
                ? ResponseType.bytes
                : ResponseType.plain,
          ),
        ),
      );
      return _decode(response);
    } on DioException catch (error) {
      if (error.response != null) {
        return _decode(error.response!);
      }
      // ignore: avoid_print
      print('ApiClient transport failed: $error');
      return ApiResponse(
        success: false,
        code: null,
        message: _transportMessage(error),
        raw: {'error': '$error'},
        httpStatus: error.response?.statusCode,
      );
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
        final isTimeout = error is DioException &&
            (error.type == DioExceptionType.connectionTimeout ||
                error.type == DioExceptionType.receiveTimeout ||
                error.type == DioExceptionType.sendTimeout);
        if (isTimeout) {
          AppHttpClient.quarantineLast();
        }
        final text = '$error';
        final retryable =
            isTimeout ||
            text.contains('HandshakeException') ||
            text.contains('Connection terminated') ||
            text.contains('Connection closed') ||
            text.contains('SocketException') ||
            text.contains('ClientException') ||
            text.contains('Connection reset') ||
            (error is DioException &&
                error.type == DioExceptionType.connectionError);
        // ignore: avoid_print
        print(
          'ApiClient transport error attempt=$attempt/$maxAttempts: $error',
        );
        if (!retryable || attempt == maxAttempts) rethrow;
        await Future<void>.delayed(Duration(milliseconds: 200 * attempt));
      }
    }
    throw lastError ?? StateError('ApiClient send failed');
  }

  ApiResponse _decode(Response<dynamic> response) {
    final contentType = response.headers.value(Headers.contentTypeHeader) ?? '';
    final status = response.statusCode;
    final data = response.data;
    if (_isProtoBody(contentType, data)) {
      try {
        final parsed = RelationListProto.decode(_asBytes(data));
        // ignore: avoid_print
        print(
          'ApiClient ← $status protobuf success=${parsed.success} '
          'code=${parsed.code} message=${parsed.message}',
        );
        return parsed;
      } catch (error) {
        // ignore: avoid_print
        print('ApiClient protobuf decode failed: $error');
        return ApiResponse(
          success: false,
          code: status,
          message: '$error',
          raw: {'httpStatus': status},
          httpStatus: status,
        );
      }
    }

    String rawBody;
    try {
      rawBody = _bodyAsString(data);
    } on FormatException {
      return ApiResponse(
        success: false,
        code: status,
        message: 'invalid.response',
        raw: {'httpStatus': status},
        httpStatus: status,
      );
    }
    final preview = rawBody.length > 400
        ? '${rawBody.substring(0, 400)}…'
        : rawBody;
    // ignore: avoid_print
    print(
      'ApiClient ← ${response.statusCode} content-type=$contentType $preview',
    );

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

  static bool _isProtoBody(String contentType, Object? data) {
    if (contentType.contains(acceptProto)) return true;
    return false;
  }

  static List<int> _asBytes(Object? data) {
    if (data is Uint8List) return data;
    if (data is List<int>) return data;
    if (data is String) return utf8.encode(data);
    return const [];
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

  static String _transportMessage(DioException error) {
    return switch (error.type) {
      DioExceptionType.connectionTimeout ||
      DioExceptionType.receiveTimeout ||
      DioExceptionType.sendTimeout =>
        'Network timeout. Please check your connection and try again.',
      DioExceptionType.connectionError =>
        'Network error. Please check your connection.',
      _ => error.message?.trim().isNotEmpty == true
          ? error.message!.trim()
          : 'Network request failed.',
    };
  }

  void close() => _dio.close(force: true);
}
