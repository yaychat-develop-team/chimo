import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:protobuf/protobuf.dart';

import '../../../common/models/any_parser.dart';
import '../../../common/models/server_client/base.pb.dart';
import '../../../common/utils/app_log.dart';
import '../../../common/utils/app_toast.dart';
import 'auth_request_headers.dart';
import 'http.dart';

/// 统一网络拦截器：
/// 1. 注入公共头 (`timestamp`, `df_*`, `token`)
/// 2. 支持 Map (自动包装 bizParam) 与 GeneratedMessage (PB/JSON) 请求体
/// 3. DELETE / PUT 改写为 POST
/// 4. 统一未登录检测与错误 Toast 提示
class HttpInterceptor extends Interceptor {
  HttpInterceptor({
    this.tokenProvider,
    this.onNotLogin,
  });

  /// forya token 失效业务码
  static const int tokenExpiredCode = 1001110004;

  final String? Function()? tokenProvider;
  final Future<void> Function(RequestOptions options, int? code, String message)? onNotLogin;

  static bool _handlingNotLogin = false;

  static bool isSessionMaintenancePath(Uri uri) {
    final path = uri.path;
    return path.contains('/user/open') || path.contains('/auth/refresh-token');
  }

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    // 1. 设置默认 Content-Type 与 Accept
    options.headers.putIfAbsent(
      Headers.contentTypeHeader,
      () => Headers.jsonContentType,
    );
    options.headers.putIfAbsent(
      Headers.acceptHeader,
      () => Headers.jsonContentType,
    );

    // 2. 注入时间戳
    options.headers['timestamp'] = '${DateTime.now().millisecondsSinceEpoch}';

    // 3. 注入 df_* 公共设备/应用参数
    AuthRequestHeaders.commonParam.forEach((key, value) {
      final text = value.trim();
      if (text.isNotEmpty) {
        options.headers['df_$key'] = text;
      }
    });

    // 4. 注入 token
    final token = tokenProvider?.call();
    if (token != null && token.isNotEmpty) {
      options.headers['token'] = token;
    } else {
      options.headers.remove('token');
    }

    // 5. 对齐 forya：DELETE / PUT 走 POST 通道
    final method = options.method.toUpperCase();
    if (method == 'DELETE' || method == 'PUT') {
      options.method = 'POST';
    }

    // 6. 处理请求体：支持 GeneratedMessage (PB 二进制或 JSON bizParam) 和 Map (自动包装 bizParam)
    final rawReqData = options.data;
    _formatRequestBody(options);

    final logData = _formatDataForLog(rawReqData, isResponse: false);
    AppLog.net(
      'Http -> ${options.method} ${options.uri}',
      body: logData,
    );

    handler.next(options);
  }

  void _formatRequestBody(RequestOptions options) {
    final isProtoContent = options.contentType == Http.protobufContentType ||
        options.headers[Headers.contentTypeHeader] == Http.protobufContentType;

    if (options.data is GeneratedMessage) {
      final msg = options.data as GeneratedMessage;
      if (isProtoContent) {
        options.contentType = Http.protobufContentType;
        options.headers[Headers.contentTypeHeader] = Http.protobufContentType;
        options.data = Stream.fromIterable([msg.writeToBuffer()]);
      } else {
        final jsonMap = msg.toProto3Json(typeRegistry: AnyParser.typeRegistry);
        options.data = jsonEncode({'bizParam': jsonMap});
      }
    } else if (options.data is Map) {
      final map = options.data as Map;
      if (map.containsKey('bizParam')) {
        options.data = jsonEncode(map);
      } else {
        options.data = jsonEncode({'bizParam': Map<String, dynamic>.from(map)});
      }
    } else if (options.data is List<int> && isProtoContent) {
      options.data = Stream.fromIterable([options.data as List<int>]);
    }
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    final logData = _formatDataForLog(response.data, isResponse: true);
    AppLog.net(
      'Http <- [${response.statusCode}] ${response.requestOptions.uri}',
      body: logData,
    );

    // 检测未登录
    _checkNotLogin(response);

    handler.next(response);
  }

  /// 非 release 环境下，将 proto 实例或二进制 protobuf 解析为 JSON 结构打印
  Object? _formatDataForLog(dynamic rawData, {required bool isResponse}) {
    if (kReleaseMode) {
      return rawData is List<int> ? '[binary bytes]' : rawData;
    }

    if (rawData is GeneratedMessage) {
      try {
        return rawData.toProto3Json(typeRegistry: AnyParser.typeRegistry);
      } catch (_) {
        return rawData.toString();
      }
    }

    if (rawData is List<int>) {
      if (isResponse) {
        try {
          final baseRsp = BaseRsp.fromBuffer(rawData);
          try {
            return baseRsp.toProto3Json(typeRegistry: AnyParser.typeRegistry);
          } catch (_) {
            dynamic payload;
            if (baseRsp.hasData() && baseRsp.data.value.isNotEmpty) {
              final unpacked = AnyParser.parse(baseRsp.data);
              if (unpacked != null) {
                payload = unpacked.toProto3Json(typeRegistry: AnyParser.typeRegistry);
              }
            }
            return {
              'success': baseRsp.success,
              'code': baseRsp.code,
              'message': baseRsp.message,
              if (baseRsp.hasSysTime()) 'sysTime': baseRsp.sysTime.toString(),
              'data': payload ?? (baseRsp.hasData() ? {'@type': baseRsp.data.typeUrl} : null),
            };
          }
        } catch (_) {
          return '[binary bytes: ${rawData.length} bytes]';
        }
      }
      return '[binary bytes: ${rawData.length} bytes]';
    }

    return rawData;
  }

  void _checkNotLogin(Response response) {
    final headerCode = response.headers.value('x-df-rsp-code');
    var isNotLogin = headerCode == '$tokenExpiredCode';

    int? code = int.tryParse(headerCode ?? '');
    String message = '';

    if (!isNotLogin && response.data != null) {
      if (response.data is List<int>) {
        try {
          final baseRsp = BaseRsp.fromBuffer(response.data as List<int>);
          if (baseRsp.code == tokenExpiredCode || baseRsp.message == 'user.not.login') {
            isNotLogin = true;
            code = baseRsp.code;
            message = baseRsp.message;
          }
        } catch (_) {}
      } else {
        // Map 或 String JSON
        Map<String, dynamic>? json;
        if (response.data is Map<String, dynamic>) {
          json = response.data as Map<String, dynamic>;
        } else if (response.data is Map) {
          json = (response.data as Map).map((k, v) => MapEntry('$k', v));
        } else if (response.data is String) {
          try {
            final decoded = jsonDecode(response.data as String);
            if (decoded is Map<String, dynamic>) json = decoded;
          } catch (_) {}
        }

        if (json != null) {
          final parsedCode = json['code'] is int
              ? json['code'] as int
              : int.tryParse('${json['code']}');
          final parsedMsg = json['message']?.toString() ?? '';
          if (parsedCode == tokenExpiredCode || parsedMsg == 'user.not.login') {
            isNotLogin = true;
            code = parsedCode;
            message = parsedMsg;
          }
        }
      }
    }

    if (isNotLogin &&
        !isSessionMaintenancePath(response.requestOptions.uri) &&
        !_handlingNotLogin) {
      final hook = onNotLogin;
      if (hook != null) {
        _handlingNotLogin = true;
        hook(response.requestOptions, code, message).whenComplete(() {
          _handlingNotLogin = false;
        });
      }
    }
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    AppLog.w(
      'Http onError: ${err.requestOptions.uri}, ${err.type}, ${err.message}',
      error: err,
    );

    final toastMessage = _resolveErrorMessage(err);
    if (toastMessage.isNotEmpty) {
      AppToast.error(toastMessage);
    }

    handler.next(err);
  }

  String _resolveErrorMessage(DioException err) {
    switch (err.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        return 'Network timeout. Please check your connection and try again.';
      case DioExceptionType.connectionError:
        return 'Network connection error. Please check your network.';
      case DioExceptionType.badCertificate:
        return 'Certificate validation failed.';
      case DioExceptionType.badResponse:
        final status = err.response?.statusCode;
        return 'Server error ($status)';
      case DioExceptionType.cancel:
        return '';
      case DioExceptionType.unknown:
        if (err.error is SocketException) {
          return 'Network unreachable. Please check your connection.';
        }
        return err.message?.trim().isNotEmpty == true
            ? err.message!.trim()
            : 'Network request failed.';
      default:
        return err.message?.trim().isNotEmpty == true
            ? err.message!.trim()
            : 'Network request failed.';
    }
  }
}
