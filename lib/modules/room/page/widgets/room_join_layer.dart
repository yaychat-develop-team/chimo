import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../common/constants/app_assets.dart';
import '../../../../common/models/server_client/common/car.pbenum.dart';
import '../../../../common/models/server_client/message.pb.dart';
import '../../../../common/models/server_client/rtc.pb.dart';
import '../../../../common/utils/app_log.dart';
import '../../../../common/utils/event_center.dart';
import '../../../../common/utils/event_constant.dart';
import '../../../../common/widgets/app_image.dart';
import 'package:chimo/common/utils/chimo.dart';

/// 座驾入场横条。对齐 joyride `JoinAnimationDisplay` + `UserJoinAnimationWidget`。
///
/// 不走 GetX：`eventCenter` 直达本层，本地 `_buffer` 排队播放，
/// 避免 `RoomEffectLogic.join` Rx 漏订（表现为要热刷新才有）。
///
/// **必须作为房间全屏 Stack 的直接子节点**（播放时返回 [PositionedDirectional]）。
class RoomJoinLayer extends StatefulWidget {
  const RoomJoinLayer({super.key});

  @override
  State<RoomJoinLayer> createState() => _RoomJoinLayerState();
}

class _RoomJoinLayerState extends State<RoomJoinLayer>
    with WidgetsBindingObserver, SingleTickerProviderStateMixin {
  final List<RoomUserJoin> _buffer = [];
  AppLifecycleState _lifecycle = AppLifecycleState.resumed;
  StreamSubscription<Event>? _addSub;
  StreamSubscription<Event>? _clearSub;

  late final AnimationController _controller;
  late final Animation<double> _slide;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2500),
    )..addStatusListener((status) {
        if (status == AnimationStatus.completed) _onComplete();
      });
    _slide = TweenSequence<double>([
      TweenSequenceItem(tween: Tween(begin: 0, end: 1), weight: 2.5),
      TweenSequenceItem(tween: ConstantTween(1), weight: 5),
      TweenSequenceItem(tween: Tween(begin: 1, end: 2), weight: 2.5),
    ]).animate(_controller);

    _addSub = eventCenter
        .subscribe(EventConstant.addJoinRoomAnimationConfig)
        .listen((event) {
      final data = event.data;
      if (data is RoomUserJoin) _addItem(data);
    });
    _clearSub = eventCenter
        .subscribe(EventConstant.clearJoinRoomAnimationConfig)
        .listen((_) => _clearBuffer());

    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    _addSub?.cancel();
    _clearSub?.cancel();
    _controller.dispose();
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    _lifecycle = state;
    if (state == AppLifecycleState.paused) _clearBuffer();
  }

  void _clearBuffer() {
    _buffer.clear();
    _controller.reset();
    if (mounted) setState(() {});
  }

  void _addItem(RoomUserJoin message) {
    if (_lifecycle == AppLifecycleState.paused) return;
    if (!message.hasUser() || !message.user.hasCar()) return;
    AppLog.i(
      'RoomJoinLayer add nick=${message.user.nickname} '
      'car=${_carName(message.user)}',
    );
    // 对齐 joyride：空闲时立刻 forward，再入队；否则只入队等上一条播完。
    if (_controller.status == AnimationStatus.dismissed) {
      _controller.forward();
    }
    _buffer.add(message);
    if (mounted) setState(() {});
  }

  void _onComplete() {
    _controller.reset();
    if (_buffer.isNotEmpty) _buffer.removeAt(0);
    if (_buffer.isNotEmpty) {
      _controller.forward();
    }
    if (mounted) setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    if (_buffer.isEmpty) return const SizedBox.shrink();
    final width = MediaQuery.sizeOf(context).width;
    final user = _buffer.first.user;
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return PositionedDirectional(
          start: width * (1 - _slide.value),
          top: 73.w,
          child: child!,
        );
      },
      child: IgnorePointer(child: _banner(user, width)),
    );
  }

  Widget _banner(SimpleChannelUser user, double width) {
    return Container(
      width: width,
      height: 84.w,
      padding: EdgeInsetsDirectional.only(start: 22.w, end: 16.w),
      // 对齐 joyride：只铺 join_bg 图，不要额外底色（图本身带透明渐变）。
      decoration: BoxDecoration(
        image: Chimo.decorationImage(
          AppAssets.roomJoinBg(_carLevel(user)),
          fit: BoxFit.cover,
        ),
      ),
      child: Row(
        children: [
          AppImage.avatar(user.avatar, size: 36.w),
          SizedBox(width: 8.w),
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  user.nickname,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    color: Color(0xFFFDF652),
                    fontSize: 13,
                    fontWeight: FontWeight.w400,
                    height: 1,
                  ),
                ),
                SizedBox(height: 1.w),
                Text.rich(
                  TextSpan(
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 13,
                      fontWeight: FontWeight.w400,
                      height: 1,
                    ),
                    children: [
                      const TextSpan(text: 'entered in '),
                      TextSpan(
                        text: _carName(user),
                        style: const TextStyle(color: Color(0xFFFDF652)),
                      ),
                    ],
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
          SizedBox(width: 4.w),
          if (_carImage(user).isNotEmpty)
            Chimo.image(
              _carImage(user),
              width: 88.w,
              fit: BoxFit.fitWidth,
            ),
        ],
      ),
    );
  }
}

String _carName(SimpleChannelUser user) {
  if (!user.hasCar() || !user.car.hasCarMetaInfo()) return '';
  return user.car.carMetaInfo.name.trim();
}

String _carImage(SimpleChannelUser user) {
  if (!user.hasCar() || !user.car.hasCarMetaInfo()) return '';
  return user.car.carMetaInfo.rightImgLink.trim();
}

String _carLevel(SimpleChannelUser user) {
  if (!user.hasCar() || !user.car.hasCarMetaInfo()) return '';
  return switch (user.car.carMetaInfo.level) {
    CarLevel.SSS => 'SSS',
    CarLevel.SS => 'SS',
    CarLevel.S => 'S',
    CarLevel.A => 'A',
    CarLevel.B => 'B',
    _ => '',
  };
}
