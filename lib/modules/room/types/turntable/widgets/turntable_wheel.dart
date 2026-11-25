import 'dart:math';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../common/constants/app_assets.dart';
import '../../../../../common/models/server_client/room_turntable.pb.dart';
import '../../../../../common/utils/app_log.dart';
import '../../../../../common/utils/chimo.dart';
import '../logic/turntable_logic.dart';

/// 转盘盘面与动画。对齐 joyride `TurntableWidget`。
class TurntableWheel extends StatefulWidget {
  const TurntableWheel({
    super.key,
    required this.info,
    this.status = TurntableStatus.idle,
    this.stopId = 0,
    this.onBtnTap,
    this.onRotateStop,
  });

  final TurntableInfo info;
  final TurntableStatus status;
  final int stopId;
  final VoidCallback? onBtnTap;
  final VoidCallback? onRotateStop;

  @override
  State<TurntableWheel> createState() => _TurntableWheelState();
}

class _TurntableWheelState extends State<TurntableWheel> with TickerProviderStateMixin {
  static const _period = 1000;

  AnimationController? _startController;
  AnimationController? _stopController;
  late AnimationController _indicatorController;
  late Animation<double> _indicatorScale;
  late Animation<double> _rotateAnimation;
  late TurntableInfo _info;
  int _stopIndex = 0;

  double get _circleSize => 260.w;

  List<TurntableItem> get _items => _info.items;

  @override
  void initState() {
    super.initState();
    _info = widget.info;
    _stopIndex = _indexOf(widget.stopId > 0 ? widget.stopId : _info.stopId);
    _rotateAnimation = AlwaysStoppedAnimation<double>(_targetOf(_stopIndex));

    _indicatorController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    _indicatorScale = TweenSequence<double>([
      TweenSequenceItem(
        tween: Tween(begin: 1.0, end: 0.85).chain(CurveTween(curve: Curves.easeOut)),
        weight: 30,
      ),
      TweenSequenceItem(
        tween: Tween(begin: 0.85, end: 1.1).chain(CurveTween(curve: Curves.easeOut)),
        weight: 40,
      ),
      TweenSequenceItem(
        tween: Tween(begin: 1.1, end: 1.0).chain(CurveTween(curve: Curves.easeIn)),
        weight: 30,
      ),
    ]).animate(_indicatorController);

    if (widget.status == TurntableStatus.rotating) {
      if (widget.stopId > 0) {
        _stopRotate(_indexOf(widget.stopId));
      } else {
        _startRotate();
      }
    }
  }

  @override
  void didUpdateWidget(TurntableWheel oldWidget) {
    super.didUpdateWidget(oldWidget);
    _info = widget.info;
    if (widget.status == oldWidget.status && widget.stopId == oldWidget.stopId) {
      return;
    }
    AppLog.d(
      'Turntable status ${oldWidget.status} -> ${widget.status}, '
      'stopId ${oldWidget.stopId} -> ${widget.stopId}',
    );
    switch (widget.status) {
      case TurntableStatus.idle:
        if (oldWidget.status != TurntableStatus.idle) {
          _reset();
        }
      case TurntableStatus.rotating:
        if (widget.stopId > 0) {
          if (oldWidget.stopId != widget.stopId ||
              oldWidget.status != TurntableStatus.rotating) {
            _stopRotate(_indexOf(widget.stopId));
          }
        } else if (oldWidget.status != TurntableStatus.rotating ||
            oldWidget.stopId != 0) {
          _startRotate();
        }
      case TurntableStatus.stopped:
        break;
    }
  }

  int _indexOf(int stopId) => max(0, _info.items.indexWhere((item) => item.id == stopId));

  double _targetOf(int index) => _items.isNotEmpty ? (1 - (index * 1.0 / _items.length)) : 0;

  void _onStop(AnimationStatus status) {
    if (status == AnimationStatus.completed) {
      widget.onRotateStop?.call();
      if (mounted) setState(() {});
    }
  }

  void _startRotate() {
    var cur = _rotateAnimation.value;
    if (cur == 0) cur = 1;
    final tweenSequence = TweenSequence<double>([
      if (cur < 1)
        TweenSequenceItem<double>(
          tween: Tween<double>(begin: cur, end: 1),
          weight: (1 - cur) * 100,
        ),
      TweenSequenceItem<double>(
        tween: Tween<double>(begin: 0, end: cur),
        weight: cur * 100,
      ),
    ]);

    _releaseStopController();
    _releaseStartController();
    _startController = AnimationController(
      duration: const Duration(milliseconds: _period),
      vsync: this,
    );
    _rotateAnimation = tweenSequence.animate(_startController!);
    _startController?.repeat();
    if (mounted) setState(() {});
  }

  void _stopRotate(int index) {
    final cur = _rotateAnimation.value;
    _startController?.stop();
    _stopIndex = index;
    _releaseStopController();

    var target = 1 - (_stopIndex / _items.length);
    if (target == 0) target = 1;
    late final int targetDuration;
    if (target > cur) {
      targetDuration = ((target - cur) * _period * 1.1).round();
      _stopController = AnimationController(
        duration: Duration(milliseconds: targetDuration),
        vsync: this,
      );
      _rotateAnimation = Tween<double>(begin: cur, end: target).animate(_stopController!);
    } else {
      targetDuration = ((target + 1 - cur) * _period * 1.2).round();
      _stopController = AnimationController(
        duration: Duration(milliseconds: targetDuration),
        vsync: this,
      );
      final tweenSequence = TweenSequence<double>([
        if (cur < 1)
          TweenSequenceItem<double>(
            tween: Tween<double>(begin: cur, end: 1),
            weight: (1 - cur) * 100,
          ),
        TweenSequenceItem<double>(
          tween: Tween<double>(begin: 0, end: target),
          weight: target * 100,
        ),
      ]);
      _rotateAnimation = tweenSequence.animate(_stopController!);
    }

    AppLog.d(
      'Stop rotate cur=$cur stopIndex=$_stopIndex target=$target duration=$targetDuration',
    );
    _stopController?.addStatusListener(_onStop);
    _stopController?.forward();
    if (mounted) setState(() {});
  }

  void _reset() {
    final cur = _rotateAnimation.value;
    _releaseStartController();
    _releaseStopController();
    _rotateAnimation = AlwaysStoppedAnimation<double>(cur);
    if (mounted) setState(() {});
  }

  void _releaseStartController() {
    _startController?.stop();
    _startController?.dispose();
    _startController = null;
  }

  void _releaseStopController() {
    if (_stopController == null) return;
    _stopController?.stop();
    _stopController?.removeStatusListener(_onStop);
    _stopController?.dispose();
    _stopController = null;
  }

  @override
  void dispose() {
    _releaseStartController();
    _releaseStopController();
    _indicatorController.dispose();
    super.dispose();
  }

  void _onIndicatorTap() {
    _indicatorController.forward(from: 0);
    widget.onBtnTap?.call();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        Chimo.image(AppAssets.turntableBg, width: 375.w, fit: BoxFit.fitWidth),
        if (widget.status != TurntableStatus.idle)
          PositionedDirectional(
            top: 46.w,
            child: Chimo.image(AppAssets.turntableLight, width: 112.w, fit: BoxFit.fitWidth),
          ),
        PositionedDirectional(
          top: 61.w,
          child: SizedBox(
            width: _circleSize,
            height: _circleSize,
            child: RotationTransition(
              turns: _rotateAnimation,
              child: RepaintBoundary(
                child: CustomPaint(
                  size: Size(_circleSize, _circleSize),
                  painter: _TurntablePainter(
                    selection: _stopIndex,
                    items: _items,
                    status: widget.status,
                  ),
                ),
              ),
            ),
          ),
        ),
        PositionedDirectional(
          top: 127.w,
          child: GestureDetector(
            onTap: _onIndicatorTap,
            child: ScaleTransition(
              scale: _indicatorScale,
              child: Chimo.image(AppAssets.turntableStart, width: 128.w, fit: BoxFit.fitWidth),
            ),
          ),
        ),
      ],
    );
  }
}

class _TurntablePainter extends CustomPainter {
  _TurntablePainter({
    this.selection = 0,
    required this.status,
    required this.items,
  });

  final int selection;
  final List<TurntableItem> items;
  final TurntableStatus status;

  double get _sweepAngle => pi * 2 / itemCount;

  int get itemCount => items.length;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..strokeWidth = 10
      ..isAntiAlias = true
      ..style = PaintingStyle.fill;
    for (var i = 0; i < itemCount; i++) {
      _drawItem(canvas, size, paint, items[i], i);
    }
  }

  void _drawItem(Canvas canvas, Size size, Paint paint, TurntableItem item, int i) {
    final r = size.width / 2;
    _drawArcBg(canvas, i, size);
    canvas.save();
    canvas.translate(r, r);
    canvas.rotate(i * _sweepAngle);
    canvas.translate(-r, -r);
    _drawText(canvas, r, i, item);
    canvas.restore();
  }

  void _drawText(Canvas canvas, double r, int i, TurntableItem item) {
    _drawStroke(canvas, r, i, item);
    const textWidth = 60.0;
    const shadowColor = Color(0xFF2C085C);
    var textColor = Colors.white;
    if (selection != i && status == TurntableStatus.stopped) {
      textColor = Colors.white54;
    }
    final pb = ui.ParagraphBuilder(
      ui.ParagraphStyle(
        fontWeight: FontWeight.w900,
        fontStyle: FontStyle.italic,
        textAlign: TextAlign.center,
        maxLines: 4,
        height: 1,
        fontSize: 13,
      ),
    );
    pb.pushStyle(
      ui.TextStyle(
        color: textColor,
        shadows: const [ui.Shadow(color: shadowColor, offset: Offset(0, 1), blurRadius: 1)],
      ),
    );
    pb.addText(item.name);
    pb.pop();
    final paragraph = pb.build()..layout(const ui.ParagraphConstraints(width: textWidth));
    canvas.drawParagraph(paragraph, Offset(r - textWidth / 2, 20));
  }

  void _drawStroke(Canvas canvas, double r, int i, TurntableItem item) {
    const textWidth = 60.0;
    const shadowColor = Color(0xFF2C085C);
    final fPaint = Paint()
      ..style = PaintingStyle.stroke
      ..color = shadowColor
      ..strokeWidth = 2;
    final pb = ui.ParagraphBuilder(
      ui.ParagraphStyle(
        fontWeight: FontWeight.w900,
        fontStyle: FontStyle.italic,
        textAlign: TextAlign.center,
        maxLines: 4,
        height: 1,
        fontSize: 13,
      ),
    );
    pb.pushStyle(
      ui.TextStyle(
        foreground: fPaint,
        shadows: const [ui.Shadow(color: shadowColor, offset: Offset(0, 1), blurRadius: 1)],
      ),
    );
    pb.addText(item.name);
    pb.pop();
    final paragraph = pb.build()..layout(const ui.ParagraphConstraints(width: textWidth));
    canvas.drawParagraph(paragraph, Offset(r - textWidth / 2, 20));
  }

  void _drawArcBg(Canvas canvas, int i, Size size) {
    final r = size.width / 2;
    final startAngle = -pi / 2 - _sweepAngle / 2 + i * _sweepAngle;
    final linePaint = Paint()
      ..color = Colors.white.withValues(alpha: 0.3)
      ..strokeWidth = 1
      ..isAntiAlias = true
      ..style = PaintingStyle.stroke;
    canvas.drawLine(
      Offset(r, r),
      Offset(r + r * cos(startAngle), r + r * sin(startAngle)),
      linePaint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
