import 'package:dio/dio.dart';
import 'package:fixnum/fixnum.dart';

import '../../../common/models/server_client/couple.pb.dart';
import '../../../common/models/server_client/mass.pb.dart';
import '../../../common/models/server_client/rtc.pb.dart';
import '../../../common/models/server_client/user.pb.dart';
import '../../../common/constants/app_links.dart';
import '../http/api_result.dart';
import '../http/http.dart';

/// 21 日亲密之旅 / Romance 房接口。对齐 joyride `RomanceApi`。
class RomanceApi {
  const RomanceApi();

  static final _jsonBody = Options(
    headers: {Headers.contentTypeHeader: Headers.jsonContentType},
  );

  /// H5 任务页。对齐 joyride `UrlConfig.intimacyMission`。
  static String intimacyMissionUrl(String activityId) =>
      AppLinks.intimacyMission(activityId);

  /// 用户是否符合解锁条件。
  Future<ApiResult<ActiveCommonRsp>> checkActivity(int uid) {
    return Http.ins.getAndParse<ActiveCommonRsp>('/couple/check/$uid');
  }

  /// 活动基本信息（按对方 uid）。
  Future<ApiResult<ActivityBaseInfo>> activityBaseInfo(int uid) {
    return Http.ins.getAndParse<ActivityBaseInfo>('/couple/activity/info/$uid');
  }

  /// 领取活动奖励。
  Future<ApiResult<void>> receiveReward({
    required Int64 activityId,
    int level = 0,
  }) {
    return Http.ins.postAndParse(
      '/couple/receive/reward',
      data: RewardReceiveReq(activityId: activityId, level: level),
      options: _jsonBody,
    );
  }

  /// 是否已赠送活动礼物（资料卡快捷条）。
  Future<ApiResult<ActiveCommonRsp>> hasSendActiveGift(int uid) {
    return Http.ins.getAndParse<ActiveCommonRsp>('/couple/is_send/$uid');
  }

  /// 房间配单（邀请主播）。
  Future<ApiResult<void>> dispatchRoom(String rid) {
    return Http.ins.postAndParse('/mass/dispatch/$rid', options: _jsonBody);
  }

  /// GS 处理派单结果。`result`: 0 拒绝 / 1 接受。
  Future<ApiResult<void>> handleDispatch({
    required Int64 dispatchId,
    required int result,
  }) {
    return Http.ins.postAndParse(
      '/mass/handle/dispatch',
      data: HandleDispatchReq(dispatchId: dispatchId, result: result),
      options: _jsonBody,
    );
  }

  /// 自动搭讪。`inRoom`: 0 不在房 / 1 在房。
  Future<ApiResult<void>> autoStrike(int inRoom) {
    return Http.ins.getAndParse('/mass/auto/strike_up?in_room=$inRoom');
  }

  /// Romance 房抱上麦。
  Future<ApiResult<void>> grantUpMic({
    required int uid,
    required int position,
  }) {
    return Http.ins.postAndParse(
      '/mass/grant_up/mic',
      data: ChannelGrantUpMic(uid: Int64(uid), position: position),
      options: _jsonBody,
    );
  }

  /// 匹配翻牌 GS（备用；主路径靠 CMD `PICK_GS_CARD`）。
  Future<ApiResult<User>> matchChatGs() {
    return Http.ins.getAndParse<User>('/mass/match/chat/gs');
  }
}
