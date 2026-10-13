import 'dart:math' as math;

import 'package:flutter/material.dart';

import '../../../common/theme/app_colors.dart';
import '../../../common/widgets/app_scaffold.dart';

/// 已提交的注销账号审核状态（对齐 forya AccountCancelResultPage）。
class AccountCancelResultPage extends StatelessWidget {
  const AccountCancelResultPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChimoScaffold(
      title: 'Cancel Account',
      backgroundColor: Colors.white,
      titleStyle: const TextStyle(
        color: AppColors.outline,
        fontSize: 16,
        fontWeight: FontWeight.w600,
      ),
      body: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 48),
        child: Column(
          children: [
            SizedBox(height: 133),
            _ReviewBadge(),
            SizedBox(height: 25),
            Text(
              'Application for account cancellation is under review.',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: AppColors.outline,
                fontSize: 20,
                fontWeight: FontWeight.w500,
                height: 1.35,
              ),
            ),
            SizedBox(height: 30),
            Text(
              'The application for account cancellation has been submitted successfully. The staff will complete the review within 15 working days. Once the review is approved, the user can confirm again to complete the cancellation successfully.',
              style: TextStyle(
                color: AppColors.textGray99,
                fontSize: 12,
                fontWeight: FontWeight.w500,
                height: 1.45,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// 黄色审核徽章，对齐 forya `ic_accountapprove` 样式。
class _ReviewBadge extends StatelessWidget {
  const _ReviewBadge();

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      width: 69,
      height: 69,
      child: CustomPaint(painter: _ReviewBadgePainter()),
    );
  }
}

class _ReviewBadgePainter extends CustomPainter {
  const _ReviewBadgePainter();

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.shortestSide / 2;

    canvas.drawCircle(center, radius, Paint()..color = AppColors.warningYellow);

    // 白色表针（审核中标记）。
    final hand = Paint()
      ..color = Colors.white
      ..strokeWidth = 5
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke;

    final short = radius * 0.28;
    final long = radius * 0.42;
    canvas.drawLine(center, center + Offset(0, -short), hand);
    canvas.drawLine(center, center + Offset(long * math.cos(-0.4), long * math.sin(-0.4)), hand);

    canvas.drawCircle(center, 3.5, Paint()..color = Colors.white);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
