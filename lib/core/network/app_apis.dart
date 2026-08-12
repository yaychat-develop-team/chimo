import 'services/app_settings_api.dart';
import 'services/auth_api.dart';
import 'services/cash_api.dart';
import 'services/emote_api.dart';
import 'services/group_api.dart';
import 'services/relation_api.dart';
import 'services/user_api.dart';

export 'api_result.dart';
export 'app_meta_dto.dart';
export 'blacklist_dto.dart';
export 'cash_charge_dto.dart';
export 'cash_op_history_dto.dart';
export 'group_photo_dto.dart';
export 'services/app_settings_api.dart';
export 'services/auth_api.dart';
export 'services/cash_api.dart';
export 'services/emote_api.dart';
export 'services/group_api.dart';
export 'services/relation_api.dart';
export 'services/user_api.dart';

/// 各领域类型化 API 服务的静态门面。
///
/// 优先使用 `AppApis.user.profile()`，而非 `NetworkBootstrap.api.userInfo()`。
abstract final class AppApis {
  static const auth = AuthApi();
  static const user = UserApi();
  static const relation = RelationApi();
  static const group = GroupApi();
  static const cash = CashApi();
  static const app = AppSettingsApi();
  static const emote = EmoteApi();
}
