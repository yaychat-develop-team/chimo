// This is a generated file - do not edit.
//
// Generated from server_client/quick_msg.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_relative_imports

import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

import 'quick_msg.pbenum.dart';

export 'package:protobuf/protobuf.dart' show GeneratedMessageGenericExtensions;

export 'quick_msg.pbenum.dart';

class SaveQuickMsgListReq extends $pb.GeneratedMessage {
  factory SaveQuickMsgListReq({
    $core.Iterable<SaveQuickMsgReq>? list,
  }) {
    final result = create();
    if (list != null) result.list.addAll(list);
    return result;
  }

  SaveQuickMsgListReq._();

  factory SaveQuickMsgListReq.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory SaveQuickMsgListReq.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'SaveQuickMsgListReq',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'quick_msg'),
      createEmptyInstance: create)
    ..pPM<SaveQuickMsgReq>(1, _omitFieldNames ? '' : 'list',
        subBuilder: SaveQuickMsgReq.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SaveQuickMsgListReq clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SaveQuickMsgListReq copyWith(void Function(SaveQuickMsgListReq) updates) =>
      super.copyWith((message) => updates(message as SaveQuickMsgListReq))
          as SaveQuickMsgListReq;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SaveQuickMsgListReq create() => SaveQuickMsgListReq._();
  @$core.override
  SaveQuickMsgListReq createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static SaveQuickMsgListReq getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<SaveQuickMsgListReq>(create);
  static SaveQuickMsgListReq? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<SaveQuickMsgReq> get list => $_getList(0);
}

class SaveQuickMsgReq extends $pb.GeneratedMessage {
  factory SaveQuickMsgReq({
    QuickMsgData? data,
    $core.int? position,
    QuickMsgOp? op,
  }) {
    final result = create();
    if (data != null) result.data = data;
    if (position != null) result.position = position;
    if (op != null) result.op = op;
    return result;
  }

  SaveQuickMsgReq._();

  factory SaveQuickMsgReq.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory SaveQuickMsgReq.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'SaveQuickMsgReq',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'quick_msg'),
      createEmptyInstance: create)
    ..aOM<QuickMsgData>(1, _omitFieldNames ? '' : 'data',
        subBuilder: QuickMsgData.create)
    ..aI(2, _omitFieldNames ? '' : 'position', fieldType: $pb.PbFieldType.OU3)
    ..aE<QuickMsgOp>(3, _omitFieldNames ? '' : 'op',
        enumValues: QuickMsgOp.values)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SaveQuickMsgReq clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SaveQuickMsgReq copyWith(void Function(SaveQuickMsgReq) updates) =>
      super.copyWith((message) => updates(message as SaveQuickMsgReq))
          as SaveQuickMsgReq;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SaveQuickMsgReq create() => SaveQuickMsgReq._();
  @$core.override
  SaveQuickMsgReq createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static SaveQuickMsgReq getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<SaveQuickMsgReq>(create);
  static SaveQuickMsgReq? _defaultInstance;

  @$pb.TagNumber(1)
  QuickMsgData get data => $_getN(0);
  @$pb.TagNumber(1)
  set data(QuickMsgData value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasData() => $_has(0);
  @$pb.TagNumber(1)
  void clearData() => $_clearField(1);
  @$pb.TagNumber(1)
  QuickMsgData ensureData() => $_ensure(0);

  @$pb.TagNumber(2)
  $core.int get position => $_getIZ(1);
  @$pb.TagNumber(2)
  set position($core.int value) => $_setUnsignedInt32(1, value);
  @$pb.TagNumber(2)
  $core.bool hasPosition() => $_has(1);
  @$pb.TagNumber(2)
  void clearPosition() => $_clearField(2);

  @$pb.TagNumber(3)
  QuickMsgOp get op => $_getN(2);
  @$pb.TagNumber(3)
  set op(QuickMsgOp value) => $_setField(3, value);
  @$pb.TagNumber(3)
  $core.bool hasOp() => $_has(2);
  @$pb.TagNumber(3)
  void clearOp() => $_clearField(3);
}

class QuickMsgListRsp extends $pb.GeneratedMessage {
  factory QuickMsgListRsp({
    $core.Iterable<QuickMsgData>? list,
  }) {
    final result = create();
    if (list != null) result.list.addAll(list);
    return result;
  }

  QuickMsgListRsp._();

  factory QuickMsgListRsp.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory QuickMsgListRsp.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'QuickMsgListRsp',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'quick_msg'),
      createEmptyInstance: create)
    ..pPM<QuickMsgData>(1, _omitFieldNames ? '' : 'list',
        subBuilder: QuickMsgData.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  QuickMsgListRsp clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  QuickMsgListRsp copyWith(void Function(QuickMsgListRsp) updates) =>
      super.copyWith((message) => updates(message as QuickMsgListRsp))
          as QuickMsgListRsp;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static QuickMsgListRsp create() => QuickMsgListRsp._();
  @$core.override
  QuickMsgListRsp createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static QuickMsgListRsp getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<QuickMsgListRsp>(create);
  static QuickMsgListRsp? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<QuickMsgData> get list => $_getList(0);
}

enum QuickMsgData_Content { textMsg, imageMsg, audioMsg, videoMsg, notSet }

class QuickMsgData extends $pb.GeneratedMessage {
  factory QuickMsgData({
    $fixnum.Int64? id,
    $core.String? alias,
    $core.int? scene,
    QuickMsgFormat? format,
    QuickTextMsg? textMsg,
    QuickImageMsg? imageMsg,
    QuickAudioMsg? audioMsg,
    QuickVideoMsg? videoMsg,
  }) {
    final result = create();
    if (id != null) result.id = id;
    if (alias != null) result.alias = alias;
    if (scene != null) result.scene = scene;
    if (format != null) result.format = format;
    if (textMsg != null) result.textMsg = textMsg;
    if (imageMsg != null) result.imageMsg = imageMsg;
    if (audioMsg != null) result.audioMsg = audioMsg;
    if (videoMsg != null) result.videoMsg = videoMsg;
    return result;
  }

  QuickMsgData._();

  factory QuickMsgData.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory QuickMsgData.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static const $core.Map<$core.int, QuickMsgData_Content>
      _QuickMsgData_ContentByTag = {
    5: QuickMsgData_Content.textMsg,
    6: QuickMsgData_Content.imageMsg,
    7: QuickMsgData_Content.audioMsg,
    8: QuickMsgData_Content.videoMsg,
    0: QuickMsgData_Content.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'QuickMsgData',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'quick_msg'),
      createEmptyInstance: create)
    ..oo(0, [5, 6, 7, 8])
    ..aInt64(1, _omitFieldNames ? '' : 'id')
    ..aOS(2, _omitFieldNames ? '' : 'alias')
    ..aI(3, _omitFieldNames ? '' : 'scene', fieldType: $pb.PbFieldType.OU3)
    ..aE<QuickMsgFormat>(4, _omitFieldNames ? '' : 'format',
        enumValues: QuickMsgFormat.values)
    ..aOM<QuickTextMsg>(5, _omitFieldNames ? '' : 'textMsg',
        subBuilder: QuickTextMsg.create)
    ..aOM<QuickImageMsg>(6, _omitFieldNames ? '' : 'imageMsg',
        subBuilder: QuickImageMsg.create)
    ..aOM<QuickAudioMsg>(7, _omitFieldNames ? '' : 'audioMsg',
        subBuilder: QuickAudioMsg.create)
    ..aOM<QuickVideoMsg>(8, _omitFieldNames ? '' : 'videoMsg',
        subBuilder: QuickVideoMsg.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  QuickMsgData clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  QuickMsgData copyWith(void Function(QuickMsgData) updates) =>
      super.copyWith((message) => updates(message as QuickMsgData))
          as QuickMsgData;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static QuickMsgData create() => QuickMsgData._();
  @$core.override
  QuickMsgData createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static QuickMsgData getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<QuickMsgData>(create);
  static QuickMsgData? _defaultInstance;

  @$pb.TagNumber(5)
  @$pb.TagNumber(6)
  @$pb.TagNumber(7)
  @$pb.TagNumber(8)
  QuickMsgData_Content whichContent() =>
      _QuickMsgData_ContentByTag[$_whichOneof(0)]!;
  @$pb.TagNumber(5)
  @$pb.TagNumber(6)
  @$pb.TagNumber(7)
  @$pb.TagNumber(8)
  void clearContent() => $_clearField($_whichOneof(0));

  @$pb.TagNumber(1)
  $fixnum.Int64 get id => $_getI64(0);
  @$pb.TagNumber(1)
  set id($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get alias => $_getSZ(1);
  @$pb.TagNumber(2)
  set alias($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasAlias() => $_has(1);
  @$pb.TagNumber(2)
  void clearAlias() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.int get scene => $_getIZ(2);
  @$pb.TagNumber(3)
  set scene($core.int value) => $_setUnsignedInt32(2, value);
  @$pb.TagNumber(3)
  $core.bool hasScene() => $_has(2);
  @$pb.TagNumber(3)
  void clearScene() => $_clearField(3);

  @$pb.TagNumber(4)
  QuickMsgFormat get format => $_getN(3);
  @$pb.TagNumber(4)
  set format(QuickMsgFormat value) => $_setField(4, value);
  @$pb.TagNumber(4)
  $core.bool hasFormat() => $_has(3);
  @$pb.TagNumber(4)
  void clearFormat() => $_clearField(4);

  @$pb.TagNumber(5)
  QuickTextMsg get textMsg => $_getN(4);
  @$pb.TagNumber(5)
  set textMsg(QuickTextMsg value) => $_setField(5, value);
  @$pb.TagNumber(5)
  $core.bool hasTextMsg() => $_has(4);
  @$pb.TagNumber(5)
  void clearTextMsg() => $_clearField(5);
  @$pb.TagNumber(5)
  QuickTextMsg ensureTextMsg() => $_ensure(4);

  @$pb.TagNumber(6)
  QuickImageMsg get imageMsg => $_getN(5);
  @$pb.TagNumber(6)
  set imageMsg(QuickImageMsg value) => $_setField(6, value);
  @$pb.TagNumber(6)
  $core.bool hasImageMsg() => $_has(5);
  @$pb.TagNumber(6)
  void clearImageMsg() => $_clearField(6);
  @$pb.TagNumber(6)
  QuickImageMsg ensureImageMsg() => $_ensure(5);

  @$pb.TagNumber(7)
  QuickAudioMsg get audioMsg => $_getN(6);
  @$pb.TagNumber(7)
  set audioMsg(QuickAudioMsg value) => $_setField(7, value);
  @$pb.TagNumber(7)
  $core.bool hasAudioMsg() => $_has(6);
  @$pb.TagNumber(7)
  void clearAudioMsg() => $_clearField(7);
  @$pb.TagNumber(7)
  QuickAudioMsg ensureAudioMsg() => $_ensure(6);

  @$pb.TagNumber(8)
  QuickVideoMsg get videoMsg => $_getN(7);
  @$pb.TagNumber(8)
  set videoMsg(QuickVideoMsg value) => $_setField(8, value);
  @$pb.TagNumber(8)
  $core.bool hasVideoMsg() => $_has(7);
  @$pb.TagNumber(8)
  void clearVideoMsg() => $_clearField(8);
  @$pb.TagNumber(8)
  QuickVideoMsg ensureVideoMsg() => $_ensure(7);
}

class QuickTextMsg extends $pb.GeneratedMessage {
  factory QuickTextMsg({
    $core.String? content,
  }) {
    final result = create();
    if (content != null) result.content = content;
    return result;
  }

  QuickTextMsg._();

  factory QuickTextMsg.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory QuickTextMsg.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'QuickTextMsg',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'quick_msg'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'content')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  QuickTextMsg clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  QuickTextMsg copyWith(void Function(QuickTextMsg) updates) =>
      super.copyWith((message) => updates(message as QuickTextMsg))
          as QuickTextMsg;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static QuickTextMsg create() => QuickTextMsg._();
  @$core.override
  QuickTextMsg createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static QuickTextMsg getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<QuickTextMsg>(create);
  static QuickTextMsg? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get content => $_getSZ(0);
  @$pb.TagNumber(1)
  set content($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasContent() => $_has(0);
  @$pb.TagNumber(1)
  void clearContent() => $_clearField(1);
}

class QuickImageMsg extends $pb.GeneratedMessage {
  factory QuickImageMsg({
    $core.String? url,
  }) {
    final result = create();
    if (url != null) result.url = url;
    return result;
  }

  QuickImageMsg._();

  factory QuickImageMsg.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory QuickImageMsg.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'QuickImageMsg',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'quick_msg'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'url')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  QuickImageMsg clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  QuickImageMsg copyWith(void Function(QuickImageMsg) updates) =>
      super.copyWith((message) => updates(message as QuickImageMsg))
          as QuickImageMsg;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static QuickImageMsg create() => QuickImageMsg._();
  @$core.override
  QuickImageMsg createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static QuickImageMsg getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<QuickImageMsg>(create);
  static QuickImageMsg? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get url => $_getSZ(0);
  @$pb.TagNumber(1)
  set url($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasUrl() => $_has(0);
  @$pb.TagNumber(1)
  void clearUrl() => $_clearField(1);
}

class QuickAudioMsg extends $pb.GeneratedMessage {
  factory QuickAudioMsg({
    $core.String? url,
    $core.int? duration,
  }) {
    final result = create();
    if (url != null) result.url = url;
    if (duration != null) result.duration = duration;
    return result;
  }

  QuickAudioMsg._();

  factory QuickAudioMsg.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory QuickAudioMsg.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'QuickAudioMsg',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'quick_msg'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'url')
    ..aI(2, _omitFieldNames ? '' : 'duration', fieldType: $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  QuickAudioMsg clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  QuickAudioMsg copyWith(void Function(QuickAudioMsg) updates) =>
      super.copyWith((message) => updates(message as QuickAudioMsg))
          as QuickAudioMsg;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static QuickAudioMsg create() => QuickAudioMsg._();
  @$core.override
  QuickAudioMsg createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static QuickAudioMsg getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<QuickAudioMsg>(create);
  static QuickAudioMsg? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get url => $_getSZ(0);
  @$pb.TagNumber(1)
  set url($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasUrl() => $_has(0);
  @$pb.TagNumber(1)
  void clearUrl() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.int get duration => $_getIZ(1);
  @$pb.TagNumber(2)
  set duration($core.int value) => $_setUnsignedInt32(1, value);
  @$pb.TagNumber(2)
  $core.bool hasDuration() => $_has(1);
  @$pb.TagNumber(2)
  void clearDuration() => $_clearField(2);
}

class QuickVideoMsg extends $pb.GeneratedMessage {
  factory QuickVideoMsg({
    $core.String? url,
    $core.int? duration,
  }) {
    final result = create();
    if (url != null) result.url = url;
    if (duration != null) result.duration = duration;
    return result;
  }

  QuickVideoMsg._();

  factory QuickVideoMsg.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory QuickVideoMsg.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'QuickVideoMsg',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'quick_msg'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'url')
    ..aI(2, _omitFieldNames ? '' : 'duration', fieldType: $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  QuickVideoMsg clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  QuickVideoMsg copyWith(void Function(QuickVideoMsg) updates) =>
      super.copyWith((message) => updates(message as QuickVideoMsg))
          as QuickVideoMsg;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static QuickVideoMsg create() => QuickVideoMsg._();
  @$core.override
  QuickVideoMsg createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static QuickVideoMsg getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<QuickVideoMsg>(create);
  static QuickVideoMsg? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get url => $_getSZ(0);
  @$pb.TagNumber(1)
  set url($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasUrl() => $_has(0);
  @$pb.TagNumber(1)
  void clearUrl() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.int get duration => $_getIZ(1);
  @$pb.TagNumber(2)
  set duration($core.int value) => $_setUnsignedInt32(1, value);
  @$pb.TagNumber(2)
  $core.bool hasDuration() => $_has(1);
  @$pb.TagNumber(2)
  void clearDuration() => $_clearField(2);
}

class QuickHiAiData extends $pb.GeneratedMessage {
  factory QuickHiAiData({
    $core.String? result,
  }) {
    final result$ = create();
    if (result != null) result$.result = result;
    return result$;
  }

  QuickHiAiData._();

  factory QuickHiAiData.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory QuickHiAiData.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'QuickHiAiData',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'quick_msg'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'result')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  QuickHiAiData clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  QuickHiAiData copyWith(void Function(QuickHiAiData) updates) =>
      super.copyWith((message) => updates(message as QuickHiAiData))
          as QuickHiAiData;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static QuickHiAiData create() => QuickHiAiData._();
  @$core.override
  QuickHiAiData createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static QuickHiAiData getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<QuickHiAiData>(create);
  static QuickHiAiData? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get result => $_getSZ(0);
  @$pb.TagNumber(1)
  set result($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasResult() => $_has(0);
  @$pb.TagNumber(1)
  void clearResult() => $_clearField(1);
}

const $core.bool _omitFieldNames =
    $core.bool.fromEnvironment('protobuf.omit_field_names');
const $core.bool _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');
