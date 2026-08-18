import 'package:fixnum/fixnum.dart';
import 'package:protobuf/protobuf.dart' as pb;
import 'package:protobuf/well_known_types/google/protobuf/any.pb.dart';

import '../api_client.dart';

/// 对齐 forya `base.BaseRsp` + `user.UserListRsp`（仅关系列表需要的字段）。
/// JSON Accept 下 `/user-relation/search-fans` 会 System error，必须走 protobuf。
abstract final class RelationListProto {
  static ApiResponse decode(List<int> bytes) {
    final envelope = _BaseRsp.fromBuffer(bytes);
    if (!envelope.success) {
      return ApiResponse(
        success: false,
        code: envelope.code,
        message: envelope.message.isEmpty ? 'System error.' : envelope.message,
        raw: {'code': envelope.code, 'message': envelope.message},
      );
    }
    if (!envelope.hasData || envelope.data.value.isEmpty) {
      return ApiResponse(
        success: true,
        code: envelope.code,
        message: envelope.message,
        data: const {'userList': <Map<String, dynamic>>[]},
        raw: const {},
      );
    }
    final typeUrl = envelope.data.typeUrl;
    if (typeUrl.contains('UserInfoRsp')) {
      final info = _UserInfoRsp.fromBuffer(envelope.data.value);
      final user = info.hasUser ? info.user.toJsonMap() : const <String, dynamic>{};
      return ApiResponse(
        success: true,
        code: envelope.code,
        message: envelope.message,
        data: {'user': user},
        raw: const {},
      );
    }
    final list = _UserListRsp.fromBuffer(envelope.data.value);
    return ApiResponse(
      success: true,
      code: envelope.code,
      message: envelope.message,
      data: {
        'userList': [
          for (final u in list.userList) u.toJsonMap(),
        ],
      },
      raw: const {},
    );
  }
}

class _BaseRsp extends pb.GeneratedMessage {
  factory _BaseRsp.fromBuffer(List<int> data) =>
      create()..mergeFromBuffer(data);

  _BaseRsp._();

  static final pb.BuilderInfo _i = pb.BuilderInfo(
    'BaseRsp',
    package: const pb.PackageName('base'),
    createEmptyInstance: create,
  )
    ..aOB(1, 'success')
    ..aI(2, 'code', fieldType: pb.PbFieldType.OU3)
    ..aOS(3, 'message')
    ..a<Int64>(
      4,
      'sysTime',
      pb.PbFieldType.OU6,
      defaultOrMaker: Int64.ZERO,
    )
    ..aOM<Any>(5, 'data', subBuilder: Any.create)
    ..hasRequiredFields = false;

  @override
  pb.BuilderInfo get info_ => _i;

  static _BaseRsp create() => _BaseRsp._();

  @override
  _BaseRsp createEmptyInstance() => create();

  @override
  _BaseRsp clone() => deepCopy();

  bool get success => $_getBF(0);
  set success(bool value) => $_setBool(0, value);
  int get code => $_getIZ(1);
  set code(int value) => $_setUnsignedInt32(1, value);
  String get message => $_getSZ(2);
  bool get hasData => $_has(4);
  Any get data => $_getN(4);
  set data(Any value) => $_setField(5, value);
}

class _UserListRsp extends pb.GeneratedMessage {
  factory _UserListRsp.fromBuffer(List<int> data) =>
      create()..mergeFromBuffer(data);

  _UserListRsp._();

  static final pb.BuilderInfo _i = pb.BuilderInfo(
    'UserListRsp',
    package: const pb.PackageName('user'),
    createEmptyInstance: create,
  )
    ..aOB(1, 'success')
    ..aOS(2, 'message')
    ..pPM<_RelationUser>(4, 'userList', subBuilder: _RelationUser.create)
    ..hasRequiredFields = false;

  @override
  pb.BuilderInfo get info_ => _i;

  static _UserListRsp create() => _UserListRsp._();

  @override
  _UserListRsp createEmptyInstance() => create();

  @override
  _UserListRsp clone() => deepCopy();

  List<_RelationUser> get userList => $_getList(2);
}

class _UserInfoRsp extends pb.GeneratedMessage {
  factory _UserInfoRsp.fromBuffer(List<int> data) =>
      create()..mergeFromBuffer(data);

  _UserInfoRsp._();

  static final pb.BuilderInfo _i = pb.BuilderInfo(
    'UserInfoRsp',
    package: const pb.PackageName('user'),
    createEmptyInstance: create,
  )
    ..aOB(1, 'success')
    ..aOS(2, 'message')
    ..aOM<_RelationUser>(3, 'user', subBuilder: _RelationUser.create)
    ..hasRequiredFields = false;

  @override
  pb.BuilderInfo get info_ => _i;

  static _UserInfoRsp create() => _UserInfoRsp._();

  @override
  _UserInfoRsp createEmptyInstance() => create();

  @override
  _UserInfoRsp clone() => deepCopy();

  bool get hasUser => $_has(2);
  _RelationUser get user => $_getN(2);
  set user(_RelationUser value) => $_setField(3, value);
}

class _AuditItem extends pb.GeneratedMessage {
  _AuditItem._();

  static final pb.BuilderInfo _i = pb.BuilderInfo(
    'AuditItem',
    package: const pb.PackageName('user'),
    createEmptyInstance: create,
  )
    ..aOS(1, 'content')
    ..aOB(2, 'ok')
    ..hasRequiredFields = false;

  @override
  pb.BuilderInfo get info_ => _i;

  static _AuditItem create() => _AuditItem._();

  @override
  _AuditItem createEmptyInstance() => create();

  @override
  _AuditItem clone() => deepCopy();

  String get content => $_getSZ(0);
  set content(String value) => $_setString(0, value);
  bool get ok => $_getBF(1);
  set ok(bool value) => $_setBool(1, value);
}

class _ChannelInfo extends pb.GeneratedMessage {
  _ChannelInfo._();

  static final pb.BuilderInfo _i = pb.BuilderInfo(
    'ChannelInfo',
    package: const pb.PackageName('user'),
    createEmptyInstance: create,
  )
    ..aOS(6, 'title')
    ..aOS(14, 'label')
    ..hasRequiredFields = false;

  @override
  pb.BuilderInfo get info_ => _i;

  static _ChannelInfo create() => _ChannelInfo._();

  @override
  _ChannelInfo createEmptyInstance() => create();

  @override
  _ChannelInfo clone() => deepCopy();

  String get title => $_getSZ(0);
  String get label => $_getSZ(1);
}

class _VipIcons extends pb.GeneratedMessage {
  _VipIcons._();

  static final pb.BuilderInfo _i = pb.BuilderInfo(
    'UserVipLevelIcons',
    package: const pb.PackageName('base'),
    createEmptyInstance: create,
  )
    ..aOS(1, 'smallIcon', protoName: 'smallIcon')
    ..hasRequiredFields = false;

  @override
  pb.BuilderInfo get info_ => _i;

  static _VipIcons create() => _VipIcons._();

  @override
  _VipIcons createEmptyInstance() => create();

  @override
  _VipIcons clone() => deepCopy();

  String get smallIcon => $_getSZ(0);
}

class _RelationUser extends pb.GeneratedMessage {
  _RelationUser._();

  static final pb.BuilderInfo _i = pb.BuilderInfo(
    'User',
    package: const pb.PackageName('user'),
    createEmptyInstance: create,
  )
    ..aOS(1, 'birthday')
    ..aOS(6, 'gender')
    ..aInt64(7, 'id')
    ..aOS(9, 'nickname')
    ..aOS(10, 'personalSignature')
    ..pPM<_AuditItem>(11, 'picList', subBuilder: _AuditItem.create)
    ..aI(13, 'vipLevel')
    ..aOS(14, 'voice')
    ..aOS(15, 'avatar')
    ..aOS(16, 'emUsername')
    ..aI(18, 'relationType')
    ..aI(20, 'weight')
    ..aI(21, 'height')
    ..aI(25, 'voiceDuration')
    ..aI(26, 'onlineStatus')
    ..aOM<_ChannelInfo>(27, 'currentChannel', subBuilder: _ChannelInfo.create)
    ..aOM<_VipIcons>(33, 'icons', subBuilder: _VipIcons.create)
    ..pPS(40, 'makeFriendsLabel')
    ..aI(44, 'age')
    ..aOS(50, 'avatarAudit')
    ..aOB(70, 'isHidden')
    ..aOS(97, 'cardDynamicResource')
    ..hasRequiredFields = false;

  @override
  pb.BuilderInfo get info_ => _i;

  static _RelationUser create() => _RelationUser._();

  @override
  _RelationUser createEmptyInstance() => create();

  @override
  _RelationUser clone() => deepCopy();

  Map<String, dynamic> toJsonMap() {
    return {
      'id': hasId ? id.toString() : '',
      'nickname': nickname,
      'avatar': avatar,
      'avatarAudit': avatarAudit,
      'emUsername': emUsername,
      'gender': gender,
      'birthday': birthday,
      'personalSignature': personalSignature,
      'relationType': relationType,
      'age': age,
      'vipLevel': vipLevel,
      'voice': voice,
      'voiceDuration': voiceDuration,
      'weight': weight,
      'height': height,
      'onlineStatus': onlineStatus,
      'isHidden': isHidden,
      'cardDynamicResource': cardDynamicResource,
      'makeFriendsLabel': makeFriendsLabel.toList(growable: false),
      'picList': [
        for (final pic in picList)
          {'content': pic.content, 'ok': pic.ok},
      ],
      if (hasCurrentChannel)
        'currentChannel': {
          'title': currentChannel.title,
          'name': currentChannel.title,
          'label': currentChannel.label,
        },
      if (hasIcons) 'icons': {'smallIcon': icons.smallIcon},
    };
  }

  bool get hasId => $_has(2);
  Int64 get id => $_getI64(2);
  set id(Int64 value) => $_setInt64(2, value);
  String get gender => $_getSZ(1);
  set gender(String value) => $_setString(1, value);
  String get nickname => $_getSZ(3);
  set nickname(String value) => $_setString(3, value);
  String get personalSignature => $_getSZ(4);
  set personalSignature(String value) => $_setString(4, value);
  List<_AuditItem> get picList => $_getList(5);
  int get vipLevel => $_getIZ(6);
  String get voice => $_getSZ(7);
  String get avatar => $_getSZ(8);
  set avatar(String value) => $_setString(8, value);
  String get emUsername => $_getSZ(9);
  set emUsername(String value) => $_setString(9, value);
  int get relationType => $_getIZ(10);
  set relationType(int value) => $_setUnsignedInt32(10, value);
  int get weight => $_getIZ(11);
  int get height => $_getIZ(12);
  int get voiceDuration => $_getIZ(13);
  int get onlineStatus => $_getIZ(14);
  bool get hasCurrentChannel => $_has(15);
  _ChannelInfo get currentChannel => $_getN(15);
  bool get hasIcons => $_has(16);
  _VipIcons get icons => $_getN(16);
  List<String> get makeFriendsLabel => $_getList(17);
  int get age => $_getIZ(18);
  set age(int value) => $_setUnsignedInt32(18, value);
  String get avatarAudit => $_getSZ(19);
  bool get isHidden => $_getBF(20);
  String get cardDynamicResource => $_getSZ(21);
  String get birthday => $_getSZ(0);
  set birthday(String value) => $_setString(0, value);
}

_RelationUser _userFromMap(Map<String, dynamic> u) {
  final user = _RelationUser.create();
  final idRaw = '${u['id'] ?? ''}'.trim();
  if (idRaw.isNotEmpty) user.id = Int64.parseInt(idRaw);
  user.nickname = '${u['nickname'] ?? ''}';
  user.avatar = '${u['avatar'] ?? ''}';
  user.gender = '${u['gender'] ?? ''}';
  user.emUsername = '${u['emUsername'] ?? ''}';
  user.personalSignature = '${u['personalSignature'] ?? ''}';
  user.birthday = '${u['birthday'] ?? ''}';
  user.relationType = u['relationType'] as int? ?? 0;
  final pics = u['picList'];
  if (pics is List) {
    for (final p in pics) {
      if (p is! Map) continue;
      final item = _AuditItem.create()
        ..content = '${p['content'] ?? ''}'
        ..ok = p['ok'] == true;
      user.picList.add(item);
    }
  }
  return user;
}

/// @visibleForTesting
List<int> encodeRelationListEnvelope({
  required List<Map<String, dynamic>> users,
  bool success = true,
  int code = 0,
}) {
  final list = _UserListRsp.create();
  for (final u in users) {
    list.userList.add(_userFromMap(u));
  }
  final envelope = _BaseRsp.create()
    ..success = success
    ..code = code
    ..data = (Any()..value = list.writeToBuffer());
  return envelope.writeToBuffer();
}

/// @visibleForTesting
List<int> encodeUserInfoEnvelope({
  required Map<String, dynamic> user,
  bool success = true,
  int code = 0,
}) {
  final info = _UserInfoRsp.create()..user = _userFromMap(user);
  final envelope = _BaseRsp.create()
    ..success = success
    ..code = code
    ..data = (Any()
      ..typeUrl = 'type.googleapis.com/user.UserInfoRsp'
      ..value = info.writeToBuffer());
  return envelope.writeToBuffer();
}
