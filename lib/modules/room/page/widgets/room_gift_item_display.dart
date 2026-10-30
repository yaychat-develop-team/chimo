import 'dart:async';

import 'package:flutter/material.dart';
import 'package:forya_pag/pag.dart';
import 'package:get/get.dart';

import '../../../../common/theme/app_colors.dart';
import '../../logic/mic_logic.dart';
import '../../model/room_gift_display.dart';
import 'package:chimo/common/utils/chimo.dart';

/// 直接移植 joyride [GiftItemDisplay] + [GiftItemController]。
/// 坐标/曲线/控件树与源码一致：发送者麦位 → 中心 PAG → 接收者麦位。
class RoomGiftItemDisplay extends StatefulWidget {
  const RoomGiftItemDisplay({super.key, required this.config, this.onComplete});

  final RoomGiftDisplay config;
  final ValueChanged<RoomGiftDisplay>? onComplete;

  @override
  State<RoomGiftItemDisplay> createState() => _RoomGiftItemDisplayState();
}

class _RoomGiftItemDisplayState extends State<RoomGiftItemDisplay>
    with TickerProviderStateMixin {
  late final _GiftItemController _controller;
  late final String _tag;
  var _pagPlaying = false;

  @override
  void initState() {
    super.initState();
    _tag = UniqueKey().toString();
    _controller = Get.put(
      _GiftItemController(
        widget.config,
        this,
        completeCallback: widget.onComplete,
      ),
      tag: _tag,
    );
  }

  @override
  void dispose() {
    Get.delete<_GiftItemController>(tag: _tag);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<_GiftItemController>(
      tag: _tag,
      builder: (controller) {
        if (controller.giftStatus == RoomGiftPlayStatus.wait) {
          return const IgnorePointer();
        }
        if (widget.config.showAnimation) {
          return _renderAnimationPag(context);
        }
        return _renderPagGift(context);
      },
    );
  }

  /// joyride [_renderPagGift]
  Widget _renderPagGift(BuildContext context) {
    final url = widget.config.giftUrl.trim();
    if (url.isEmpty) {
      // 无 PAG：立刻进入飞出（joyride 低端机同逻辑）。
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (mounted) _controller.onPagAnimEnd();
      });
      return const SizedBox.shrink();
    }
    return Stack(
      children: [
        PositionedDirectional(
          start: 0,
          end: 0,
          top: 0,
          bottom: 0,
          child: IgnorePointer(
            child: PAGView.network(
              url,
              imgs: widget.config.imgList.isEmpty
                  ? null
                  : widget.config.imgList,
              texts: widget.config.textList.isEmpty
                  ? null
                  : widget.config.textList,
              repeatCount: PAGView.REPEAT_COUNT_DEFAULT,
              initProgress: 0,
              autoPlay: false,
              key: _controller.pagKey,
              onInit: () {
                _controller.startPlayPag();
                setState(() => _pagPlaying = true);
              },
              onAnimationEnd: _controller.onPagAnimEnd,
            ),
          ),
        ),
        if (widget.config.showPrice && _pagPlaying)
          PositionedDirectional(
            top: 120,
            end: 10,
            child: IgnorePointer(
              child: Text(
                '${widget.config.price}',
                style: const TextStyle(
                  color: AppColors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
      ],
    );
  }

  /// joyride [_renderAnimationPag]
  Widget _renderAnimationPag(BuildContext context) {
    if (_controller.inController == null || _controller.outController == null) {
      return const SizedBox.shrink();
    }
    return Stack(
      children: [
        if (_controller.giftStatus == RoomGiftPlayStatus.ani ||
            _controller.giftStatus == RoomGiftPlayStatus.willAni)
          _renderPagGift(context),
        if (_controller.giftStatus == RoomGiftPlayStatus.inAni ||
            _controller.giftStatus == RoomGiftPlayStatus.willAni)
          _renderNormalIn(),
        if (_controller.giftStatus == RoomGiftPlayStatus.outAni)
          _renderNormalOut(),
        if (_controller.giftStatus == RoomGiftPlayStatus.micAni &&
            widget.config.micRes.isNotEmpty)
          ..._micAnim,
      ],
    );
  }

  /// joyride [_renderNormalIn]
  Widget _renderNormalIn() {
    if (_controller.inController == null) return const SizedBox.shrink();
    return PositionedDirectional(
      start: 0,
      top: 0,
      child: AnimatedBuilder(
        animation: _controller.inController!,
        builder: _buildIn,
      ),
    );
  }

  /// joyride [_buildIn]：Center + Matrix4.translate(全局麦位坐标)
  Widget _buildIn(BuildContext context, Widget? child) {
    final inOffset = _point(widget.config.senderUid);
    final w = inOffset.size.width <= 0 ? 50.0 : inOffset.size.width;
    final h = inOffset.size.height <= 0 ? w : inOffset.size.height;
    final tx = (_controller.inTranslateX.value as num?)?.toDouble() ?? 0.0;
    final ty = (_controller.inTranslateY.value as num?)?.toDouble() ?? 0.0;
    final scale = (_controller.inScale.value as num?)?.toDouble() ?? 1.0;
    final opacity = ((_controller.inOpacity.value as num?)?.toDouble() ?? 0.0)
        .clamp(0.0, 1.0);
    return Center(
      child: Container(
        width: w,
        height: h,
        alignment: Alignment.center,
        transform: Matrix4.identity()
          ..translateByDouble(tx, ty, 0, 1)
          ..scaleByDouble(scale, scale, 1, 1),
        child: Opacity(
          opacity: opacity,
          child: Chimo.image(
            widget.config.iconUrl,
            width: w,
            height: w,
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }

  /// joyride [_renderNormalOut]
  Widget _renderNormalOut() {
    return PositionedDirectional(
      top: 0,
      bottom: 0,
      start: 0,
      end: 0,
      child: Stack(
        children: widget.config.receiverUids.map(_buildOutForUid).toList(),
      ),
    );
  }

  /// joyride [_buildOutForUid]
  Widget _buildOutForUid(int uid) {
    if (_controller.outController == null) return const SizedBox.shrink();
    return Positioned(
      child: AnimatedBuilder(
        animation: _controller.outController!,
        builder: (context, child) =>
            _buildOut(uid, giftNum: widget.config.count),
      ),
    );
  }

  /// joyride [_buildOut]
  Widget _buildOut(int uid, {int giftNum = 1}) {
    final tx =
        (_controller.outTranslateX[uid]?.value as num?)?.toDouble() ?? 0.0;
    final ty =
        (_controller.outTranslateY[uid]?.value as num?)?.toDouble() ?? 0.0;
    final scale = (_controller.outScale[uid]?.value as num?)?.toDouble() ?? 1.0;
    final opacity =
        ((_controller.outOpacity[uid]?.value as num?)?.toDouble() ?? 0.0).clamp(
          0.0,
          1.0,
        );
    return Center(
      child: Transform(
        alignment: AlignmentDirectional.center,
        transform: Matrix4.identity()
          ..translateByDouble(tx, ty, 0, 1)
          ..scaleByDouble(scale, scale, 1, 1),
        child: Container(
          width: _controller.giftSize,
          height: _controller.giftSize,
          alignment: Alignment.center,
          child: Opacity(
            opacity: opacity,
            child: Stack(
              children: [
                Center(
                  child: Chimo.image(
                    widget.config.iconUrl,
                    width: _controller.giftSize,
                    height: _controller.giftSize,
                    fit: BoxFit.contain,
                  ),
                ),
                if (giftNum > 1) _renderGiftNum(giftNum),
              ],
            ),
          ),
        ),
      ),
    );
  }

  List<Widget> get _micAnim =>
      widget.config.receiverUids.map(_buildMicRes).toList();

  /// joyride [_buildMicRes]
  Widget _buildMicRes(int uid) {
    final offset = _point(uid);
    final micIconSize = offset.size.width <= 0 ? 50.0 : offset.size.width;
    final size = micIconSize * 1.6;
    final top = offset.offset.dy - (size - micIconSize) / 2;
    final left = offset.offset.dx - (size - micIconSize) / 2;
    return PositionedDirectional(
      top: top,
      start: left,
      child: IgnorePointer(
        child: offset.inPosition
            ? Chimo.image(
                widget.config.micRes,
                width: size,
                height: size,
                fit: BoxFit.contain,
              )
            : const SizedBox(),
      ),
    );
  }

  Widget _renderGiftNum(int giftNum) {
    return Align(
      alignment: AlignmentDirectional.bottomEnd,
      child: Text(
        'x$giftNum',
        style: const TextStyle(
          color: Color(0xFFFFF1B4),
          fontSize: 60,
          fontWeight: FontWeight.w500,
          fontStyle: FontStyle.italic,
          shadows: [
            Shadow(color: Color(0xFFFF718C), offset: Offset(2, 2)),
            Shadow(color: Color(0xFFFF718C), offset: Offset(2, -2)),
            Shadow(color: Color(0xFFFF718C), offset: Offset(-2, 2)),
            Shadow(color: Color(0xFFFF718C), offset: Offset(-2, -2)),
          ],
        ),
      ),
    );
  }

  RoomMicPoint _point(int uid) {
    if (Get.isRegistered<MicLogic>())
      return Get.find<MicLogic>().pointByUid(uid);
    return RoomMicPoint(
      Offset(Get.width - 70, 50),
      size: const Size(50, 50),
      inPosition: false,
    );
  }
}

/// 直接移植 joyride [GiftItemController]。
class _GiftItemController extends GetxController {
  _GiftItemController(
    this.config,
    this.tickerProvider, {
    this.completeCallback,
  });

  final RoomGiftDisplay config;
  final TickerProvider tickerProvider;
  final ValueChanged<RoomGiftDisplay>? completeCallback;

  RoomGiftPlayStatus giftStatus = RoomGiftPlayStatus.wait;
  AnimationController? inController;
  late Animation inTranslateX;
  late Animation inTranslateY;
  late Animation inScale;
  late Animation inOpacity;

  AnimationController? outController;
  final outTranslateX = <int, Animation>{};
  final outTranslateY = <int, Animation>{};
  final outScale = <int, Animation>{};
  final outOpacity = <int, Animation>{};

  late double _giftWidth;
  late double _offsetY;
  late double _offsetX;

  final pagKey = GlobalKey<PAGViewState>();
  Timer? _timer;
  Timer? _micTimer;
  Timer? _pagFallback;
  var hasCallBack = false;

  double get giftSize => _giftWidth;

  @override
  void onInit() {
    super.onInit();
    _initSizes();
    if (config.showAnimation) {
      _initIn();
      _initOut();
    }
    _timer = Timer(const Duration(seconds: 20), _callBackIfNeed);
  }

  @override
  void onReady() {
    super.onReady();
    _playInAnimationIfNeed();
  }

  @override
  void onClose() {
    inController?.removeStatusListener(_onInStatus);
    inController?.dispose();
    inController = null;
    outController?.removeStatusListener(_onOutStatus);
    outController?.dispose();
    outController = null;
    _timer?.cancel();
    _micTimer?.cancel();
    _pagFallback?.cancel();
    _callBackIfNeed();
    super.onClose();
  }

  void _callBackIfNeed() {
    if (hasCallBack) return;
    hasCallBack = true;
    completeCallback?.call(config);
  }

  /// joyride [_initSizes]：用 ScreenUtil 屏宽（与麦位同一套坐标）。
  void _initSizes() {
    final w = Get.width;
    final h = Get.height;
    _giftWidth = w / 2;
    _offsetX = (w - _giftWidth) / 2;
    _offsetY = (h - _giftWidth) / 2;
  }

  RoomMicPoint _point(int uid) {
    if (Get.isRegistered<MicLogic>())
      return Get.find<MicLogic>().pointByUid(uid);
    return RoomMicPoint(
      Offset(Get.width - 70, 50),
      size: const Size(50, 50),
      inPosition: false,
    );
  }

  /// joyride [_initIn]
  void _initIn() {
    final inOffset = _point(config.senderUid);
    final micW = inOffset.size.width <= 0 ? 50.0 : inOffset.size.width;
    inController = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: tickerProvider,
    )..addStatusListener(_onInStatus);
    const stayThreshold = 0.85;
    inController!.addListener(() {
      final value = inController?.value ?? 0;
      if (value > stayThreshold) {
        if (giftStatus == RoomGiftPlayStatus.inAni) {
          giftStatus = RoomGiftPlayStatus.willAni;
        }
        update();
      }
    });
    const stayEndCurve = _StayEndCurve(stayThreshold);
    inTranslateX = Tween(begin: inOffset.offset.dx, end: _offsetX).animate(
      CurvedAnimation(
        parent: inController!,
        curve: const Interval(0.5, 1, curve: stayEndCurve),
      ),
    );
    inTranslateY = Tween(begin: inOffset.offset.dy, end: _offsetY).animate(
      CurvedAnimation(
        parent: inController!,
        curve: const Interval(0.5, 1, curve: stayEndCurve),
      ),
    );
    inScale = Tween(begin: 1.0, end: _giftWidth / micW).animate(
      CurvedAnimation(
        parent: inController!,
        curve: const Interval(0.5, 1, curve: stayEndCurve),
      ),
    );
    inOpacity = Tween(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: inController!,
        curve: const Interval(0, 0.5, curve: Curves.easeOut),
      ),
    );
  }

  void _onInStatus(AnimationStatus status) {
    if (status == AnimationStatus.completed) {
      giftStatus = RoomGiftPlayStatus.ani;
      // 礼物面板盖住全屏 PAG 时 VisibilityDetector 会 pause，onAnimationEnd 不来。
      // 飞入结束后兜底进飞出，避免整段卡死。
      _pagFallback?.cancel();
      _pagFallback = Timer(const Duration(milliseconds: 2800), () {
        if (giftStatus == RoomGiftPlayStatus.ani ||
            giftStatus == RoomGiftPlayStatus.willAni) {
          onPagAnimEnd();
        }
      });
    }
    update();
  }

  /// joyride [_initOut]
  void _initOut() {
    outController = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: tickerProvider,
    )..addStatusListener(_onOutStatus);
    final sw = Get.width;
    final sh = Get.height;
    for (final uid in config.receiverUids) {
      final offset = _point(uid);
      final micW = offset.size.width <= 0 ? 50.0 : offset.size.width;
      outTranslateX[uid] =
          Tween(
            begin: 0.0,
            end: -sw / 2 + offset.offset.dx + offset.size.width / 2,
          ).animate(
            CurvedAnimation(
              parent: outController!,
              curve: const Interval(0, 0.4, curve: Curves.linear),
            ),
          );
      outTranslateY[uid] =
          Tween(
            begin: 0.0,
            end: -sh / 2 + offset.offset.dy + offset.size.height / 2,
          ).animate(
            CurvedAnimation(
              parent: outController!,
              curve: const Interval(0, 0.4, curve: Curves.linear),
            ),
          );
      outScale[uid] = Tween(begin: 1.0, end: micW / _giftWidth).animate(
        CurvedAnimation(
          parent: outController!,
          curve: const Interval(0, 0.4, curve: Curves.linear),
        ),
      );
      outOpacity[uid] = Tween(begin: 1.0, end: 0.0).animate(
        CurvedAnimation(
          parent: outController!,
          curve: const Interval(0.4, 1, curve: Curves.decelerate),
        ),
      );
    }
  }

  void _onOutStatus(AnimationStatus status) {
    if (status == AnimationStatus.completed) onOutEnd();
  }

  /// joyride [_playInAnimationIfNeed]
  void _playInAnimationIfNeed() {
    if (config.showAnimation && inController != null) {
      giftStatus = RoomGiftPlayStatus.inAni;
      inController!.reset();
      inController!.forward(from: 0);
    } else {
      giftStatus = RoomGiftPlayStatus.ani;
    }
    update();
  }

  void startPlayPag() => pagKey.currentState?.start();

  /// joyride [onPagAnimEnd]
  void onPagAnimEnd() {
    _pagFallback?.cancel();
    if (config.showAnimation && outController != null) {
      giftStatus = RoomGiftPlayStatus.outAni;
      update();
      outController!.reset();
      outController!.forward();
    } else {
      _callBackIfNeed();
    }
  }

  /// joyride [onOutEnd]
  void onOutEnd() {
    if (config.showAnimation && config.micRes.isNotEmpty) {
      giftStatus = RoomGiftPlayStatus.micAni;
      update();
      // joyride 用 MultiFrameImage.onComplete；这里无帧序列，定时结束。
      _micTimer?.cancel();
      _micTimer = Timer(const Duration(milliseconds: 1200), _onEnd);
    } else {
      _onEnd();
    }
  }

  void _onEnd() {
    giftStatus = RoomGiftPlayStatus.wait;
    update();
    _callBackIfNeed();
  }
}

/// joyride [StayEndCurve]
class _StayEndCurve extends Curve {
  const _StayEndCurve(this.threshold);

  final double threshold;

  @override
  double transform(double t) {
    if (t <= threshold) return t / threshold;
    return 1;
  }
}
