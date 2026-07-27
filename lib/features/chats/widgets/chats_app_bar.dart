import 'package:flutter/material.dart';

import '../../../core/constants/app_assets.dart';
import '../../../core/theme/app_colors.dart';

/// 消息页顶栏：左侧标题（带绿色浪线）+ 右侧通讯录 / 搜索。
class ChatsAppBar extends StatelessWidget {
  const ChatsAppBar({super.key, this.onContactsTap, this.onSearchTap});

  final VoidCallback? onContactsTap;
  final VoidCallback? onSearchTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 8, 16, 12),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Chats',
                style: TextStyle(
                  color: AppColors.textPrimary,
                  fontSize: 32,
                  fontWeight: FontWeight.w800,
                  height: 1,
                ),
              ),
              const SizedBox(height: 4),
              CustomPaint(
                size: const Size(36, 10),
                painter: _TitleSquigglePainter(),
              ),
            ],
          ),
          const Spacer(),
          _HeaderIconButton(asset: AppAssets.msgContacts, onTap: onContactsTap),
          const SizedBox(width: 10),
          _HeaderIconButton(asset: AppAssets.msgSearch, onTap: onSearchTap),
        ],
      ),
    );
  }
}

/// 顶栏右侧圆角图标按钮（资源图）。
class _HeaderIconButton extends StatelessWidget {
  const _HeaderIconButton({required this.asset, this.onTap});

  final String asset;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: const Color(0xFF1A1A1A),
      borderRadius: BorderRadius.circular(14),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(14),
        child: SizedBox(
          width: 44,
          height: 44,
          child: Center(
            child: Image.asset(
              asset,
              width: 22,
              height: 22,
              color: AppColors.textPrimary,
            ),
          ),
        ),
      ),
    );
  }
}

/// 绘制「Chats」标题下的绿色浪线装饰。
class _TitleSquigglePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = AppColors.primaryBright
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3
      ..strokeCap = StrokeCap.round;

    final path = Path()
      ..moveTo(0, size.height * 0.55)
      ..cubicTo(
        size.width * 0.25,
        size.height * 0.05,
        size.width * 0.45,
        size.height * 1.05,
        size.width * 0.7,
        size.height * 0.45,
      )
      ..cubicTo(
        size.width * 0.85,
        size.height * 0.1,
        size.width * 0.92,
        size.height * 0.7,
        size.width,
        size.height * 0.35,
      );
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
