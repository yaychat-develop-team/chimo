import 'dart:convert';

import 'package:hive_ce_flutter/hive_flutter.dart' hide TypeRegistry;
import 'package:protobuf/protobuf.dart';

import '../../common/utils/app_log.dart';

/// `user` box 的 AES-256 密钥。长度必须是 32。
const sessionCipherKey = <int>[
  162, 191, 69, 209, 74, 147, 166, 135, 59, 206, 147, 5, 85, 75, 206, 44,
  79, 205, 177, 49, 106, 74, 167, 106, 176, 0, 35, 102, 139, 7, 163, 148,
];

/// 本地存储 key。按 box 生命周期选用，不要散落业务字符串。
abstract final class StorageKeys {
  // —— settings（退出不清）——
  static const confResp = 'confRespKey';

  // —— user（登录态，退出 clear）——
  static const lastUserInfo = 'lastUserInfoKey';
  static String authInfo(String regionCode) => 'authInfoKey$regionCode';

  // —— cache（可丢）——
  static String userDaily(int uid, String type) {
    final now = DateTime.now();
    return 'userDailyKey_${uid}_${now.year}_${now.month}_${now.day}_$type';
  }

  static String romanceActivityHasShow(String tid) =>
      'romanceActivityHasShowKey_$tid';

  static String romanceActivitySuccessHasShow(String tid) =>
      'romanceActivitySuccessHasShowKey_$tid';

  static String giftWallCardEffect(int cardId) => 'gift_card_effect_shown_$cardId';
}

/// 本地存储唯一入口，也是全项目唯一 import hive 的地方。
///
/// | box | 内容 | 加密 | 何时清 |
/// |---|---|---|---|
/// | [settings] | 环境、代理、埋点 id、搜索历史、ConfResp | 否 | 不清 |
/// | [user] | AuthRsp / 最近 User | AES-256 | 退出登录整箱 `clear()` |
/// | [cache] | 冷却、弹窗 once、日计数 | 否 | 可随时清 |
abstract final class AppStorage {
  static const _settingKey = 'SETTING_KEY';
  static const _userKey = 'USER_KEY';
  static const _cacheKey = 'CACHE_KEY';

  static Box<Object?>? _settings;
  static Box<Object?>? _user;
  static Box<Object?>? _cache;

  /// 永久配置。退出登录不清。
  static Box<Object?>? get settings => _settings;

  /// 登录态。AES 加密，退出登录整箱清空。
  static Box<Object?>? get user => _user;

  /// 可丢缓存。清掉只会让冷却 / once 标记重置。
  static Box<Object?>? get cache => _cache;

  /// 三个 box 是否都已打开。
  static bool get ready => _settings != null && _user != null && _cache != null;

  /// 必须在 `main()` 里、且在任何一次取值之前 await。
  ///
  /// [directory] 只给测试用：`flutter test` 里没有 path_provider 平台通道，
  /// 走 `Hive.init(临时目录)` 而不是 `Hive.initFlutter()`。
  static Future<void> init({String? directory}) async {
    if (ready) return;
    if (directory == null) {
      await Hive.initFlutter('hive');
    } else {
      Hive.init(directory);
    }
    _settings = await _open(_settingKey);
    _user = await _open(_userKey, cipher: HiveAesCipher(sessionCipherKey));
    _cache = await _open(_cacheKey);
  }

  /// 打不开就删库重建。
  ///
  /// 常见原因：[sessionCipherKey] 换过、文件损坏、写入中途掉电。
  /// 代价是本地数据丢失（`user` 丢了就是重新登录一次）。
  static Future<Box<Object?>> _open(String name, {HiveCipher? cipher}) async {
    try {
      return await Hive.openBox<Object?>(name, encryptionCipher: cipher);
    } catch (error, stack) {
      AppLog.w('AppStorage open $name failed, recreating', error: error, stack: stack);
      try {
        await Hive.deleteBoxFromDisk(name);
      } catch (_) {}
      return Hive.openBox<Object?>(name, encryptionCipher: cipher);
    }
  }

  // —— 通用读写（box 未就绪时静默降级）——

  static Object? get(Box<Object?>? box, String key) => box?.get(key);

  static Future<void> put(Box<Object?>? box, String key, Object? value) async {
    if (box == null) return;
    if (value == null) {
      await box.delete(key);
    } else {
      await box.put(key, value);
    }
  }

  static Future<void> remove(Box<Object?>? box, String key) async {
    await box?.delete(key);
  }

  static bool getBool(Box<Object?>? box, String key, [bool defaultValue = false]) {
    final value = box?.get(key);
    return value is bool ? value : defaultValue;
  }

  static Future<void> setBool(Box<Object?>? box, String key, bool value) {
    return put(box, key, value);
  }

  static int getInt(Box<Object?>? box, String key, [int defaultValue = 0]) {
    final value = box?.get(key);
    if (value is int) return value;
    if (value is num) return value.toInt();
    return defaultValue;
  }

  static Future<void> setInt(Box<Object?>? box, String key, int value) {
    return put(box, key, value);
  }

  /// Protobuf 以 proto3 JSON 字符串落盘，跨版本更稳。
  static Future<bool> savePb(
    Box<Object?>? box,
    String key,
    GeneratedMessage? data, {
    TypeRegistry? typeRegistry,
  }) async {
    if (box == null || data == null) return false;
    try {
      typeRegistry ??= TypeRegistry([data]);
      final map = data.toProto3Json(typeRegistry: typeRegistry);
      await box.put(key, jsonEncode(map));
      return true;
    } catch (error) {
      AppLog.d('AppStorage.savePb failed', error: error);
      return false;
    }
  }

  static T? getPb<T extends GeneratedMessage>(
    Box<Object?>? box,
    String key,
    T emptyMsg, {
    TypeRegistry? typeRegistry,
  }) {
    try {
      final raw = box?.get(key);
      if (raw is! String || raw.isEmpty) return null;
      typeRegistry ??= TypeRegistry([emptyMsg]);
      emptyMsg.mergeFromProto3Json(
        jsonDecode(raw),
        typeRegistry: typeRegistry,
        ignoreUnknownFields: true,
      );
      return emptyMsg;
    } catch (error) {
      AppLog.d('AppStorage.getPb failed', error: error);
      return null;
    }
  }
}
