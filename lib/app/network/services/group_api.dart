import '../../../common/models/server_client/group/group.pb.dart';
import '../../../common/models/server_client/user.pb.dart';
import '../http/api_gateway.dart';
import '../http/api_result.dart';
import '../http/pb_specs.dart';
import '../network_bootstrap.dart';

/// 群组 / 部落相关接口。
class GroupApi {
  const GroupApi();

  Future<ApiResult<List<GroupInfo>>> list({int pageNum = 1, int pageSize = 10}) {
    return ApiGateway.request(
      () => NetworkBootstrap.client.get(
        '/chat/group/list',
        query: {'pageNum': '$pageNum', 'pageSize': '$pageSize'},
        unpack: PbSpecs.groupList,
      ),
      map: _groupList,
    );
  }

  /// 引导页行业列表（`/chat/group/getTypeList`）。
  Future<ApiResult<List<String>>> typeList() {
    return ApiGateway.request(
      () => NetworkBootstrap.client.get(
        '/chat/group/getTypeList',
        unpack: PbSpecs.groupTypes,
      ),
      map: (res) {
        final data = res.data;
        if (data is! GroupTypeList) return const [];
        return [
          for (final item in data.typeList)
            if (item.trim().isNotEmpty) item.trim(),
        ];
      },
    );
  }

  /// 引导页 / 按部落类型筛选（`typeList`，逗号分隔；空表示全部）。
  Future<ApiResult<List<GroupInfo>>> listByType(String typeList) {
    return ApiGateway.request(
      () => NetworkBootstrap.client.get(
        '/chat/group/listByType',
        query: {'typeList': typeList},
        unpack: PbSpecs.groupList,
      ),
      map: _groupList,
    );
  }

  Future<ApiResult<List<GroupInfo>>> myGroups() {
    return ApiGateway.request(
      () => NetworkBootstrap.client.get(
        '/chat/group/myGroups',
        unpack: PbSpecs.groupList,
      ),
      map: _groupList,
    );
  }

  Future<ApiResult<GroupInfo>> detail(String gid) {
    return ApiGateway.request(
      () => NetworkBootstrap.client.get(
        '/chat/group/getDetail/$gid',
        unpack: PbSpecs.groupDetail,
      ),
      map: (res) {
        final data = res.data;
        if (data is GroupInfo && (data.name.isNotEmpty || data.emGroupId.isNotEmpty)) {
          return data;
        }
        if (data is GroupListRsp && data.groupList.isNotEmpty) {
          return data.groupList.first;
        }
        throw StateError('Empty group detail');
      },
    );
  }

  Future<ApiResult<List<GroupPhoto>>> photos(String gid) {
    return ApiGateway.request(
      () => NetworkBootstrap.client.get(
        '/chat/group/photoList/$gid',
        unpack: PbSpecs.groupPhotos,
      ),
      map: (res) {
        final data = res.data;
        if (data is! GroupPhotoListRsp) return const [];
        return data.groupPhotoList;
      },
    );
  }

  Future<ApiResult<List<User>>> members(String gid, {String searchKey = ''}) {
    return ApiGateway.request(
      () => NetworkBootstrap.client.get(
        '/chat/group/searchUsers/$gid',
        query: {'searchKey': searchKey},
        unpack: PbSpecs.userList,
      ),
      map: (res) {
        final data = res.data;
        if (data is! UserListRsp) return const [];
        return data.userList;
      },
    );
  }

  Future<ApiResult<void>> join(List<String> gids) {
    return ApiGateway.action(
      () => NetworkBootstrap.client.post(
        '/chat/group/join',
        bizParam: {'emGroupIdList': gids},
      ),
    );
  }

  Future<ApiResult<void>> leave(String gid) {
    return ApiGateway.action(
      () => NetworkBootstrap.client.post('/chat/group/leave/$gid'),
    );
  }
}

List<GroupInfo> _groupList(dynamic res) {
  final data = res.data;
  if (data is! GroupListRsp) return const [];
  return data.groupList;
}
