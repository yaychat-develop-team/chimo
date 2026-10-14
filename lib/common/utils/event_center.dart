import 'dart:async';

import 'package:chimo/common/utils/app_log.dart';

/// 事件中心<br/>
/// Example:<br/>
/// ```dart
/// 注册单个事
/// StreamSubscription<Event> subscription = eventCenter.subscribe('my.event').listen((event) {
///   // use data
///   dynamic data = event.data; // Outputs event values: 'this is data!'
/// });
///
/// 注册多个事件
/// StreamSubscription<Event> subscription = eventCenter.subscribe(['my.event','my.event1']).listen((event) {
///   switch(event.name){
///     case 'my.event':
///       break;
///     case 'my.event1':
///       break;
///   }
/// });
///
/// 取消注册，一般在dispose或者其他地方
/// subscription.cancel();
///
/// 发布事件
/// eventCenter.emit(Event('my.event',data: 'this is data!'));
/// ```
class EventCenter {
  late StreamController<Event> _eventStream;

  EventCenter._() {
    _eventStream = StreamController.broadcast();
  }

  /// 注册单个事件<br/>
  /// [name] 事件名
  Stream<Event> subscribe(String name) =>
      _eventStream.stream.where((event) => event.name.toLowerCase() == name.toLowerCase());

  /// 注册多个事件<br/>
  /// [names] 事件名集合
  Stream<Event> subscribes(List<String> names) => _eventStream.stream.where(
    (event) => names.any((it) => it.toLowerCase() == event.name.toLowerCase()),
  );

  /// 发布事件<br/>
  /// [event] 事件数据
  void emit(Event event) {
    AppLog.d('EventCenter.emit${event.name}');
    _eventStream.add(event);
  }
}

/// 全局单独的一个对象
EventCenter eventCenter = EventCenter._();

/// 事件信息
class Event {
  final String name;
  final dynamic data;

  Event(this.name, {this.data});

  Map<String, dynamic> toJson() {
    // 如果 data 里还有复杂对象，需要递归处理
    dynamic safeData = _safeJson(data);
    return {'name': name, 'data': safeData};
  }

  // 推荐引入下面的 _safeJson 方法
  dynamic _safeJson(dynamic value) {
    if (value == null || value is String || value is num || value is bool) {
      return value;
    }
    if (value is Map) {
      return value.map((k, v) => MapEntry(k.toString(), _safeJson(v)));
    }
    if (value is Iterable) {
      return value.map(_safeJson).toList();
    }
    if (value is DateTime) {
      return value.toIso8601String();
    }
    if (value is Function) {
      return null;
    }
    return value.toString();
  }
}
