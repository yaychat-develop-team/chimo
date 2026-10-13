import 'package:hive_ce_flutter/hive_flutter.dart';

import '../../common/utils/app_log.dart';

/// `session` box 的 AES-256 密钥。长度必须是 32。
const sessionCipherKey = <int>[
  162,
  191,
  69,
  209,
  74,
  147,
  166,
  135,
  59,
  206,
  147,
  5,
  85,
  75,
  206,
  44,
  79,
  205,
  177,
  49,
  106,
  74,
  167,
  106,
  176,
  0,
  35,
  102,
  139,
  7,
  163,
  148,
];

/// 本地存储唯一入口，也是全项目唯一 import hive 的地方。
///
/// 三个 box 按**生命周期**划分，不按业务模块划分：
///
/// | box | 内容 | 加密 | 何时清 |
/// |---|---|---|---|
/// | [settings] | 环境、代理、埋点 id、搜索历史 | 否 | 不清 |
/// | [user] | 登录态一份 JSON | AES-256 | 退出登录整箱 `clear()` |
/// | [cache] | 冷却时间戳等可丢数据 | 否 | 可随时清 |
///
/// 三个 getter 都是**可空**的：box 还没打开时返回 null 而不是抛异常，调用方用
/// `?.` / `??` 兜底。这样即使将来有人把 [init] 的位置挪错，表现是「读不到数据」
/// 而不是「App 起不来」。
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

  /// 可丢缓存。清掉只会让冷却重新计时。
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
  /// 走到这条路的情况：[StorageKeys.sessionCipherKey] 换过、文件损坏、
  /// 写入中途掉电。代价是本地数据丢失（`session` 丢了就是重新登录一次），
  /// 好过启动直接崩在 `openBox` 上。
  static Future<Box<Object?>> _open(String name, {HiveCipher? cipher}) async {
    try {
      return await Hive.openBox<Object?>(name, encryptionCipher: cipher);
    } catch (error, stack) {
      AppLog.w('AppStorage open $name failed, recreating', error: error, stack: stack);
      try {
        await Hive.deleteBoxFromDisk(name);
      } catch (_) {
        // 删不掉就算了：外层已经在「打不开就重建」的兜底路径上。
      }
      return Hive.openBox<Object?>(name, encryptionCipher: cipher);
    }
  }

  // /// 测试用：关掉三个 box 并清空静态引用，让下一次 [init] 从头来。
  // @visibleForTesting
  // static Future<void> reset() async {
  //   await Hive.close();
  //   _settings = null;
  //   _user = null;
  //   _cache = null;
  // }
}
