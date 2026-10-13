import 'dart:io';
import 'dart:ui';

import 'package:flutter/material.dart';

import '../../../../common/constants/app_assets.dart';
import '../../../../common/theme/app_colors.dart';
import '../../../../common/widgets/app_image.dart';

/// 图片气泡的形状与解码预算。私聊四角 12 + 一层浅投影，群聊尾角 4 / 其余 18、
/// 无投影 —— 两边设计稿本来就不一样， 合并时照抄，没有统一（同
/// `ChatBubbleStyle` 的理由：统一等于静默视觉回归）。
class ChatImageStyle {
  const ChatImageStyle({
    required this.radius,
    this.tailRadius,
    this.shadows = const [],
    this.memWidth,
  });

  /// 主圆角。
  final double radius;

  /// 「尾角」—— 自己那侧的右上角 / 对方那侧的左上角。null 表示四角一样大。
  final double? tailRadius;

  final List<BoxShadow> shadows;

  /// 解码预算（`AppImage.memWidth`）。私聊封顶 720，群聊原来不封。
  final int? memWidth;

  BorderRadius borderRadiusFor({required bool isSelf}) {
    final tail = tailRadius;
    if (tail == null) return BorderRadius.circular(radius);
    return BorderRadius.only(
      topLeft: Radius.circular(isSelf ? radius : tail),
      topRight: Radius.circular(isSelf ? tail : radius),
      bottomLeft: Radius.circular(radius),
      bottomRight: Radius.circular(radius),
    );
  }

  /// 私聊消息流。`shadows` 里的 6% 黑不是 const，所以这两个是 `static final`。
  static final ChatImageStyle dm = ChatImageStyle(
    radius: 12,
    memWidth: 720,
    shadows: [
      BoxShadow(
        color: Colors.black.withValues(alpha: 0.06),
        blurRadius: 8,
        offset: const Offset(0, 2),
      ),
    ],
  );

  /// 群聊消息流。
  static const ChatImageStyle group = ChatImageStyle(radius: 18, tailRadius: 4);
}

/// 聊天里的图片气泡：约 3:4 的缩略图（132×176），网络 / assets / 本地文件三种来源，
/// 可选「未加入社区」的模糊遮罩。
///
/// 点击、长按、头像那一行都不在这里：两边都由 `ChatMessageList` 在外面包
/// `_GroupChatBubble` 各包一遍）。
class ChatImageBubble extends StatelessWidget {
  const ChatImageBubble({
    super.key,
    required this.source,
    required this.isSelf,
    required this.style,
    this.locked = false,
  });

  final String source;
  final bool isSelf;
  final ChatImageStyle style;

  /// 未加入社区：模糊 + 底部 Join to view。只有群聊会传 true。
  final bool locked;

  static const double width = 132;
  static const double height = 176;

  Widget _expired() {
    return Container(
      width: width,
      height: height,
      color: AppColors.surfaceOlive,
      alignment: Alignment.center,
      child: const Text(
        'Picture expired',
        textAlign: TextAlign.center,
        style: TextStyle(color: AppColors.textGray66, fontSize: 12, fontWeight: FontWeight.w600),
      ),
    );
  }

  Widget _rawImage() {
    final src = source.trim();
    if (src.isEmpty) return _expired();

    if (src.startsWith('http://') || src.startsWith('https://')) {
      return AppImage(
        src,
        width: width,
        height: height,
        fit: BoxFit.cover,
        memWidth: style.memWidth,
        placeholder: ColoredBox(
          color: locked ? AppColors.outlineBright : AppColors.textGrayF3,
          child: const Center(
            child: SizedBox(
              width: 22,
              height: 22,
              child: CircularProgressIndicator(strokeWidth: 2),
            ),
          ),
        ),
        error: _expired(),
      );
    }

    if (src.startsWith('assets/')) {
      return AppImage(src, width: width, height: height, fit: BoxFit.cover, error: _expired());
    }

    final file = File(src);
    if (file.existsSync()) {
      return AppImage.file(
        file.path,
        width: width,
        height: height,
        fit: BoxFit.cover,
        error: _expired(),
      );
    }

    return _expired();
  }

  @override
  Widget build(BuildContext context) {
    final image = SizedBox(width: width, height: height, child: _rawImage());

    final Widget content = !locked
        ? image
        : SizedBox(
            width: width,
            height: height,
            child: Stack(
              fit: StackFit.expand,
              children: [
                ImageFiltered(imageFilter: ImageFilter.blur(sigmaX: 8, sigmaY: 8), child: image),
                const ColoredBox(color: AppColors.scrimBlack20),
                Positioned(
                  left: 0,
                  right: 0,
                  bottom: 0,
                  child: Container(
                    height: 32,
                    color: Colors.black.withValues(alpha: 0.28),
                    alignment: Alignment.center,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        AppImage(AppAssets.lockIcon, width: 14, height: 14, color: Colors.white),
                        const SizedBox(width: 5),
                        const Text(
                          'Join to view',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );

    final radius = style.borderRadiusFor(isSelf: isSelf);
    final clipped = ClipRRect(borderRadius: radius, child: content);
    if (style.shadows.isEmpty) return clipped;
    return DecoratedBox(
      decoration: BoxDecoration(borderRadius: radius, boxShadow: style.shadows),
      child: clipped,
    );
  }
}
