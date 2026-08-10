import '../../../features/me/data/user_dto.dart';
import '../../../features/me/models/me_models.dart';
import '../../../shared/models/chat_user_profile.dart';
import '../api_gateway.dart';
import '../api_result.dart';
import '../app_meta_dto.dart';
import '../network_bootstrap.dart';

/// 当前用户 / 资料相关接口。
class UserApi {
  const UserApi();

  Future<ApiResult<MeProfile>> profile() {
    return ApiGateway.request(
      () => NetworkBootstrap.api.userInfo(),
      map: (res) {
        final profile = UserDto.parseProfile(res);
        if (profile == null) throw StateError('Empty user profile');
        return profile;
      },
    );
  }

  Future<ApiResult<ChatUserProfile>> chatProfile() {
    return ApiGateway.request(
      () => NetworkBootstrap.api.userInfo(),
      map: (res) {
        final profile = UserDto.parseChatProfile(res);
        if (profile == null) throw StateError('Empty user profile');
        return profile;
      },
    );
  }

  Future<ApiResult<ChatUserProfile>> profileByUid(
    String uid, {
    int scene = 0,
  }) {
    return ApiGateway.request(
      () => NetworkBootstrap.api.userInfoByUid(uid, scene: scene),
      map: (res) {
        final profile = UserDto.parseChatProfile(res);
        if (profile == null) throw StateError('Empty user profile');
        return profile;
      },
    );
  }

  /// 软拉取资料——信封成功但 body 为空时返回 `ok` 且 data 为 null。
  Future<ApiResult<MeProfile?>> profileOrNull() {
    return ApiGateway.request(
      () => NetworkBootstrap.api.userInfo(),
      map: UserDto.parseProfile,
    );
  }

  Future<ApiResult<ChatUserProfile?>> profileByUidOrNull(
    String uid, {
    int scene = 0,
  }) {
    return ApiGateway.request(
      () => NetworkBootstrap.api.userInfoByUid(uid, scene: scene),
      map: UserDto.parseChatProfile,
    );
  }

  Future<ApiResult<void>> update(Map<String, dynamic> fields) {
    return ApiGateway.action(
      () => NetworkBootstrap.api.updateUserInfo(fields),
    );
  }

  Future<ApiResult<bool>> hasApplyForCancel() {
    return ApiGateway.request(
      () => NetworkBootstrap.api.accountSecurityInfo(),
      map: (res) {
        final data = res.data;
        if (data is! Map) return false;
        final map = Map<String, dynamic>.from(data);
        final raw = map['hasApplyForCancel'] ?? map['has_apply_for_cancel'];
        if (raw is bool) return raw;
        if (raw is num) return raw != 0;
        final text = '$raw'.trim().toLowerCase();
        return text == 'true' || text == '1';
      },
    );
  }

  Future<ApiResult<void>> cancelAccount({String code = ''}) {
    return ApiGateway.action(
      () => NetworkBootstrap.api.cancelAccount(code: code),
    );
  }

  Future<ApiResult<Map<String, dynamic>>> conf() {
    return ApiGateway.request(
      () => NetworkBootstrap.api.userConf(),
      map: (res) {
        final data = res.data;
        if (data is Map) return Map<String, dynamic>.from(data);
        return <String, dynamic>{};
      },
    );
  }

  Future<ApiResult<String>> imAppKey() {
    return ApiGateway.request(
      () => NetworkBootstrap.api.userConf(),
      map: (res) {
        final key = UserConfDto.parseAppKey(res.data);
        if (key == null || key.isEmpty) {
          throw StateError('imConfig.appKey missing from /user/conf');
        }
        return key;
      },
    );
  }

  Future<ApiResult<({String emUser, String emPwd, MeProfile profile})>>
      imCredentials() {
    return ApiGateway.request(
      () => NetworkBootstrap.api.userInfo(),
      map: (res) {
        final data = res.data;
        if (data is! Map) throw StateError('Empty user info');
        final root = Map<String, dynamic>.from(data);
        final user = root['user'] is Map
            ? Map<String, dynamic>.from(root['user'] as Map)
            : root;
        final emUser =
            '${user['emUsername'] ?? user['emUserName'] ?? ''}'.trim();
        final emPwd = '${user['emPwd'] ?? user['emPassword'] ?? ''}'.trim();
        if (emUser.isEmpty || emPwd.isEmpty) {
          throw StateError('EM credentials missing');
        }
        return (
          emUser: emUser,
          emPwd: emPwd,
          profile: UserDto.fromUserMap(user),
        );
      },
    );
  }
}
