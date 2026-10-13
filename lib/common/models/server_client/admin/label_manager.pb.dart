// This is a generated file - do not edit.
//
// Generated from server_client/admin/label_manager.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_relative_imports

import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

import 'base.pb.dart' as $0;

export 'package:protobuf/protobuf.dart' show GeneratedMessageGenericExtensions;

class AddLabelReq extends $pb.GeneratedMessage {
  factory AddLabelReq({
    $0.LabelDesc? label,
  }) {
    final result = create();
    if (label != null) result.label = label;
    return result;
  }

  AddLabelReq._();

  factory AddLabelReq.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory AddLabelReq.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'AddLabelReq',
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'adminLabelManager'),
      createEmptyInstance: create)
    ..aOM<$0.LabelDesc>(1, _omitFieldNames ? '' : 'label',
        subBuilder: $0.LabelDesc.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  AddLabelReq clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  AddLabelReq copyWith(void Function(AddLabelReq) updates) =>
      super.copyWith((message) => updates(message as AddLabelReq))
          as AddLabelReq;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static AddLabelReq create() => AddLabelReq._();
  @$core.override
  AddLabelReq createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static AddLabelReq getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<AddLabelReq>(create);
  static AddLabelReq? _defaultInstance;

  @$pb.TagNumber(1)
  $0.LabelDesc get label => $_getN(0);
  @$pb.TagNumber(1)
  set label($0.LabelDesc value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasLabel() => $_has(0);
  @$pb.TagNumber(1)
  void clearLabel() => $_clearField(1);
  @$pb.TagNumber(1)
  $0.LabelDesc ensureLabel() => $_ensure(0);
}

class AllLabels extends $pb.GeneratedMessage {
  factory AllLabels({
    $core.Iterable<$0.LabelDesc>? labelList,
  }) {
    final result = create();
    if (labelList != null) result.labelList.addAll(labelList);
    return result;
  }

  AllLabels._();

  factory AllLabels.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory AllLabels.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'AllLabels',
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'adminLabelManager'),
      createEmptyInstance: create)
    ..pPM<$0.LabelDesc>(2, _omitFieldNames ? '' : 'labelList',
        protoName: 'labelList', subBuilder: $0.LabelDesc.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  AllLabels clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  AllLabels copyWith(void Function(AllLabels) updates) =>
      super.copyWith((message) => updates(message as AllLabels)) as AllLabels;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static AllLabels create() => AllLabels._();
  @$core.override
  AllLabels createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static AllLabels getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<AllLabels>(create);
  static AllLabels? _defaultInstance;

  @$pb.TagNumber(2)
  $pb.PbList<$0.LabelDesc> get labelList => $_getList(0);
}

class UpdateUserLabelReq extends $pb.GeneratedMessage {
  factory UpdateUserLabelReq({
    $fixnum.Int64? uid,
    $core.Iterable<$fixnum.Int64>? labelIdList,
  }) {
    final result = create();
    if (uid != null) result.uid = uid;
    if (labelIdList != null) result.labelIdList.addAll(labelIdList);
    return result;
  }

  UpdateUserLabelReq._();

  factory UpdateUserLabelReq.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory UpdateUserLabelReq.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'UpdateUserLabelReq',
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'adminLabelManager'),
      createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'uid')
    ..p<$fixnum.Int64>(
        2, _omitFieldNames ? '' : 'labelIdList', $pb.PbFieldType.K6,
        protoName: 'labelIdList')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UpdateUserLabelReq clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UpdateUserLabelReq copyWith(void Function(UpdateUserLabelReq) updates) =>
      super.copyWith((message) => updates(message as UpdateUserLabelReq))
          as UpdateUserLabelReq;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UpdateUserLabelReq create() => UpdateUserLabelReq._();
  @$core.override
  UpdateUserLabelReq createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static UpdateUserLabelReq getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<UpdateUserLabelReq>(create);
  static UpdateUserLabelReq? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get uid => $_getI64(0);
  @$pb.TagNumber(1)
  set uid($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasUid() => $_has(0);
  @$pb.TagNumber(1)
  void clearUid() => $_clearField(1);

  @$pb.TagNumber(2)
  $pb.PbList<$fixnum.Int64> get labelIdList => $_getList(1);
}

const $core.bool _omitFieldNames =
    $core.bool.fromEnvironment('protobuf.omit_field_names');
const $core.bool _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');
