import 'network/services/app_settings_api.dart';
import 'network/services/auth_api.dart';
import 'network/services/cash_api.dart';
import 'network/services/emote_api.dart';
import 'network/services/group_api.dart';
import 'network/services/relation_api.dart';
import 'network/services/report_api.dart';
import 'network/services/user_api.dart';

export 'network/http/api_result.dart';
export 'network/services/app_settings_api.dart';
export 'network/services/auth_api.dart';
export 'network/services/cash_api.dart';
export 'network/services/emote_api.dart';
export 'network/services/group_api.dart';
export 'network/services/relation_api.dart';
export 'network/services/report_api.dart';
export 'network/services/user_api.dart';

/// 各领域类型化 API 服务的静态门面。
///
/// 业务层优先使用 `AppApis.user.profile()`（类型化结果）。
abstract final class ChimoApis {
  static const auth = AuthApi();
  static const user = UserApi();
  static const relation = RelationApi();
  static const group = GroupApi();
  static const cash = CashApi();
  static const app = AppSettingsApi();
  static const emote = EmoteApi();
  static const report = ReportApi();
}
