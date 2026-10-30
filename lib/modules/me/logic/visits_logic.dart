import '../../../app/app_jumper.dart';
import '../../../app/chimo_api.dart';
import '../../../common/extensions/wire_view.dart';
import '../../../common/models/server_client/user.pb.dart';
import '../../../common/state/async_list_logic.dart';
import '../../../common/utils/app_toast.dart';

/// Me → 访客：谁看过我的资料（`GET /user-relation/viewedBy`）。
///
/// 三件套（loading / 错误文案 / try-catch）在 [AsyncListLogic] 里。
/// 这里只剩取数、打开资料和删除。
class VisitsLogic extends AsyncListLogic<ViewedByItem> {
  @override
  Future<ApiResult<List<ViewedByItem>>> fetch() =>
      ChimoApis.relation.viewedBy();

  @override
  String get failMessage => 'Failed to load visits';

  /// 删一条访问记录。失败 toast。
  Future<void> remove(ViewedByItem item) async {
    try {
      final res = await ChimoApis.relation.deleteVisitRecord(
        item.uid.toString(),
      );
      if (!res.ok) {
        AppToast.error(res.message.isEmpty ? 'Delete failed' : res.message);
        return;
      }
      items.removeWhere((e) => e.uid == item.uid);
    } catch (error) {
      AppToast.error('Delete failed: $error');
    }
  }

  Future<void> open(ViewedByItem item) async {
    try {
      final res = await ChimoApis.user.profileByUid(item.uid.toString());
      final profile =
          res.data?.user ??
          (User()
            ..id = item.uid
            ..nickname = item.nickname.isEmpty ? 'User' : item.nickname
            ..avatar = item.avatar);
      await AppJumper.toProfile(profile.uid, preview: profile);
    } catch (error) {
      AppToast.error('Open profile failed: $error');
    }
  }
}
