import '../../../common/models/server_client/room/base.pb.dart';
import '../http/api_result.dart';
import '../http/http.dart';

/// 房间模块相关接口。
class RoomApi {
  const RoomApi();

  /// 房间检查信息
  Future<ApiResult<RoomCheckItem>> check(int rid) {
    return Http.ins.getAndParse<RoomCheckItem>('/room/check/$rid');
  }

  /// 进入房间
  Future<ApiResult<void>> enterRoom(int rid, {String password = ''}) {
    return Http.ins.postAndParse(
      '/room/enter',
      data: {
        'rid': rid,
        if (password.isNotEmpty) 'password': password,
      },
    );
  }

  /// 离开房间
  Future<ApiResult<void>> leaveRoom(int rid) {
    return Http.ins.postAndParse(
      '/room/leave',
      data: {'rid': rid},
    );
  }
}
