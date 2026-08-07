import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// Submitted cancel-account review status (forya AccountCancelResultPage).
class AccountCancelResultPage extends StatelessWidget {
  const AccountCancelResultPage({super.key});

  static const _securityRouteName = 'AccountSecurityPage';

  void _popToSecurity(BuildContext context) {
    Navigator.of(context).popUntil((route) {
      return route.settings.name == _securityRouteName || route.isFirst;
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.dark,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Text(
            'Cancel Account',
            style: TextStyle(
              color: Color(0xFF333333),
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
          centerTitle: true,
          elevation: 0,
          backgroundColor: Colors.white,
          foregroundColor: const Color(0xFF333333),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios, size: 18),
            onPressed: () => _popToSecurity(context),
          ),
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
                  color: Color(0xFF333333),
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  height: 1.35,
                ),
              ),
              SizedBox(height: 30),
              Text(
                'The application for account cancellation has been submitted successfully. The staff will complete the review within 15 working days. Once the review is approved, the user can confirm again to complete the cancellation successfully.',
                style: TextStyle(
                  color: Color(0xFF999999),
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  height: 1.45,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// Yellow review badge matching forya `ic_accountapprove` look.
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

    canvas.drawCircle(
      center,
      radius,
      Paint()..color = const Color(0xFFFFD400),
    );

    // White clock hands (under-review mark).
    final hand = Paint()
      ..color = Colors.white
      ..strokeWidth = 5
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke;

    final short = radius * 0.28;
    final long = radius * 0.42;
    canvas.drawLine(center, center + Offset(0, -short), hand);
    canvas.drawLine(
      center,
      center + Offset(long * math.cos(-0.4), long * math.sin(-0.4)),
      hand,
    );

    canvas.drawCircle(
      center,
      3.5,
      Paint()..color = Colors.white,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
