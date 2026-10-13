import '../../../common/models/server_client/banner.pb.dart';
import '../../../common/models/server_client/cash.pb.dart';
import '../../../common/models/server_client/common/app.pb.dart';
import '../../../common/models/server_client/emote.pb.dart';
import '../../../common/models/server_client/group/group.pb.dart';
import '../../../common/models/server_client/home_page/home_page_main.pb.dart';
import '../../../common/models/server_client/login.pb.dart';
import '../../../common/models/server_client/user.pb.dart';
import 'pb_codec.dart';

/// 各接口 `BaseRsp.data` 对应的生成模型。
///
/// `fromBuffer` 带可选 ExtensionRegistry，不能直接当 tear-off 传给 [PbUnpack]。
abstract final class PbSpecs {
  static final userInfo = PbUnpack(
    UserInfoRsp(),
    (bytes) => UserInfoRsp.fromBuffer(bytes),
  );
  static final userList = PbUnpack(
    UserListRsp(),
    (bytes) => UserListRsp.fromBuffer(bytes),
  );
  static final makeFriendLabels = PbUnpack(
    MakeFriendLabelResp(),
    (bytes) => MakeFriendLabelResp.fromBuffer(bytes),
  );
  static final accountSecurity = PbUnpack(
    AccountSecurityInfoResp(),
    (bytes) => AccountSecurityInfoResp.fromBuffer(bytes),
  );
  static final conf = PbUnpack(
    ConfResp(),
    (bytes) => ConfResp.fromBuffer(bytes),
  );
  static final viewedBy = PbUnpack(
    ViewedByRsp(),
    (bytes) => ViewedByRsp.fromBuffer(bytes),
  );
  static final msgUser = PbUnpack(
    MsgListUserItem(),
    (bytes) => MsgListUserItem.fromBuffer(bytes),
  );
  static final blackList = PbUnpack(
    GetBlackListResp(),
    (bytes) => GetBlackListResp.fromBuffer(bytes),
  );
  static final search = PbUnpack(
    SearchResp(),
    (bytes) => SearchResp.fromBuffer(bytes),
  );
  static final userCash = PbUnpack(
    UserCash(),
    (bytes) => UserCash.fromBuffer(bytes),
  );
  static final cashGoods = PbUnpack(
    CashGoodsRsp(),
    (bytes) => CashGoodsRsp.fromBuffer(bytes),
  );
  static final chargeProducts = PbUnpack(
    CashChargeProductListRsp(),
    (bytes) => CashChargeProductListRsp.fromBuffer(bytes),
  );
  static final cashItem = PbUnpack(
    ItemInfoRsp(),
    (bytes) => ItemInfoRsp.fromBuffer(bytes),
  );
  static final chargeCreate = PbUnpack(
    CashChargeCreateRsp(),
    (bytes) => CashChargeCreateRsp.fromBuffer(bytes),
  );
  static final chargeCheck = PbUnpack(
    CashChargeCheckRsp(),
    (bytes) => CashChargeCheckRsp.fromBuffer(bytes),
  );
  static final cashHistory = PbUnpack(
    CashOpHistoryRsp(),
    (bytes) => CashOpHistoryRsp.fromBuffer(bytes),
  );
  static final groupList = PbUnpack(
    GroupListRsp(),
    (bytes) => GroupListRsp.fromBuffer(bytes),
  );
  static final groupDetail = PbUnpack(
    GroupInfo(),
    (bytes) => GroupInfo.fromBuffer(bytes),
  );
  static final groupTypes = PbUnpack(
    GroupTypeList(),
    (bytes) => GroupTypeList.fromBuffer(bytes),
  );
  static final groupPhotos = PbUnpack(
    GroupPhotoListRsp(),
    (bytes) => GroupPhotoListRsp.fromBuffer(bytes),
  );
  static final emotePacks = PbUnpack(
    EmoticonsListResp(),
    (bytes) => EmoticonsListResp.fromBuffer(bytes),
  );
  static final emoteItems = PbUnpack(
    EmoteItemList(),
    (bytes) => EmoteItemList.fromBuffer(bytes),
  );
  static final settings = PbUnpack(
    GetSettingsResp(),
    (bytes) => GetSettingsResp.fromBuffer(bytes),
  );
  static final version = PbUnpack(
    VersionUpdateData(),
    (bytes) => VersionUpdateData.fromBuffer(bytes),
  );
  static final banners = PbUnpack(
    BannerListResp(),
    (bytes) => BannerListResp.fromBuffer(bytes),
  );
  static final homeMain = PbUnpack(
    HomeMainData(),
    (bytes) => HomeMainData.fromBuffer(bytes),
  );
  static final auth = PbUnpack(AuthRsp(), (bytes) => AuthRsp.fromBuffer(bytes));
  static final externalAuth = PbUnpack(
    ExternalAuthRsp(),
    (bytes) => ExternalAuthRsp.fromBuffer(bytes),
  );
  static final loginPlatforms = PbUnpack(
    LoginPlatformsRsp(),
    (bytes) => LoginPlatformsRsp.fromBuffer(bytes),
  );
}
