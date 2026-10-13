import 'dart:io';

import 'package:flutter/material.dart';

import '../../../../common/theme/app_colors.dart';
import '../../../../common/widgets/app_image.dart';

/// 贴纸气泡（forya `_EmoteItem`：固定宽 65、`fitWidth`，不像照片那样 cover 裁切）。
///
/// 占位图、`filterQuality` 一个字都不差，所以合并后没有任何参数化 —— 只有 [source]。
/// 头像 / 失败重试那一行由 `ChatMessageList` 包。
class ChatEmoteBubble extends StatelessWidget {
  const ChatEmoteBubble({super.key, required this.source});

  /// 网络 URL 或本地文件路径；空串 / 文件不存在都画成破图占位。
  final String source;

  static const double size = 65;

  static const Widget _broken = SizedBox(
    width: size,
    height: size,
    child: ColoredBox(
      color: AppColors.textGrayF0,
      child: Icon(Icons.broken_image_outlined, color: AppColors.textGray99),
    ),
  );

  static const Widget _loading = SizedBox(
    width: size,
    height: size,
    child: ColoredBox(
      color: AppColors.textGrayF5,
      child: Center(
        child: SizedBox(width: 18, height: 18, child: CircularProgressIndicator(strokeWidth: 2)),
      ),
    ),
  );

  @override
  Widget build(BuildContext context) {
    final src = source.trim();
    if (src.isEmpty) return _broken;

    if (src.startsWith('http://') || src.startsWith('https://')) {
      return SizedBox(
        width: size,
        child: AppImage(
          src,
          width: size,
          fit: BoxFit.fitWidth,
          filterQuality: FilterQuality.medium,
          placeholder: _loading,
          error: _broken,
        ),
      );
    }

    final file = File(src);
    if (file.existsSync()) {
      return SizedBox(
        width: size,
        child: AppImage.file(file.path, width: size, fit: BoxFit.fitWidth),
      );
    }

    return _broken;
  }
}
