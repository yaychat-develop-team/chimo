import 'dart:typed_data';

import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'pag_controller.dart';
import 'package:visibility_detector/visibility_detector.dart';

import 'constant.dart';

var _keyIndex = 0;

class PAGImageView extends StatefulWidget {
  double? width;
  double? height;

  /// 二进制动画数据
  Uint8List? bytesData;

  /// 网络资源，动画链接
  String? url;

  /// flutter动画资源路径
  String? assetName;

  /// asset package
  String? package;

  /// 备份资源
  String? backupResource;

  /// 初始化时播放进度
  double initProgress;

  /// 初始化后自动播放
  bool autoPlay;

  /// 循环次数
  int repeatCount;

  /// 初始化完成
  PAGInitCallback? onInit;

  /// 替换的文本集合
  List<String>? texts;

  /// 替换的文本颜色集合
  List<String>? textColors;

  /// 替换的图片集合，本地路径
  /// [todo] 后面支持在线路径
  List<String>? imgs;

  bool hybridComposition = true;

  /// Notifies the start of the animation.
  PAGCallback? onAnimationStart;

  /// Notifies the end of the animation.
  PAGCallback? onAnimationEnd;

  /// Notifies the cancellation of the animation.
  PAGCallback? onAnimationCancel;

  /// Notifies the repetition of the animation.
  PAGCallback? onAnimationRepeat;

  AssetBundle? bundle;

  bool visibilityPause;//不可见自动暂停 默认false

  String pagViewType = ViewTypes.PAG_IMAGE_VIEW;

  static const int REPEAT_COUNT_LOOP = -1; //无限循环
  static const int REPEAT_COUNT_DEFAULT = 1; //默认仅播放一次

  PAGImageView.network(
    this.url, {
    this.pagViewType = ViewTypes.PAG_IMAGE_VIEW,
    this.backupResource,
    this.width,
    this.height,
    this.repeatCount = REPEAT_COUNT_DEFAULT,
    this.initProgress = 0,
    this.autoPlay = false,
    this.texts,
    this.textColors,
    this.imgs,
    this.onInit,
    this.onAnimationStart,
    this.onAnimationEnd,
    this.onAnimationCancel,
    this.onAnimationRepeat,
    this.hybridComposition = true,
        this.visibilityPause = false,
    Key? key,
  }) : super(key: key);

  PAGImageView.asset(
    this.assetName, {
    this.bundle,
    this.pagViewType = ViewTypes.PAG_IMAGE_VIEW,
    this.backupResource,
    this.width,
    this.height,
    this.repeatCount = REPEAT_COUNT_DEFAULT,
    this.initProgress = 0,
    this.autoPlay = false,
    this.package,
    this.texts,
    this.textColors,
    this.imgs,
    this.onInit,
    this.onAnimationStart,
    this.onAnimationEnd,
    this.onAnimationCancel,
    this.onAnimationRepeat,
    this.hybridComposition = true,
        this.visibilityPause = false,
        Key? key,
  }) : super(key: key);

  PAGImageView.bytes(
    this.bytesData, {
    this.pagViewType = ViewTypes.PAG_IMAGE_VIEW,
    this.backupResource,
    this.width,
    this.height,
    this.repeatCount = REPEAT_COUNT_DEFAULT,
    this.initProgress = 0,
    this.autoPlay = false,
    this.texts,
    this.textColors,
    this.imgs,
    this.package,
    this.onInit,
    this.onAnimationStart,
    this.onAnimationEnd,
    this.onAnimationCancel,
    this.onAnimationRepeat,
    this.hybridComposition = true,
        this.visibilityPause = false,
        Key? key,
  }) : super(key: key);

  @override
  State<PAGImageView> createState() => PAGImageViewState();
}

const _viewType = 'plugins.yay.chat/pag_img_view';

class PAGImageViewState extends State<PAGImageView> {
  int? _textureId;

  PagController? _pagController;

  late AppLifecycleListener _appLifecycleListener;
  GlobalKey _visiKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    _appLifecycleListener = AppLifecycleListener(
      onDetach: () => _onAppLifecycleChanged("onDetach"),
      onHide: () => _onAppLifecycleChanged("onHide"),
      onInactive: () => _onAppLifecycleChanged("onInactive"),
      onPause: () => _onAppLifecycleChanged("onPause"),
      onRestart: () => _onAppLifecycleChanged("onRestart"),
      onResume: () => _onAppLifecycleChanged("onResume"),
      onShow: () => _onAppLifecycleChanged("onShow"),
    );
  }

  @override
  void didUpdateWidget(covariant PAGImageView oldWidget) {
    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    _appLifecycleListener.dispose();
    _pagController?.release();
    _pagController = null;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Widget? nativeView;
    if (defaultTargetPlatform == TargetPlatform.android) {
      final Map<String, dynamic> creationParams = <String, dynamic>{};

      if (widget.hybridComposition == false) {
        nativeView = AndroidView(
          viewType: _viewType,
          layoutDirection: TextDirection.ltr,
          creationParams: creationParams,
          creationParamsCodec: const StandardMessageCodec(),
          gestureRecognizers: const <Factory<OneSequenceGestureRecognizer>>{},
          onPlatformViewCreated: _onPlatformViewCreated,
        );
      } else {
        nativeView = PlatformViewLink(
          viewType: _viewType,
          surfaceFactory: (
            BuildContext context,
            PlatformViewController controller,
          ) {
            return AndroidViewSurface(
              controller: controller as AndroidViewController,
              gestureRecognizers: const <Factory<
                  OneSequenceGestureRecognizer>>{},
              hitTestBehavior: PlatformViewHitTestBehavior.opaque,
            );
          },
          onCreatePlatformView: (PlatformViewCreationParams params) {
            return PlatformViewsService.initSurfaceAndroidView(
              id: params.id,
              viewType: _viewType,
              layoutDirection: TextDirection.ltr,
              creationParams: creationParams,
              creationParamsCodec: const StandardMessageCodec(),
            )
              ..addOnPlatformViewCreatedListener(params.onPlatformViewCreated)
              ..addOnPlatformViewCreatedListener(_onPlatformViewCreated)
              ..create();
          },
        );
      }
    } else if (defaultTargetPlatform == TargetPlatform.iOS) {
      nativeView = UiKitView(
        layoutDirection: TextDirection.ltr,
        viewType: _viewType,
        onPlatformViewCreated: _onPlatformViewCreated,
      );
    }
    if (nativeView != null) {
      return LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            if(widget.visibilityPause){
              return Center(
                child: VisibilityDetector(
                  key: _visiKey,
                  onVisibilityChanged: _onVisibilityChanged,
                  child: SizedBox(
                    width: widget.width ?? constraints.constrainWidth(),
                    height: widget.height ?? constraints.constrainHeight(),
                    child: nativeView,
                  ),
                ),
              );
            }
        return SizedBox(
          width: widget.width ?? constraints.constrainWidth(),
          height: widget.height ?? constraints.constrainHeight(),
          child: nativeView,
        );
      });
    }
    return Text(
        '$defaultTargetPlatform platform version is not implemented yet.');
  }

  void _onPlatformViewCreated(int id) async {
    try {
      int repeatCount = widget.repeatCount <= 0 &&
              widget.repeatCount != PAGImageView.REPEAT_COUNT_LOOP
          ? PAGImageView.REPEAT_COUNT_DEFAULT
          : widget.repeatCount;
      double initProcess = widget.initProgress < 0 ? 0 : widget.initProgress;

      _pagController = PagController(viewType: widget.pagViewType, viewId: id);

      String? assetName = widget.assetName;
      String? url = widget.url;
      if (widget.bundle != null && assetName != null && assetName.isNotEmpty) {
        String assetsUrl = await widget.bundle!.loadString(assetName);
        if (assetsUrl.isNotEmpty) {
          url = assetsUrl;
          assetName = null;
        }
      }

      _textureId = await _pagController!.init({
        Params.AssetName: assetName,
        Params.Package: widget.package,
        Params.Url: url,
        Params.Bytes: widget.bytesData,
        Params.RepeatCount: repeatCount,
        Params.InitProgress: initProcess,
        Params.AutoPlay: widget.autoPlay,
        Params.Texts: widget.texts,
        Params.TextColors: widget.textColors,
        Params.Imgs: widget.imgs
      });
      if (_textureId != null && _textureId! >= 0) {
        var events = <String, PAGCallback?>{
          Event.Start: widget.onAnimationStart,
          Event.End: widget.onAnimationEnd,
          Event.Cancel: widget.onAnimationCancel,
          Event.Repeat: widget.onAnimationRepeat,
        };
        _pagController!.callbackHandler = (event) {
          events[event]?.call();
        };
      }
      widget.onInit?.call(pagController: _pagController!);
    } catch (e) {
      print(e);
    }
  }

  void _onVisibilityChanged(VisibilityInfo info) {
    var visiblePercentage = info.visibleFraction * 100;
    if (visiblePercentage > 90) {
      // 可见
      _pagController?.resume();
      print("PAGImageView:resume:visible $_textureId");
    } else {
      // 不可见
      _pagController?.pause();
      print("PAGImageView:pause:visible $_textureId");
    }
  }

  _onAppLifecycleChanged(String state) {
    switch (state) {
      case 'onPause':
        _pagController?.pause();
        print("PAGImageView:pause:LifecycleChanged $_textureId");
        break;
      case 'onResume':
        _pagController?.resume();
        print("PAGImageView:resume:LifecycleChanged $_textureId");
        break;
    }
  }
}
