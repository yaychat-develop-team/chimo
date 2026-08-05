import 'dart:convert';

import 'package:http/http.dart' as http;

import 'api_config.dart';

/// Minimal JSON API envelope from echimo backends.
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

/// Lightweight HTTP client matching D:\forya HeaderInterceptor shapes.
class ApiClient {
  ApiClient({http.Client? httpClient, this.tokenProvider})
      : _http = httpClient ?? http.Client();

  final http.Client _http;
  final String? Function()? tokenProvider;

  Uri _uri(String path, [Map<String, String>? query]) {
    final normalized = path.startsWith('/') ? path : '/$path';
    final base = Uri.parse('${ApiConfig.baseUrl}$normalized');
    if (query == null || query.isEmpty) return base;
    // Uri.replace(queryParameters:) drops "=" for empty values ("keyword"
    // instead of "keyword="), which breaks echimo list APIs that expect an
    // explicit empty keyword the same way forya builds: keyword=$searchStr.
    final merged = <String, String>{
      ...base.queryParameters,
      ...query,
    };
    final pairs = <String>[
      for (final e in merged.entries)
        '${Uri.encodeQueryComponent(e.key)}='
            '${Uri.encodeQueryComponent(e.value)}',
    ];
    return base.replace(query: pairs.join('&'));
  }

  Map<String, String> _headers() {
    final headers = <String, String>{
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'timestamp': '${DateTime.now().millisecondsSinceEpoch}',
    };
    final token = tokenProvider?.call();
    if (token != null && token.isNotEmpty) {
      headers['token'] = token;
    }
    return headers;
  }

  Map<String, dynamic> _wrapBizParam(Map<String, dynamic> bizParam) {
    final payload = Map<String, dynamic>.from(bizParam);
    payload.putIfAbsent(
      'timestamp',
      () => DateTime.now().millisecondsSinceEpoch,
    );
    return {'bizParam': payload};
  }

  Future<ApiResponse> post(
    String path, {
    Map<String, dynamic>? bizParam,
  }) async {
    final uri = _uri(path);
    final body = jsonEncode(_wrapBizParam(bizParam ?? const {}));
    // ignore: avoid_print
    print('ApiClient POST $uri body=$body');
    final response = await _send(
      () => _http.post(uri, headers: _headers(), body: body),
    );
    return _decode(response);
  }

  Future<ApiResponse> get(
    String path, {
    Map<String, String>? query,
  }) async {
    final uri = _uri(path, query);
    // ignore: avoid_print
    print('ApiClient GET $uri');
    final response = await _send(
      () => _http.get(uri, headers: _headers()),
    );
    return _decode(response);
  }

  /// Retry transient TLS / socket failures (emulator network is flaky).
  Future<http.Response> _send(
    Future<http.Response> Function() call, {
    int maxAttempts = 3,
  }) async {
    Object? lastError;
    for (var attempt = 1; attempt <= maxAttempts; attempt++) {
      try {
        return await call();
      } catch (error) {
        lastError = error;
        final text = '$error';
        final retryable = text.contains('HandshakeException') ||
            text.contains('Connection terminated') ||
            text.contains('Connection closed') ||
            text.contains('SocketException') ||
            text.contains('ClientException') ||
            text.contains('Connection reset');
        // ignore: avoid_print
        print(
          'ApiClient transport error attempt=$attempt/$maxAttempts: $error',
        );
        if (!retryable || attempt == maxAttempts) rethrow;
        await Future<void>.delayed(Duration(milliseconds: 350 * attempt));
      }
    }
    // Unreachable; keeps analyzer happy.
    throw lastError ?? StateError('ApiClient send failed');
  }

  ApiResponse _decode(http.Response response) {
    final rawBody = response.body;
    final preview =
        rawBody.length > 400 ? '${rawBody.substring(0, 400)}…' : rawBody;
    // ignore: avoid_print
    print('ApiClient ← ${response.statusCode} $preview');
    try {
      final decoded = jsonDecode(rawBody);
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

  Future<ApiResponse> pingUserOpen({bool open = false}) {
    return post('/user/open', bizParam: {'open': open});
  }

  void close() => _http.close();
}
