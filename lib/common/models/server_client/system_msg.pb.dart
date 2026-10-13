// This is a generated file - do not edit.
//
// Generated from server_client/system_msg.proto.

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
import 'system_msg.pbenum.dart';

export 'package:protobuf/protobuf.dart' show GeneratedMessageGenericExtensions;

export 'system_msg.pbenum.dart';

enum MsgBody_Content {
  textMsg,
  textLinkMsg,
  imageMsg,
  imageLinkMsg,
  imageTextMsg,
  imageTextLinkMsg,
  notSet
}

class MsgBody extends $pb.GeneratedMessage {
  factory MsgBody({
    Format? format,
    $fixnum.Int64? timestamp,
    Sender? sender,
    TextMsg? textMsg,
    TextLinkMsg? textLinkMsg,
    ImageMsg? imageMsg,
    ImageLinkMsg? imageLinkMsg,
    ImageTextMsg? imageTextMsg,
    ImageTextLinkMsg? imageTextLinkMsg,
    $fixnum.Int64? packageId,
    $fixnum.Int64? recordId,
  }) {
    final result = create();
    if (format != null) result.format = format;
    if (timestamp != null) result.timestamp = timestamp;
    if (sender != null) result.sender = sender;
    if (textMsg != null) result.textMsg = textMsg;
    if (textLinkMsg != null) result.textLinkMsg = textLinkMsg;
    if (imageMsg != null) result.imageMsg = imageMsg;
    if (imageLinkMsg != null) result.imageLinkMsg = imageLinkMsg;
    if (imageTextMsg != null) result.imageTextMsg = imageTextMsg;
    if (imageTextLinkMsg != null) result.imageTextLinkMsg = imageTextLinkMsg;
    if (packageId != null) result.packageId = packageId;
    if (recordId != null) result.recordId = recordId;
    return result;
  }

  MsgBody._();

  factory MsgBody.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory MsgBody.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static const $core.Map<$core.int, MsgBody_Content> _MsgBody_ContentByTag = {
    4: MsgBody_Content.textMsg,
    5: MsgBody_Content.textLinkMsg,
    6: MsgBody_Content.imageMsg,
    7: MsgBody_Content.imageLinkMsg,
    8: MsgBody_Content.imageTextMsg,
    9: MsgBody_Content.imageTextLinkMsg,
    0: MsgBody_Content.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'MsgBody',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'base'),
      createEmptyInstance: create)
    ..oo(0, [4, 5, 6, 7, 8, 9])
    ..aE<Format>(1, _omitFieldNames ? '' : 'format', enumValues: Format.values)
    ..aInt64(2, _omitFieldNames ? '' : 'timestamp')
    ..aOM<Sender>(3, _omitFieldNames ? '' : 'sender', subBuilder: Sender.create)
    ..aOM<TextMsg>(4, _omitFieldNames ? '' : 'textMsg',
        subBuilder: TextMsg.create)
    ..aOM<TextLinkMsg>(5, _omitFieldNames ? '' : 'textLinkMsg',
        subBuilder: TextLinkMsg.create)
    ..aOM<ImageMsg>(6, _omitFieldNames ? '' : 'imageMsg',
        subBuilder: ImageMsg.create)
    ..aOM<ImageLinkMsg>(7, _omitFieldNames ? '' : 'imageLinkMsg',
        subBuilder: ImageLinkMsg.create)
    ..aOM<ImageTextMsg>(8, _omitFieldNames ? '' : 'imageTextMsg',
        subBuilder: ImageTextMsg.create)
    ..aOM<ImageTextLinkMsg>(9, _omitFieldNames ? '' : 'imageTextLinkMsg',
        subBuilder: ImageTextLinkMsg.create)
    ..a<$fixnum.Int64>(
        10, _omitFieldNames ? '' : 'packageId', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$fixnum.Int64>(
        11, _omitFieldNames ? '' : 'recordId', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  MsgBody clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  MsgBody copyWith(void Function(MsgBody) updates) =>
      super.copyWith((message) => updates(message as MsgBody)) as MsgBody;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static MsgBody create() => MsgBody._();
  @$core.override
  MsgBody createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static MsgBody getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<MsgBody>(create);
  static MsgBody? _defaultInstance;

  @$pb.TagNumber(4)
  @$pb.TagNumber(5)
  @$pb.TagNumber(6)
  @$pb.TagNumber(7)
  @$pb.TagNumber(8)
  @$pb.TagNumber(9)
  MsgBody_Content whichContent() => _MsgBody_ContentByTag[$_whichOneof(0)]!;
  @$pb.TagNumber(4)
  @$pb.TagNumber(5)
  @$pb.TagNumber(6)
  @$pb.TagNumber(7)
  @$pb.TagNumber(8)
  @$pb.TagNumber(9)
  void clearContent() => $_clearField($_whichOneof(0));

  @$pb.TagNumber(1)
  Format get format => $_getN(0);
  @$pb.TagNumber(1)
  set format(Format value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasFormat() => $_has(0);
  @$pb.TagNumber(1)
  void clearFormat() => $_clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get timestamp => $_getI64(1);
  @$pb.TagNumber(2)
  set timestamp($fixnum.Int64 value) => $_setInt64(1, value);
  @$pb.TagNumber(2)
  $core.bool hasTimestamp() => $_has(1);
  @$pb.TagNumber(2)
  void clearTimestamp() => $_clearField(2);

  @$pb.TagNumber(3)
  Sender get sender => $_getN(2);
  @$pb.TagNumber(3)
  set sender(Sender value) => $_setField(3, value);
  @$pb.TagNumber(3)
  $core.bool hasSender() => $_has(2);
  @$pb.TagNumber(3)
  void clearSender() => $_clearField(3);
  @$pb.TagNumber(3)
  Sender ensureSender() => $_ensure(2);

  @$pb.TagNumber(4)
  TextMsg get textMsg => $_getN(3);
  @$pb.TagNumber(4)
  set textMsg(TextMsg value) => $_setField(4, value);
  @$pb.TagNumber(4)
  $core.bool hasTextMsg() => $_has(3);
  @$pb.TagNumber(4)
  void clearTextMsg() => $_clearField(4);
  @$pb.TagNumber(4)
  TextMsg ensureTextMsg() => $_ensure(3);

  @$pb.TagNumber(5)
  TextLinkMsg get textLinkMsg => $_getN(4);
  @$pb.TagNumber(5)
  set textLinkMsg(TextLinkMsg value) => $_setField(5, value);
  @$pb.TagNumber(5)
  $core.bool hasTextLinkMsg() => $_has(4);
  @$pb.TagNumber(5)
  void clearTextLinkMsg() => $_clearField(5);
  @$pb.TagNumber(5)
  TextLinkMsg ensureTextLinkMsg() => $_ensure(4);

  @$pb.TagNumber(6)
  ImageMsg get imageMsg => $_getN(5);
  @$pb.TagNumber(6)
  set imageMsg(ImageMsg value) => $_setField(6, value);
  @$pb.TagNumber(6)
  $core.bool hasImageMsg() => $_has(5);
  @$pb.TagNumber(6)
  void clearImageMsg() => $_clearField(6);
  @$pb.TagNumber(6)
  ImageMsg ensureImageMsg() => $_ensure(5);

  @$pb.TagNumber(7)
  ImageLinkMsg get imageLinkMsg => $_getN(6);
  @$pb.TagNumber(7)
  set imageLinkMsg(ImageLinkMsg value) => $_setField(7, value);
  @$pb.TagNumber(7)
  $core.bool hasImageLinkMsg() => $_has(6);
  @$pb.TagNumber(7)
  void clearImageLinkMsg() => $_clearField(7);
  @$pb.TagNumber(7)
  ImageLinkMsg ensureImageLinkMsg() => $_ensure(6);

  @$pb.TagNumber(8)
  ImageTextMsg get imageTextMsg => $_getN(7);
  @$pb.TagNumber(8)
  set imageTextMsg(ImageTextMsg value) => $_setField(8, value);
  @$pb.TagNumber(8)
  $core.bool hasImageTextMsg() => $_has(7);
  @$pb.TagNumber(8)
  void clearImageTextMsg() => $_clearField(8);
  @$pb.TagNumber(8)
  ImageTextMsg ensureImageTextMsg() => $_ensure(7);

  @$pb.TagNumber(9)
  ImageTextLinkMsg get imageTextLinkMsg => $_getN(8);
  @$pb.TagNumber(9)
  set imageTextLinkMsg(ImageTextLinkMsg value) => $_setField(9, value);
  @$pb.TagNumber(9)
  $core.bool hasImageTextLinkMsg() => $_has(8);
  @$pb.TagNumber(9)
  void clearImageTextLinkMsg() => $_clearField(9);
  @$pb.TagNumber(9)
  ImageTextLinkMsg ensureImageTextLinkMsg() => $_ensure(8);

  @$pb.TagNumber(10)
  $fixnum.Int64 get packageId => $_getI64(9);
  @$pb.TagNumber(10)
  set packageId($fixnum.Int64 value) => $_setInt64(9, value);
  @$pb.TagNumber(10)
  $core.bool hasPackageId() => $_has(9);
  @$pb.TagNumber(10)
  void clearPackageId() => $_clearField(10);

  @$pb.TagNumber(11)
  $fixnum.Int64 get recordId => $_getI64(10);
  @$pb.TagNumber(11)
  set recordId($fixnum.Int64 value) => $_setInt64(10, value);
  @$pb.TagNumber(11)
  $core.bool hasRecordId() => $_has(10);
  @$pb.TagNumber(11)
  void clearRecordId() => $_clearField(11);
}

class TextMsg extends $pb.GeneratedMessage {
  factory TextMsg({
    $core.String? text,
    $core.Iterable<$core.String>? highlight,
    $core.Iterable<$core.String>? urls,
  }) {
    final result = create();
    if (text != null) result.text = text;
    if (highlight != null) result.highlight.addAll(highlight);
    if (urls != null) result.urls.addAll(urls);
    return result;
  }

  TextMsg._();

  factory TextMsg.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory TextMsg.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'TextMsg',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'base'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'text')
    ..pPS(2, _omitFieldNames ? '' : 'highlight')
    ..pPS(3, _omitFieldNames ? '' : 'urls')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  TextMsg clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  TextMsg copyWith(void Function(TextMsg) updates) =>
      super.copyWith((message) => updates(message as TextMsg)) as TextMsg;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static TextMsg create() => TextMsg._();
  @$core.override
  TextMsg createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static TextMsg getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<TextMsg>(create);
  static TextMsg? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get text => $_getSZ(0);
  @$pb.TagNumber(1)
  set text($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasText() => $_has(0);
  @$pb.TagNumber(1)
  void clearText() => $_clearField(1);

  @$pb.TagNumber(2)
  $pb.PbList<$core.String> get highlight => $_getList(1);

  @$pb.TagNumber(3)
  $pb.PbList<$core.String> get urls => $_getList(2);
}

class TextLinkMsg extends $pb.GeneratedMessage {
  factory TextLinkMsg({
    $core.String? text,
    $core.String? linkText,
    $core.String? link,
  }) {
    final result = create();
    if (text != null) result.text = text;
    if (linkText != null) result.linkText = linkText;
    if (link != null) result.link = link;
    return result;
  }

  TextLinkMsg._();

  factory TextLinkMsg.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory TextLinkMsg.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'TextLinkMsg',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'base'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'text')
    ..aOS(2, _omitFieldNames ? '' : 'linkText')
    ..aOS(3, _omitFieldNames ? '' : 'link')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  TextLinkMsg clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  TextLinkMsg copyWith(void Function(TextLinkMsg) updates) =>
      super.copyWith((message) => updates(message as TextLinkMsg))
          as TextLinkMsg;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static TextLinkMsg create() => TextLinkMsg._();
  @$core.override
  TextLinkMsg createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static TextLinkMsg getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<TextLinkMsg>(create);
  static TextLinkMsg? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get text => $_getSZ(0);
  @$pb.TagNumber(1)
  set text($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasText() => $_has(0);
  @$pb.TagNumber(1)
  void clearText() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get linkText => $_getSZ(1);
  @$pb.TagNumber(2)
  set linkText($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasLinkText() => $_has(1);
  @$pb.TagNumber(2)
  void clearLinkText() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get link => $_getSZ(2);
  @$pb.TagNumber(3)
  set link($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasLink() => $_has(2);
  @$pb.TagNumber(3)
  void clearLink() => $_clearField(3);
}

class ImageMsg extends $pb.GeneratedMessage {
  factory ImageMsg({
    $core.String? imageUrl,
  }) {
    final result = create();
    if (imageUrl != null) result.imageUrl = imageUrl;
    return result;
  }

  ImageMsg._();

  factory ImageMsg.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ImageMsg.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ImageMsg',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'base'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'imageUrl')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ImageMsg clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ImageMsg copyWith(void Function(ImageMsg) updates) =>
      super.copyWith((message) => updates(message as ImageMsg)) as ImageMsg;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ImageMsg create() => ImageMsg._();
  @$core.override
  ImageMsg createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ImageMsg getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ImageMsg>(create);
  static ImageMsg? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get imageUrl => $_getSZ(0);
  @$pb.TagNumber(1)
  set imageUrl($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasImageUrl() => $_has(0);
  @$pb.TagNumber(1)
  void clearImageUrl() => $_clearField(1);
}

class ImageLinkMsg extends $pb.GeneratedMessage {
  factory ImageLinkMsg({
    $core.String? imageUrl,
    $core.String? link,
  }) {
    final result = create();
    if (imageUrl != null) result.imageUrl = imageUrl;
    if (link != null) result.link = link;
    return result;
  }

  ImageLinkMsg._();

  factory ImageLinkMsg.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ImageLinkMsg.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ImageLinkMsg',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'base'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'imageUrl')
    ..aOS(2, _omitFieldNames ? '' : 'link')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ImageLinkMsg clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ImageLinkMsg copyWith(void Function(ImageLinkMsg) updates) =>
      super.copyWith((message) => updates(message as ImageLinkMsg))
          as ImageLinkMsg;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ImageLinkMsg create() => ImageLinkMsg._();
  @$core.override
  ImageLinkMsg createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ImageLinkMsg getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ImageLinkMsg>(create);
  static ImageLinkMsg? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get imageUrl => $_getSZ(0);
  @$pb.TagNumber(1)
  set imageUrl($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasImageUrl() => $_has(0);
  @$pb.TagNumber(1)
  void clearImageUrl() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get link => $_getSZ(1);
  @$pb.TagNumber(2)
  set link($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasLink() => $_has(1);
  @$pb.TagNumber(2)
  void clearLink() => $_clearField(2);
}

class ImageTextMsg extends $pb.GeneratedMessage {
  factory ImageTextMsg({
    $core.String? title,
    $core.String? content,
    $core.String? imageUrl,
  }) {
    final result = create();
    if (title != null) result.title = title;
    if (content != null) result.content = content;
    if (imageUrl != null) result.imageUrl = imageUrl;
    return result;
  }

  ImageTextMsg._();

  factory ImageTextMsg.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ImageTextMsg.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ImageTextMsg',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'base'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'title')
    ..aOS(2, _omitFieldNames ? '' : 'content')
    ..aOS(3, _omitFieldNames ? '' : 'imageUrl')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ImageTextMsg clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ImageTextMsg copyWith(void Function(ImageTextMsg) updates) =>
      super.copyWith((message) => updates(message as ImageTextMsg))
          as ImageTextMsg;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ImageTextMsg create() => ImageTextMsg._();
  @$core.override
  ImageTextMsg createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ImageTextMsg getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ImageTextMsg>(create);
  static ImageTextMsg? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get title => $_getSZ(0);
  @$pb.TagNumber(1)
  set title($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasTitle() => $_has(0);
  @$pb.TagNumber(1)
  void clearTitle() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get content => $_getSZ(1);
  @$pb.TagNumber(2)
  set content($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasContent() => $_has(1);
  @$pb.TagNumber(2)
  void clearContent() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get imageUrl => $_getSZ(2);
  @$pb.TagNumber(3)
  set imageUrl($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasImageUrl() => $_has(2);
  @$pb.TagNumber(3)
  void clearImageUrl() => $_clearField(3);
}

class ImageTextLinkMsg extends $pb.GeneratedMessage {
  factory ImageTextLinkMsg({
    $core.String? title,
    $core.String? content,
    $core.String? imageUrl,
    $core.String? link,
  }) {
    final result = create();
    if (title != null) result.title = title;
    if (content != null) result.content = content;
    if (imageUrl != null) result.imageUrl = imageUrl;
    if (link != null) result.link = link;
    return result;
  }

  ImageTextLinkMsg._();

  factory ImageTextLinkMsg.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ImageTextLinkMsg.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ImageTextLinkMsg',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'base'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'title')
    ..aOS(2, _omitFieldNames ? '' : 'content')
    ..aOS(3, _omitFieldNames ? '' : 'imageUrl')
    ..aOS(4, _omitFieldNames ? '' : 'link')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ImageTextLinkMsg clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ImageTextLinkMsg copyWith(void Function(ImageTextLinkMsg) updates) =>
      super.copyWith((message) => updates(message as ImageTextLinkMsg))
          as ImageTextLinkMsg;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ImageTextLinkMsg create() => ImageTextLinkMsg._();
  @$core.override
  ImageTextLinkMsg createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ImageTextLinkMsg getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ImageTextLinkMsg>(create);
  static ImageTextLinkMsg? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get title => $_getSZ(0);
  @$pb.TagNumber(1)
  set title($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasTitle() => $_has(0);
  @$pb.TagNumber(1)
  void clearTitle() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get content => $_getSZ(1);
  @$pb.TagNumber(2)
  set content($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasContent() => $_has(1);
  @$pb.TagNumber(2)
  void clearContent() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get imageUrl => $_getSZ(2);
  @$pb.TagNumber(3)
  set imageUrl($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasImageUrl() => $_has(2);
  @$pb.TagNumber(3)
  void clearImageUrl() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.String get link => $_getSZ(3);
  @$pb.TagNumber(4)
  set link($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasLink() => $_has(3);
  @$pb.TagNumber(4)
  void clearLink() => $_clearField(4);
}

class SystemMsgRsp_Data extends $pb.GeneratedMessage {
  factory SystemMsgRsp_Data({
    $core.Iterable<MsgBody>? list,
    $0.Page? page,
  }) {
    final result = create();
    if (list != null) result.list.addAll(list);
    if (page != null) result.page = page;
    return result;
  }

  SystemMsgRsp_Data._();

  factory SystemMsgRsp_Data.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory SystemMsgRsp_Data.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'SystemMsgRsp.Data',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'base'),
      createEmptyInstance: create)
    ..pPM<MsgBody>(1, _omitFieldNames ? '' : 'list', subBuilder: MsgBody.create)
    ..aOM<$0.Page>(2, _omitFieldNames ? '' : 'page', subBuilder: $0.Page.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SystemMsgRsp_Data clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SystemMsgRsp_Data copyWith(void Function(SystemMsgRsp_Data) updates) =>
      super.copyWith((message) => updates(message as SystemMsgRsp_Data))
          as SystemMsgRsp_Data;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SystemMsgRsp_Data create() => SystemMsgRsp_Data._();
  @$core.override
  SystemMsgRsp_Data createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static SystemMsgRsp_Data getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<SystemMsgRsp_Data>(create);
  static SystemMsgRsp_Data? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<MsgBody> get list => $_getList(0);

  @$pb.TagNumber(2)
  $0.Page get page => $_getN(1);
  @$pb.TagNumber(2)
  set page($0.Page value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasPage() => $_has(1);
  @$pb.TagNumber(2)
  void clearPage() => $_clearField(2);
  @$pb.TagNumber(2)
  $0.Page ensurePage() => $_ensure(1);
}

class SystemMsgRsp extends $pb.GeneratedMessage {
  factory SystemMsgRsp({
    $core.bool? success,
    $core.String? message,
    SystemMsgRsp_Data? data,
  }) {
    final result = create();
    if (success != null) result.success = success;
    if (message != null) result.message = message;
    if (data != null) result.data = data;
    return result;
  }

  SystemMsgRsp._();

  factory SystemMsgRsp.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory SystemMsgRsp.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'SystemMsgRsp',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'base'),
      createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'success')
    ..aOS(2, _omitFieldNames ? '' : 'message')
    ..aOM<SystemMsgRsp_Data>(3, _omitFieldNames ? '' : 'data',
        subBuilder: SystemMsgRsp_Data.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SystemMsgRsp clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SystemMsgRsp copyWith(void Function(SystemMsgRsp) updates) =>
      super.copyWith((message) => updates(message as SystemMsgRsp))
          as SystemMsgRsp;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SystemMsgRsp create() => SystemMsgRsp._();
  @$core.override
  SystemMsgRsp createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static SystemMsgRsp getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<SystemMsgRsp>(create);
  static SystemMsgRsp? _defaultInstance;

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
  SystemMsgRsp_Data get data => $_getN(2);
  @$pb.TagNumber(3)
  set data(SystemMsgRsp_Data value) => $_setField(3, value);
  @$pb.TagNumber(3)
  $core.bool hasData() => $_has(2);
  @$pb.TagNumber(3)
  void clearData() => $_clearField(3);
  @$pb.TagNumber(3)
  SystemMsgRsp_Data ensureData() => $_ensure(2);
}

class Sender extends $pb.GeneratedMessage {
  factory Sender({
    $fixnum.Int64? uid,
    $core.String? avatar,
    $core.String? nickName,
  }) {
    final result = create();
    if (uid != null) result.uid = uid;
    if (avatar != null) result.avatar = avatar;
    if (nickName != null) result.nickName = nickName;
    return result;
  }

  Sender._();

  factory Sender.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory Sender.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'Sender',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'base'),
      createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'uid')
    ..aOS(2, _omitFieldNames ? '' : 'avatar')
    ..aOS(3, _omitFieldNames ? '' : 'nickName')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Sender clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Sender copyWith(void Function(Sender) updates) =>
      super.copyWith((message) => updates(message as Sender)) as Sender;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Sender create() => Sender._();
  @$core.override
  Sender createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static Sender getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Sender>(create);
  static Sender? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get uid => $_getI64(0);
  @$pb.TagNumber(1)
  set uid($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasUid() => $_has(0);
  @$pb.TagNumber(1)
  void clearUid() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get avatar => $_getSZ(1);
  @$pb.TagNumber(2)
  set avatar($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasAvatar() => $_has(1);
  @$pb.TagNumber(2)
  void clearAvatar() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get nickName => $_getSZ(2);
  @$pb.TagNumber(3)
  set nickName($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasNickName() => $_has(2);
  @$pb.TagNumber(3)
  void clearNickName() => $_clearField(3);
}

const $core.bool _omitFieldNames =
    $core.bool.fromEnvironment('protobuf.omit_field_names');
const $core.bool _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');
