import 'dart:async';
import 'dart:convert';

import 'app_storage.dart';
import '../../common/utils/app_log.dart';

/// 本地登录会话。整份序列化成 JSON 放在 [AppStorage.user]。
///
/// [read] 同步：box 在 `main()` 里打开，解析结果留在内存。
/// [update] 在上一笔写入完成后再改，避免 token 刷新和资料保存互相覆盖。
class UserStore {
  const UserStore({
    this.loggedIn = false,
    this.onboardingCompleted = false,
    this.method,
    this.phone,
    this.email,
    this.token,
    this.userId,
    this.nickname,
    this.avatarUrl,
    this.gender,
    this.birthday,
    this.emUsername,
    this.emPassword,
  });

  final bool loggedIn;
  final bool onboardingCompleted;
  final String? method;
  final String? phone;
  final String? email;
  final String? token;
  final String? userId;
  final String? nickname;
  final String? avatarUrl;
  final String? gender;
  final String? birthday;
  final String? emUsername;
  final String? emPassword;

  static const _key = 'CURRENT_USER_KEY';

  static UserStore? _memory;
  static Future<void> _tail = Future<void>.value();

  bool get isLoggedIn => loggedIn && (token?.isNotEmpty ?? false);

  /// 当 [otherId] 为当前登录用户时为 true（群成员、搜索命中等）。
  bool isCurrentUser(String? otherId) {
    final a = (otherId ?? '').trim();
    if (a.isEmpty) return false;
    final me = userId;
    if (me == null || me.isEmpty) return false;
    return me == a;
  }

  Map<String, dynamic> toJson() => {
    'loggedIn': loggedIn,
    'onboardingCompleted': onboardingCompleted,
    if (method != null) 'method': method,
    if (phone != null) 'phone': phone,
    if (email != null) 'email': email,
    if (token != null) 'token': token,
    if (userId != null) 'userId': userId,
    if (nickname != null) 'nickname': nickname,
    if (avatarUrl != null) 'avatarUrl': avatarUrl,
    if (gender != null) 'gender': gender,
    if (birthday != null) 'birthday': birthday,
    if (emUsername != null) 'emUsername': emUsername,
    if (emPassword != null) 'emPassword': emPassword,
  };

  factory UserStore.fromJson(Map<String, dynamic> json) {
    return UserStore(
      loggedIn: json['loggedIn'] == true,
      onboardingCompleted: json['onboardingCompleted'] == true,
      method: _text(json['method']),
      phone: _text(json['phone']),
      email: _text(json['email']),
      token: _text(json['token']),
      userId: _loose(json['userId']),
      nickname: _text(json['nickname']),
      avatarUrl: _text(json['avatarUrl']),
      gender: _gender(json['gender']),
      birthday: _text(json['birthday']),
      emUsername: _loose(json['emUsername']),
      emPassword: _loose(json['emPassword']),
    );
  }

  /// 只改传入的非空字段。[loggedIn] 省略时记为已登录。
  ///
  /// 性别传入空串、`unknown`、`0` 时清空。token 带来的 uid 会补进 [userId]。
  UserStore patch({
    bool? loggedIn,
    bool? onboardingCompleted,
    String? method,
    String? phone,
    String? email,
    String? token,
    String? userId,
    String? nickname,
    String? avatarUrl,
    String? gender,
    String? birthday,
    String? emUsername,
    String? emPassword,
  }) {
    final nextToken = _prefer(token, this.token);
    var nextUserId = _prefer(userId, this.userId);
    if (token != null && token.trim().isNotEmpty) {
      nextUserId ??= userIdFromJwt(nextToken!);
    }
    return UserStore(
      loggedIn: loggedIn ?? true,
      onboardingCompleted: onboardingCompleted ?? this.onboardingCompleted,
      method: _prefer(method, this.method),
      phone: _prefer(phone, this.phone),
      email: _prefer(email, this.email),
      token: nextToken,
      userId: nextUserId,
      nickname: _prefer(nickname, this.nickname),
      avatarUrl: _prefer(avatarUrl, this.avatarUrl),
      gender: gender == null ? this.gender : _gender(gender),
      birthday: _prefer(birthday, this.birthday),
      emUsername: _prefer(emUsername, this.emUsername),
      emPassword: _prefer(emPassword, this.emPassword),
    );
  }

  static UserStore get currentUser => _read();

  static UserStore _read() {
    final existing = _memory;
    if (existing != null) return existing;

    final box = AppStorage.user;
    if (box == null) {
      _memory = const UserStore();
      return _memory!;
    }

    final raw = box.get(_key);
    final loaded = raw is String && raw.isNotEmpty ? _decode(raw) : const UserStore();
    final healed = _withJwtUserId(loaded);
    _memory = healed;
    if (healed.userId != loaded.userId) {
      unawaited(_enqueue(() => _persist(_memory!)));
    }
    return healed;
  }

  /// 基于当前缓存改一版再整份落盘。
  static Future<void> update(UserStore Function(UserStore current) change) {
    return _enqueue(() async {
      final next = change(_read());
      await _persist(next);
    });
  }

  /// 记住邮箱，不改变登录标记。
  static Future<void> rememberEmail(String email) {
    final trimmed = email.trim();
    if (trimmed.isEmpty) return Future<void>.value();
    return update((cache) => cache.patch(email: trimmed, loggedIn: cache.loggedIn));
  }

  /// 引导完成或跳过。下次冷启动不再强制完善资料。
  static Future<void> markOnboardingCompleted() {
    return update((cache) => cache.patch(loggedIn: true, onboardingCompleted: true));
  }

  /// 退出登录：整箱清空。`settings` / `cache` 两个 box 不受影响。
  static Future<void> clear() {
    return _enqueue(() async {
      _memory = const UserStore();
      final box = AppStorage.user;
      if (box == null) return;
      try {
        await box.clear();
      } catch (error, stack) {
        AppLog.e('UserCache clear failed', error: error, stack: stack);
      }
    });
  }

  /// 尽力从 JWT 解析 uid（forya token 把 `uid` 放在 protected header）。
  static String? userIdFromJwt(String token) {
    try {
      final parts = token.split('.');
      if (parts.length < 2) return null;
      for (final part in parts.take(2)) {
        final normalized = base64Url.normalize(part);
        final decoded = utf8.decode(base64Url.decode(normalized));
        final json = jsonDecode(decoded);
        if (json is! Map) continue;
        final uid = json['uid'] ?? json['userId'] ?? json['id'];
        if (uid == null) continue;
        final text = '$uid'.trim();
        if (text.isNotEmpty && text != 'null') return text;
      }
    } catch (_) {
      // JWT 结构不合预期（换过签发方式 / 手工改过 token）：当作没有 uid，
      // 由调用方走「取不到 uid」的分支，不影响登录态本身。
    }
    return null;
  }

  static UserStore _withJwtUserId(UserStore cache) {
    if (cache.userId != null && cache.userId!.isNotEmpty) return cache;
    final token = cache.token;
    if (token == null || token.isEmpty) return cache;
    final uid = userIdFromJwt(token);
    if (uid == null) return cache;
    return cache.patch(userId: uid, loggedIn: cache.loggedIn);
  }

  static UserStore _decode(String raw) {
    try {
      final json = jsonDecode(raw);
      if (json is Map) {
        return UserStore.fromJson(Map<String, dynamic>.from(json));
      }
    } catch (error, stack) {
      AppLog.e('UserCache decode failed', error: error, stack: stack);
    }
    return const UserStore();
  }

  static Future<void> _persist(UserStore value) async {
    _memory = value;
    final box = AppStorage.user;
    if (box == null) {
      AppLog.e('UserCache write dropped, box not open');
      return;
    }
    await box.put(_key, jsonEncode(value.toJson()));
  }

  static Future<void> _enqueue(Future<void> Function() action) {
    final result = _tail.then((_) => action());
    _tail = result.then((_) {}, onError: (_, _) {});
    return result;
  }
}

String? _text(Object? value) => value is String && value.isNotEmpty ? value : null;

String? _loose(Object? value) {
  if (value is String && value.isNotEmpty) return value;
  final text = value == null ? '' : '$value'.trim();
  return text.isEmpty || text == 'null' ? null : text;
}

String? _gender(Object? value) {
  if (value is! String) return null;
  final g = value.trim();
  return g.isEmpty || g == 'null' || g.toLowerCase() == 'unknown' || g == '0' ? null : g;
}

String? _prefer(String? incoming, String? current) {
  if (incoming == null) return current;
  final text = incoming.trim();
  if (text.isEmpty || text == 'null') return current;
  return text;
}
