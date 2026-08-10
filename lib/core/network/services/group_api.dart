import '../../../features/home/data/group_member_dto.dart';
import '../../../shared/models/group_item.dart';
import '../../../shared/models/group_member.dart';
import '../api_gateway.dart';
import '../api_result.dart';
import '../group_dto.dart';
import '../group_photo_dto.dart';
import '../network_bootstrap.dart';

/// 群组 / 部落相关接口。
class GroupApi {
  const GroupApi();

  Future<ApiResult<List<PopularGroupItem>>> list({
    int pageNum = 1,
    int pageSize = 10,
  }) {
    return ApiGateway.request(
      () => NetworkBootstrap.api.groupList(
        pageNum: pageNum,
        pageSize: pageSize,
      ),
      map: GroupDto.parseList,
    );
  }

  /// 引导页 / 按部落类型筛选（`typeList`，逗号分隔；空表示全部）。
  Future<ApiResult<List<PopularGroupItem>>> listByType(String typeList) {
    return ApiGateway.request(
      () => NetworkBootstrap.api.groupListByType(typeList),
      map: GroupDto.parseList,
    );
  }

  Future<ApiResult<List<PopularGroupItem>>> myGroups() {
    return ApiGateway.request(
      () => NetworkBootstrap.api.myGroups(),
      map: GroupDto.parseList,
    );
  }

  Future<ApiResult<PopularGroupItem>> detail(String gid) {
    return ApiGateway.request(
      () => NetworkBootstrap.api.groupDetail(gid),
      map: (res) {
        final data = res.data;
        if (data is Map) {
          final nested = data['group'];
          if (nested is Map) {
            return GroupDto.fromMap(Map<String, dynamic>.from(nested));
          }
          final list = GroupDto.parseData(data);
          if (list.isNotEmpty) return list.first;
          if (data.containsKey('name') || data.containsKey('emGroupId')) {
            return GroupDto.fromMap(Map<String, dynamic>.from(data));
          }
        }
        throw StateError('Empty group detail');
      },
    );
  }

  Future<ApiResult<List<GroupPhotoSection>>> photos(String gid) {
    return ApiGateway.request(
      () => NetworkBootstrap.api.groupPhotos(gid),
      map: GroupPhotoDto.parseSections,
    );
  }

  Future<ApiResult<List<GroupMember>>> members(
    String gid, {
    String searchKey = '',
  }) {
    return ApiGateway.request(
      () => NetworkBootstrap.api.groupMembers(gid, searchKey: searchKey),
      map: GroupMemberDto.parseList,
    );
  }

  Future<ApiResult<void>> join(List<String> gids) {
    return ApiGateway.action(() => NetworkBootstrap.api.joinGroup(gids));
  }

  Future<ApiResult<void>> leave(String gid) {
    return ApiGateway.action(() => NetworkBootstrap.api.leaveGroup(gid));
  }
}
