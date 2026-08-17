import 'dart:convert';
import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:chimo/core/network/api_client.dart';
import 'package:chimo/core/network/api_config.dart';
import 'package:chimo/core/network/header_interceptor.dart';

class _MockAdapter implements HttpClientAdapter {
  _MockAdapter(this.onFetch);

  final Future<ResponseBody> Function(RequestOptions options) onFetch;

  @override
  void close({bool force = false}) {}

  @override
  Future<ResponseBody> fetch(
    RequestOptions options,
    Stream<Uint8List>? requestStream,
    Future<void>? cancelFuture,
  ) {
    return onFetch(options);
  }
}

ResponseBody _jsonBody(Map<String, dynamic> json, {int status = 200}) {
  return ResponseBody.fromString(
    jsonEncode(json),
    status,
    headers: {
      Headers.contentTypeHeader: [Headers.jsonContentType],
    },
  );
}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    ApiConfig.isDebug = true;
    ApiConfig.useEnvironment(ApiEnvironment.test);
  });

  group('ApiClient', () {
    test('wraps bizParam and parses envelope', () async {
      late RequestOptions captured;
      final dio = Dio(
        BaseOptions(
          baseUrl: ApiConfig.baseUrl,
          responseType: ResponseType.plain,
        ),
      );
      dio.httpClientAdapter = _MockAdapter((options) async {
        captured = options;
        return _jsonBody({
          'success': true,
          'code': 0,
          'message': 'success',
          'data': {'agent': {}},
        });
      });

      final client = ApiClient(dio: dio);
      final response = await client.pingUserOpen(open: false);
      expect(response.success, isTrue);
      expect(response.message, 'success');
      expect(
        captured.uri.toString(),
        'https://test-api.echimo.com/api/v1/user/open',
      );
      expect(captured.method, 'POST');
      expect('${captured.data}', contains('"bizParam"'));
      expect('${captured.data}', contains('"open":false'));
      client.close();
    });

    test('HeaderInterceptor injects token and common headers', () async {
      late RequestOptions captured;
      final dio = Dio(
        BaseOptions(
          baseUrl: ApiConfig.baseUrl,
          responseType: ResponseType.plain,
        ),
      );
      dio.httpClientAdapter = _MockAdapter((options) async {
        captured = options;
        return _jsonBody({
          'success': true,
          'code': 0,
          'message': 'success',
          'data': {},
        });
      });

      final client = ApiClient(
        dio: dio,
        interceptors: [
          HeaderInterceptor(tokenProvider: () => 'tok-123'),
        ],
      );
      final response =
          await client.post('/user/open', bizParam: {'open': false});
      expect(response.success, isTrue);
      expect(captured.headers['token'], 'tok-123');
      expect(captured.headers['timestamp'], isNotNull);
      expect(captured.headers['timestamp'], isNotEmpty);
      expect(
        captured.headers[Headers.contentTypeHeader] ??
            captured.headers['content-type'],
        Headers.jsonContentType,
      );
      client.close();
    });

    test('maps transport timeout to failed ApiResponse', () async {
      final dio = Dio(
        BaseOptions(
          baseUrl: ApiConfig.baseUrl,
          responseType: ResponseType.plain,
        ),
      );
      dio.httpClientAdapter = _ThrowingAdapter(
        DioException(
          requestOptions: RequestOptions(path: '/user/info'),
          type: DioExceptionType.receiveTimeout,
          message: 'receive timeout',
        ),
      );

      final client = ApiClient(dio: dio);
      final response = await client.get('/user/info');
      expect(response.success, isFalse);
      expect(response.message, contains('Network timeout'));
      client.close();
    });
  });
}

class _ThrowingAdapter implements HttpClientAdapter {
  _ThrowingAdapter(this.error);

  final DioException error;

  @override
  void close({bool force = false}) {}

  @override
  Future<ResponseBody> fetch(
    RequestOptions options,
    Stream<Uint8List>? requestStream,
    Future<void>? cancelFuture,
  ) {
    throw error.copyWith(requestOptions: options);
  }
}
