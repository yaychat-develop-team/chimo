import 'dart:convert';

import 'package:chimo/common/utils/type_util.dart';
import 'package:protobuf/protobuf.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'app_log.dart';

abstract class CacheKeys {
  static const confRespKey = 'confRespKey';
  static const lastUserInfoKey = 'lastUserInfoKey';


  ///区域登录的缓存信息
  static String authInfoKey(String regionCode) {
    return 'authInfoKey$regionCode';
  }

}

abstract class CacheUtil {
  static late SharedPreferences _prefs;

  static Future init() async {
    _prefs = await SharedPreferences.getInstance();
  }


  /// 移除存储数据
  static Future<bool> removeObject(String key) => _prefs.remove(key);

  /// 全部清空
  static Future<void> clear() async {
    _prefs.clear();
  }

  static Future<bool> set(String key, String value) {
    return _prefs.setString(key, value);
  }

  static String get(String key, [String defaultValue = '']) {
    String? res = _prefs.getString(key);
    return res ?? defaultValue;
  }

  static int getInt(String key, [int defaultValue = 0]) {
    return _prefs.getInt(key)??defaultValue;
  }

  static Future<bool> setInt(String key, int value) {
    return _prefs.setInt(key, TypeUtil.parseInt(value));
  }

  static Future<bool> setBool(String key, bool value) {
    return _prefs.setBool(key, value);
  }

  static bool getBool(String key, [bool defaultValue = false]) {
    bool? value = _prefs.getBool(key);
    return value ?? defaultValue;
  }

  static delete(String key) {
    _prefs.remove(key);
  }

  /// 存储
  static saveObject(String key, Object? value) async {
    if (value != null) {
      String obj = json.encode(value);
      _prefs.setString(key, obj);
    }
  }

  /// 获取存储数据
  static getObject(String key) {
    String? value = _prefs.getString(key);
    if (value != null) {
      return json.decode(value);
    }
  }

  static Future<bool> savePb(String key, GeneratedMessage? data, {TypeRegistry? typeRegistry}) async {
    try {
      if(data == null) return false;
      typeRegistry ??= TypeRegistry([data]);
      Object? map = data.toProto3Json(typeRegistry: typeRegistry);
      await saveObject(key, map);
      return true;
    } catch (e) {
      AppLog.d('savePb == $e');
    }
    return false;
  }

  static T? getPb<T extends GeneratedMessage>(String key, T emptyMsg, {TypeRegistry? typeRegistry}) {
    try {
      typeRegistry ??= TypeRegistry([emptyMsg]);
      Object? cacheData =  getObject(key);
      if (cacheData != null) {
        emptyMsg.mergeFromProto3Json(cacheData, typeRegistry: typeRegistry, ignoreUnknownFields: true);
        return emptyMsg;
      }
    } catch (e) {
      AppLog.d('getPb == $e');
    }
    return null;
  }

}
