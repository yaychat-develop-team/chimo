// This is a generated file - do not edit.
//
// Generated from server_client/gs/gs_persona.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_relative_imports

import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

import 'gs_persona.pbenum.dart';

export 'package:protobuf/protobuf.dart' show GeneratedMessageGenericExtensions;

export 'gs_persona.pbenum.dart';

/// 获取问题列表响应
class GetPersonaQuestionsRsp extends $pb.GeneratedMessage {
  factory GetPersonaQuestionsRsp({
    $core.Iterable<PersonaQuestion>? questions,
  }) {
    final result = create();
    if (questions != null) result.questions.addAll(questions);
    return result;
  }

  GetPersonaQuestionsRsp._();

  factory GetPersonaQuestionsRsp.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GetPersonaQuestionsRsp.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GetPersonaQuestionsRsp',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'gs.persona'),
      createEmptyInstance: create)
    ..pPM<PersonaQuestion>(1, _omitFieldNames ? '' : 'questions',
        subBuilder: PersonaQuestion.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetPersonaQuestionsRsp clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetPersonaQuestionsRsp copyWith(
          void Function(GetPersonaQuestionsRsp) updates) =>
      super.copyWith((message) => updates(message as GetPersonaQuestionsRsp))
          as GetPersonaQuestionsRsp;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetPersonaQuestionsRsp create() => GetPersonaQuestionsRsp._();
  @$core.override
  GetPersonaQuestionsRsp createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static GetPersonaQuestionsRsp getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetPersonaQuestionsRsp>(create);
  static GetPersonaQuestionsRsp? _defaultInstance;

  /// 问题列表
  @$pb.TagNumber(1)
  $pb.PbList<PersonaQuestion> get questions => $_getList(0);
}

/// 问题
class PersonaQuestion extends $pb.GeneratedMessage {
  factory PersonaQuestion({
    $core.String? key,
    $core.String? title,
    $core.bool? multiSelect,
    $core.Iterable<PersonaOption>? options,
    $core.Iterable<$core.String>? selectedOptionKeys,
    $core.Iterable<$core.int>? selectedValues,
  }) {
    final result = create();
    if (key != null) result.key = key;
    if (title != null) result.title = title;
    if (multiSelect != null) result.multiSelect = multiSelect;
    if (options != null) result.options.addAll(options);
    if (selectedOptionKeys != null)
      result.selectedOptionKeys.addAll(selectedOptionKeys);
    if (selectedValues != null) result.selectedValues.addAll(selectedValues);
    return result;
  }

  PersonaQuestion._();

  factory PersonaQuestion.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory PersonaQuestion.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'PersonaQuestion',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'gs.persona'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'key')
    ..aOS(2, _omitFieldNames ? '' : 'title')
    ..aOB(3, _omitFieldNames ? '' : 'multiSelect')
    ..pPM<PersonaOption>(4, _omitFieldNames ? '' : 'options',
        subBuilder: PersonaOption.create)
    ..pPS(5, _omitFieldNames ? '' : 'selectedOptionKeys')
    ..p<$core.int>(
        6, _omitFieldNames ? '' : 'selectedValues', $pb.PbFieldType.KU3)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  PersonaQuestion clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  PersonaQuestion copyWith(void Function(PersonaQuestion) updates) =>
      super.copyWith((message) => updates(message as PersonaQuestion))
          as PersonaQuestion;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static PersonaQuestion create() => PersonaQuestion._();
  @$core.override
  PersonaQuestion createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static PersonaQuestion getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<PersonaQuestion>(create);
  static PersonaQuestion? _defaultInstance;

  /// 问题key（对应tb_persona_custom_option字段名：region_level/height_level/occupation_category/family_level/education_level/career_level）
  @$pb.TagNumber(1)
  $core.String get key => $_getSZ(0);
  @$pb.TagNumber(1)
  set key($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasKey() => $_has(0);
  @$pb.TagNumber(1)
  void clearKey() => $_clearField(1);

  /// 问题标题（如：Where do you wish to live?）
  @$pb.TagNumber(2)
  $core.String get title => $_getSZ(1);
  @$pb.TagNumber(2)
  set title($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasTitle() => $_has(1);
  @$pb.TagNumber(2)
  void clearTitle() => $_clearField(2);

  /// 是否多选
  @$pb.TagNumber(3)
  $core.bool get multiSelect => $_getBF(2);
  @$pb.TagNumber(3)
  set multiSelect($core.bool value) => $_setBool(2, value);
  @$pb.TagNumber(3)
  $core.bool hasMultiSelect() => $_has(2);
  @$pb.TagNumber(3)
  void clearMultiSelect() => $_clearField(3);

  /// 选项列表
  @$pb.TagNumber(4)
  $pb.PbList<PersonaOption> get options => $_getList(3);

  /// 已选择的项key集合（字符串）
  @$pb.TagNumber(5)
  $pb.PbList<$core.String> get selectedOptionKeys => $_getList(4);

  /// 已选择项映射数值（如1/2/3），便于直接落库
  @$pb.TagNumber(6)
  $pb.PbList<$core.int> get selectedValues => $_getList(5);
}

/// 选项
class PersonaOption extends $pb.GeneratedMessage {
  factory PersonaOption({
    $core.String? key,
    $core.String? text,
    $core.int? value,
  }) {
    final result = create();
    if (key != null) result.key = key;
    if (text != null) result.text = text;
    if (value != null) result.value = value;
    return result;
  }

  PersonaOption._();

  factory PersonaOption.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory PersonaOption.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'PersonaOption',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'gs.persona'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'key')
    ..aOS(2, _omitFieldNames ? '' : 'text')
    ..aI(3, _omitFieldNames ? '' : 'value', fieldType: $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  PersonaOption clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  PersonaOption copyWith(void Function(PersonaOption) updates) =>
      super.copyWith((message) => updates(message as PersonaOption))
          as PersonaOption;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static PersonaOption create() => PersonaOption._();
  @$core.override
  PersonaOption createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static PersonaOption getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<PersonaOption>(create);
  static PersonaOption? _defaultInstance;

  /// 选项key（字符串，如：big_city/small_town/countryside）
  @$pb.TagNumber(1)
  $core.String get key => $_getSZ(0);
  @$pb.TagNumber(1)
  set key($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasKey() => $_has(0);
  @$pb.TagNumber(1)
  void clearKey() => $_clearField(1);

  /// 选项展示文案
  @$pb.TagNumber(2)
  $core.String get text => $_getSZ(1);
  @$pb.TagNumber(2)
  set text($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasText() => $_has(1);
  @$pb.TagNumber(2)
  void clearText() => $_clearField(2);

  /// 映射到库中数值：1/2/3...
  @$pb.TagNumber(3)
  $core.int get value => $_getIZ(2);
  @$pb.TagNumber(3)
  set value($core.int value) => $_setUnsignedInt32(2, value);
  @$pb.TagNumber(3)
  $core.bool hasValue() => $_has(2);
  @$pb.TagNumber(3)
  void clearValue() => $_clearField(3);
}

/// 用户选择项
class PersonaSelection extends $pb.GeneratedMessage {
  factory PersonaSelection({
    $core.String? questionKey,
    $core.Iterable<$core.String>? optionKeys,
    $core.Iterable<$core.int>? values,
  }) {
    final result = create();
    if (questionKey != null) result.questionKey = questionKey;
    if (optionKeys != null) result.optionKeys.addAll(optionKeys);
    if (values != null) result.values.addAll(values);
    return result;
  }

  PersonaSelection._();

  factory PersonaSelection.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory PersonaSelection.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'PersonaSelection',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'gs.persona'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'questionKey')
    ..pPS(2, _omitFieldNames ? '' : 'optionKeys')
    ..p<$core.int>(3, _omitFieldNames ? '' : 'values', $pb.PbFieldType.KU3)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  PersonaSelection clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  PersonaSelection copyWith(void Function(PersonaSelection) updates) =>
      super.copyWith((message) => updates(message as PersonaSelection))
          as PersonaSelection;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static PersonaSelection create() => PersonaSelection._();
  @$core.override
  PersonaSelection createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static PersonaSelection getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<PersonaSelection>(create);
  static PersonaSelection? _defaultInstance;

  /// 问题key，对应 PersonaQuestion.key
  @$pb.TagNumber(1)
  $core.String get questionKey => $_getSZ(0);
  @$pb.TagNumber(1)
  set questionKey($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasQuestionKey() => $_has(0);
  @$pb.TagNumber(1)
  void clearQuestionKey() => $_clearField(1);

  /// 选项key集合；单选题仅取第一个
  @$pb.TagNumber(2)
  $pb.PbList<$core.String> get optionKeys => $_getList(1);

  /// 数值集合：与option_keys一一对应；单选题仅取第一个
  @$pb.TagNumber(3)
  $pb.PbList<$core.int> get values => $_getList(2);
}

/// 提交选择请求
class SubmitPersonaSelectionsReq extends $pb.GeneratedMessage {
  factory SubmitPersonaSelectionsReq({
    $fixnum.Int64? gsId,
    $core.Iterable<PersonaSelection>? selections,
  }) {
    final result = create();
    if (gsId != null) result.gsId = gsId;
    if (selections != null) result.selections.addAll(selections);
    return result;
  }

  SubmitPersonaSelectionsReq._();

  factory SubmitPersonaSelectionsReq.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory SubmitPersonaSelectionsReq.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'SubmitPersonaSelectionsReq',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'gs.persona'),
      createEmptyInstance: create)
    ..a<$fixnum.Int64>(1, _omitFieldNames ? '' : 'gsId', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..pPM<PersonaSelection>(2, _omitFieldNames ? '' : 'selections',
        subBuilder: PersonaSelection.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SubmitPersonaSelectionsReq clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SubmitPersonaSelectionsReq copyWith(
          void Function(SubmitPersonaSelectionsReq) updates) =>
      super.copyWith(
              (message) => updates(message as SubmitPersonaSelectionsReq))
          as SubmitPersonaSelectionsReq;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SubmitPersonaSelectionsReq create() => SubmitPersonaSelectionsReq._();
  @$core.override
  SubmitPersonaSelectionsReq createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static SubmitPersonaSelectionsReq getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<SubmitPersonaSelectionsReq>(create);
  static SubmitPersonaSelectionsReq? _defaultInstance;

  /// 主播用户ID
  @$pb.TagNumber(1)
  $fixnum.Int64 get gsId => $_getI64(0);
  @$pb.TagNumber(1)
  set gsId($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasGsId() => $_has(0);
  @$pb.TagNumber(1)
  void clearGsId() => $_clearField(1);

  /// 选择项集合
  @$pb.TagNumber(2)
  $pb.PbList<PersonaSelection> get selections => $_getList(1);
}

/// ========== 候选资料 / 领取 ==========
/// 候选资料列表响应
class GetCandidateProfilesRsp extends $pb.GeneratedMessage {
  factory GetCandidateProfilesRsp({
    $core.Iterable<PersonaProfileCandidate>? candidates,
  }) {
    final result = create();
    if (candidates != null) result.candidates.addAll(candidates);
    return result;
  }

  GetCandidateProfilesRsp._();

  factory GetCandidateProfilesRsp.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GetCandidateProfilesRsp.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GetCandidateProfilesRsp',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'gs.persona'),
      createEmptyInstance: create)
    ..pPM<PersonaProfileCandidate>(1, _omitFieldNames ? '' : 'candidates',
        subBuilder: PersonaProfileCandidate.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetCandidateProfilesRsp clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetCandidateProfilesRsp copyWith(
          void Function(GetCandidateProfilesRsp) updates) =>
      super.copyWith((message) => updates(message as GetCandidateProfilesRsp))
          as GetCandidateProfilesRsp;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetCandidateProfilesRsp create() => GetCandidateProfilesRsp._();
  @$core.override
  GetCandidateProfilesRsp createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static GetCandidateProfilesRsp getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetCandidateProfilesRsp>(create);
  static GetCandidateProfilesRsp? _defaultInstance;

  /// 候选资料项
  @$pb.TagNumber(1)
  $pb.PbList<PersonaProfileCandidate> get candidates => $_getList(0);
}

/// 候选资料概要
class PersonaProfileCandidate extends $pb.GeneratedMessage {
  factory PersonaProfileCandidate({
    $fixnum.Int64? candidateId,
    $core.String? name,
    $core.String? age,
    $core.String? countryRegion,
    $core.String? occupation,
    $core.String? brief,
    $core.String? avatarUrl,
    $core.Iterable<$core.String>? sampleAlbumUrls,
    $core.int? heightCm,
    $core.int? weightKg,
    $core.int? bustSize,
    $core.int? waistSize,
    $core.int? hipSize,
    $core.String? physicalInfo,
    $core.String? educationBackground,
    $core.String? workExperience,
    $core.String? personalityTraits,
    $core.String? hobbies,
    $core.String? streamingReason,
    $core.String? familyBackground,
  }) {
    final result = create();
    if (candidateId != null) result.candidateId = candidateId;
    if (name != null) result.name = name;
    if (age != null) result.age = age;
    if (countryRegion != null) result.countryRegion = countryRegion;
    if (occupation != null) result.occupation = occupation;
    if (brief != null) result.brief = brief;
    if (avatarUrl != null) result.avatarUrl = avatarUrl;
    if (sampleAlbumUrls != null) result.sampleAlbumUrls.addAll(sampleAlbumUrls);
    if (heightCm != null) result.heightCm = heightCm;
    if (weightKg != null) result.weightKg = weightKg;
    if (bustSize != null) result.bustSize = bustSize;
    if (waistSize != null) result.waistSize = waistSize;
    if (hipSize != null) result.hipSize = hipSize;
    if (physicalInfo != null) result.physicalInfo = physicalInfo;
    if (educationBackground != null)
      result.educationBackground = educationBackground;
    if (workExperience != null) result.workExperience = workExperience;
    if (personalityTraits != null) result.personalityTraits = personalityTraits;
    if (hobbies != null) result.hobbies = hobbies;
    if (streamingReason != null) result.streamingReason = streamingReason;
    if (familyBackground != null) result.familyBackground = familyBackground;
    return result;
  }

  PersonaProfileCandidate._();

  factory PersonaProfileCandidate.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory PersonaProfileCandidate.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'PersonaProfileCandidate',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'gs.persona'),
      createEmptyInstance: create)
    ..a<$fixnum.Int64>(
        1, _omitFieldNames ? '' : 'candidateId', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..aOS(2, _omitFieldNames ? '' : 'name')
    ..aOS(3, _omitFieldNames ? '' : 'age')
    ..aOS(4, _omitFieldNames ? '' : 'countryRegion')
    ..aOS(5, _omitFieldNames ? '' : 'occupation')
    ..aOS(6, _omitFieldNames ? '' : 'brief')
    ..aOS(7, _omitFieldNames ? '' : 'avatarUrl')
    ..pPS(8, _omitFieldNames ? '' : 'sampleAlbumUrls')
    ..aI(9, _omitFieldNames ? '' : 'heightCm', fieldType: $pb.PbFieldType.OU3)
    ..aI(10, _omitFieldNames ? '' : 'weightKg', fieldType: $pb.PbFieldType.OU3)
    ..aI(11, _omitFieldNames ? '' : 'bustSize', fieldType: $pb.PbFieldType.OU3)
    ..aI(12, _omitFieldNames ? '' : 'waistSize', fieldType: $pb.PbFieldType.OU3)
    ..aI(13, _omitFieldNames ? '' : 'hipSize', fieldType: $pb.PbFieldType.OU3)
    ..aOS(14, _omitFieldNames ? '' : 'physicalInfo')
    ..aOS(15, _omitFieldNames ? '' : 'educationBackground')
    ..aOS(16, _omitFieldNames ? '' : 'workExperience')
    ..aOS(17, _omitFieldNames ? '' : 'personalityTraits')
    ..aOS(18, _omitFieldNames ? '' : 'hobbies')
    ..aOS(19, _omitFieldNames ? '' : 'streamingReason')
    ..aOS(20, _omitFieldNames ? '' : 'familyBackground')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  PersonaProfileCandidate clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  PersonaProfileCandidate copyWith(
          void Function(PersonaProfileCandidate) updates) =>
      super.copyWith((message) => updates(message as PersonaProfileCandidate))
          as PersonaProfileCandidate;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static PersonaProfileCandidate create() => PersonaProfileCandidate._();
  @$core.override
  PersonaProfileCandidate createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static PersonaProfileCandidate getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<PersonaProfileCandidate>(create);
  static PersonaProfileCandidate? _defaultInstance;

  /// 候选ID
  @$pb.TagNumber(1)
  $fixnum.Int64 get candidateId => $_getI64(0);
  @$pb.TagNumber(1)
  set candidateId($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasCandidateId() => $_has(0);
  @$pb.TagNumber(1)
  void clearCandidateId() => $_clearField(1);

  /// 姓名
  @$pb.TagNumber(2)
  $core.String get name => $_getSZ(1);
  @$pb.TagNumber(2)
  set name($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasName() => $_has(1);
  @$pb.TagNumber(2)
  void clearName() => $_clearField(2);

  /// 年龄（字符串以保持与库一致）
  @$pb.TagNumber(3)
  $core.String get age => $_getSZ(2);
  @$pb.TagNumber(3)
  set age($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasAge() => $_has(2);
  @$pb.TagNumber(3)
  void clearAge() => $_clearField(3);

  /// 所属国家或地区
  @$pb.TagNumber(4)
  $core.String get countryRegion => $_getSZ(3);
  @$pb.TagNumber(4)
  set countryRegion($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasCountryRegion() => $_has(3);
  @$pb.TagNumber(4)
  void clearCountryRegion() => $_clearField(4);

  /// 职业
  @$pb.TagNumber(5)
  $core.String get occupation => $_getSZ(4);
  @$pb.TagNumber(5)
  set occupation($core.String value) => $_setString(4, value);
  @$pb.TagNumber(5)
  $core.bool hasOccupation() => $_has(4);
  @$pb.TagNumber(5)
  void clearOccupation() => $_clearField(5);

  /// 简介
  @$pb.TagNumber(6)
  $core.String get brief => $_getSZ(5);
  @$pb.TagNumber(6)
  set brief($core.String value) => $_setString(5, value);
  @$pb.TagNumber(6)
  $core.bool hasBrief() => $_has(5);
  @$pb.TagNumber(6)
  void clearBrief() => $_clearField(6);

  /// 头像
  @$pb.TagNumber(7)
  $core.String get avatarUrl => $_getSZ(6);
  @$pb.TagNumber(7)
  set avatarUrl($core.String value) => $_setString(6, value);
  @$pb.TagNumber(7)
  $core.bool hasAvatarUrl() => $_has(6);
  @$pb.TagNumber(7)
  void clearAvatarUrl() => $_clearField(7);

  /// 相册预览
  @$pb.TagNumber(8)
  $pb.PbList<$core.String> get sampleAlbumUrls => $_getList(7);

  /// 身高(cm)
  @$pb.TagNumber(9)
  $core.int get heightCm => $_getIZ(8);
  @$pb.TagNumber(9)
  set heightCm($core.int value) => $_setUnsignedInt32(8, value);
  @$pb.TagNumber(9)
  $core.bool hasHeightCm() => $_has(8);
  @$pb.TagNumber(9)
  void clearHeightCm() => $_clearField(9);

  /// 体重(kg)
  @$pb.TagNumber(10)
  $core.int get weightKg => $_getIZ(9);
  @$pb.TagNumber(10)
  set weightKg($core.int value) => $_setUnsignedInt32(9, value);
  @$pb.TagNumber(10)
  $core.bool hasWeightKg() => $_has(9);
  @$pb.TagNumber(10)
  void clearWeightKg() => $_clearField(10);

  /// 胸围(cm)
  @$pb.TagNumber(11)
  $core.int get bustSize => $_getIZ(10);
  @$pb.TagNumber(11)
  set bustSize($core.int value) => $_setUnsignedInt32(10, value);
  @$pb.TagNumber(11)
  $core.bool hasBustSize() => $_has(10);
  @$pb.TagNumber(11)
  void clearBustSize() => $_clearField(11);

  /// 腰围(cm)
  @$pb.TagNumber(12)
  $core.int get waistSize => $_getIZ(11);
  @$pb.TagNumber(12)
  set waistSize($core.int value) => $_setUnsignedInt32(11, value);
  @$pb.TagNumber(12)
  $core.bool hasWaistSize() => $_has(11);
  @$pb.TagNumber(12)
  void clearWaistSize() => $_clearField(12);

  /// 臀围(cm)
  @$pb.TagNumber(13)
  $core.int get hipSize => $_getIZ(12);
  @$pb.TagNumber(13)
  set hipSize($core.int value) => $_setUnsignedInt32(12, value);
  @$pb.TagNumber(13)
  $core.bool hasHipSize() => $_has(12);
  @$pb.TagNumber(13)
  void clearHipSize() => $_clearField(13);

  /// 身体信息组合字符串，格式: "Height: 168 cm、Weight: 58 kg、Measurements: 88-68-92"
  @$pb.TagNumber(14)
  $core.String get physicalInfo => $_getSZ(13);
  @$pb.TagNumber(14)
  set physicalInfo($core.String value) => $_setString(13, value);
  @$pb.TagNumber(14)
  $core.bool hasPhysicalInfo() => $_has(13);
  @$pb.TagNumber(14)
  void clearPhysicalInfo() => $_clearField(14);

  /// 教育背景（简述）
  @$pb.TagNumber(15)
  $core.String get educationBackground => $_getSZ(14);
  @$pb.TagNumber(15)
  set educationBackground($core.String value) => $_setString(14, value);
  @$pb.TagNumber(15)
  $core.bool hasEducationBackground() => $_has(14);
  @$pb.TagNumber(15)
  void clearEducationBackground() => $_clearField(15);

  /// 工作经历（简述）
  @$pb.TagNumber(16)
  $core.String get workExperience => $_getSZ(15);
  @$pb.TagNumber(16)
  set workExperience($core.String value) => $_setString(15, value);
  @$pb.TagNumber(16)
  $core.bool hasWorkExperience() => $_has(15);
  @$pb.TagNumber(16)
  void clearWorkExperience() => $_clearField(16);

  /// 性格特征（简述）
  @$pb.TagNumber(17)
  $core.String get personalityTraits => $_getSZ(16);
  @$pb.TagNumber(17)
  set personalityTraits($core.String value) => $_setString(16, value);
  @$pb.TagNumber(17)
  $core.bool hasPersonalityTraits() => $_has(16);
  @$pb.TagNumber(17)
  void clearPersonalityTraits() => $_clearField(17);

  /// 兴趣爱好
  @$pb.TagNumber(18)
  $core.String get hobbies => $_getSZ(17);
  @$pb.TagNumber(18)
  set hobbies($core.String value) => $_setString(17, value);
  @$pb.TagNumber(18)
  $core.bool hasHobbies() => $_has(17);
  @$pb.TagNumber(18)
  void clearHobbies() => $_clearField(18);

  /// 成为主播原因
  @$pb.TagNumber(19)
  $core.String get streamingReason => $_getSZ(18);
  @$pb.TagNumber(19)
  set streamingReason($core.String value) => $_setString(18, value);
  @$pb.TagNumber(19)
  $core.bool hasStreamingReason() => $_has(18);
  @$pb.TagNumber(19)
  void clearStreamingReason() => $_clearField(19);

  /// 家庭背景（简述）
  @$pb.TagNumber(20)
  $core.String get familyBackground => $_getSZ(19);
  @$pb.TagNumber(20)
  set familyBackground($core.String value) => $_setString(19, value);
  @$pb.TagNumber(20)
  $core.bool hasFamilyBackground() => $_has(19);
  @$pb.TagNumber(20)
  void clearFamilyBackground() => $_clearField(20);
}

/// 领取预生成资料请求
class ClaimPreGeneratedProfileReq extends $pb.GeneratedMessage {
  factory ClaimPreGeneratedProfileReq({
    $fixnum.Int64? personaId,
  }) {
    final result = create();
    if (personaId != null) result.personaId = personaId;
    return result;
  }

  ClaimPreGeneratedProfileReq._();

  factory ClaimPreGeneratedProfileReq.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ClaimPreGeneratedProfileReq.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ClaimPreGeneratedProfileReq',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'gs.persona'),
      createEmptyInstance: create)
    ..a<$fixnum.Int64>(
        1, _omitFieldNames ? '' : 'personaId', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ClaimPreGeneratedProfileReq clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ClaimPreGeneratedProfileReq copyWith(
          void Function(ClaimPreGeneratedProfileReq) updates) =>
      super.copyWith(
              (message) => updates(message as ClaimPreGeneratedProfileReq))
          as ClaimPreGeneratedProfileReq;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ClaimPreGeneratedProfileReq create() =>
      ClaimPreGeneratedProfileReq._();
  @$core.override
  ClaimPreGeneratedProfileReq createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ClaimPreGeneratedProfileReq getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ClaimPreGeneratedProfileReq>(create);
  static ClaimPreGeneratedProfileReq? _defaultInstance;

  /// 人设ID
  @$pb.TagNumber(1)
  $fixnum.Int64 get personaId => $_getI64(0);
  @$pb.TagNumber(1)
  set personaId($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasPersonaId() => $_has(0);
  @$pb.TagNumber(1)
  void clearPersonaId() => $_clearField(1);
}

/// 查询人设详情响应
class GetPersonaDetailRsp extends $pb.GeneratedMessage {
  factory GetPersonaDetailRsp({
    BackgroundInfo? background,
    MyStoryInfo? story,
    PhotoAlbum? album,
    $fixnum.Int64? personaId,
  }) {
    final result = create();
    if (background != null) result.background = background;
    if (story != null) result.story = story;
    if (album != null) result.album = album;
    if (personaId != null) result.personaId = personaId;
    return result;
  }

  GetPersonaDetailRsp._();

  factory GetPersonaDetailRsp.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GetPersonaDetailRsp.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GetPersonaDetailRsp',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'gs.persona'),
      createEmptyInstance: create)
    ..aOM<BackgroundInfo>(1, _omitFieldNames ? '' : 'background',
        subBuilder: BackgroundInfo.create)
    ..aOM<MyStoryInfo>(2, _omitFieldNames ? '' : 'story',
        subBuilder: MyStoryInfo.create)
    ..aOM<PhotoAlbum>(3, _omitFieldNames ? '' : 'album',
        subBuilder: PhotoAlbum.create)
    ..a<$fixnum.Int64>(
        4, _omitFieldNames ? '' : 'personaId', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetPersonaDetailRsp clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetPersonaDetailRsp copyWith(void Function(GetPersonaDetailRsp) updates) =>
      super.copyWith((message) => updates(message as GetPersonaDetailRsp))
          as GetPersonaDetailRsp;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetPersonaDetailRsp create() => GetPersonaDetailRsp._();
  @$core.override
  GetPersonaDetailRsp createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static GetPersonaDetailRsp getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetPersonaDetailRsp>(create);
  static GetPersonaDetailRsp? _defaultInstance;

  /// 背景资料
  @$pb.TagNumber(1)
  BackgroundInfo get background => $_getN(0);
  @$pb.TagNumber(1)
  set background(BackgroundInfo value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasBackground() => $_has(0);
  @$pb.TagNumber(1)
  void clearBackground() => $_clearField(1);
  @$pb.TagNumber(1)
  BackgroundInfo ensureBackground() => $_ensure(0);

  /// 我的故事
  @$pb.TagNumber(2)
  MyStoryInfo get story => $_getN(1);
  @$pb.TagNumber(2)
  set story(MyStoryInfo value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasStory() => $_has(1);
  @$pb.TagNumber(2)
  void clearStory() => $_clearField(2);
  @$pb.TagNumber(2)
  MyStoryInfo ensureStory() => $_ensure(1);

  /// 照片相册
  @$pb.TagNumber(3)
  PhotoAlbum get album => $_getN(2);
  @$pb.TagNumber(3)
  set album(PhotoAlbum value) => $_setField(3, value);
  @$pb.TagNumber(3)
  $core.bool hasAlbum() => $_has(2);
  @$pb.TagNumber(3)
  void clearAlbum() => $_clearField(3);
  @$pb.TagNumber(3)
  PhotoAlbum ensureAlbum() => $_ensure(2);

  /// 人设ID
  @$pb.TagNumber(4)
  $fixnum.Int64 get personaId => $_getI64(3);
  @$pb.TagNumber(4)
  set personaId($fixnum.Int64 value) => $_setInt64(3, value);
  @$pb.TagNumber(4)
  $core.bool hasPersonaId() => $_has(3);
  @$pb.TagNumber(4)
  void clearPersonaId() => $_clearField(4);
}

/// 背景资料
class BackgroundInfo extends $pb.GeneratedMessage {
  factory BackgroundInfo({
    $core.String? name,
    $core.String? countryRegion,
    $core.String? age,
    $core.String? gender,
    $core.String? occupation,
    $core.String? heightCm,
    $core.String? weightKg,
    $core.String? bustSize,
    $core.String? waistSize,
    $core.String? hipSize,
    $core.String? educationBackground,
    $core.String? workExperience,
    $core.String? personalityTraits,
    $core.String? hobbies,
    $core.String? streamingReason,
    $core.String? familyBackground,
    $core.String? birthCity,
    $core.String? livingCity,
  }) {
    final result = create();
    if (name != null) result.name = name;
    if (countryRegion != null) result.countryRegion = countryRegion;
    if (age != null) result.age = age;
    if (gender != null) result.gender = gender;
    if (occupation != null) result.occupation = occupation;
    if (heightCm != null) result.heightCm = heightCm;
    if (weightKg != null) result.weightKg = weightKg;
    if (bustSize != null) result.bustSize = bustSize;
    if (waistSize != null) result.waistSize = waistSize;
    if (hipSize != null) result.hipSize = hipSize;
    if (educationBackground != null)
      result.educationBackground = educationBackground;
    if (workExperience != null) result.workExperience = workExperience;
    if (personalityTraits != null) result.personalityTraits = personalityTraits;
    if (hobbies != null) result.hobbies = hobbies;
    if (streamingReason != null) result.streamingReason = streamingReason;
    if (familyBackground != null) result.familyBackground = familyBackground;
    if (birthCity != null) result.birthCity = birthCity;
    if (livingCity != null) result.livingCity = livingCity;
    return result;
  }

  BackgroundInfo._();

  factory BackgroundInfo.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory BackgroundInfo.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'BackgroundInfo',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'gs.persona'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'name')
    ..aOS(2, _omitFieldNames ? '' : 'countryRegion')
    ..aOS(3, _omitFieldNames ? '' : 'age')
    ..aOS(4, _omitFieldNames ? '' : 'gender')
    ..aOS(5, _omitFieldNames ? '' : 'occupation')
    ..aOS(6, _omitFieldNames ? '' : 'heightCm')
    ..aOS(7, _omitFieldNames ? '' : 'weightKg')
    ..aOS(8, _omitFieldNames ? '' : 'bustSize')
    ..aOS(9, _omitFieldNames ? '' : 'waistSize')
    ..aOS(10, _omitFieldNames ? '' : 'hipSize')
    ..aOS(11, _omitFieldNames ? '' : 'educationBackground')
    ..aOS(12, _omitFieldNames ? '' : 'workExperience')
    ..aOS(13, _omitFieldNames ? '' : 'personalityTraits')
    ..aOS(14, _omitFieldNames ? '' : 'hobbies')
    ..aOS(15, _omitFieldNames ? '' : 'streamingReason')
    ..aOS(16, _omitFieldNames ? '' : 'familyBackground')
    ..aOS(17, _omitFieldNames ? '' : 'birthCity')
    ..aOS(18, _omitFieldNames ? '' : 'livingCity')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  BackgroundInfo clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  BackgroundInfo copyWith(void Function(BackgroundInfo) updates) =>
      super.copyWith((message) => updates(message as BackgroundInfo))
          as BackgroundInfo;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static BackgroundInfo create() => BackgroundInfo._();
  @$core.override
  BackgroundInfo createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static BackgroundInfo getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<BackgroundInfo>(create);
  static BackgroundInfo? _defaultInstance;

  /// 人设名称
  @$pb.TagNumber(1)
  $core.String get name => $_getSZ(0);
  @$pb.TagNumber(1)
  set name($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasName() => $_has(0);
  @$pb.TagNumber(1)
  void clearName() => $_clearField(1);

  /// 国家或地区
  @$pb.TagNumber(2)
  $core.String get countryRegion => $_getSZ(1);
  @$pb.TagNumber(2)
  set countryRegion($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasCountryRegion() => $_has(1);
  @$pb.TagNumber(2)
  void clearCountryRegion() => $_clearField(2);

  /// 年龄
  @$pb.TagNumber(3)
  $core.String get age => $_getSZ(2);
  @$pb.TagNumber(3)
  set age($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasAge() => $_has(2);
  @$pb.TagNumber(3)
  void clearAge() => $_clearField(3);

  /// 性别
  @$pb.TagNumber(4)
  $core.String get gender => $_getSZ(3);
  @$pb.TagNumber(4)
  set gender($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasGender() => $_has(3);
  @$pb.TagNumber(4)
  void clearGender() => $_clearField(4);

  /// 职业
  @$pb.TagNumber(5)
  $core.String get occupation => $_getSZ(4);
  @$pb.TagNumber(5)
  set occupation($core.String value) => $_setString(4, value);
  @$pb.TagNumber(5)
  $core.bool hasOccupation() => $_has(4);
  @$pb.TagNumber(5)
  void clearOccupation() => $_clearField(5);

  /// 身高(cm)
  @$pb.TagNumber(6)
  $core.String get heightCm => $_getSZ(5);
  @$pb.TagNumber(6)
  set heightCm($core.String value) => $_setString(5, value);
  @$pb.TagNumber(6)
  $core.bool hasHeightCm() => $_has(5);
  @$pb.TagNumber(6)
  void clearHeightCm() => $_clearField(6);

  /// 体重(kg)
  @$pb.TagNumber(7)
  $core.String get weightKg => $_getSZ(6);
  @$pb.TagNumber(7)
  set weightKg($core.String value) => $_setString(6, value);
  @$pb.TagNumber(7)
  $core.bool hasWeightKg() => $_has(6);
  @$pb.TagNumber(7)
  void clearWeightKg() => $_clearField(7);

  /// 胸围(cm)
  @$pb.TagNumber(8)
  $core.String get bustSize => $_getSZ(7);
  @$pb.TagNumber(8)
  set bustSize($core.String value) => $_setString(7, value);
  @$pb.TagNumber(8)
  $core.bool hasBustSize() => $_has(7);
  @$pb.TagNumber(8)
  void clearBustSize() => $_clearField(8);

  /// 腰围(cm)
  @$pb.TagNumber(9)
  $core.String get waistSize => $_getSZ(8);
  @$pb.TagNumber(9)
  set waistSize($core.String value) => $_setString(8, value);
  @$pb.TagNumber(9)
  $core.bool hasWaistSize() => $_has(8);
  @$pb.TagNumber(9)
  void clearWaistSize() => $_clearField(9);

  /// 臀围(cm)
  @$pb.TagNumber(10)
  $core.String get hipSize => $_getSZ(9);
  @$pb.TagNumber(10)
  set hipSize($core.String value) => $_setString(9, value);
  @$pb.TagNumber(10)
  $core.bool hasHipSize() => $_has(9);
  @$pb.TagNumber(10)
  void clearHipSize() => $_clearField(10);

  /// 教育背景（简述）
  @$pb.TagNumber(11)
  $core.String get educationBackground => $_getSZ(10);
  @$pb.TagNumber(11)
  set educationBackground($core.String value) => $_setString(10, value);
  @$pb.TagNumber(11)
  $core.bool hasEducationBackground() => $_has(10);
  @$pb.TagNumber(11)
  void clearEducationBackground() => $_clearField(11);

  /// 工作经历（简述）
  @$pb.TagNumber(12)
  $core.String get workExperience => $_getSZ(11);
  @$pb.TagNumber(12)
  set workExperience($core.String value) => $_setString(11, value);
  @$pb.TagNumber(12)
  $core.bool hasWorkExperience() => $_has(11);
  @$pb.TagNumber(12)
  void clearWorkExperience() => $_clearField(12);

  /// 性格特征（简述）
  @$pb.TagNumber(13)
  $core.String get personalityTraits => $_getSZ(12);
  @$pb.TagNumber(13)
  set personalityTraits($core.String value) => $_setString(12, value);
  @$pb.TagNumber(13)
  $core.bool hasPersonalityTraits() => $_has(12);
  @$pb.TagNumber(13)
  void clearPersonalityTraits() => $_clearField(13);

  /// 兴趣爱好
  @$pb.TagNumber(14)
  $core.String get hobbies => $_getSZ(13);
  @$pb.TagNumber(14)
  set hobbies($core.String value) => $_setString(13, value);
  @$pb.TagNumber(14)
  $core.bool hasHobbies() => $_has(13);
  @$pb.TagNumber(14)
  void clearHobbies() => $_clearField(14);

  /// 成为主播原因
  @$pb.TagNumber(15)
  $core.String get streamingReason => $_getSZ(14);
  @$pb.TagNumber(15)
  set streamingReason($core.String value) => $_setString(14, value);
  @$pb.TagNumber(15)
  $core.bool hasStreamingReason() => $_has(14);
  @$pb.TagNumber(15)
  void clearStreamingReason() => $_clearField(15);

  /// 家庭背景（简述）
  @$pb.TagNumber(16)
  $core.String get familyBackground => $_getSZ(15);
  @$pb.TagNumber(16)
  set familyBackground($core.String value) => $_setString(15, value);
  @$pb.TagNumber(16)
  $core.bool hasFamilyBackground() => $_has(15);
  @$pb.TagNumber(16)
  void clearFamilyBackground() => $_clearField(16);

  /// 出生城市
  @$pb.TagNumber(17)
  $core.String get birthCity => $_getSZ(16);
  @$pb.TagNumber(17)
  set birthCity($core.String value) => $_setString(16, value);
  @$pb.TagNumber(17)
  $core.bool hasBirthCity() => $_has(16);
  @$pb.TagNumber(17)
  void clearBirthCity() => $_clearField(17);

  /// 居住城市
  @$pb.TagNumber(18)
  $core.String get livingCity => $_getSZ(17);
  @$pb.TagNumber(18)
  set livingCity($core.String value) => $_setString(17, value);
  @$pb.TagNumber(18)
  $core.bool hasLivingCity() => $_has(17);
  @$pb.TagNumber(18)
  void clearLivingCity() => $_clearField(18);
}

/// 我的故事
class MyStoryInfo extends $pb.GeneratedMessage {
  factory MyStoryInfo({
    $core.String? familyStory,
    $core.String? emotionStoryFirst,
    $core.String? emotionStorySecond,
  }) {
    final result = create();
    if (familyStory != null) result.familyStory = familyStory;
    if (emotionStoryFirst != null) result.emotionStoryFirst = emotionStoryFirst;
    if (emotionStorySecond != null)
      result.emotionStorySecond = emotionStorySecond;
    return result;
  }

  MyStoryInfo._();

  factory MyStoryInfo.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory MyStoryInfo.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'MyStoryInfo',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'gs.persona'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'familyStory')
    ..aOS(2, _omitFieldNames ? '' : 'emotionStoryFirst')
    ..aOS(3, _omitFieldNames ? '' : 'emotionStorySecond')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  MyStoryInfo clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  MyStoryInfo copyWith(void Function(MyStoryInfo) updates) =>
      super.copyWith((message) => updates(message as MyStoryInfo))
          as MyStoryInfo;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static MyStoryInfo create() => MyStoryInfo._();
  @$core.override
  MyStoryInfo createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static MyStoryInfo getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<MyStoryInfo>(create);
  static MyStoryInfo? _defaultInstance;

  /// 家庭故事
  @$pb.TagNumber(1)
  $core.String get familyStory => $_getSZ(0);
  @$pb.TagNumber(1)
  set familyStory($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasFamilyStory() => $_has(0);
  @$pb.TagNumber(1)
  void clearFamilyStory() => $_clearField(1);

  /// 情感故事一
  @$pb.TagNumber(2)
  $core.String get emotionStoryFirst => $_getSZ(1);
  @$pb.TagNumber(2)
  set emotionStoryFirst($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasEmotionStoryFirst() => $_has(1);
  @$pb.TagNumber(2)
  void clearEmotionStoryFirst() => $_clearField(2);

  /// 情感故事二
  @$pb.TagNumber(3)
  $core.String get emotionStorySecond => $_getSZ(2);
  @$pb.TagNumber(3)
  set emotionStorySecond($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasEmotionStorySecond() => $_has(2);
  @$pb.TagNumber(3)
  void clearEmotionStorySecond() => $_clearField(3);
}

/// 照片相册
class PhotoAlbum extends $pb.GeneratedMessage {
  factory PhotoAlbum({
    $core.Iterable<AlbumAsset>? assets,
  }) {
    final result = create();
    if (assets != null) result.assets.addAll(assets);
    return result;
  }

  PhotoAlbum._();

  factory PhotoAlbum.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory PhotoAlbum.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'PhotoAlbum',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'gs.persona'),
      createEmptyInstance: create)
    ..pPM<AlbumAsset>(1, _omitFieldNames ? '' : 'assets',
        subBuilder: AlbumAsset.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  PhotoAlbum clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  PhotoAlbum copyWith(void Function(PhotoAlbum) updates) =>
      super.copyWith((message) => updates(message as PhotoAlbum)) as PhotoAlbum;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static PhotoAlbum create() => PhotoAlbum._();
  @$core.override
  PhotoAlbum createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static PhotoAlbum getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<PhotoAlbum>(create);
  static PhotoAlbum? _defaultInstance;

  /// 照片资源项
  @$pb.TagNumber(1)
  $pb.PbList<AlbumAsset> get assets => $_getList(0);
}

/// 照片资源
class AlbumAsset extends $pb.GeneratedMessage {
  factory AlbumAsset({
    $core.int? assetType,
    $core.String? imageUrl,
    $fixnum.Int64? id,
  }) {
    final result = create();
    if (assetType != null) result.assetType = assetType;
    if (imageUrl != null) result.imageUrl = imageUrl;
    if (id != null) result.id = id;
    return result;
  }

  AlbumAsset._();

  factory AlbumAsset.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory AlbumAsset.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'AlbumAsset',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'gs.persona'),
      createEmptyInstance: create)
    ..aI(1, _omitFieldNames ? '' : 'assetType', fieldType: $pb.PbFieldType.OU3)
    ..aOS(2, _omitFieldNames ? '' : 'imageUrl')
    ..a<$fixnum.Int64>(3, _omitFieldNames ? '' : 'id', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  AlbumAsset clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  AlbumAsset copyWith(void Function(AlbumAsset) updates) =>
      super.copyWith((message) => updates(message as AlbumAsset)) as AlbumAsset;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static AlbumAsset create() => AlbumAsset._();
  @$core.override
  AlbumAsset createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static AlbumAsset getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<AlbumAsset>(create);
  static AlbumAsset? _defaultInstance;

  /// 资源类型：1形象照 2常规照
  @$pb.TagNumber(1)
  $core.int get assetType => $_getIZ(0);
  @$pb.TagNumber(1)
  set assetType($core.int value) => $_setUnsignedInt32(0, value);
  @$pb.TagNumber(1)
  $core.bool hasAssetType() => $_has(0);
  @$pb.TagNumber(1)
  void clearAssetType() => $_clearField(1);

  /// 图片URL
  @$pb.TagNumber(2)
  $core.String get imageUrl => $_getSZ(1);
  @$pb.TagNumber(2)
  set imageUrl($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasImageUrl() => $_has(1);
  @$pb.TagNumber(2)
  void clearImageUrl() => $_clearField(2);

  /// 资源ID（tb_gs_persona_album.id）
  @$pb.TagNumber(3)
  $fixnum.Int64 get id => $_getI64(2);
  @$pb.TagNumber(3)
  set id($fixnum.Int64 value) => $_setInt64(2, value);
  @$pb.TagNumber(3)
  $core.bool hasId() => $_has(2);
  @$pb.TagNumber(3)
  void clearId() => $_clearField(3);
}

/// 同步资料请求
class SyncProfileReq extends $pb.GeneratedMessage {
  factory SyncProfileReq({
    $fixnum.Int64? personaId,
  }) {
    final result = create();
    if (personaId != null) result.personaId = personaId;
    return result;
  }

  SyncProfileReq._();

  factory SyncProfileReq.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory SyncProfileReq.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'SyncProfileReq',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'gs.persona'),
      createEmptyInstance: create)
    ..a<$fixnum.Int64>(
        1, _omitFieldNames ? '' : 'personaId', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SyncProfileReq clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SyncProfileReq copyWith(void Function(SyncProfileReq) updates) =>
      super.copyWith((message) => updates(message as SyncProfileReq))
          as SyncProfileReq;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SyncProfileReq create() => SyncProfileReq._();
  @$core.override
  SyncProfileReq createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static SyncProfileReq getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<SyncProfileReq>(create);
  static SyncProfileReq? _defaultInstance;

  /// 人设ID
  @$pb.TagNumber(1)
  $fixnum.Int64 get personaId => $_getI64(0);
  @$pb.TagNumber(1)
  set personaId($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasPersonaId() => $_has(0);
  @$pb.TagNumber(1)
  void clearPersonaId() => $_clearField(1);
}

/// 根据简介生成详细请求
class GetMoreReq extends $pb.GeneratedMessage {
  factory GetMoreReq({
    $fixnum.Int64? personaId,
    BriefType? briefType,
    $core.String? brief,
  }) {
    final result = create();
    if (personaId != null) result.personaId = personaId;
    if (briefType != null) result.briefType = briefType;
    if (brief != null) result.brief = brief;
    return result;
  }

  GetMoreReq._();

  factory GetMoreReq.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GetMoreReq.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GetMoreReq',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'gs.persona'),
      createEmptyInstance: create)
    ..a<$fixnum.Int64>(
        1, _omitFieldNames ? '' : 'personaId', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..aE<BriefType>(2, _omitFieldNames ? '' : 'briefType',
        enumValues: BriefType.values)
    ..aOS(3, _omitFieldNames ? '' : 'brief')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetMoreReq clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetMoreReq copyWith(void Function(GetMoreReq) updates) =>
      super.copyWith((message) => updates(message as GetMoreReq)) as GetMoreReq;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetMoreReq create() => GetMoreReq._();
  @$core.override
  GetMoreReq createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static GetMoreReq getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetMoreReq>(create);
  static GetMoreReq? _defaultInstance;

  /// 人设ID
  @$pb.TagNumber(1)
  $fixnum.Int64 get personaId => $_getI64(0);
  @$pb.TagNumber(1)
  set personaId($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasPersonaId() => $_has(0);
  @$pb.TagNumber(1)
  void clearPersonaId() => $_clearField(1);

  /// 简介类型（使用 BriefType 指定）
  @$pb.TagNumber(2)
  BriefType get briefType => $_getN(1);
  @$pb.TagNumber(2)
  set briefType(BriefType value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasBriefType() => $_has(1);
  @$pb.TagNumber(2)
  void clearBriefType() => $_clearField(2);

  /// 简介/提示词
  @$pb.TagNumber(3)
  $core.String get brief => $_getSZ(2);
  @$pb.TagNumber(3)
  set brief($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasBrief() => $_has(2);
  @$pb.TagNumber(3)
  void clearBrief() => $_clearField(3);
}

/// 生成形象照请求
class GenerateAvatarReq extends $pb.GeneratedMessage {
  factory GenerateAvatarReq({
    $fixnum.Int64? personaId,
    $core.int? count,
    $core.String? prompt,
  }) {
    final result = create();
    if (personaId != null) result.personaId = personaId;
    if (count != null) result.count = count;
    if (prompt != null) result.prompt = prompt;
    return result;
  }

  GenerateAvatarReq._();

  factory GenerateAvatarReq.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GenerateAvatarReq.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GenerateAvatarReq',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'gs.persona'),
      createEmptyInstance: create)
    ..a<$fixnum.Int64>(
        1, _omitFieldNames ? '' : 'personaId', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..aI(2, _omitFieldNames ? '' : 'count', fieldType: $pb.PbFieldType.OU3)
    ..aOS(3, _omitFieldNames ? '' : 'prompt')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GenerateAvatarReq clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GenerateAvatarReq copyWith(void Function(GenerateAvatarReq) updates) =>
      super.copyWith((message) => updates(message as GenerateAvatarReq))
          as GenerateAvatarReq;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GenerateAvatarReq create() => GenerateAvatarReq._();
  @$core.override
  GenerateAvatarReq createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static GenerateAvatarReq getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GenerateAvatarReq>(create);
  static GenerateAvatarReq? _defaultInstance;

  /// 人设ID
  @$pb.TagNumber(1)
  $fixnum.Int64 get personaId => $_getI64(0);
  @$pb.TagNumber(1)
  set personaId($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasPersonaId() => $_has(0);
  @$pb.TagNumber(1)
  void clearPersonaId() => $_clearField(1);

  /// 生成数量
  @$pb.TagNumber(2)
  $core.int get count => $_getIZ(1);
  @$pb.TagNumber(2)
  set count($core.int value) => $_setUnsignedInt32(1, value);
  @$pb.TagNumber(2)
  $core.bool hasCount() => $_has(1);
  @$pb.TagNumber(2)
  void clearCount() => $_clearField(2);

  /// 附加提示词（可选）
  @$pb.TagNumber(3)
  $core.String get prompt => $_getSZ(2);
  @$pb.TagNumber(3)
  set prompt($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasPrompt() => $_has(2);
  @$pb.TagNumber(3)
  void clearPrompt() => $_clearField(3);
}

/// 生成常规照片请求
class GenerateNormalPhotosReq extends $pb.GeneratedMessage {
  factory GenerateNormalPhotosReq({
    $fixnum.Int64? personaId,
    $fixnum.Int64? scenePromptId,
    $core.String? promptText,
    $core.int? count,
  }) {
    final result = create();
    if (personaId != null) result.personaId = personaId;
    if (scenePromptId != null) result.scenePromptId = scenePromptId;
    if (promptText != null) result.promptText = promptText;
    if (count != null) result.count = count;
    return result;
  }

  GenerateNormalPhotosReq._();

  factory GenerateNormalPhotosReq.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GenerateNormalPhotosReq.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GenerateNormalPhotosReq',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'gs.persona'),
      createEmptyInstance: create)
    ..a<$fixnum.Int64>(
        1, _omitFieldNames ? '' : 'personaId', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$fixnum.Int64>(
        2, _omitFieldNames ? '' : 'scenePromptId', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..aOS(3, _omitFieldNames ? '' : 'promptText')
    ..aI(4, _omitFieldNames ? '' : 'count', fieldType: $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GenerateNormalPhotosReq clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GenerateNormalPhotosReq copyWith(
          void Function(GenerateNormalPhotosReq) updates) =>
      super.copyWith((message) => updates(message as GenerateNormalPhotosReq))
          as GenerateNormalPhotosReq;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GenerateNormalPhotosReq create() => GenerateNormalPhotosReq._();
  @$core.override
  GenerateNormalPhotosReq createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static GenerateNormalPhotosReq getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GenerateNormalPhotosReq>(create);
  static GenerateNormalPhotosReq? _defaultInstance;

  /// 人设ID
  @$pb.TagNumber(1)
  $fixnum.Int64 get personaId => $_getI64(0);
  @$pb.TagNumber(1)
  set personaId($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasPersonaId() => $_has(0);
  @$pb.TagNumber(1)
  void clearPersonaId() => $_clearField(1);

  /// 场景提示词ID（tb_photo_scene_prompt.id）
  @$pb.TagNumber(2)
  $fixnum.Int64 get scenePromptId => $_getI64(1);
  @$pb.TagNumber(2)
  set scenePromptId($fixnum.Int64 value) => $_setInt64(1, value);
  @$pb.TagNumber(2)
  $core.bool hasScenePromptId() => $_has(1);
  @$pb.TagNumber(2)
  void clearScenePromptId() => $_clearField(2);

  /// 自定义提示词（覆盖场景库）
  @$pb.TagNumber(3)
  $core.String get promptText => $_getSZ(2);
  @$pb.TagNumber(3)
  set promptText($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasPromptText() => $_has(2);
  @$pb.TagNumber(3)
  void clearPromptText() => $_clearField(3);

  /// 生成数量
  @$pb.TagNumber(4)
  $core.int get count => $_getIZ(3);
  @$pb.TagNumber(4)
  set count($core.int value) => $_setUnsignedInt32(3, value);
  @$pb.TagNumber(4)
  $core.bool hasCount() => $_has(3);
  @$pb.TagNumber(4)
  void clearCount() => $_clearField(4);
}

/// 常规照场景简述
class ScenePromptBrief extends $pb.GeneratedMessage {
  factory ScenePromptBrief({
    $fixnum.Int64? id,
    $core.String? sceneBrief,
  }) {
    final result = create();
    if (id != null) result.id = id;
    if (sceneBrief != null) result.sceneBrief = sceneBrief;
    return result;
  }

  ScenePromptBrief._();

  factory ScenePromptBrief.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ScenePromptBrief.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ScenePromptBrief',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'gs.persona'),
      createEmptyInstance: create)
    ..a<$fixnum.Int64>(1, _omitFieldNames ? '' : 'id', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..aOS(2, _omitFieldNames ? '' : 'sceneBrief')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ScenePromptBrief clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ScenePromptBrief copyWith(void Function(ScenePromptBrief) updates) =>
      super.copyWith((message) => updates(message as ScenePromptBrief))
          as ScenePromptBrief;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ScenePromptBrief create() => ScenePromptBrief._();
  @$core.override
  ScenePromptBrief createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ScenePromptBrief getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ScenePromptBrief>(create);
  static ScenePromptBrief? _defaultInstance;

  /// 场景提示词ID（tb_photo_scene_prompt.id）
  @$pb.TagNumber(1)
  $fixnum.Int64 get id => $_getI64(0);
  @$pb.TagNumber(1)
  set id($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => $_clearField(1);

  /// 场景简述
  @$pb.TagNumber(2)
  $core.String get sceneBrief => $_getSZ(1);
  @$pb.TagNumber(2)
  set sceneBrief($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasSceneBrief() => $_has(1);
  @$pb.TagNumber(2)
  void clearSceneBrief() => $_clearField(2);
}

/// 获取常规照场景简述列表响应
class GetScenePromptBriefListRsp extends $pb.GeneratedMessage {
  factory GetScenePromptBriefListRsp({
    $core.Iterable<ScenePromptBrief>? items,
  }) {
    final result = create();
    if (items != null) result.items.addAll(items);
    return result;
  }

  GetScenePromptBriefListRsp._();

  factory GetScenePromptBriefListRsp.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GetScenePromptBriefListRsp.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GetScenePromptBriefListRsp',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'gs.persona'),
      createEmptyInstance: create)
    ..pPM<ScenePromptBrief>(1, _omitFieldNames ? '' : 'items',
        subBuilder: ScenePromptBrief.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetScenePromptBriefListRsp clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetScenePromptBriefListRsp copyWith(
          void Function(GetScenePromptBriefListRsp) updates) =>
      super.copyWith(
              (message) => updates(message as GetScenePromptBriefListRsp))
          as GetScenePromptBriefListRsp;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetScenePromptBriefListRsp create() => GetScenePromptBriefListRsp._();
  @$core.override
  GetScenePromptBriefListRsp createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static GetScenePromptBriefListRsp getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetScenePromptBriefListRsp>(create);
  static GetScenePromptBriefListRsp? _defaultInstance;

  /// 场景简述列表
  @$pb.TagNumber(1)
  $pb.PbList<ScenePromptBrief> get items => $_getList(0);
}

/// 删除常规照请求
class DeleteNormalPhotosReq extends $pb.GeneratedMessage {
  factory DeleteNormalPhotosReq({
    $fixnum.Int64? personaId,
    $core.Iterable<$fixnum.Int64>? assetIds,
  }) {
    final result = create();
    if (personaId != null) result.personaId = personaId;
    if (assetIds != null) result.assetIds.addAll(assetIds);
    return result;
  }

  DeleteNormalPhotosReq._();

  factory DeleteNormalPhotosReq.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory DeleteNormalPhotosReq.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'DeleteNormalPhotosReq',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'gs.persona'),
      createEmptyInstance: create)
    ..a<$fixnum.Int64>(
        1, _omitFieldNames ? '' : 'personaId', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..p<$fixnum.Int64>(
        2, _omitFieldNames ? '' : 'assetIds', $pb.PbFieldType.KU6)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  DeleteNormalPhotosReq clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  DeleteNormalPhotosReq copyWith(
          void Function(DeleteNormalPhotosReq) updates) =>
      super.copyWith((message) => updates(message as DeleteNormalPhotosReq))
          as DeleteNormalPhotosReq;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DeleteNormalPhotosReq create() => DeleteNormalPhotosReq._();
  @$core.override
  DeleteNormalPhotosReq createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static DeleteNormalPhotosReq getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<DeleteNormalPhotosReq>(create);
  static DeleteNormalPhotosReq? _defaultInstance;

  /// 人设ID
  @$pb.TagNumber(1)
  $fixnum.Int64 get personaId => $_getI64(0);
  @$pb.TagNumber(1)
  set personaId($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasPersonaId() => $_has(0);
  @$pb.TagNumber(1)
  void clearPersonaId() => $_clearField(1);

  /// 需要删除的相册资源ID列表（仅允许删除常规照：asset_type=2）
  @$pb.TagNumber(2)
  $pb.PbList<$fixnum.Int64> get assetIds => $_getList(1);
}

/// ai 生成响应
class AiGenerateRsp extends $pb.GeneratedMessage {
  factory AiGenerateRsp({
    $fixnum.Int64? jobId,
    $core.String? content,
  }) {
    final result = create();
    if (jobId != null) result.jobId = jobId;
    if (content != null) result.content = content;
    return result;
  }

  AiGenerateRsp._();

  factory AiGenerateRsp.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory AiGenerateRsp.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'AiGenerateRsp',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'gs.persona'),
      createEmptyInstance: create)
    ..a<$fixnum.Int64>(1, _omitFieldNames ? '' : 'jobId', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..aOS(2, _omitFieldNames ? '' : 'content')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  AiGenerateRsp clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  AiGenerateRsp copyWith(void Function(AiGenerateRsp) updates) =>
      super.copyWith((message) => updates(message as AiGenerateRsp))
          as AiGenerateRsp;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static AiGenerateRsp create() => AiGenerateRsp._();
  @$core.override
  AiGenerateRsp createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static AiGenerateRsp getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<AiGenerateRsp>(create);
  static AiGenerateRsp? _defaultInstance;

  /// 任务ID
  @$pb.TagNumber(1)
  $fixnum.Int64 get jobId => $_getI64(0);
  @$pb.TagNumber(1)
  set jobId($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasJobId() => $_has(0);
  @$pb.TagNumber(1)
  void clearJobId() => $_clearField(1);

  /// 响应内容(若命中已知结果，不用请求AI，直接响应到此字段)
  @$pb.TagNumber(2)
  $core.String get content => $_getSZ(1);
  @$pb.TagNumber(2)
  set content($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasContent() => $_has(1);
  @$pb.TagNumber(2)
  void clearContent() => $_clearField(2);
}

/// 查询AI任务状态请求（用于根据 job_id 轮询）
class GetJobStatusReq extends $pb.GeneratedMessage {
  factory GetJobStatusReq({
    $fixnum.Int64? jobId,
  }) {
    final result = create();
    if (jobId != null) result.jobId = jobId;
    return result;
  }

  GetJobStatusReq._();

  factory GetJobStatusReq.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GetJobStatusReq.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GetJobStatusReq',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'gs.persona'),
      createEmptyInstance: create)
    ..a<$fixnum.Int64>(1, _omitFieldNames ? '' : 'jobId', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetJobStatusReq clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetJobStatusReq copyWith(void Function(GetJobStatusReq) updates) =>
      super.copyWith((message) => updates(message as GetJobStatusReq))
          as GetJobStatusReq;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetJobStatusReq create() => GetJobStatusReq._();
  @$core.override
  GetJobStatusReq createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static GetJobStatusReq getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetJobStatusReq>(create);
  static GetJobStatusReq? _defaultInstance;

  /// 任务ID（来自AiGenerateRsp.job_id）
  @$pb.TagNumber(1)
  $fixnum.Int64 get jobId => $_getI64(0);
  @$pb.TagNumber(1)
  set jobId($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasJobId() => $_has(0);
  @$pb.TagNumber(1)
  void clearJobId() => $_clearField(1);
}

/// 查询AI任务状态响应
class GetJobStatusRsp extends $pb.GeneratedMessage {
  factory GetJobStatusRsp({
    $fixnum.Int64? jobId,
    JobStatus? status,
    $core.String? content,
    $core.Iterable<AlbumAsset>? assets,
    $core.String? errorMessage,
  }) {
    final result = create();
    if (jobId != null) result.jobId = jobId;
    if (status != null) result.status = status;
    if (content != null) result.content = content;
    if (assets != null) result.assets.addAll(assets);
    if (errorMessage != null) result.errorMessage = errorMessage;
    return result;
  }

  GetJobStatusRsp._();

  factory GetJobStatusRsp.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GetJobStatusRsp.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GetJobStatusRsp',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'gs.persona'),
      createEmptyInstance: create)
    ..a<$fixnum.Int64>(1, _omitFieldNames ? '' : 'jobId', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..aE<JobStatus>(2, _omitFieldNames ? '' : 'status',
        enumValues: JobStatus.values)
    ..aOS(3, _omitFieldNames ? '' : 'content')
    ..pPM<AlbumAsset>(4, _omitFieldNames ? '' : 'assets',
        subBuilder: AlbumAsset.create)
    ..aOS(5, _omitFieldNames ? '' : 'errorMessage')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetJobStatusRsp clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetJobStatusRsp copyWith(void Function(GetJobStatusRsp) updates) =>
      super.copyWith((message) => updates(message as GetJobStatusRsp))
          as GetJobStatusRsp;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetJobStatusRsp create() => GetJobStatusRsp._();
  @$core.override
  GetJobStatusRsp createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static GetJobStatusRsp getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetJobStatusRsp>(create);
  static GetJobStatusRsp? _defaultInstance;

  /// 任务ID
  @$pb.TagNumber(1)
  $fixnum.Int64 get jobId => $_getI64(0);
  @$pb.TagNumber(1)
  set jobId($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasJobId() => $_has(0);
  @$pb.TagNumber(1)
  void clearJobId() => $_clearField(1);

  /// 任务状态
  @$pb.TagNumber(2)
  JobStatus get status => $_getN(1);
  @$pb.TagNumber(2)
  set status(JobStatus value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasStatus() => $_has(1);
  @$pb.TagNumber(2)
  void clearStatus() => $_clearField(2);

  /// 文本结果（如“根据简介生成详细资料”的生成内容）
  @$pb.TagNumber(3)
  $core.String get content => $_getSZ(2);
  @$pb.TagNumber(3)
  set content($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasContent() => $_has(2);
  @$pb.TagNumber(3)
  void clearContent() => $_clearField(3);

  /// 图片生成结果（如形象照/常规照生成后的相册资源）
  @$pb.TagNumber(4)
  $pb.PbList<AlbumAsset> get assets => $_getList(3);

  /// 错误信息（当status=FAILED时可用）
  @$pb.TagNumber(5)
  $core.String get errorMessage => $_getSZ(4);
  @$pb.TagNumber(5)
  set errorMessage($core.String value) => $_setString(4, value);
  @$pb.TagNumber(5)
  $core.bool hasErrorMessage() => $_has(4);
  @$pb.TagNumber(5)
  void clearErrorMessage() => $_clearField(5);
}

/// ai 私聊  目前只支持文本消息，表情，图片暂不支持
class SendAiMessageReq extends $pb.GeneratedMessage {
  factory SendAiMessageReq({
    $core.String? fromEmId,
  }) {
    final result = create();
    if (fromEmId != null) result.fromEmId = fromEmId;
    return result;
  }

  SendAiMessageReq._();

  factory SendAiMessageReq.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory SendAiMessageReq.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'SendAiMessageReq',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'gs.persona'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'fromEmId')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SendAiMessageReq clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SendAiMessageReq copyWith(void Function(SendAiMessageReq) updates) =>
      super.copyWith((message) => updates(message as SendAiMessageReq))
          as SendAiMessageReq;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SendAiMessageReq create() => SendAiMessageReq._();
  @$core.override
  SendAiMessageReq createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static SendAiMessageReq getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<SendAiMessageReq>(create);
  static SendAiMessageReq? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get fromEmId => $_getSZ(0);
  @$pb.TagNumber(1)
  set fromEmId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasFromEmId() => $_has(0);
  @$pb.TagNumber(1)
  void clearFromEmId() => $_clearField(1);
}

class SendAiMessageRsp extends $pb.GeneratedMessage {
  factory SendAiMessageRsp({
    $core.String? chatId,
  }) {
    final result = create();
    if (chatId != null) result.chatId = chatId;
    return result;
  }

  SendAiMessageRsp._();

  factory SendAiMessageRsp.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory SendAiMessageRsp.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'SendAiMessageRsp',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'gs.persona'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'chatId')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SendAiMessageRsp clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SendAiMessageRsp copyWith(void Function(SendAiMessageRsp) updates) =>
      super.copyWith((message) => updates(message as SendAiMessageRsp))
          as SendAiMessageRsp;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SendAiMessageRsp create() => SendAiMessageRsp._();
  @$core.override
  SendAiMessageRsp createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static SendAiMessageRsp getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<SendAiMessageRsp>(create);
  static SendAiMessageRsp? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get chatId => $_getSZ(0);
  @$pb.TagNumber(1)
  set chatId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasChatId() => $_has(0);
  @$pb.TagNumber(1)
  void clearChatId() => $_clearField(1);
}

class GetAiMessageResultRsp extends $pb.GeneratedMessage {
  factory GetAiMessageResultRsp({
    $core.String? content,
  }) {
    final result = create();
    if (content != null) result.content = content;
    return result;
  }

  GetAiMessageResultRsp._();

  factory GetAiMessageResultRsp.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GetAiMessageResultRsp.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GetAiMessageResultRsp',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'gs.persona'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'content')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetAiMessageResultRsp clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetAiMessageResultRsp copyWith(
          void Function(GetAiMessageResultRsp) updates) =>
      super.copyWith((message) => updates(message as GetAiMessageResultRsp))
          as GetAiMessageResultRsp;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetAiMessageResultRsp create() => GetAiMessageResultRsp._();
  @$core.override
  GetAiMessageResultRsp createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static GetAiMessageResultRsp getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetAiMessageResultRsp>(create);
  static GetAiMessageResultRsp? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get content => $_getSZ(0);
  @$pb.TagNumber(1)
  set content($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasContent() => $_has(0);
  @$pb.TagNumber(1)
  void clearContent() => $_clearField(1);
}

/// 人设照片响应
class PersonaPhotosRsp extends $pb.GeneratedMessage {
  factory PersonaPhotosRsp({
    $core.Iterable<AlbumAsset>? assets,
  }) {
    final result = create();
    if (assets != null) result.assets.addAll(assets);
    return result;
  }

  PersonaPhotosRsp._();

  factory PersonaPhotosRsp.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory PersonaPhotosRsp.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'PersonaPhotosRsp',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'gs.persona'),
      createEmptyInstance: create)
    ..pPM<AlbumAsset>(1, _omitFieldNames ? '' : 'assets',
        subBuilder: AlbumAsset.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  PersonaPhotosRsp clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  PersonaPhotosRsp copyWith(void Function(PersonaPhotosRsp) updates) =>
      super.copyWith((message) => updates(message as PersonaPhotosRsp))
          as PersonaPhotosRsp;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static PersonaPhotosRsp create() => PersonaPhotosRsp._();
  @$core.override
  PersonaPhotosRsp createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static PersonaPhotosRsp getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<PersonaPhotosRsp>(create);
  static PersonaPhotosRsp? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<AlbumAsset> get assets => $_getList(0);
}

const $core.bool _omitFieldNames =
    $core.bool.fromEnvironment('protobuf.omit_field_names');
const $core.bool _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');
