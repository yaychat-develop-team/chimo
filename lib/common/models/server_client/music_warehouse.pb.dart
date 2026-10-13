// This is a generated file - do not edit.
//
// Generated from server_client/music_warehouse.proto.

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

class RemoveMusicReq extends $pb.GeneratedMessage {
  factory RemoveMusicReq({
    $fixnum.Int64? songCode,
  }) {
    final result = create();
    if (songCode != null) result.songCode = songCode;
    return result;
  }

  RemoveMusicReq._();

  factory RemoveMusicReq.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory RemoveMusicReq.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'RemoveMusicReq',
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'music_warehouse'),
      createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'songCode')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RemoveMusicReq clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RemoveMusicReq copyWith(void Function(RemoveMusicReq) updates) =>
      super.copyWith((message) => updates(message as RemoveMusicReq))
          as RemoveMusicReq;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RemoveMusicReq create() => RemoveMusicReq._();
  @$core.override
  RemoveMusicReq createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static RemoveMusicReq getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RemoveMusicReq>(create);
  static RemoveMusicReq? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get songCode => $_getI64(0);
  @$pb.TagNumber(1)
  set songCode($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasSongCode() => $_has(0);
  @$pb.TagNumber(1)
  void clearSongCode() => $_clearField(1);
}

class Music extends $pb.GeneratedMessage {
  factory Music({
    $fixnum.Int64? id,
    $fixnum.Int64? songCode,
    $core.String? content,
  }) {
    final result = create();
    if (id != null) result.id = id;
    if (songCode != null) result.songCode = songCode;
    if (content != null) result.content = content;
    return result;
  }

  Music._();

  factory Music.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory Music.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'Music',
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'music_warehouse'),
      createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'id')
    ..aInt64(2, _omitFieldNames ? '' : 'songCode')
    ..aOS(3, _omitFieldNames ? '' : 'content')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Music clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Music copyWith(void Function(Music) updates) =>
      super.copyWith((message) => updates(message as Music)) as Music;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Music create() => Music._();
  @$core.override
  Music createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static Music getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Music>(create);
  static Music? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get id => $_getI64(0);
  @$pb.TagNumber(1)
  set id($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => $_clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get songCode => $_getI64(1);
  @$pb.TagNumber(2)
  set songCode($fixnum.Int64 value) => $_setInt64(1, value);
  @$pb.TagNumber(2)
  $core.bool hasSongCode() => $_has(1);
  @$pb.TagNumber(2)
  void clearSongCode() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get content => $_getSZ(2);
  @$pb.TagNumber(3)
  set content($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasContent() => $_has(2);
  @$pb.TagNumber(3)
  void clearContent() => $_clearField(3);
}

class MusicListResp extends $pb.GeneratedMessage {
  factory MusicListResp({
    $core.Iterable<Music>? musics,
  }) {
    final result = create();
    if (musics != null) result.musics.addAll(musics);
    return result;
  }

  MusicListResp._();

  factory MusicListResp.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory MusicListResp.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'MusicListResp',
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'music_warehouse'),
      createEmptyInstance: create)
    ..pPM<Music>(1, _omitFieldNames ? '' : 'musics', subBuilder: Music.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  MusicListResp clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  MusicListResp copyWith(void Function(MusicListResp) updates) =>
      super.copyWith((message) => updates(message as MusicListResp))
          as MusicListResp;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static MusicListResp create() => MusicListResp._();
  @$core.override
  MusicListResp createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static MusicListResp getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<MusicListResp>(create);
  static MusicListResp? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<Music> get musics => $_getList(0);
}

const $core.bool _omitFieldNames =
    $core.bool.fromEnvironment('protobuf.omit_field_names');
const $core.bool _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');
