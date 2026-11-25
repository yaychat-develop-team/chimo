import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../../common/theme/app_colors.dart';
import '../../../common/widgets/app_scaffold.dart';

/// 全屏播放 Reveal Card 视频。（用 WebView 播，免增依赖）。
class VideoPreviewPage extends StatefulWidget {
  const VideoPreviewPage({super.key, required this.url});

  final String url;

  @override
  State<VideoPreviewPage> createState() => _VideoPreviewPageState();
}

class _VideoPreviewPageState extends State<VideoPreviewPage> {
  late final WebViewController _controller;
  var _loading = true;

  @override
  void initState() {
    super.initState();
    final src = Uri.encodeFull(widget.url.trim());
    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(AppColors.black)
      ..setNavigationDelegate(
        NavigationDelegate(
          onPageFinished: (_) {
            if (mounted) setState(() => _loading = false);
          },
        ),
      )
      ..loadHtmlString('''
        <!DOCTYPE html>
        <html>
        <head>
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
        <style>
          html,body{margin:0;height:100%;background:#000;display:flex;align-items:center;justify-content:center}
          video{width:100%;height:100%;object-fit:contain;background:#000}
        </style>
        </head>
        <body>
        <video src="$src" controls autoplay playsinline webkit-playsinline></video>
        </body>
        </html>
        ''', baseUrl: src.startsWith('http') ? src : null);
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      backgroundColor: AppColors.black,
      appBar: const AppNavBar(title: 'Video'),
      body: Stack(
        fit: StackFit.expand,
        children: [
          WebViewWidget(controller: _controller),
          if (_loading)
            const Center(child: CircularProgressIndicator(color: AppColors.green00F875)),
        ],
      ),
    );
  }
}
