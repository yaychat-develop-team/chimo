import '../../../app/app_jumper.dart';
import '../../../app/chimo_api.dart';
import '../../../common/extensions/wire_view.dart';
import '../../../common/models/server_client/user.pb.dart';
import '../../../common/state/async_list_logic.dart';
import '../../../common/utils/app_toast.dart';

/// Me → 访客：谁看过我的资料（`GET /user-relation/viewedBy`）。
///
/// 三件套（loading / 错误文案 / try-catch）在 [AsyncListLogic] 里，
/// 这里只剩「取哪个接口」和访客列表自己的两个动作。
class VisitsLogic extends AsyncListLogic<ViewedByItem> {
  @override
  Future<ApiResult<List<ViewedByItem>>> fetch() => ChimoApis.relation.viewedBy();

  @override
  String get failMessage => 'Failed to load visits';

  /// 删一条访问记录。返回错误文案，`null` = 删掉了（或页面已退，不用提示）。
  Future<String?> delete(ViewedByItem item) async {
    try {
      final res = await ChimoApis.relation.deleteVisitRecord(item.uid.toString());
      if (isClosed) return null;
      if (!res.ok) return res.message.isEmpty ? 'Delete failed' : res.message;
      items.removeWhere((e) => e.uid == item.uid);
      return null;
    } catch (error) {
      return isClosed ? null : 'Delete failed: $error';
    }
  }

  Future<void> remove(ViewedByItem item) async {
    final failure = await delete(item);
    if (isClosed || failure == null) return;
    AppToast.error(failure);
  }

  Future<void> open(ViewedByItem item) async {
    try {
      final profile = await profileFor(item);
      if (isClosed) return;
      await AppJumper.toProfile(profile.uid, preview: profile);
    } catch (error) {
      if (isClosed) return;
      AppToast.error('Open profile failed: $error');
    }
  }

  /// 点一行要开的资料。接口没给就拿列表里已有的字段兜底。
  Future<User> profileFor(ViewedByItem item) async {
    final res = await ChimoApis.user.profileByUidOrNull(item.uid.toString());
    return res.data ??
        (User()
          ..id = item.uid
          ..nickname = item.nickname.isEmpty ? 'User' : item.nickname
          ..avatar = item.avatar);
  }
}
