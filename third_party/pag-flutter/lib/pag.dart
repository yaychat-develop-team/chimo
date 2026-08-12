import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:visibility_detector/visibility_detector.dart';
import 'constant.dart';

class PAGView extends StatefulWidget {
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
  PAGCallback? onInit;

  /// 替换的文本集合
  List<String>? texts;

  /// 替换的文本颜色集合
  List<String>? textColors;

  /// 替换的图片集合，本地路径
  /// [todo] 后面支持在线路径
  List<String>? imgs;

  /// Notifies the start of the animation.
  PAGCallback? onAnimationStart;

  /// Notifies the end of the animation.
  PAGCallback? onAnimationEnd;

  /// Notifies the cancellation of the animation.
  PAGCallback? onAnimationCancel;

  /// Notifies the repetition of the animation.
  PAGCallback? onAnimationRepeat;

  AssetBundle? bundle;

  static const int REPEAT_COUNT_LOOP = -1; //无限循环
  static const int REPEAT_COUNT_DEFAULT = 1; //默认仅播放一次

  PAGView.network(
    this.url, {
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
    Key? key,
  }) : super(key: key);

  PAGView.asset(
    this.assetName, {
    this.bundle,
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
    Key? key,
  }) : super(key: key);

  PAGView.bytes(
    this.bytesData, {
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
    Key? key,
  }) : super(key: key);

  @override
  PAGViewState createState() => PAGViewState();
}

class PAGViewState extends State<PAGView> {
  bool _hasLoadTexture = false;
  int _textureId = -1;

  double rawWidth = 0;
  double rawHeight = 0;

  double ratio = 0.5;

  String? _backupResource;

  bool _showBackupResource = false;

  // 原生接口
  static const String _nativeInit = 'initPag';
  static const String _nativeRelease = 'release';
  static const String _nativeStart = 'start';
  static const String _nativeStop = 'stop';
  static const String _nativePause = 'pause';
  static const String _nativeSetProgress = 'setProgress';
  static const String _nativeGetPointLayer = 'getLayersUnderPoint';
  static const String _nativeNumTexts = "numTexts";
  static const String _nativeNumImages = "numImages";
  static const String _nativeGetPath = "getPath";
  static const String _nativeGetTextData = "getTextData";
  static const String _nativeChangeText = 'changeText';

  // 参数
  static const String _argumentTextureId = 'textureId';
  static const String _argumentAssetName = 'assetName';
  static const String _argumentPackage = 'package';
  static const String _argumentUrl = 'url';
  static const String _argumentBytes = 'bytesData';
  static const String _argumentRepeatCount = 'repeatCount';
  static const String _argumentInitProgress = 'initProgress';
  static const String _argumentAutoPlay = 'autoPlay';
  static const String _argumentWidth = 'width';
  static const String _argumentHeight = 'height';
  static const String _argumentPointX = 'x';
  static const String _argumentPointY = 'y';
  static const String _argumentProgress = 'progress';
  static const String _argumentEvent = 'PAGEvent';
  static const String _argumentIndex = "index";
  static const String _argumentTexts = "texts";
  static const String _argumentTextColors = "textColors";
  static const String _argumentImgs = "imgs";

  // 监听该函数
  static const String _playCallback = 'PAGCallback';
  static const String _eventStart = 'onAnimationStart';
  static const String _eventEnd = 'onAnimationEnd';
  static const String _eventCancel = 'onAnimationCancel';
  static const String _eventRepeat = 'onAnimationRepeat';
  static const String _eventUpdate = 'onAnimationUpdate';

  // 回调监听
  static MethodChannel _channel = (const MethodChannel('flutter_pag_plugin')
    ..setMethodCallHandler((result) {
      if (result.method == _playCallback) {
        callbackHandlers[result.arguments[_argumentTextureId]]
            ?.call(result.arguments[_argumentEvent]);
      }

      return Future<dynamic>.value();
    }));

  static Map<int, Function(String event)?> callbackHandlers = {};

  late GlobalKey _visiKey;

  late AppLifecycleListener _appLifecycleListener;

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
    _init();
  }

  void _init() {
    if (Platform.isAndroid || Platform.isIOS) {
      _visiKey = GlobalKey();
      newTexture();
    } else {
      _showBackupResource = true;
      _backupResource = widget.backupResource;
      _initBackupResource();
    }
  }

  _reInit() async {
    await _release();

    _init();
  }

  @override
  void didUpdateWidget(covariant PAGView oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (_hasLoadTexture &&
        (oldWidget.assetName != widget.assetName ||
            oldWidget.url != widget.url)) {
      _reInit();
    }
  }

  // 初始化
  void newTexture() async {
    int repeatCount = widget.repeatCount <= 0 &&
            widget.repeatCount != PAGView.REPEAT_COUNT_LOOP
        ? PAGView.REPEAT_COUNT_DEFAULT
        : widget.repeatCount;
    double initProcess = widget.initProgress < 0 ? 0 : widget.initProgress;

    try {
      String? assetName = widget.assetName;
      String? url = widget.url;
      if (widget.bundle != null && assetName != null && assetName.isNotEmpty) {
        String assetsUrl = await widget.bundle!.loadString(assetName);
        if (assetsUrl.isNotEmpty) {
          url = assetsUrl;
          assetName = null;
        }
      }

      dynamic result = await _channel.invokeMethod(_nativeInit, {
        _argumentAssetName: assetName,
        _argumentPackage: widget.package,
        _argumentUrl: url,
        _argumentBytes: widget.bytesData,
        _argumentRepeatCount: repeatCount,
        _argumentInitProgress: initProcess,
        _argumentAutoPlay: widget.autoPlay,
        _argumentTexts: widget.texts,
        _argumentTextColors: widget.textColors,
        _argumentImgs: widget.imgs
      });
      if (!mounted) {
        if (result is Map) {
          final tid = result[_argumentTextureId];
          if (tid is int && tid >= 0) {
            _channel.invokeMethod(_nativeRelease, {_argumentTextureId: tid});
          }
        }
        return;
      }
      if (result is Map) {
        _textureId = result[_argumentTextureId];
        rawWidth = result[_argumentWidth] ?? 0;
        rawHeight = result[_argumentHeight] ?? 0;

        _calculateRatio();
      }
      if (mounted) {
        setState(() {
          _hasLoadTexture = true;
        });
        widget.onInit?.call();
      } else {
        _channel.invokeMethod(_nativeRelease, {_argumentTextureId: _textureId});
      }
    } catch (e) {
      print('PAGViewState error: $e');
    }

    // 事件回调
    if (_textureId >= 0) {
      var events = <String, PAGCallback?>{
        _eventStart: widget.onAnimationStart,
        _eventEnd: widget.onAnimationEnd,
        _eventCancel: widget.onAnimationCancel,
        _eventRepeat: widget.onAnimationRepeat,
      };
      callbackHandlers[_textureId] = (event) {
        events[event]?.call();
      };
    }
  }

  /// 开始
  void start() {
    if (!_hasLoadTexture) {
      return;
    }
    _channel.invokeMethod(_nativeStart, {_argumentTextureId: _textureId});
  }

  /// 停止
  void stop() {
    if (!_hasLoadTexture) {
      return;
    }
    _channel.invokeMethod(_nativeStop, {_argumentTextureId: _textureId});
  }

  /// 暂停
  void pause() {
    if (!_hasLoadTexture) {
      return;
    }
    print('pag----pause');
    _channel.invokeMethod(_nativePause, {_argumentTextureId: _textureId});
  }

  void resume() {
    if (!_hasLoadTexture) {
      return;
    }
    print('pag----resume');
    _channel.invokeMethod(Methods.Resume, {_argumentTextureId: _textureId});
  }

  /// 设置进度
  void setProgress(double progress) {
    if (!_hasLoadTexture) {
      return;
    }
    _channel.invokeMethod(_nativeSetProgress,
        {_argumentTextureId: _textureId, _argumentProgress: progress});
  }

  /// 获取某一位置的图层
  Future<List<String>> getLayersUnderPoint(double x, double y) async {
    if (!_hasLoadTexture) {
      return [];
    }
    return (await _channel.invokeMethod(_nativeGetPointLayer, {
      _argumentTextureId: _textureId,
      _argumentPointX: x,
      _argumentPointY: y
    }) as List)
        .map((e) => e.toString())
        .toList();
  }

  /// 获取可替换的文本数量
  Future<int?> getNumTexts() async {
    if (!_hasLoadTexture) {
      return 0;
    }
    return _channel
        .invokeMethod(_nativeNumTexts, {_argumentTextureId: _textureId});
  }

  /// 获取可替换的图片数量
  Future<int?> getNumImgs() async {
    if (!_hasLoadTexture) {
      return 0;
    }
    return _channel
        .invokeMethod(_nativeNumImages, {_argumentTextureId: _textureId});
  }

  /// 获取资源路径
  Future<String?> getPath() async {
    if (!_hasLoadTexture) {
      return "";
    }
    return _channel
        .invokeMethod(_nativeGetPath, {_argumentTextureId: _textureId});
  }

  /// 获取对应序号的文本内容
  Future<String?> getTextData(int index) async {
    if (!_hasLoadTexture) {
      return "";
    }
    return _channel.invokeMethod(_nativeGetTextData,
        {_argumentTextureId: _textureId, _argumentIndex: index});
  }

  Future changeTexts(List<String> texts) async {
    if (!_hasLoadTexture) {
      return "";
    }
    return _channel.invokeMethod(_nativeChangeText,
        {_argumentTextureId: _textureId, _argumentTexts: texts});
  }

  @override
  Widget build(BuildContext context) {
    if (_hasLoadTexture) {
      return Center(
        child: VisibilityDetector(
          key: _visiKey,
          onVisibilityChanged: _onVisibilityChanged,
          child: SizedBox(
            width: widget.width ?? (rawWidth * ratio),
            height: widget.height ?? (rawHeight * ratio),
            child: Texture(textureId: _textureId),
          ),
        ),
      );
    } else if (_showBackupResource) {
      return Center(
        child: SizedBox(
            width: widget.width ?? (rawWidth * ratio),
            height: widget.height ?? (rawHeight * ratio),
            child: Image.network(_backupResource ?? '', fit: BoxFit.contain)),
      );
    } else {
      return const SizedBox.shrink();
    }
  }

  @override
  void dispose() {
    _appLifecycleListener.dispose();
    _release();
    super.dispose();
  }

  /// 计算最合适的缩放比例
  void _calculateRatio() {
    // 已显式指定宽高时不需要 MediaQuery（避免异步回调里 context 已销毁）。
    if (widget.width != null && widget.height != null) {
      ratio = 1;
      return;
    }
    if (!mounted) return;
    Size size = MediaQuery.of(context).size;
    debugPrint(
        'calculateRatio:$size  widget.width:${widget.width} widget.height:${widget.height}  rawWidth:$rawWidth  rawHeight:$rawHeight ');
    if (rawHeight > 0 && rawWidth > 0) {
      double wRatio = size.width / rawWidth;
      double hRatio = size.height / rawHeight;
      // ratio = min(wRatio, hRatio);
      ratio = wRatio;
      debugPrint('calculateRatio:$wRatio  $hRatio  $ratio');
    }
  }

  void _initBackupResource() {
    if (widget.url != null && widget.url!.isNotEmpty) {
      _backupResource ??= widget.url!.replaceFirst('.pag', '.png');
    }
  }

  Future<void> _release() async {
    await _channel
        .invokeMethod(_nativeRelease, {_argumentTextureId: _textureId});
    callbackHandlers.remove(_textureId);
  }

  void _onVisibilityChanged(VisibilityInfo info) {
    var visiblePercentage = info.visibleFraction * 100;
    if (visiblePercentage > 90) {
      // 可见
      resume();
    } else {
      // 不可见
      pause();
    }
  }

  _onAppLifecycleChanged(String state) {
    switch (state) {
      case 'onPause':
        pause();
        break;
      case 'onResume':
        resume();
        break;
    }
  }
}
