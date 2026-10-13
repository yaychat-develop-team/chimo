import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'log.dart';

/// 日志级别。数值越大越严重；低于 [AppLog.minLevel] 的直接丢弃。
enum AppLogLevel { debug, info, warn, error }

/// 全项目唯一的日志出口。
///
/// **不要再用 `print` / `debugPrint`**：两者在 release 包里都不会被剥掉，
/// 内容会写进 iOS 的 os_log 与 Android 的 logcat，任何拿到设备的人
/// （或连着 Mac 的 Console.app）都能读到手机号、验证码、token、环信密码。
/// [enabled] 默认跟着 [kReleaseMode] 关闭，release 包一行日志都不产出。
///
/// 敏感字段还有第二道防线：进 [sink] 的每一行 —— 消息、`body:`、`error:` ——
/// 都按字段名打过码，所以即使为了排查线上问题临时把 [enabled] 打开，
/// 明文也不会进系统日志。结构化的值请走 `body:` 而不是拼进消息：
/// 前者按字段名递归打码，最可靠；消息只能靠正则兜。
abstract final class AppLog {
  /// 总开关。release 包默认关闭 —— 这是本类存在的首要理由。
  static bool enabled = !kReleaseMode;

  /// 低于此级别的日志丢弃。
  static AppLogLevel minLevel = AppLogLevel.debug;

  /// 网络日志单独开关：它最吵，排查非网络问题时可以只关它。
  static bool netEnabled = true;

  /// 单条 body 打码后的最大长度，超出截断。
  /// **先打码再截断**，否则截断处可能留下半截 token。
  static int maxBodyLength = 1000;

  /// 输出目标。测试里替换成收集器即可断言，记得在 tearDown 里换回 [defaultSink]。
  ///
  /// 默认落到线上的 Talker（[logger]）。打码仍在进 sink 之前完成。
  static void Function(String line) sink = defaultSink;

  static void defaultSink(String line) {
    final talker = loggerOrNull;
    if (talker == null) {
      debugPrint(line);
      return;
    }
    talker.info(line);
  }

  /// 流程追踪：生命周期、SDK 状态。
  ///
  /// 允许带 [error] —— 「取不到就用默认值」这类可以忽略的异常（设备信息、
  /// 商店价格）记在 debug 级就够，塞进 warn 流会把真正要看的告警淹掉。
  static void d(
    String message, {
    Object? error,
    StackTrace? stack,
    Object? body,
  }) => _emit(
    AppLogLevel.debug,
    'D',
    message,
    body: body,
    error: error,
    stack: stack,
  );

  /// 有意义的状态变化：token 刷新、下单成功。
  static void i(
    String message, {
    Object? error,
    StackTrace? stack,
    Object? body,
  }) => _emit(
    AppLogLevel.info,
    'I',
    message,
    body: body,
    error: error,
    stack: stack,
  );

  /// 用户可能察觉的失败：发送失败、上传失败、播放失败。
  static void w(
    String message, {
    Object? error,
    StackTrace? stack,
    Object? body,
  }) => _emit(
    AppLogLevel.warn,
    'W',
    message,
    body: body,
    error: error,
    stack: stack,
  );

  /// 不该发生的失败：解析崩了、外部 SDK 回调异常。
  static void e(
    String message, {
    Object? error,
    StackTrace? stack,
    Object? body,
  }) => _emit(
    AppLogLevel.error,
    'E',
    message,
    body: body,
    error: error,
    stack: stack,
  );

  /// 网络请求 / 响应。[body] 一定要用这个参数传，不要拼进 [message]，
  /// 拼进去就绕过打码了。
  static void net(String message, {Object? body}) {
    if (!netEnabled) return;
    _emit(AppLogLevel.debug, 'NET', message, body: body);
  }

  static void _emit(
    AppLogLevel level,
    String label,
    String message, {
    Object? body,
    Object? error,
    StackTrace? stack,
  }) {
    if (!enabled) return;
    if (level.index < minLevel.index) return;
    // 消息也过一遍打码：100 多个调用点，靠「记得手动包一层」是守不住的，
    // 唯一能长期成立的不变式是「进 sink 的每一行都打过码」。
    final line = StringBuffer('[$label] ${_scrubText(message)}');
    if (body != null) line.write(' body=${_clip(redact(body))}');
    // error 是机器产生的、内容不可控（DioException 会带上 URI 与参数），
    // 所以同样过打码。
    if (error != null) line.write(' error=${_scrubText('$error')}');
    sink('$line');
    if (stack != null) sink('$stack');
  }

  static String _clip(String value) {
    if (value.length <= maxBodyLength) return value;
    return '${value.substring(0, maxBodyLength)}…(${value.length} chars)';
  }

  /// 把任意值转成「可以安全写进日志」的文本。
  ///
  /// Map / List 走结构化打码（按字段名，最可靠）；字符串先尝试当 JSON 解，
  /// 解不出来（比如被截断的响应体）再退化成正则打码。
  static String redact(Object? value) {
    if (value == null) return 'null';
    if (value is Map || value is List) return _encode(_scrub(value));
    final text = '$value';
    final head = text.trimLeft();
    if (head.startsWith('{') || head.startsWith('[')) {
      try {
        return _encode(_scrub(jsonDecode(text)));
      } on FormatException {
        // 不是合法 JSON，退化成正则。
      }
    }
    return _scrubText(text);
  }

  // Map 里可能塞着 File / MultipartFile 这类不可 JSON 化的值；
  // 字段名已经在 _scrub 里判过了，剩下的直接 toString 再过一遍正则。
  static String _encode(Object? node) =>
      jsonEncode(node, toEncodable: (Object? o) => _scrubText('$o'));

  /// 打码字段名（已归一化：小写、去掉下划线与连字符）。
  ///
  /// 只列「确定要遮」的；同族字段由 [_isSensitive] 的 password / pwd / token
  /// 子串规则兜住，免得新加一个 `imToken` 就漏出去。
  static const _sensitiveKeys = <String>{
    'token',
    'accesstoken',
    'refreshtoken',
    'idtoken',
    'identitytoken',
    'password',
    'empassword',
    'empwd',
    'pwd',
    'phone',
    'mobile',
    'phonenum',
    'phonenumber',
    'smscode',
    'verifycode',
    'email',
    'mac',
    'idfa',
  };

  static const _phoneKeys = <String>{
    'phone',
    'mobile',
    'phonenum',
    'phonenumber',
  };

  static Object? _scrub(Object? node) {
    if (node is Map) {
      return <String, Object?>{
        for (final entry in node.entries)
          '${entry.key}': _isSensitive('${entry.key}', entry.value)
              ? _mask('${entry.key}', entry.value)
              : _scrub(entry.value),
      };
    }
    if (node is List) return [for (final item in node) _scrub(item)];
    return node;
  }

  static bool _isSensitive(String key, Object? value) {
    // true / false / null 不可能是密钥，遮掉反而把 `hasToken=true` 这类
    // 有用的排查信号也弄没了。
    if (value == null || value is bool) return false;
    final k = _normalize(key);
    // 业务响应码也叫 code，但它是 int（`"code":200`）；
    // 短信 / 邮箱验证码是字符串（`"code":"123456"`）。一律打码会把响应码也遮掉，
    // 网络日志就没法排查了 —— 所以只遮字符串形态。
    if (k == 'code') return value is String;
    if (_sensitiveKeys.contains(k)) return true;
    return k.contains('password') || k.contains('pwd') || k.contains('token');
  }

  static String _normalize(String key) =>
      key.toLowerCase().replaceAll(_separatorPattern, '');

  static final _separatorPattern = RegExp(r'[_\-\s]');

  static String _mask(String key, Object? value) {
    if (_phoneKeys.contains(_normalize(key))) return _maskTail('$value');
    return '***';
  }

  /// 手机号保留后 4 位：排查「是不是这个号」够用，又拼不出完整号码。
  static String _maskTail(String value) {
    final digits = value.replaceAll(_nonDigitPattern, '');
    if (digits.length < 4) return '***';
    return '***${digits.substring(digits.length - 4)}';
  }

  static final _nonDigitPattern = RegExp(r'\D');

  // 结构化打码走不通时的退路（截断的响应体、异常的 toString）。
  // 覆盖 `token=abc`、`"token":"abc"`、`token: abc` 三种写法。
  static const _keyPattern =
      r'[A-Za-z_]*(?:password|pwd|token)[A-Za-z_]*'
      r'|phoneNumber|phoneNum|phone|mobile'
      r'|smsCode|verifyCode|email|idfa|mac';

  static final _pairPattern = RegExp(
    '("?)(?<![A-Za-z_])($_keyPattern)\\1\\s*([=:])\\s*(")?'
    '([^"\\s,;&}\\])]*)"?',
    caseSensitive: false,
  );

  // code 单独一条：只遮字符串形态的验证码，
  // 不动 `code=200` / `"code":200` 这类业务响应码（理由同 _isSensitive）。
  static final _codePattern = RegExp(r'"code"\s*:\s*"([^"]*)"?');

  static String _scrubText(String text) {
    final masked = text.replaceAllMapped(_pairPattern, (m) {
      final value = m[5] ?? '';
      // 同 _isSensitive：`hasToken=true`、`token=null` 保持原样。
      if (_harmlessValues.contains(value.toLowerCase())) return m[0]!;
      // 原样保留键的引号与分隔符，值的引号有则补回去，
      // 免得把 JSON 片段改成 `token=***` 这种看不出结构的样子。
      final quote = m[4] ?? '';
      return '${m[1]}${m[2]}${m[1]}${m[3]}$quote${_mask(m[2]!, value)}$quote';
    });
    return masked.replaceAll(_codePattern, '"code":"***"');
  }

  static const _harmlessValues = <String>{'', 'true', 'false', 'null'};
}
