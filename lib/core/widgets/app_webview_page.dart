import 'dart:async';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../navigation/app_scheme_helper.dart';
import '../theme/app_colors.dart';
import 'app_nav_bar.dart';

/// 应用内浏览器，用于 banner / scheme `web` 链接。
///
/// 通过 `CallFlutter` + scheme 导航桥接 H5（与 forya JRWebView 相同）。
class AppWebViewPage extends StatefulWidget {
  const AppWebViewPage({
    super.key,
    required this.url,
    this.title,
  });

  final String url;
  final String? title;

  static Future<void> open(
    BuildContext context, {
    required String url,
    String? title,
  }) {
    return Navigator.of(context).push<void>(
      MaterialPageRoute<void>(
        builder: (_) => AppWebViewPage(url: url, title: title),
      ),
    );
  }

  @override
  State<AppWebViewPage> createState() => _AppWebViewPageState();
}

class _AppWebViewPageState extends State<AppWebViewPage> {
  late final WebViewController _controller;
  late final bool _fullScreen;
  var _loading = true;
  String? _title;

  @override
  void initState() {
    super.initState();
    _title = widget.title;
    _fullScreen = widget.url.contains('is_full_screen=1');
    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..enableZoom(false)
      ..setBackgroundColor(AppColors.background)
      ..setNavigationDelegate(
        NavigationDelegate(
          onPageStarted: (_) {
            if (mounted) setState(() => _loading = true);
          },
          onPageFinished: (_) async {
            if (!mounted) return;
            setState(() => _loading = false);
            if (_title != null && _title!.trim().isNotEmpty) return;
            try {
              final raw = await _controller.runJavaScriptReturningResult(
                'document.title',
              );
              final next = _stripJsString('$raw').trim();
              if (next.isNotEmpty && mounted) {
                setState(() => _title = next);
              }
            } catch (_) {}
          },
          onNavigationRequest: (request) async {
            if (!mounted) return NavigationDecision.prevent;
            final url = request.url;
            // 普通 http(s) 页面放行；拦截自定义 scheme。
            if (url.startsWith('http://') || url.startsWith('https://')) {
              return NavigationDecision.navigate;
            }
            final result = await AppSchemeHelper.handle(context, url);
            if (result == false) return NavigationDecision.navigate;
            await _runJsResult(result);
            return NavigationDecision.prevent;
          },
        ),
      )
      ..addJavaScriptChannel(
        'CallFlutter',
        onMessageReceived: (message) {
          unawaited(_onCallFlutter(message.message));
        },
      )
      ..loadRequest(Uri.parse(widget.url));
  }

  Future<void> _onCallFlutter(String message) async {
    if (!mounted || message.trim().isEmpty) return;
    var cmd = message.trim();
    if (cmd.startsWith('http://') || cmd.startsWith('https://')) {
      cmd = 'yqdf://web?url=${Uri.encodeComponent(cmd)}';
    }
    final result = await AppSchemeHelper.handle(context, cmd);
    await _runJsResult(result);
  }

  Future<void> _runJsResult(Object? result) async {
    if (!mounted) return;
    if (result is String && result.isNotEmpty) {
      try {
        await _controller.runJavaScript(result);
      } catch (_) {}
    }
  }

  static String _stripJsString(String value) {
    var s = value.trim();
    if (s.length >= 2 && s.startsWith('"') && s.endsWith('"')) {
      s = s.substring(1, s.length - 1);
    }
    return s;
  }

  Future<void> _onBack() async {
    if (await _controller.canGoBack()) {
      await _controller.goBack();
      return;
    }
    if (mounted) Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    final body = Stack(
      fit: StackFit.expand,
      children: [
        WebViewWidget(controller: _controller),
        if (_loading)
          const Center(
            child: CircularProgressIndicator(
              strokeWidth: 2,
              color: AppColors.textPrimary,
            ),
          ),
      ],
    );

    // 全屏活动 H5 自行绘制返回 / 标题（forya CommonWebView）。
    if (_fullScreen) {
      return Scaffold(
        backgroundColor: AppColors.background,
        resizeToAvoidBottomInset: false,
        body: body,
      );
    }

    return Scaffold(
      backgroundColor: AppColors.background,
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            AppNavBar(
              title: (_title ?? '').trim().isEmpty ? 'Chimo' : _title!.trim(),
              onBack: _onBack,
            ),
            Expanded(child: body),
          ],
        ),
      ),
    );
  }
}
