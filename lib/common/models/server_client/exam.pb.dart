// This is a generated file - do not edit.
//
// Generated from server_client/exam.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_relative_imports

import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

import 'exam.pbenum.dart';

export 'package:protobuf/protobuf.dart' show GeneratedMessageGenericExtensions;

export 'exam.pbenum.dart';

class StudyMaterialsRsp extends $pb.GeneratedMessage {
  factory StudyMaterialsRsp({
    $core.String? material,
    $core.String? videoUrl,
    $core.String? videoCover,
  }) {
    final result = create();
    if (material != null) result.material = material;
    if (videoUrl != null) result.videoUrl = videoUrl;
    if (videoCover != null) result.videoCover = videoCover;
    return result;
  }

  StudyMaterialsRsp._();

  factory StudyMaterialsRsp.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory StudyMaterialsRsp.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'StudyMaterialsRsp',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'exam'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'material')
    ..aOS(2, _omitFieldNames ? '' : 'videoUrl')
    ..aOS(3, _omitFieldNames ? '' : 'videoCover')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  StudyMaterialsRsp clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  StudyMaterialsRsp copyWith(void Function(StudyMaterialsRsp) updates) =>
      super.copyWith((message) => updates(message as StudyMaterialsRsp))
          as StudyMaterialsRsp;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static StudyMaterialsRsp create() => StudyMaterialsRsp._();
  @$core.override
  StudyMaterialsRsp createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static StudyMaterialsRsp getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<StudyMaterialsRsp>(create);
  static StudyMaterialsRsp? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get material => $_getSZ(0);
  @$pb.TagNumber(1)
  set material($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasMaterial() => $_has(0);
  @$pb.TagNumber(1)
  void clearMaterial() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get videoUrl => $_getSZ(1);
  @$pb.TagNumber(2)
  set videoUrl($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasVideoUrl() => $_has(1);
  @$pb.TagNumber(2)
  void clearVideoUrl() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get videoCover => $_getSZ(2);
  @$pb.TagNumber(3)
  set videoCover($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasVideoCover() => $_has(2);
  @$pb.TagNumber(3)
  void clearVideoCover() => $_clearField(3);
}

class StudyMaterials extends $pb.GeneratedMessage {
  factory StudyMaterials({
    $core.Iterable<MaterialItem>? items,
  }) {
    final result = create();
    if (items != null) result.items.addAll(items);
    return result;
  }

  StudyMaterials._();

  factory StudyMaterials.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory StudyMaterials.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'StudyMaterials',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'exam'),
      createEmptyInstance: create)
    ..pPM<MaterialItem>(1, _omitFieldNames ? '' : 'items',
        subBuilder: MaterialItem.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  StudyMaterials clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  StudyMaterials copyWith(void Function(StudyMaterials) updates) =>
      super.copyWith((message) => updates(message as StudyMaterials))
          as StudyMaterials;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static StudyMaterials create() => StudyMaterials._();
  @$core.override
  StudyMaterials createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static StudyMaterials getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<StudyMaterials>(create);
  static StudyMaterials? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<MaterialItem> get items => $_getList(0);
}

class MaterialItem extends $pb.GeneratedMessage {
  factory MaterialItem({
    Title? title,
    $core.Iterable<Material>? materials,
  }) {
    final result = create();
    if (title != null) result.title = title;
    if (materials != null) result.materials.addAll(materials);
    return result;
  }

  MaterialItem._();

  factory MaterialItem.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory MaterialItem.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'MaterialItem',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'exam'),
      createEmptyInstance: create)
    ..aOM<Title>(1, _omitFieldNames ? '' : 'title', subBuilder: Title.create)
    ..pPM<Material>(2, _omitFieldNames ? '' : 'materials',
        subBuilder: Material.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  MaterialItem clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  MaterialItem copyWith(void Function(MaterialItem) updates) =>
      super.copyWith((message) => updates(message as MaterialItem))
          as MaterialItem;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static MaterialItem create() => MaterialItem._();
  @$core.override
  MaterialItem createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static MaterialItem getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<MaterialItem>(create);
  static MaterialItem? _defaultInstance;

  @$pb.TagNumber(1)
  Title get title => $_getN(0);
  @$pb.TagNumber(1)
  set title(Title value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasTitle() => $_has(0);
  @$pb.TagNumber(1)
  void clearTitle() => $_clearField(1);
  @$pb.TagNumber(1)
  Title ensureTitle() => $_ensure(0);

  @$pb.TagNumber(2)
  $pb.PbList<Material> get materials => $_getList(1);
}

class Title extends $pb.GeneratedMessage {
  factory Title({
    TitleType? type,
    $core.String? content,
  }) {
    final result = create();
    if (type != null) result.type = type;
    if (content != null) result.content = content;
    return result;
  }

  Title._();

  factory Title.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory Title.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'Title',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'exam'),
      createEmptyInstance: create)
    ..aE<TitleType>(1, _omitFieldNames ? '' : 'type',
        enumValues: TitleType.values)
    ..aOS(2, _omitFieldNames ? '' : 'content')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Title clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Title copyWith(void Function(Title) updates) =>
      super.copyWith((message) => updates(message as Title)) as Title;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Title create() => Title._();
  @$core.override
  Title createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static Title getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Title>(create);
  static Title? _defaultInstance;

  @$pb.TagNumber(1)
  TitleType get type => $_getN(0);
  @$pb.TagNumber(1)
  set type(TitleType value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasType() => $_has(0);
  @$pb.TagNumber(1)
  void clearType() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get content => $_getSZ(1);
  @$pb.TagNumber(2)
  set content($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasContent() => $_has(1);
  @$pb.TagNumber(2)
  void clearContent() => $_clearField(2);
}

class Material extends $pb.GeneratedMessage {
  factory Material({
    MediaType? type,
    $core.String? content,
  }) {
    final result = create();
    if (type != null) result.type = type;
    if (content != null) result.content = content;
    return result;
  }

  Material._();

  factory Material.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory Material.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'Material',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'exam'),
      createEmptyInstance: create)
    ..aE<MediaType>(1, _omitFieldNames ? '' : 'type',
        enumValues: MediaType.values)
    ..aOS(2, _omitFieldNames ? '' : 'content')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Material clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Material copyWith(void Function(Material) updates) =>
      super.copyWith((message) => updates(message as Material)) as Material;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Material create() => Material._();
  @$core.override
  Material createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static Material getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Material>(create);
  static Material? _defaultInstance;

  @$pb.TagNumber(1)
  MediaType get type => $_getN(0);
  @$pb.TagNumber(1)
  set type(MediaType value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasType() => $_has(0);
  @$pb.TagNumber(1)
  void clearType() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get content => $_getSZ(1);
  @$pb.TagNumber(2)
  set content($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasContent() => $_has(1);
  @$pb.TagNumber(2)
  void clearContent() => $_clearField(2);
}

class StartQuestionReq extends $pb.GeneratedMessage {
  factory StartQuestionReq({
    $fixnum.Int64? unit,
  }) {
    final result = create();
    if (unit != null) result.unit = unit;
    return result;
  }

  StartQuestionReq._();

  factory StartQuestionReq.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory StartQuestionReq.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'StartQuestionReq',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'exam'),
      createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'unit')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  StartQuestionReq clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  StartQuestionReq copyWith(void Function(StartQuestionReq) updates) =>
      super.copyWith((message) => updates(message as StartQuestionReq))
          as StartQuestionReq;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static StartQuestionReq create() => StartQuestionReq._();
  @$core.override
  StartQuestionReq createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static StartQuestionReq getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<StartQuestionReq>(create);
  static StartQuestionReq? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get unit => $_getI64(0);
  @$pb.TagNumber(1)
  set unit($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasUnit() => $_has(0);
  @$pb.TagNumber(1)
  void clearUnit() => $_clearField(1);
}

class StartQuestionRsp extends $pb.GeneratedMessage {
  factory StartQuestionRsp({
    $core.int? totalQuestion,
    Question? question,
    $fixnum.Int64? examId,
    $core.int? examTimeSec,
  }) {
    final result = create();
    if (totalQuestion != null) result.totalQuestion = totalQuestion;
    if (question != null) result.question = question;
    if (examId != null) result.examId = examId;
    if (examTimeSec != null) result.examTimeSec = examTimeSec;
    return result;
  }

  StartQuestionRsp._();

  factory StartQuestionRsp.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory StartQuestionRsp.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'StartQuestionRsp',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'exam'),
      createEmptyInstance: create)
    ..aI(1, _omitFieldNames ? '' : 'totalQuestion')
    ..aOM<Question>(2, _omitFieldNames ? '' : 'question',
        subBuilder: Question.create)
    ..aInt64(3, _omitFieldNames ? '' : 'examId')
    ..aI(4, _omitFieldNames ? '' : 'examTimeSec')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  StartQuestionRsp clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  StartQuestionRsp copyWith(void Function(StartQuestionRsp) updates) =>
      super.copyWith((message) => updates(message as StartQuestionRsp))
          as StartQuestionRsp;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static StartQuestionRsp create() => StartQuestionRsp._();
  @$core.override
  StartQuestionRsp createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static StartQuestionRsp getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<StartQuestionRsp>(create);
  static StartQuestionRsp? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get totalQuestion => $_getIZ(0);
  @$pb.TagNumber(1)
  set totalQuestion($core.int value) => $_setSignedInt32(0, value);
  @$pb.TagNumber(1)
  $core.bool hasTotalQuestion() => $_has(0);
  @$pb.TagNumber(1)
  void clearTotalQuestion() => $_clearField(1);

  @$pb.TagNumber(2)
  Question get question => $_getN(1);
  @$pb.TagNumber(2)
  set question(Question value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasQuestion() => $_has(1);
  @$pb.TagNumber(2)
  void clearQuestion() => $_clearField(2);
  @$pb.TagNumber(2)
  Question ensureQuestion() => $_ensure(1);

  @$pb.TagNumber(3)
  $fixnum.Int64 get examId => $_getI64(2);
  @$pb.TagNumber(3)
  set examId($fixnum.Int64 value) => $_setInt64(2, value);
  @$pb.TagNumber(3)
  $core.bool hasExamId() => $_has(2);
  @$pb.TagNumber(3)
  void clearExamId() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.int get examTimeSec => $_getIZ(3);
  @$pb.TagNumber(4)
  set examTimeSec($core.int value) => $_setSignedInt32(3, value);
  @$pb.TagNumber(4)
  $core.bool hasExamTimeSec() => $_has(3);
  @$pb.TagNumber(4)
  void clearExamTimeSec() => $_clearField(4);
}

class NextQuestionReq extends $pb.GeneratedMessage {
  factory NextQuestionReq({
    $fixnum.Int64? questionId,
    $core.Iterable<$fixnum.Int64>? optionId,
    $core.int? index,
    $fixnum.Int64? examId,
  }) {
    final result = create();
    if (questionId != null) result.questionId = questionId;
    if (optionId != null) result.optionId.addAll(optionId);
    if (index != null) result.index = index;
    if (examId != null) result.examId = examId;
    return result;
  }

  NextQuestionReq._();

  factory NextQuestionReq.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory NextQuestionReq.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'NextQuestionReq',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'exam'),
      createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'questionId')
    ..p<$fixnum.Int64>(2, _omitFieldNames ? '' : 'optionId', $pb.PbFieldType.K6)
    ..aI(3, _omitFieldNames ? '' : 'index')
    ..aInt64(4, _omitFieldNames ? '' : 'examId')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  NextQuestionReq clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  NextQuestionReq copyWith(void Function(NextQuestionReq) updates) =>
      super.copyWith((message) => updates(message as NextQuestionReq))
          as NextQuestionReq;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static NextQuestionReq create() => NextQuestionReq._();
  @$core.override
  NextQuestionReq createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static NextQuestionReq getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<NextQuestionReq>(create);
  static NextQuestionReq? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get questionId => $_getI64(0);
  @$pb.TagNumber(1)
  set questionId($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasQuestionId() => $_has(0);
  @$pb.TagNumber(1)
  void clearQuestionId() => $_clearField(1);

  @$pb.TagNumber(2)
  $pb.PbList<$fixnum.Int64> get optionId => $_getList(1);

  @$pb.TagNumber(3)
  $core.int get index => $_getIZ(2);
  @$pb.TagNumber(3)
  set index($core.int value) => $_setSignedInt32(2, value);
  @$pb.TagNumber(3)
  $core.bool hasIndex() => $_has(2);
  @$pb.TagNumber(3)
  void clearIndex() => $_clearField(3);

  @$pb.TagNumber(4)
  $fixnum.Int64 get examId => $_getI64(3);
  @$pb.TagNumber(4)
  set examId($fixnum.Int64 value) => $_setInt64(3, value);
  @$pb.TagNumber(4)
  $core.bool hasExamId() => $_has(3);
  @$pb.TagNumber(4)
  void clearExamId() => $_clearField(4);
}

class NextQuestionRsp extends $pb.GeneratedMessage {
  factory NextQuestionRsp({
    $core.bool? finished,
    $core.int? score,
    Question? question,
    $core.bool? pass,
    $core.int? passScore,
  }) {
    final result = create();
    if (finished != null) result.finished = finished;
    if (score != null) result.score = score;
    if (question != null) result.question = question;
    if (pass != null) result.pass = pass;
    if (passScore != null) result.passScore = passScore;
    return result;
  }

  NextQuestionRsp._();

  factory NextQuestionRsp.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory NextQuestionRsp.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'NextQuestionRsp',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'exam'),
      createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'finished')
    ..aI(2, _omitFieldNames ? '' : 'score')
    ..aOM<Question>(3, _omitFieldNames ? '' : 'question',
        subBuilder: Question.create)
    ..aOB(4, _omitFieldNames ? '' : 'pass')
    ..aI(5, _omitFieldNames ? '' : 'passScore')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  NextQuestionRsp clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  NextQuestionRsp copyWith(void Function(NextQuestionRsp) updates) =>
      super.copyWith((message) => updates(message as NextQuestionRsp))
          as NextQuestionRsp;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static NextQuestionRsp create() => NextQuestionRsp._();
  @$core.override
  NextQuestionRsp createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static NextQuestionRsp getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<NextQuestionRsp>(create);
  static NextQuestionRsp? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get finished => $_getBF(0);
  @$pb.TagNumber(1)
  set finished($core.bool value) => $_setBool(0, value);
  @$pb.TagNumber(1)
  $core.bool hasFinished() => $_has(0);
  @$pb.TagNumber(1)
  void clearFinished() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.int get score => $_getIZ(1);
  @$pb.TagNumber(2)
  set score($core.int value) => $_setSignedInt32(1, value);
  @$pb.TagNumber(2)
  $core.bool hasScore() => $_has(1);
  @$pb.TagNumber(2)
  void clearScore() => $_clearField(2);

  @$pb.TagNumber(3)
  Question get question => $_getN(2);
  @$pb.TagNumber(3)
  set question(Question value) => $_setField(3, value);
  @$pb.TagNumber(3)
  $core.bool hasQuestion() => $_has(2);
  @$pb.TagNumber(3)
  void clearQuestion() => $_clearField(3);
  @$pb.TagNumber(3)
  Question ensureQuestion() => $_ensure(2);

  @$pb.TagNumber(4)
  $core.bool get pass => $_getBF(3);
  @$pb.TagNumber(4)
  set pass($core.bool value) => $_setBool(3, value);
  @$pb.TagNumber(4)
  $core.bool hasPass() => $_has(3);
  @$pb.TagNumber(4)
  void clearPass() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.int get passScore => $_getIZ(4);
  @$pb.TagNumber(5)
  set passScore($core.int value) => $_setSignedInt32(4, value);
  @$pb.TagNumber(5)
  $core.bool hasPassScore() => $_has(4);
  @$pb.TagNumber(5)
  void clearPassScore() => $_clearField(5);
}

class Question extends $pb.GeneratedMessage {
  factory Question({
    QuestionType? type,
    $fixnum.Int64? id,
    $core.int? index,
    $core.String? content,
    $core.Iterable<Option>? options,
  }) {
    final result = create();
    if (type != null) result.type = type;
    if (id != null) result.id = id;
    if (index != null) result.index = index;
    if (content != null) result.content = content;
    if (options != null) result.options.addAll(options);
    return result;
  }

  Question._();

  factory Question.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory Question.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'Question',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'exam'),
      createEmptyInstance: create)
    ..aE<QuestionType>(1, _omitFieldNames ? '' : 'type',
        enumValues: QuestionType.values)
    ..aInt64(2, _omitFieldNames ? '' : 'id')
    ..aI(3, _omitFieldNames ? '' : 'index')
    ..aOS(4, _omitFieldNames ? '' : 'content')
    ..pPM<Option>(5, _omitFieldNames ? '' : 'options',
        subBuilder: Option.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Question clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Question copyWith(void Function(Question) updates) =>
      super.copyWith((message) => updates(message as Question)) as Question;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Question create() => Question._();
  @$core.override
  Question createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static Question getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Question>(create);
  static Question? _defaultInstance;

  @$pb.TagNumber(1)
  QuestionType get type => $_getN(0);
  @$pb.TagNumber(1)
  set type(QuestionType value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasType() => $_has(0);
  @$pb.TagNumber(1)
  void clearType() => $_clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get id => $_getI64(1);
  @$pb.TagNumber(2)
  set id($fixnum.Int64 value) => $_setInt64(1, value);
  @$pb.TagNumber(2)
  $core.bool hasId() => $_has(1);
  @$pb.TagNumber(2)
  void clearId() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.int get index => $_getIZ(2);
  @$pb.TagNumber(3)
  set index($core.int value) => $_setSignedInt32(2, value);
  @$pb.TagNumber(3)
  $core.bool hasIndex() => $_has(2);
  @$pb.TagNumber(3)
  void clearIndex() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.String get content => $_getSZ(3);
  @$pb.TagNumber(4)
  set content($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasContent() => $_has(3);
  @$pb.TagNumber(4)
  void clearContent() => $_clearField(4);

  @$pb.TagNumber(5)
  $pb.PbList<Option> get options => $_getList(4);
}

class Option extends $pb.GeneratedMessage {
  factory Option({
    $fixnum.Int64? id,
    $core.String? content,
  }) {
    final result = create();
    if (id != null) result.id = id;
    if (content != null) result.content = content;
    return result;
  }

  Option._();

  factory Option.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory Option.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'Option',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'exam'),
      createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'id')
    ..aOS(2, _omitFieldNames ? '' : 'content')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Option clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Option copyWith(void Function(Option) updates) =>
      super.copyWith((message) => updates(message as Option)) as Option;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Option create() => Option._();
  @$core.override
  Option createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static Option getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Option>(create);
  static Option? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get id => $_getI64(0);
  @$pb.TagNumber(1)
  set id($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get content => $_getSZ(1);
  @$pb.TagNumber(2)
  set content($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasContent() => $_has(1);
  @$pb.TagNumber(2)
  void clearContent() => $_clearField(2);
}

class GsTrainingRoomRsp extends $pb.GeneratedMessage {
  factory GsTrainingRoomRsp({
    $core.Iterable<RoomItem>? rooms,
  }) {
    final result = create();
    if (rooms != null) result.rooms.addAll(rooms);
    return result;
  }

  GsTrainingRoomRsp._();

  factory GsTrainingRoomRsp.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GsTrainingRoomRsp.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GsTrainingRoomRsp',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'exam'),
      createEmptyInstance: create)
    ..pPM<RoomItem>(1, _omitFieldNames ? '' : 'rooms',
        subBuilder: RoomItem.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GsTrainingRoomRsp clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GsTrainingRoomRsp copyWith(void Function(GsTrainingRoomRsp) updates) =>
      super.copyWith((message) => updates(message as GsTrainingRoomRsp))
          as GsTrainingRoomRsp;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GsTrainingRoomRsp create() => GsTrainingRoomRsp._();
  @$core.override
  GsTrainingRoomRsp createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static GsTrainingRoomRsp getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GsTrainingRoomRsp>(create);
  static GsTrainingRoomRsp? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<RoomItem> get rooms => $_getList(0);
}

class RoomItem extends $pb.GeneratedMessage {
  factory RoomItem({
    $fixnum.Int64? id,
    $core.String? title,
    $core.String? cover,
    $core.int? userCount,
    $core.int? micCount,
  }) {
    final result = create();
    if (id != null) result.id = id;
    if (title != null) result.title = title;
    if (cover != null) result.cover = cover;
    if (userCount != null) result.userCount = userCount;
    if (micCount != null) result.micCount = micCount;
    return result;
  }

  RoomItem._();

  factory RoomItem.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory RoomItem.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'RoomItem',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'exam'),
      createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'id')
    ..aOS(2, _omitFieldNames ? '' : 'title')
    ..aOS(3, _omitFieldNames ? '' : 'cover')
    ..aI(4, _omitFieldNames ? '' : 'userCount')
    ..aI(5, _omitFieldNames ? '' : 'micCount')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RoomItem clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RoomItem copyWith(void Function(RoomItem) updates) =>
      super.copyWith((message) => updates(message as RoomItem)) as RoomItem;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RoomItem create() => RoomItem._();
  @$core.override
  RoomItem createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static RoomItem getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<RoomItem>(create);
  static RoomItem? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get id => $_getI64(0);
  @$pb.TagNumber(1)
  set id($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get title => $_getSZ(1);
  @$pb.TagNumber(2)
  set title($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasTitle() => $_has(1);
  @$pb.TagNumber(2)
  void clearTitle() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get cover => $_getSZ(2);
  @$pb.TagNumber(3)
  set cover($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasCover() => $_has(2);
  @$pb.TagNumber(3)
  void clearCover() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.int get userCount => $_getIZ(3);
  @$pb.TagNumber(4)
  set userCount($core.int value) => $_setSignedInt32(3, value);
  @$pb.TagNumber(4)
  $core.bool hasUserCount() => $_has(3);
  @$pb.TagNumber(4)
  void clearUserCount() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.int get micCount => $_getIZ(4);
  @$pb.TagNumber(5)
  set micCount($core.int value) => $_setSignedInt32(4, value);
  @$pb.TagNumber(5)
  $core.bool hasMicCount() => $_has(4);
  @$pb.TagNumber(5)
  void clearMicCount() => $_clearField(5);
}

const $core.bool _omitFieldNames =
    $core.bool.fromEnvironment('protobuf.omit_field_names');
const $core.bool _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');
