import 'dart:async';
import 'dart:convert';

import 'package:chimo/app/session_info.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:protobuf/protobuf.dart';
import 'package:talker_dio_logger/talker_dio_logger.dart';

import '../../../common/models/any_parser.dart';
import '../../../common/models/server_client/base.pb.dart';
import '../../../common/utils/app_log.dart';
import '../../../common/utils/log.dart';
import '../../app_config.dart';
import '../config/proxy_store.dart';
import 'api_result.dart';
import 'app_http_client.dart';
import 'http_interceptor.dart';
import 'response_ext.dart';

/// 统一网络请求入口（单例），提供 Dio 封装并支持 Protobuf 与 JSON 自动解析。
class Http {
  static final Http _instance = Http._();

  static Http get ins => _instance;

  static const protobufContentType = 'application/x-protobuf';

  late Dio _dio;

  Dio get dio => _dio;

  Http._() {
    _dio = Dio(
      BaseOptions(
        baseUrl: AppConfig.baseUrl,
        connectTimeout: const Duration(seconds: 15),
        receiveTimeout: const Duration(seconds: 20),
        sendTimeout: const Duration(seconds: 20),
        contentType: Headers.jsonContentType,
        responseType: ResponseType.plain,
        headers: {Headers.acceptHeader: Headers.jsonContentType},
      ),
    );

    _dio.interceptors.add(
      HttpInterceptor(
        tokenProvider: () => SessionInfo.token,
        onNotLogin: (options, code, message) async {
          AppLog.w('Http detected not-login on: ${options.uri.path}');
        },
      ),
    );

    final talker = loggerOrNull;
    if (talker != null) {
      _dio.interceptors.add(
        TalkerDioLogger(
          talker: talker,
          settings: TalkerDioLoggerSettings(
            enabled: AppConfig.isDebug,
            responseDataConverter: _convertResponseDataForLog,
          ),
        ),
      );
    }
    updateBaseUrl();
    updateProxy();
  }


  /// 非 release 环境下，将二进制 protobuf 响应转换为可读的 JSON 结构打印
  static String _convertResponseDataForLog(Response response) {
    if (kReleaseMode) {
      return response.data is List<int>
          ? '[binary bytes: ${(response.data as List<int>).length} bytes]'
          : '${response.data}';
    }

    final data = response.data;
    if (data == null) return 'null';

    if (data is GeneratedMessage) {
      try {
        final json = data.toProto3Json(typeRegistry: AnyParser.typeRegistry);
        return const JsonEncoder.withIndent('  ').convert(json);
      } catch (_) {
        return data.toString();
      }
    }

    if (data is List<int>) {
      try {
        final baseRsp = BaseRsp.fromBuffer(data);
        dynamic payload;
        if (baseRsp.hasData() && baseRsp.data.value.isNotEmpty) {
          final unpacked = AnyParser.parse(baseRsp.data);
          if (unpacked != null) {
            try {
              payload = unpacked.toProto3Json(typeRegistry: AnyParser.typeRegistry);
            } catch (_) {
              payload = unpacked.toString();
            }
          }
        }

        Map<String, dynamic> resultMap;
        try {
          final proto3Json = baseRsp.toProto3Json(typeRegistry: AnyParser.typeRegistry);
          if (proto3Json is Map<String, dynamic>) {
            resultMap = proto3Json;
            if (payload != null && resultMap['data'] is Map) {
              final m = resultMap['data'] as Map;
              if (m.length == 1 && m.containsKey('@type') && payload is Map) {
                resultMap['data'] = {
                  ...payload,
                  '@type': baseRsp.data.typeUrl,
                };
              }
            }
          } else {
            resultMap = {'result': proto3Json};
          }
        } catch (_) {
          resultMap = {
            'success': baseRsp.success,
            'code': baseRsp.code,
            'message': baseRsp.message,
            if (baseRsp.hasSysTime()) 'sysTime': baseRsp.sysTime.toString(),
            'data': payload ?? (baseRsp.hasData() ? {'@type': baseRsp.data.typeUrl} : null),
          };
        }

        return const JsonEncoder.withIndent('  ').convert(resultMap);
      } catch (_) {
        try {
          final text = utf8.decode(data);
          final decoded = jsonDecode(text);
          return const JsonEncoder.withIndent('  ').convert(decoded);
        } catch (_) {
          return '[binary bytes: ${data.length} bytes]';
        }
      }
    }

    if (data is Map || data is List) {
      try {
        return const JsonEncoder.withIndent('  ').convert(data);
      } catch (_) {
        return '$data';
      }
    }

    if (data is String) {
      final trimmed = data.trim();
      if ((trimmed.startsWith('{') && trimmed.endsWith('}')) ||
          (trimmed.startsWith('[') && trimmed.endsWith(']'))) {
        try {
          final decoded = jsonDecode(trimmed);
          return const JsonEncoder.withIndent('  ').convert(decoded);
        } catch (_) {
          return data;
        }
      }
      return data;
    }

    return '$data';
  }

  /// 更新 API Base URL（切换环境时调用）
  void updateBaseUrl() {
    _dio.options.baseUrl = AppConfig.baseUrl;
  }

  /// 更新代理设置（Charles / 抓包调试）
  void updateProxy() {
    ProxyStore.configureDio(_dio);
  }

  /// 构造保留空参数 key= 的 Uri（避免 keyword= 搜索空串被吞掉）
  Uri _uri(String path, [Map<String, dynamic>? query]) {
    final normalized = path.startsWith('/') ? path : '/$path';
    final base = Uri.parse('${AppConfig.baseUrl}$normalized');
    if (query == null || query.isEmpty) return base;
    final merged = <String, String>{
      ...base.queryParameters,
      for (final e in query.entries) e.key: '${e.value ?? ''}',
    };
    final pairs = <String>[
      for (final e in merged.entries)
        '${Uri.encodeQueryComponent(e.key)}=${Uri.encodeQueryComponent(e.value)}',
    ];
    return base.replace(query: pairs.join('&'));
  }

  /// 底层执行 HTTP 请求并带有瞬时重试
  Future<Response> _request({
    required String method,
    required Uri uri,
    Object? data,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
    int maxAttempts = 3,
  }) async {
    final reqOptions = options ?? Options();
    reqOptions.method = method;

    return _sendWithRetry(
      () => _dio.requestUri(
        uri,
        data: data,
        options: reqOptions,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      ),
      maxAttempts: maxAttempts,
    );
  }

  /// 瞬时网络错误自动重试
  Future<Response<T>> _sendWithRetry<T>(
    Future<Response<T>> Function() call, {
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
        final text = '$error';
        final retryable = isTimeout ||
            text.contains('HandshakeException') ||
            text.contains('Connection terminated') ||
            text.contains('Connection closed') ||
            text.contains('SocketException') ||
            text.contains('ClientException') ||
            text.contains('Connection reset') ||
            (error is DioException &&
                error.type == DioExceptionType.connectionError);

        if (retryable) {
          AppHttpClient.quarantineLast();
        }
        AppLog.w('Http transport error attempt=$attempt/$maxAttempts', error: error);
        if (!retryable || attempt == maxAttempts) rethrow;
        await Future<void>.delayed(Duration(milliseconds: 200 * attempt));
      }
    }
    throw lastError ?? StateError('Http request failed after retries');
  }

  /// 通用 GET 请求
  Future<Response> get(
    String path, {
    Map<String, dynamic>? query,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
  }) {
    return _request(
      method: 'GET',
      uri: _uri(path, query),
      options: options,
      cancelToken: cancelToken,
      onReceiveProgress: onReceiveProgress,
    );
  }

  /// 通用 POST 请求
  Future<Response> post(
    String path, {
    Object? data,
    Map<String, dynamic>? query,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) {
    return _request(
      method: 'POST',
      uri: _uri(path, query),
      data: data,
      options: options,
      cancelToken: cancelToken,
      onSendProgress: onSendProgress,
      onReceiveProgress: onReceiveProgress,
    );
  }

  /// 通用文件下载
  Future<Response> download(
    String urlPath,
    dynamic savePath, {
    ProgressCallback? onReceiveProgress,
    CancelToken? cancelToken,
    Options? options,
  }) {
    return _dio.download(
      urlPath,
      savePath,
      onReceiveProgress: onReceiveProgress,
      cancelToken: cancelToken,
      options: options,
    );
  }

  /// GET 请求并解析为结果对象 [ApiResult<T>]（支持 Proto 对象或 void 纯操作）
  Future<ApiResult<T>> getAndParse<T>(
    String path, {
    Map<String, dynamic>? query,
    bool asProto = true,
    bool clearSessionOnNotLogin = true,
    CancelToken? cancelToken,
    Options? options,
  }) async {
    try {
      final opt = (options ?? Options()).copyWith(
        headers: {
          if (asProto) Headers.acceptHeader: protobufContentType,
          ...?options?.headers,
        },
        responseType: asProto ? ResponseType.bytes : ResponseType.plain,
      );
      final response = await _request(
        method: 'GET',
        uri: _uri(path, query),
        options: opt,
        cancelToken: cancelToken,
      );
      final result = response.asApiResult<T>();
      if (!result.ok && result.isNotLogin && clearSessionOnNotLogin) {
        await SessionInfo.logoutToLoginPage(false);
      }
      return result;
    } catch (e) {
      return ApiResult.fail('$e');
    }
  }

  /// POST 请求并解析为结果对象 [ApiResult<T>]（支持 Proto 对象或 void 纯操作）
  Future<ApiResult<T>> postAndParse<T>(
    String path, {
    Object? data,
    Map<String, dynamic>? query,
    bool asProto = true,
    bool clearSessionOnNotLogin = true,
    CancelToken? cancelToken,
    Options? options,
  }) async {
    try {
      final opt = (options ?? Options()).copyWith(
        headers: {
          if (asProto) Headers.acceptHeader: protobufContentType,
          if (asProto && data is GeneratedMessage)
            Headers.contentTypeHeader: protobufContentType,
          ...?options?.headers,
        },
        responseType: asProto ? ResponseType.bytes : ResponseType.plain,
      );
      final response = await _request(
        method: 'POST',
        uri: _uri(path, query),
        data: data,
        options: opt,
        cancelToken: cancelToken,
      );
      final result = response.asApiResult<T>();
      if (!result.ok && result.isNotLogin && clearSessionOnNotLogin) {
        await SessionInfo.logoutToLoginPage(false);
      }
      return result;
    } catch (e) {
      return ApiResult.fail('$e');
    }
  }

  void close() => _dio.close(force: true);
}
