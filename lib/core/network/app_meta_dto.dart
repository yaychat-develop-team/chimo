import 'api_client.dart';

/// 来自 `/app/version-check` 的载荷。
class AppVersionInfo {
  const AppVersionInfo({
    required this.version,
    this.hasUpdate = false,
    this.websiteUrl = '',
  });

  final String version;
  final bool hasUpdate;
  final String websiteUrl;
}

abstract final class AppVersionDto {
  static AppVersionInfo parse(
    ApiResponse response, {
    required String fallbackVersion,
    required String fallbackWebsite,
  }) {
    var version = fallbackVersion;
    var website = fallbackWebsite;
    var hasUpdate = false;
    if (response.success && response.data is Map) {
      final data = Map<String, dynamic>.from(response.data as Map);
      final remote =
          '${data['version'] ?? data['latestVersion'] ?? data['appVersion'] ?? ''}';
      if (remote.isNotEmpty) version = remote;
      hasUpdate = data['needUpdate'] == true ||
          data['forceUpdate'] == true ||
          data['hasUpdate'] == true;
      final url =
          '${data['downloadUrl'] ?? data['url'] ?? data['h5Url'] ?? ''}';
      if (url.startsWith('http')) website = url;
    }
    return AppVersionInfo(
      version: version,
      hasUpdate: hasUpdate,
      websiteUrl: website,
    );
  }
}

/// 来自 `/app/settings` 的隐私 / 可见性开关。
class AppPrivacySettings {
  const AppPrivacySettings({
    this.isHidden = false,
    this.isInvisibleVisit = false,
    this.isInvisibleUpMic = false,
    this.blockStrangers = false,
  });

  final bool isHidden;
  final bool isInvisibleVisit;
  final bool isInvisibleUpMic;
  final bool blockStrangers;

  static AppPrivacySettings fromResponse(ApiResponse response) {
    if (!response.success || response.data is! Map) {
      return const AppPrivacySettings();
    }
    final data = Map<String, dynamic>.from(response.data as Map);
    final access = data['accessStrangerMessage'];
    return AppPrivacySettings(
      isHidden: data['isHidden'] == true,
      isInvisibleVisit: data['isInvisibleVisit'] == true,
      isInvisibleUpMic: data['isInvisibleUpMic'] == true,
      blockStrangers: access == false,
    );
  }
}

/// 宽松的 `/user/conf` map 辅助（IM appKey、官网 URL）。
abstract final class UserConfDto {
  static String? parseAppKey(Object? data) {
    if (data is! Map) return null;
    final map = Map<String, dynamic>.from(data);
    final im = map['imConfig'] ?? map['im'] ?? map['ImConfig'];
    if (im is Map) {
      final k = '${im['appKey'] ?? im['app_key'] ?? im['appId'] ?? ''}';
      if (k.isNotEmpty) return k;
    }
    final direct = '${map['appKey'] ?? map['imAppKey'] ?? ''}';
    return direct.isEmpty ? null : direct;
  }

  static String? parseWebsite(Object? data) {
    if (data is! Map) return null;
    final map = Map<String, dynamic>.from(data);
    for (final key in [
      'website',
      'webUrl',
      'h5Url',
      'h5Domain',
      'officialWebsite',
      'gsGuideUrl',
    ]) {
      final v = '${map[key] ?? ''}'.trim();
      if (v.startsWith('http')) return v;
    }
    return null;
  }
}

/// 登录 / 绑定邮箱成功载荷（token + ids）。
class AuthTokenPayload {
  const AuthTokenPayload({
    required this.token,
    this.userId = '',
    this.nickname = '',
    this.avatarUrl = '',
    this.emUsername = '',
    this.emPassword = '',
    this.raw = const {},
  });

  final String token;
  final String userId;
  final String nickname;
  final String avatarUrl;
  final String emUsername;
  final String emPassword;
  final Map<String, dynamic> raw;

  static AuthTokenPayload? fromResponse(ApiResponse response) {
    if (!response.success) return null;
    final data = response.data;
    if (data is! Map) return null;
    var map = Map<String, dynamic>.from(data);

    // 邮箱 / 第三方登录返回 ExternalAuthRsp：{ authed: AuthRsp }。
    // 短信登录则在顶层直接返回 AuthRsp 字段。
    final authed = map['authed'];
    if (authed is Map) {
      map = Map<String, dynamic>.from(authed);
    }

    final token = '${map['token'] ?? ''}'.trim();
    if (token.isEmpty) return null;
    return AuthTokenPayload(
      token: token,
      userId: '${map['userId'] ?? map['uid'] ?? map['id'] ?? ''}',
      nickname: '${map['nickname'] ?? map['nickName'] ?? ''}',
      avatarUrl: '${map['avatar'] ?? map['avatarUrl'] ?? ''}',
      emUsername: '${map['emUsername'] ?? map['emUserName'] ?? ''}',
      emPassword: '${map['emPwd'] ?? map['emPassword'] ?? ''}',
      raw: map,
    );
  }
}

/// 来自 `/auth/login-platforms` 的登录入口配置。
class LoginPlatformsConfig {
  const LoginPlatformsConfig({
    this.mainPlatforms = const [],
    this.subPlatforms = const [],
    this.raw = const {},
  });

  final List<String> mainPlatforms;
  final List<String> subPlatforms;
  final Map<String, dynamic> raw;

  static LoginPlatformsConfig? fromResponse(ApiResponse response) {
    if (!response.success || response.data is! Map) return null;
    final data = Map<String, dynamic>.from(response.data as Map);
    final normalized = <String>{
      ..._readPlatformList(data['mainPlatforms']),
      ..._readPlatformList(data['main_platforms']),
      ..._readPlatformList(data['platforms']),
    }.toList();
    final sub = <String>{
      ..._readPlatformList(data['subPlatforms']),
      ..._readPlatformList(data['sub_platforms']),
      ..._readPlatformList(data['otherPlatforms']),
    }.toList();
    return LoginPlatformsConfig(
      mainPlatforms: normalized,
      subPlatforms: sub,
      raw: data,
    );
  }

  bool supports(String platform) {
    final key = platform.trim().toLowerCase();
    return mainPlatforms.contains(key) || subPlatforms.contains(key);
  }

  static List<String> _readPlatformList(Object? value) {
    if (value is! List) return const [];
    return [
      for (final item in value)
        if ('$item'.trim().isNotEmpty) '$item'.trim().toLowerCase(),
    ];
  }
}

/// 来自 `/user/msg-user` 的简要用户（EM → 应用 uid / 头像）。
class MsgUserBrief {
  const MsgUserBrief({
    required this.id,
    this.nickname = '',
    this.avatarUrl = '',
    this.emUsername = '',
    this.isYourInBlackList = false,
    this.raw = const {},
  });

  final String id;
  final String nickname;
  final String avatarUrl;
  final String emUsername;

  /// 对方是否已将你拉黑（发消息会失败）。
  final bool isYourInBlackList;
  final Map<String, dynamic> raw;

  static bool _truthy(Object? v) =>
      v == true || v == 1 || '$v'.toLowerCase() == 'true';

  static MsgUserBrief? fromResponse(ApiResponse response) {
    if (!response.success || response.data is! Map) return null;
    final data = Map<String, dynamic>.from(response.data as Map);
    final user = data['user'];
    final map = user is Map
        ? Map<String, dynamic>.from(user)
        : data;
    final id = '${map['id'] ?? map['userId'] ?? ''}'.trim();
    return MsgUserBrief(
      id: id,
      nickname: '${map['nickname'] ?? map['nickName'] ?? ''}'.trim(),
      avatarUrl: '${map['avatar'] ?? ''}'.trim(),
      emUsername: '${map['emUsername'] ?? map['emUserName'] ?? ''}'.trim(),
      isYourInBlackList: _truthy(
        map['isYourInBlackList'] ??
            map['is_your_in_black_list'] ??
            data['isYourInBlackList'],
      ),
      raw: map,
    );
  }
}
