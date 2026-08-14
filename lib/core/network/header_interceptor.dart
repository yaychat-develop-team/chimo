import 'package:dio/dio.dart';

import 'auth_request_headers.dart';

/// 对齐 forya `HeaderInterceptor`：注入 token / timestamp / `df_*` 公共头。
class HeaderInterceptor extends Interceptor {
  HeaderInterceptor({this.tokenProvider});

  final String? Function()? tokenProvider;

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.headers.putIfAbsent(
      Headers.contentTypeHeader,
      () => Headers.jsonContentType,
    );
    options.headers.putIfAbsent(
      Headers.acceptHeader,
      () => Headers.jsonContentType,
    );
    options.headers['timestamp'] =
        '${DateTime.now().millisecondsSinceEpoch}';

    AuthRequestHeaders.commonParam.forEach((key, value) {
      final text = value.trim();
      if (text.isEmpty) return;
      options.headers['df_$key'] = text;
    });

    final token = tokenProvider?.call();
    if (token != null && token.isNotEmpty) {
      options.headers['token'] = token;
    } else {
      options.headers.remove('token');
    }

    // 对齐 forya：DELETE / PUT 走 POST 通道（网关侧统一入口）。
    final method = options.method.toUpperCase();
    if (method == 'DELETE' || method == 'PUT') {
      options.method = 'POST';
    }

    handler.next(options);
  }
}
