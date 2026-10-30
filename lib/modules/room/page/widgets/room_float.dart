import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../app/app_jumper.dart';
import '../../../../common/constants/app_assets.dart';
import '../../../../common/theme/app_colors.dart';
import '../../../../common/theme/app_dialog.dart';
import '../../../../common/widgets/app_image.dart';
import '../../logic/mic_logic.dart';
import '../../service/room_service.dart';
import 'package:chimo/common/utils/chimo.dart';

/// 最小化后的浮窗。对齐 Oumi：可拖动的房间封面，底部音浪，右上角关闭。
class RoomFloat extends StatefulWidget {
  const RoomFloat({super.key});

  @override
  State<RoomFloat> createState() => _RoomFloatState();
}

class _RoomFloatState extends State<RoomFloat> with TickerProviderStateMixin {
  static const double _size = 64;
  static const double _avatar = 56;
  static double? _savedLeft;
  static double? _savedTop;

  var _left = 0.0;
  var _top = 0.0;
  var _dx = 0.0;
  var _dy = 0.0;
  var _minLeft = 8.0;
  var _maxLeft = 0.0;
  var _minTop = 60.0;
  var _maxTop = 0.0;
  var _maxWidth = 0.0;
  var _moved = false;
  var _ready = false;
  Offset _slide = Offset.zero;
  AnimationController? _anim;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final size = MediaQuery.sizeOf(context);
    _maxWidth = size.width;
    _minLeft = 8;
    _maxLeft = math.max(_minLeft, size.width - _size - _minLeft);
    _minTop = 60;
    _maxTop = math.max(_minTop, size.height - _size - 50);
    if (_ready) return;
    _ready = true;
    _left = _savedLeft ?? _maxLeft;
    _top = _savedTop ?? (size.height - 195 - _size);
    _left = _left.clamp(_minLeft, _maxLeft);
    _top = _top.clamp(_minTop, _maxTop);
  }

  @override
  void dispose() {
    _anim?.dispose();
    super.dispose();
  }

  void _remember() {
    _savedLeft = _left;
    _savedTop = _top;
  }

  void _onDown(PointerDownEvent event) {
    _moved = false;
  }

  void _onMove(PointerMoveEvent event) {
    if (event.delta.distance == 0) return;
    _dx += event.delta.dx;
    _dy += event.delta.dy;
    _moved = math.sqrt(_dx * _dx + _dy * _dy) > 3;
    setState(() {});
  }

  void _onUp(PointerUpEvent event) {
    _left += _dx;
    _top += _dy;
    _dx = 0;
    _dy = 0;
    if (!_moved) {
      setState(() {});
      return;
    }
    final dx = _left < (_maxWidth - _size) / 2 ? _minLeft - _left : _maxLeft - _left;
    var dy = 0.0;
    if (_top < _minTop) {
      dy = _minTop - _top;
    } else if (_top > _maxTop) {
      dy = _maxTop - _top;
    }
    _spring(dx, dy);
  }

  void _spring(double dx, double dy) {
    _anim?.dispose();
    if (dx == 0 && dy == 0) {
      _moved = false;
      _remember();
      setState(() {});
      return;
    }
    final anim = AnimationController(vsync: this, duration: const Duration(milliseconds: 150));
    _anim = anim;
    final tween = Tween<Offset>(begin: Offset.zero, end: Offset(dx, dy));
    anim.addListener(() {
      if (!mounted) return;
      setState(() => _slide = tween.evaluate(anim));
    });
    anim.addStatusListener((status) {
      if (status != AnimationStatus.completed || !mounted) return;
      setState(() {
        _left += dx;
        _top += dy;
        _slide = Offset.zero;
        _moved = false;
      });
      _remember();
    });
    anim.forward();
  }

  Future<void> _close(RoomService service) async {
    final onMic = Get.isRegistered<MicLogic>() && Get.find<MicLogic>().onMic;
    if (onMic) {
      final ok = await AppDialog.show(
        title: 'Leave the room?',
        content: 'You are on the mic.',
        confirmLabel: 'Leave',
        cancelLabel: 'Stay',
        buttons: DialogLoyoutStyle.horizontal,
      );
      if (ok != true) return;
    }
    await service.leave();
  }

  @override
  Widget build(BuildContext context) {
    if (!Get.isRegistered<RoomService>()) return const SizedBox.shrink();
    final service = Get.find<RoomService>();
    final x = _left + _dx + _slide.dx;
    final y = _top + _dy + _slide.dy;
    return PositionedDirectional(
      start: x,
      top: y,
      width: _size,
      height: _size,
      child: Listener(
        behavior: HitTestBehavior.translucent,
        onPointerDown: _onDown,
        onPointerMove: _onMove,
        onPointerUp: _onUp,
        child: SizedBox(
          width: _size,
          height: _size,
          child: Stack(
            children: [
              PositionedDirectional(
                start: 0,
                bottom: 0,
                child: GestureDetector(
                  onTap: () {
                    if (_moved) return;
                    AppJumper.toRoom(service.rid);
                  },
                  child: Obx(() => _face(service.cover.value)),
                ),
              ),
              PositionedDirectional(
                end: 0,
                top: 0,
                child: GestureDetector(
                  onTap: () => _close(service),
                  behavior: HitTestBehavior.opaque,
                  child: Chimo.image(AppAssets.roomFloatClose, width: 18, height: 18),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _face(String cover) {
    return SizedBox(
      width: _avatar,
      height: _avatar,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            width: _avatar,
            height: _avatar,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: AppColors.green29EEAA, width: 1),
            ),
            child: ClipOval(child: AppImage.avatar(cover, size: _avatar - 2)),
          ),
          Container(
            width: 54,
            height: 54,
            alignment: Alignment.center,
            decoration: ShapeDecoration(
              shape: const StadiumBorder(),
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [AppColors.black.withValues(alpha: 0), AppColors.black],
              ),
            ),
            child: Image.asset(
              AppAssets.roomFloatWave,
              width: 16,
              fit: BoxFit.fitWidth,
              color: AppColors.white,
              colorBlendMode: BlendMode.srcIn,
            ),
          ),
        ],
      ),
    );
  }
}
