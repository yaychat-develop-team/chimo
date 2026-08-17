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
    ..aOS(15, 'avatar')
    ..aOS(16, 'emUsername')
    ..aI(18, 'relationType')
    ..aI(44, 'age')
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
      'emUsername': emUsername,
      'gender': gender,
      'birthday': birthday,
      'personalSignature': personalSignature,
      'relationType': relationType,
      'age': age,
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
  String get avatar => $_getSZ(5);
  set avatar(String value) => $_setString(5, value);
  String get emUsername => $_getSZ(6);
  set emUsername(String value) => $_setString(6, value);
  int get relationType => $_getIZ(7);
  set relationType(int value) => $_setUnsignedInt32(7, value);
  int get age => $_getIZ(8);
  String get birthday => $_getSZ(0);
}

/// @visibleForTesting
List<int> encodeRelationListEnvelope({
  required List<Map<String, dynamic>> users,
  bool success = true,
  int code = 0,
}) {
  final list = _UserListRsp.create();
  for (final u in users) {
    final user = _RelationUser.create();
    final idRaw = '${u['id'] ?? ''}'.trim();
    if (idRaw.isNotEmpty) user.id = Int64.parseInt(idRaw);
    user.nickname = '${u['nickname'] ?? ''}';
    user.avatar = '${u['avatar'] ?? ''}';
    user.gender = '${u['gender'] ?? ''}';
    user.emUsername = '${u['emUsername'] ?? ''}';
    user.relationType = u['relationType'] as int? ?? 0;
    list.userList.add(user);
  }
  final envelope = _BaseRsp.create()
    ..success = success
    ..code = code
    ..data = (Any()..value = list.writeToBuffer());
  return envelope.writeToBuffer();
}
