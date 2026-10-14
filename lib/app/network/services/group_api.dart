import '../../../common/models/server_client/group/group.pb.dart';
import '../../../common/models/server_client/user.pb.dart';
import '../http/api_result.dart';
import '../http/http.dart';

/// 群组 / 部落相关接口。
class GroupApi {
  const GroupApi();

  Future<ApiResult<List<GroupInfo>>> list({int pageNum = 1, int pageSize = 10}) async {
    final res = await Http.ins.getAndParse<GroupListRsp>(
      '/chat/group/list',
      query: {'pageNum': '$pageNum', 'pageSize': '$pageSize'},
    );
    return res.map((data) => data.groupList);
  }

  /// 引导页行业列表（`/chat/group/getTypeList`）。
  Future<ApiResult<List<String>>> typeList() async {
    final res = await Http.ins.getAndParse<GroupTypeList>('/chat/group/getTypeList');
    return res.map(
      (data) => [
        for (final item in data.typeList)
          if (item.trim().isNotEmpty) item.trim(),
      ],
    );
  }

  /// 引导页 / 按部落类型筛选（`typeList`，逗号分隔；空表示全部）。
  Future<ApiResult<List<GroupInfo>>> listByType(String typeList) async {
    final res = await Http.ins.getAndParse<GroupListRsp>(
      '/chat/group/listByType',
      query: {'typeList': typeList},
    );
    return res.map((data) => data.groupList);
  }

  Future<ApiResult<List<GroupInfo>>> myGroups() async {
    final res = await Http.ins.getAndParse<GroupListRsp>('/chat/group/myGroups');
    return res.map((data) => data.groupList);
  }

  Future<ApiResult<GroupInfo>> detail(String gid) async {
    final res = await Http.ins.getAndParse<GroupInfo>('/chat/group/getDetail/$gid');
    return res;
  }

  Future<ApiResult<List<GroupPhoto>>> photos(String gid) async {
    final res = await Http.ins.getAndParse<GroupPhotoListRsp>('/chat/group/photoList/$gid');
    return res.map((data) => data.groupPhotoList);
  }

  Future<ApiResult<List<User>>> members(String gid, {String searchKey = ''}) async {
    final res = await Http.ins.getAndParse<UserListRsp>(
      '/chat/group/searchUsers/$gid',
      query: {'searchKey': searchKey},
    );
    return res.map((data) => data.userList);
  }

  Future<ApiResult<void>> join(List<String> gids) {
    return Http.ins.postAndParse(
      '/chat/group/join',
      data: {'emGroupIdList': gids},
    );
  }

  Future<ApiResult<void>> leave(String gid) {
    return Http.ins.postAndParse('/chat/group/leave/$gid');
  }
}
