import 'package:flutter/services.dart';

import 'constant.dart';

typedef PAGInitCallback = void Function({PagController pagController});

class PagController {
  final String viewType;

  final int viewId;

  final MethodChannel _channel;

  Function(String event)? _callbackHandler;

  bool _isPlaying = false;

  PagController({required this.viewType, required this.viewId})
      : _channel = MethodChannel('plugins/flutter_pag_${viewType}_${viewId}') {
    _channel.setMethodCallHandler(_handlerMethod);
  }

  set callbackHandler(Function(String event)? callbackHandler) {
    this._callbackHandler = callbackHandler;
  }

  Future<dynamic> _handlerMethod(MethodCall result) async {
    if (result.method == Event.Callback) {
      _callbackHandler?.call(result.arguments[Params.Event]);
    }
    return Future<dynamic>.value();
  }

  Future<int?> init(Map<String, dynamic> params) async {
    dynamic result = await _channel.invokeMethod(Methods.Init, params);
    if (result is Map) {
      return result[Params.TextureId];
    }
    return null;
  }

  /// 开始
  Future play() {
    if (_isPlaying) {
      return Future.value(true);
    }
    _isPlaying = true;
    return _channel.invokeMethod(Methods.Start);
  }

  /// 停止
  Future stop() {
    _isPlaying = false;
    return _channel.invokeMethod(Methods.Stop);
  }

  /// 暂停
  Future pause() {
    _isPlaying = false;
    return _channel.invokeMethod(Methods.Pause);
  }

  /// 恢复
  Future resume() {
    if (_isPlaying) {
      return Future.value(true);
    }
    _isPlaying = true;
    return _channel.invokeMethod(Methods.Resume);
  }

  /// 销毁
  Future release() async {
    _isPlaying = false;
    return _channel.invokeMethod(Methods.Release, {Params.TextureId: viewId});
  }

  /// 设置进度
  Future setProgress(double progress) {
    return _channel.invokeMethod(Methods.SetProgress,
        {Params.TextureId: viewId, Params.Progress: progress});
  }

  /// 获取某一位置的图层
  Future<List<String>> getLayersUnderPoint(double x, double y) async {
    return (await _channel.invokeMethod(Methods.GetPointLayer, {
      Params.TextureId: viewId,
      Params.PointX: x,
      Params.PointY: y
    }) as List)
        .map((e) => e.toString())
        .toList();
  }

  /// 获取可替换的文本数量
  Future<int?> getNumTexts() async {
    return _channel.invokeMethod(Methods.NumTexts, {Params.TextureId: viewId});
  }

  /// 获取可替换的图片数量
  Future<int?> getNumImgs() async {
    return _channel.invokeMethod(Methods.NumImages, {Params.TextureId: viewId});
  }

  /// 获取资源路径
  Future<String?> getPath() async {
    return _channel.invokeMethod(Methods.GetPath, {Params.TextureId: viewId});
  }

  /// 获取对应序号的文本内容
  Future<String?> getTextData(int index) async {
    return _channel.invokeMethod(
        Methods.GetTextData, {Params.TextureId: viewId, Params.Index: index});
  }
}
