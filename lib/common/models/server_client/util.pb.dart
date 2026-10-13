// This is a generated file - do not edit.
//
// Generated from server_client/util.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_relative_imports

import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

export 'package:protobuf/protobuf.dart' show GeneratedMessageGenericExtensions;

export 'util.pbenum.dart';

/// *
///  图片 MD5 违规校验结果
class CheckImageMd5Rsp extends $pb.GeneratedMessage {
  factory CheckImageMd5Rsp({
    $core.bool? violating,
  }) {
    final result = create();
    if (violating != null) result.violating = violating;
    return result;
  }

  CheckImageMd5Rsp._();

  factory CheckImageMd5Rsp.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory CheckImageMd5Rsp.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'CheckImageMd5Rsp',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'util'),
      createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'violating')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CheckImageMd5Rsp clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CheckImageMd5Rsp copyWith(void Function(CheckImageMd5Rsp) updates) =>
      super.copyWith((message) => updates(message as CheckImageMd5Rsp))
          as CheckImageMd5Rsp;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CheckImageMd5Rsp create() => CheckImageMd5Rsp._();
  @$core.override
  CheckImageMd5Rsp createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static CheckImageMd5Rsp getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<CheckImageMd5Rsp>(create);
  static CheckImageMd5Rsp? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get violating => $_getBF(0);
  @$pb.TagNumber(1)
  set violating($core.bool value) => $_setBool(0, value);
  @$pb.TagNumber(1)
  $core.bool hasViolating() => $_has(0);
  @$pb.TagNumber(1)
  void clearViolating() => $_clearField(1);
}

enum VolcCredentialsData_Extra { tos, ia, ocr, notSet }

class VolcCredentialsData extends $pb.GeneratedMessage {
  factory VolcCredentialsData({
    $core.String? ak,
    $core.String? sk,
    $core.String? stsToken,
    TosData? tos,
    IaData? ia,
    OcrData? ocr,
  }) {
    final result = create();
    if (ak != null) result.ak = ak;
    if (sk != null) result.sk = sk;
    if (stsToken != null) result.stsToken = stsToken;
    if (tos != null) result.tos = tos;
    if (ia != null) result.ia = ia;
    if (ocr != null) result.ocr = ocr;
    return result;
  }

  VolcCredentialsData._();

  factory VolcCredentialsData.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory VolcCredentialsData.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static const $core.Map<$core.int, VolcCredentialsData_Extra>
      _VolcCredentialsData_ExtraByTag = {
    4: VolcCredentialsData_Extra.tos,
    5: VolcCredentialsData_Extra.ia,
    6: VolcCredentialsData_Extra.ocr,
    0: VolcCredentialsData_Extra.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'VolcCredentialsData',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'util'),
      createEmptyInstance: create)
    ..oo(0, [4, 5, 6])
    ..aOS(1, _omitFieldNames ? '' : 'ak')
    ..aOS(2, _omitFieldNames ? '' : 'sk')
    ..aOS(3, _omitFieldNames ? '' : 'stsToken')
    ..aOM<TosData>(4, _omitFieldNames ? '' : 'tos', subBuilder: TosData.create)
    ..aOM<IaData>(5, _omitFieldNames ? '' : 'ia', subBuilder: IaData.create)
    ..aOM<OcrData>(6, _omitFieldNames ? '' : 'ocr', subBuilder: OcrData.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  VolcCredentialsData clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  VolcCredentialsData copyWith(void Function(VolcCredentialsData) updates) =>
      super.copyWith((message) => updates(message as VolcCredentialsData))
          as VolcCredentialsData;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static VolcCredentialsData create() => VolcCredentialsData._();
  @$core.override
  VolcCredentialsData createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static VolcCredentialsData getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<VolcCredentialsData>(create);
  static VolcCredentialsData? _defaultInstance;

  @$pb.TagNumber(4)
  @$pb.TagNumber(5)
  @$pb.TagNumber(6)
  VolcCredentialsData_Extra whichExtra() =>
      _VolcCredentialsData_ExtraByTag[$_whichOneof(0)]!;
  @$pb.TagNumber(4)
  @$pb.TagNumber(5)
  @$pb.TagNumber(6)
  void clearExtra() => $_clearField($_whichOneof(0));

  @$pb.TagNumber(1)
  $core.String get ak => $_getSZ(0);
  @$pb.TagNumber(1)
  set ak($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasAk() => $_has(0);
  @$pb.TagNumber(1)
  void clearAk() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get sk => $_getSZ(1);
  @$pb.TagNumber(2)
  set sk($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasSk() => $_has(1);
  @$pb.TagNumber(2)
  void clearSk() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get stsToken => $_getSZ(2);
  @$pb.TagNumber(3)
  set stsToken($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasStsToken() => $_has(2);
  @$pb.TagNumber(3)
  void clearStsToken() => $_clearField(3);

  @$pb.TagNumber(4)
  TosData get tos => $_getN(3);
  @$pb.TagNumber(4)
  set tos(TosData value) => $_setField(4, value);
  @$pb.TagNumber(4)
  $core.bool hasTos() => $_has(3);
  @$pb.TagNumber(4)
  void clearTos() => $_clearField(4);
  @$pb.TagNumber(4)
  TosData ensureTos() => $_ensure(3);

  @$pb.TagNumber(5)
  IaData get ia => $_getN(4);
  @$pb.TagNumber(5)
  set ia(IaData value) => $_setField(5, value);
  @$pb.TagNumber(5)
  $core.bool hasIa() => $_has(4);
  @$pb.TagNumber(5)
  void clearIa() => $_clearField(5);
  @$pb.TagNumber(5)
  IaData ensureIa() => $_ensure(4);

  @$pb.TagNumber(6)
  OcrData get ocr => $_getN(5);
  @$pb.TagNumber(6)
  set ocr(OcrData value) => $_setField(6, value);
  @$pb.TagNumber(6)
  $core.bool hasOcr() => $_has(5);
  @$pb.TagNumber(6)
  void clearOcr() => $_clearField(6);
  @$pb.TagNumber(6)
  OcrData ensureOcr() => $_ensure(5);
}

enum AwsCredentialsData_Extra { tos, notSet }

class AwsCredentialsData extends $pb.GeneratedMessage {
  factory AwsCredentialsData({
    $core.String? ak,
    $core.String? sk,
    TosData? tos,
  }) {
    final result = create();
    if (ak != null) result.ak = ak;
    if (sk != null) result.sk = sk;
    if (tos != null) result.tos = tos;
    return result;
  }

  AwsCredentialsData._();

  factory AwsCredentialsData.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory AwsCredentialsData.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static const $core.Map<$core.int, AwsCredentialsData_Extra>
      _AwsCredentialsData_ExtraByTag = {
    3: AwsCredentialsData_Extra.tos,
    0: AwsCredentialsData_Extra.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'AwsCredentialsData',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'util'),
      createEmptyInstance: create)
    ..oo(0, [3])
    ..aOS(1, _omitFieldNames ? '' : 'ak')
    ..aOS(2, _omitFieldNames ? '' : 'sk')
    ..aOM<TosData>(3, _omitFieldNames ? '' : 'tos', subBuilder: TosData.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  AwsCredentialsData clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  AwsCredentialsData copyWith(void Function(AwsCredentialsData) updates) =>
      super.copyWith((message) => updates(message as AwsCredentialsData))
          as AwsCredentialsData;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static AwsCredentialsData create() => AwsCredentialsData._();
  @$core.override
  AwsCredentialsData createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static AwsCredentialsData getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<AwsCredentialsData>(create);
  static AwsCredentialsData? _defaultInstance;

  @$pb.TagNumber(3)
  AwsCredentialsData_Extra whichExtra() =>
      _AwsCredentialsData_ExtraByTag[$_whichOneof(0)]!;
  @$pb.TagNumber(3)
  void clearExtra() => $_clearField($_whichOneof(0));

  @$pb.TagNumber(1)
  $core.String get ak => $_getSZ(0);
  @$pb.TagNumber(1)
  set ak($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasAk() => $_has(0);
  @$pb.TagNumber(1)
  void clearAk() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get sk => $_getSZ(1);
  @$pb.TagNumber(2)
  set sk($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasSk() => $_has(1);
  @$pb.TagNumber(2)
  void clearSk() => $_clearField(2);

  @$pb.TagNumber(3)
  TosData get tos => $_getN(2);
  @$pb.TagNumber(3)
  set tos(TosData value) => $_setField(3, value);
  @$pb.TagNumber(3)
  $core.bool hasTos() => $_has(2);
  @$pb.TagNumber(3)
  void clearTos() => $_clearField(3);
  @$pb.TagNumber(3)
  TosData ensureTos() => $_ensure(2);
}

class IaData extends $pb.GeneratedMessage {
  factory IaData() => create();

  IaData._();

  factory IaData.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory IaData.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'IaData',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'util'),
      createEmptyInstance: create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  IaData clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  IaData copyWith(void Function(IaData) updates) =>
      super.copyWith((message) => updates(message as IaData)) as IaData;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static IaData create() => IaData._();
  @$core.override
  IaData createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static IaData getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<IaData>(create);
  static IaData? _defaultInstance;
}

class OcrData extends $pb.GeneratedMessage {
  factory OcrData() => create();

  OcrData._();

  factory OcrData.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory OcrData.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'OcrData',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'util'),
      createEmptyInstance: create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  OcrData clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  OcrData copyWith(void Function(OcrData) updates) =>
      super.copyWith((message) => updates(message as OcrData)) as OcrData;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static OcrData create() => OcrData._();
  @$core.override
  OcrData createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static OcrData getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<OcrData>(create);
  static OcrData? _defaultInstance;
}

class TosData extends $pb.GeneratedMessage {
  factory TosData({
    $core.String? endpoint,
    $core.String? region,
    $core.String? objectKey,
    $core.String? bucket,
    $core.String? url,
  }) {
    final result = create();
    if (endpoint != null) result.endpoint = endpoint;
    if (region != null) result.region = region;
    if (objectKey != null) result.objectKey = objectKey;
    if (bucket != null) result.bucket = bucket;
    if (url != null) result.url = url;
    return result;
  }

  TosData._();

  factory TosData.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory TosData.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'TosData',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'util'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'endpoint')
    ..aOS(2, _omitFieldNames ? '' : 'region')
    ..aOS(3, _omitFieldNames ? '' : 'objectKey')
    ..aOS(4, _omitFieldNames ? '' : 'bucket')
    ..aOS(5, _omitFieldNames ? '' : 'url')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  TosData clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  TosData copyWith(void Function(TosData) updates) =>
      super.copyWith((message) => updates(message as TosData)) as TosData;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static TosData create() => TosData._();
  @$core.override
  TosData createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static TosData getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<TosData>(create);
  static TosData? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get endpoint => $_getSZ(0);
  @$pb.TagNumber(1)
  set endpoint($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasEndpoint() => $_has(0);
  @$pb.TagNumber(1)
  void clearEndpoint() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get region => $_getSZ(1);
  @$pb.TagNumber(2)
  set region($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasRegion() => $_has(1);
  @$pb.TagNumber(2)
  void clearRegion() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get objectKey => $_getSZ(2);
  @$pb.TagNumber(3)
  set objectKey($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasObjectKey() => $_has(2);
  @$pb.TagNumber(3)
  void clearObjectKey() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.String get bucket => $_getSZ(3);
  @$pb.TagNumber(4)
  set bucket($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasBucket() => $_has(3);
  @$pb.TagNumber(4)
  void clearBucket() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.String get url => $_getSZ(4);
  @$pb.TagNumber(5)
  set url($core.String value) => $_setString(4, value);
  @$pb.TagNumber(5)
  $core.bool hasUrl() => $_has(4);
  @$pb.TagNumber(5)
  void clearUrl() => $_clearField(5);
}

class UploadRsp extends $pb.GeneratedMessage {
  factory UploadRsp({
    $core.bool? success,
    $core.String? message,
    $core.String? url,
  }) {
    final result = create();
    if (success != null) result.success = success;
    if (message != null) result.message = message;
    if (url != null) result.url = url;
    return result;
  }

  UploadRsp._();

  factory UploadRsp.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory UploadRsp.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'UploadRsp',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'util'),
      createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'success')
    ..aOS(2, _omitFieldNames ? '' : 'message')
    ..aOS(3, _omitFieldNames ? '' : 'url')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UploadRsp clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UploadRsp copyWith(void Function(UploadRsp) updates) =>
      super.copyWith((message) => updates(message as UploadRsp)) as UploadRsp;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UploadRsp create() => UploadRsp._();
  @$core.override
  UploadRsp createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static UploadRsp getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UploadRsp>(create);
  static UploadRsp? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get success => $_getBF(0);
  @$pb.TagNumber(1)
  set success($core.bool value) => $_setBool(0, value);
  @$pb.TagNumber(1)
  $core.bool hasSuccess() => $_has(0);
  @$pb.TagNumber(1)
  void clearSuccess() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get message => $_getSZ(1);
  @$pb.TagNumber(2)
  set message($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasMessage() => $_has(1);
  @$pb.TagNumber(2)
  void clearMessage() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get url => $_getSZ(2);
  @$pb.TagNumber(3)
  set url($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasUrl() => $_has(2);
  @$pb.TagNumber(3)
  void clearUrl() => $_clearField(3);
}

class PageItem extends $pb.GeneratedMessage {
  factory PageItem({
    $core.String? name,
    $core.String? url,
  }) {
    final result = create();
    if (name != null) result.name = name;
    if (url != null) result.url = url;
    return result;
  }

  PageItem._();

  factory PageItem.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory PageItem.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'PageItem',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'util'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'name')
    ..aOS(2, _omitFieldNames ? '' : 'url')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  PageItem clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  PageItem copyWith(void Function(PageItem) updates) =>
      super.copyWith((message) => updates(message as PageItem)) as PageItem;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static PageItem create() => PageItem._();
  @$core.override
  PageItem createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static PageItem getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<PageItem>(create);
  static PageItem? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get name => $_getSZ(0);
  @$pb.TagNumber(1)
  set name($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasName() => $_has(0);
  @$pb.TagNumber(1)
  void clearName() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get url => $_getSZ(1);
  @$pb.TagNumber(2)
  set url($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasUrl() => $_has(1);
  @$pb.TagNumber(2)
  void clearUrl() => $_clearField(2);
}

class PageItemRsp extends $pb.GeneratedMessage {
  factory PageItemRsp({
    $core.bool? success,
    $core.String? message,
    $core.Iterable<PageItem>? pageList,
  }) {
    final result = create();
    if (success != null) result.success = success;
    if (message != null) result.message = message;
    if (pageList != null) result.pageList.addAll(pageList);
    return result;
  }

  PageItemRsp._();

  factory PageItemRsp.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory PageItemRsp.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'PageItemRsp',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'util'),
      createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'success')
    ..aOS(2, _omitFieldNames ? '' : 'message')
    ..pPM<PageItem>(3, _omitFieldNames ? '' : 'pageList',
        protoName: 'pageList', subBuilder: PageItem.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  PageItemRsp clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  PageItemRsp copyWith(void Function(PageItemRsp) updates) =>
      super.copyWith((message) => updates(message as PageItemRsp))
          as PageItemRsp;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static PageItemRsp create() => PageItemRsp._();
  @$core.override
  PageItemRsp createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static PageItemRsp getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<PageItemRsp>(create);
  static PageItemRsp? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get success => $_getBF(0);
  @$pb.TagNumber(1)
  set success($core.bool value) => $_setBool(0, value);
  @$pb.TagNumber(1)
  $core.bool hasSuccess() => $_has(0);
  @$pb.TagNumber(1)
  void clearSuccess() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get message => $_getSZ(1);
  @$pb.TagNumber(2)
  set message($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasMessage() => $_has(1);
  @$pb.TagNumber(2)
  void clearMessage() => $_clearField(2);

  @$pb.TagNumber(3)
  $pb.PbList<PageItem> get pageList => $_getList(2);
}

/// 单条资源
class ResourceData extends $pb.GeneratedMessage {
  factory ResourceData({
    $fixnum.Int64? id,
    $core.String? resourceName,
    $core.String? link,
    $core.String? source,
  }) {
    final result = create();
    if (id != null) result.id = id;
    if (resourceName != null) result.resourceName = resourceName;
    if (link != null) result.link = link;
    if (source != null) result.source = source;
    return result;
  }

  ResourceData._();

  factory ResourceData.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ResourceData.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ResourceData',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'util'),
      createEmptyInstance: create)
    ..a<$fixnum.Int64>(1, _omitFieldNames ? '' : 'id', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..aOS(2, _omitFieldNames ? '' : 'resourceName')
    ..aOS(3, _omitFieldNames ? '' : 'link')
    ..aOS(4, _omitFieldNames ? '' : 'source')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ResourceData clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ResourceData copyWith(void Function(ResourceData) updates) =>
      super.copyWith((message) => updates(message as ResourceData))
          as ResourceData;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ResourceData create() => ResourceData._();
  @$core.override
  ResourceData createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ResourceData getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ResourceData>(create);
  static ResourceData? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get id => $_getI64(0);
  @$pb.TagNumber(1)
  set id($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get resourceName => $_getSZ(1);
  @$pb.TagNumber(2)
  set resourceName($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasResourceName() => $_has(1);
  @$pb.TagNumber(2)
  void clearResourceName() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get link => $_getSZ(2);
  @$pb.TagNumber(3)
  set link($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasLink() => $_has(2);
  @$pb.TagNumber(3)
  void clearLink() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.String get source => $_getSZ(3);
  @$pb.TagNumber(4)
  set source($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasSource() => $_has(3);
  @$pb.TagNumber(4)
  void clearSource() => $_clearField(4);
}

class Resources extends $pb.GeneratedMessage {
  factory Resources({
    $core.Iterable<ResourceData>? datas,
  }) {
    final result = create();
    if (datas != null) result.datas.addAll(datas);
    return result;
  }

  Resources._();

  factory Resources.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory Resources.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'Resources',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'util'),
      createEmptyInstance: create)
    ..pPM<ResourceData>(1, _omitFieldNames ? '' : 'datas',
        subBuilder: ResourceData.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Resources clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Resources copyWith(void Function(Resources) updates) =>
      super.copyWith((message) => updates(message as Resources)) as Resources;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Resources create() => Resources._();
  @$core.override
  Resources createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static Resources getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Resources>(create);
  static Resources? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<ResourceData> get datas => $_getList(0);
}

const $core.bool _omitFieldNames =
    $core.bool.fromEnvironment('protobuf.omit_field_names');
const $core.bool _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');
