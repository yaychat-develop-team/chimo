import 'package:dio/dio.dart';
import 'package:fixnum/fixnum.dart';

import '../../../common/models/server_client/heart_link.pb.dart';
import '../../../common/models/server_client/user.pb.dart';
import '../http/api_result.dart';
import '../http/http.dart';

/// Heart Link 接口。对齐 joyride `HeartLinkApi`。
class HeartLinkApi {
  const HeartLinkApi();

  static final _jsonBody = Options(
    headers: {Headers.contentTypeHeader: Headers.jsonContentType},
  );

  Future<ApiResult<HeartiesBaseRsp>> getHeartiesIdList() {
    return Http.ins.getAndParse<HeartiesBaseRsp>('/heart_link/getHeartiesIdList');
  }

  Future<ApiResult<HeartiesBaseRsp>> inviteResult({
    required int rid,
    required int result,
  }) {
    return Http.ins.postAndParse<HeartiesBaseRsp>(
      '/heart_link/invite/result',
      data: UpdateInviteResultReq(channelId: Int64(rid), inviteResult: result),
      options: _jsonBody,
    );
  }

  Future<ApiResult<HeartLinkUserInfoRsp>> queryRoomUser(int rid) {
    return Http.ins.getAndParse<HeartLinkUserInfoRsp>(
      '/heart_link/queryRoomUser?channelId=$rid',
    );
  }

  Future<ApiResult<HeartLinkUserListRsp>> listGsPool() {
    return Http.ins.getAndParse<HeartLinkUserListRsp>('/heart_link/listGsPool');
  }

  Future<ApiResult<UserListRsp>> searchGs(String searchKey) {
    return Http.ins.getAndParse<UserListRsp>(
      '/user/search',
      query: {'searchKey': searchKey, 'type': 'GS'},
    );
  }

  Future<ApiResult<void>> saveGsPool(List<Int64> gsIds) {
    return Http.ins.postAndParse(
      '/heart_link/saveGsPool',
      data: GsPoolSaveReq(gsId: gsIds),
      options: _jsonBody,
    );
  }

  Future<ApiResult<void>> inviteGsJoin({required int rid, required int uid}) {
    return Http.ins.postAndParse(
      '/heart_link/inviteGsJoin',
      data: HeartLinkInviteReq(channelId: Int64(rid), uid: Int64(uid)),
      options: _jsonBody,
    );
  }

  Future<ApiResult<void>> createPrivateRoom({
    required int rid,
    required int uid1,
    required int uid2,
  }) {
    return Http.ins.postAndParse(
      '/heart_link/createPrivateRoom',
      data: CreatePrivateRoomReq(
        channelId: Int64(rid),
        userId1: Int64(uid1),
        userId2: Int64(uid2),
      ),
      options: _jsonBody,
    );
  }

  Future<ApiResult<void>> inviteViewCard({required int rid, required int gsId}) {
    return Http.ins.postAndParse(
      '/heart_link/inviteViewCard',
      data: InviteViewCardReq(channelId: Int64(rid), gsId: Int64(gsId)),
      options: _jsonBody,
    );
  }

  Future<ApiResult<void>> unlock({required int rid, required int gsId}) {
    return Http.ins.postAndParse(
      '/heart_link/unlock',
      data: HeartLinkCardUnlockReq(channelId: Int64(rid), gsId: Int64(gsId)),
      options: _jsonBody,
    );
  }

  Future<ApiResult<HeartiesQueryRsp>> getHearties(int uid) {
    return Http.ins.getAndParse<HeartiesQueryRsp>('/heart_link/getHearties?uid=$uid');
  }

  Future<ApiResult<HeartfeltWordsRsp>> heartfeltWords() {
    return Http.ins.getAndParse<HeartfeltWordsRsp>('/heart_link/query/heartfeltWords');
  }

  Future<ApiResult<HeartLinkCard>> queryInfo(int gsId) {
    return Http.ins.getAndParse<HeartLinkCard>(
      '/heart_link/queryInfo',
      query: {'gsId': gsId},
    );
  }

  Future<ApiResult<HeartLinkCard>> queryApply() {
    return Http.ins.getAndParse<HeartLinkCard>('/heart_link/queryApply');
  }

  Future<ApiResult<HeartLinkBaseRsp>> hasUnlock(int gsId) {
    return Http.ins.getAndParse<HeartLinkBaseRsp>(
      '/heart_link/hasUnlock',
      query: {'gsId': gsId},
    );
  }

  Future<ApiResult<HeartLinkUserListRsp>> queryCommonGs() {
    return Http.ins.getAndParse<HeartLinkUserListRsp>('/heart_link/queryCommonGs');
  }

  Future<ApiResult<void>> submit(HeartLinkCardSaveReq req) {
    return Http.ins.postAndParse(
      '/heart_link/submit',
      data: req,
      options: _jsonBody,
    );
  }

  Future<ApiResult<void>> viewCard(int rid) {
    return Http.ins.getAndParse('/heart_link/view/heartLinkCard?channelId=$rid');
  }

  Future<ApiResult<void>> chooseHeartfelt({
    required int rid,
    required int questionId,
    required String answer,
  }) {
    return Http.ins.postAndParse(
      '/heart_link/heartfelt/choose',
      data: HeartfeltWordReq(
        channelId: Int64(rid),
        questionId: questionId,
        answer: answer,
      ),
      options: _jsonBody,
    );
  }
}
