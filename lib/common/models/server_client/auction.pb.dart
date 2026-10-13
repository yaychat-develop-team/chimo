// This is a generated file - do not edit.
//
// Generated from server_client/auction.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_relative_imports

import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

import 'auction.pbenum.dart';
import 'base.pb.dart' as $0;

export 'package:protobuf/protobuf.dart' show GeneratedMessageGenericExtensions;

export 'auction.pbenum.dart';

class Auction extends $pb.GeneratedMessage {
  factory Auction({
    $fixnum.Int64? auctionSessionId,
    Stage? stage,
    $fixnum.Int64? endTime,
    $core.Iterable<BidInfo>? bidList,
    $core.int? extendCount,
    $fixnum.Int64? extendTime,
    Artist? artist,
  }) {
    final result = create();
    if (auctionSessionId != null) result.auctionSessionId = auctionSessionId;
    if (stage != null) result.stage = stage;
    if (endTime != null) result.endTime = endTime;
    if (bidList != null) result.bidList.addAll(bidList);
    if (extendCount != null) result.extendCount = extendCount;
    if (extendTime != null) result.extendTime = extendTime;
    if (artist != null) result.artist = artist;
    return result;
  }

  Auction._();

  factory Auction.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory Auction.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'Auction',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'auction'),
      createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'auctionSessionId')
    ..aE<Stage>(2, _omitFieldNames ? '' : 'stage', enumValues: Stage.values)
    ..aInt64(3, _omitFieldNames ? '' : 'endTime')
    ..pPM<BidInfo>(4, _omitFieldNames ? '' : 'bidList',
        subBuilder: BidInfo.create)
    ..aI(5, _omitFieldNames ? '' : 'extendCount')
    ..aInt64(6, _omitFieldNames ? '' : 'extendTime')
    ..aOM<Artist>(7, _omitFieldNames ? '' : 'artist', subBuilder: Artist.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Auction clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Auction copyWith(void Function(Auction) updates) =>
      super.copyWith((message) => updates(message as Auction)) as Auction;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Auction create() => Auction._();
  @$core.override
  Auction createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static Auction getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Auction>(create);
  static Auction? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get auctionSessionId => $_getI64(0);
  @$pb.TagNumber(1)
  set auctionSessionId($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasAuctionSessionId() => $_has(0);
  @$pb.TagNumber(1)
  void clearAuctionSessionId() => $_clearField(1);

  @$pb.TagNumber(2)
  Stage get stage => $_getN(1);
  @$pb.TagNumber(2)
  set stage(Stage value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasStage() => $_has(1);
  @$pb.TagNumber(2)
  void clearStage() => $_clearField(2);

  @$pb.TagNumber(3)
  $fixnum.Int64 get endTime => $_getI64(2);
  @$pb.TagNumber(3)
  set endTime($fixnum.Int64 value) => $_setInt64(2, value);
  @$pb.TagNumber(3)
  $core.bool hasEndTime() => $_has(2);
  @$pb.TagNumber(3)
  void clearEndTime() => $_clearField(3);

  @$pb.TagNumber(4)
  $pb.PbList<BidInfo> get bidList => $_getList(3);

  @$pb.TagNumber(5)
  $core.int get extendCount => $_getIZ(4);
  @$pb.TagNumber(5)
  set extendCount($core.int value) => $_setSignedInt32(4, value);
  @$pb.TagNumber(5)
  $core.bool hasExtendCount() => $_has(4);
  @$pb.TagNumber(5)
  void clearExtendCount() => $_clearField(5);

  @$pb.TagNumber(6)
  $fixnum.Int64 get extendTime => $_getI64(5);
  @$pb.TagNumber(6)
  set extendTime($fixnum.Int64 value) => $_setInt64(5, value);
  @$pb.TagNumber(6)
  $core.bool hasExtendTime() => $_has(5);
  @$pb.TagNumber(6)
  void clearExtendTime() => $_clearField(6);

  @$pb.TagNumber(7)
  Artist get artist => $_getN(6);
  @$pb.TagNumber(7)
  set artist(Artist value) => $_setField(7, value);
  @$pb.TagNumber(7)
  $core.bool hasArtist() => $_has(6);
  @$pb.TagNumber(7)
  void clearArtist() => $_clearField(7);
  @$pb.TagNumber(7)
  Artist ensureArtist() => $_ensure(6);
}

class BidInfo extends $pb.GeneratedMessage {
  factory BidInfo({
    $0.CommonUser? user,
    $fixnum.Int64? bid,
  }) {
    final result = create();
    if (user != null) result.user = user;
    if (bid != null) result.bid = bid;
    return result;
  }

  BidInfo._();

  factory BidInfo.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory BidInfo.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'BidInfo',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'auction'),
      createEmptyInstance: create)
    ..aOM<$0.CommonUser>(1, _omitFieldNames ? '' : 'user',
        subBuilder: $0.CommonUser.create)
    ..aInt64(2, _omitFieldNames ? '' : 'bid')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  BidInfo clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  BidInfo copyWith(void Function(BidInfo) updates) =>
      super.copyWith((message) => updates(message as BidInfo)) as BidInfo;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static BidInfo create() => BidInfo._();
  @$core.override
  BidInfo createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static BidInfo getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<BidInfo>(create);
  static BidInfo? _defaultInstance;

  @$pb.TagNumber(1)
  $0.CommonUser get user => $_getN(0);
  @$pb.TagNumber(1)
  set user($0.CommonUser value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasUser() => $_has(0);
  @$pb.TagNumber(1)
  void clearUser() => $_clearField(1);
  @$pb.TagNumber(1)
  $0.CommonUser ensureUser() => $_ensure(0);

  @$pb.TagNumber(2)
  $fixnum.Int64 get bid => $_getI64(1);
  @$pb.TagNumber(2)
  set bid($fixnum.Int64 value) => $_setInt64(1, value);
  @$pb.TagNumber(2)
  $core.bool hasBid() => $_has(1);
  @$pb.TagNumber(2)
  void clearBid() => $_clearField(2);
}

class Artist extends $pb.GeneratedMessage {
  factory Artist({
    $0.CommonUser? user,
    $fixnum.Int64? value,
    $0.CommonUser? agent,
    $fixnum.Int64? contribution,
    $core.int? expiryDate,
    $core.int? freeRenewCount,
    $fixnum.Int64? renewValue,
    $fixnum.Int64? renewExtendDay,
  }) {
    final result = create();
    if (user != null) result.user = user;
    if (value != null) result.value = value;
    if (agent != null) result.agent = agent;
    if (contribution != null) result.contribution = contribution;
    if (expiryDate != null) result.expiryDate = expiryDate;
    if (freeRenewCount != null) result.freeRenewCount = freeRenewCount;
    if (renewValue != null) result.renewValue = renewValue;
    if (renewExtendDay != null) result.renewExtendDay = renewExtendDay;
    return result;
  }

  Artist._();

  factory Artist.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory Artist.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'Artist',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'auction'),
      createEmptyInstance: create)
    ..aOM<$0.CommonUser>(1, _omitFieldNames ? '' : 'user',
        subBuilder: $0.CommonUser.create)
    ..aInt64(2, _omitFieldNames ? '' : 'value')
    ..aOM<$0.CommonUser>(3, _omitFieldNames ? '' : 'agent',
        subBuilder: $0.CommonUser.create)
    ..aInt64(4, _omitFieldNames ? '' : 'contribution')
    ..aI(5, _omitFieldNames ? '' : 'expiryDate')
    ..aI(6, _omitFieldNames ? '' : 'freeRenewCount')
    ..aInt64(7, _omitFieldNames ? '' : 'renewValue')
    ..aInt64(8, _omitFieldNames ? '' : 'renewExtendDay')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Artist clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Artist copyWith(void Function(Artist) updates) =>
      super.copyWith((message) => updates(message as Artist)) as Artist;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Artist create() => Artist._();
  @$core.override
  Artist createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static Artist getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Artist>(create);
  static Artist? _defaultInstance;

  @$pb.TagNumber(1)
  $0.CommonUser get user => $_getN(0);
  @$pb.TagNumber(1)
  set user($0.CommonUser value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasUser() => $_has(0);
  @$pb.TagNumber(1)
  void clearUser() => $_clearField(1);
  @$pb.TagNumber(1)
  $0.CommonUser ensureUser() => $_ensure(0);

  @$pb.TagNumber(2)
  $fixnum.Int64 get value => $_getI64(1);
  @$pb.TagNumber(2)
  set value($fixnum.Int64 value) => $_setInt64(1, value);
  @$pb.TagNumber(2)
  $core.bool hasValue() => $_has(1);
  @$pb.TagNumber(2)
  void clearValue() => $_clearField(2);

  @$pb.TagNumber(3)
  $0.CommonUser get agent => $_getN(2);
  @$pb.TagNumber(3)
  set agent($0.CommonUser value) => $_setField(3, value);
  @$pb.TagNumber(3)
  $core.bool hasAgent() => $_has(2);
  @$pb.TagNumber(3)
  void clearAgent() => $_clearField(3);
  @$pb.TagNumber(3)
  $0.CommonUser ensureAgent() => $_ensure(2);

  @$pb.TagNumber(4)
  $fixnum.Int64 get contribution => $_getI64(3);
  @$pb.TagNumber(4)
  set contribution($fixnum.Int64 value) => $_setInt64(3, value);
  @$pb.TagNumber(4)
  $core.bool hasContribution() => $_has(3);
  @$pb.TagNumber(4)
  void clearContribution() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.int get expiryDate => $_getIZ(4);
  @$pb.TagNumber(5)
  set expiryDate($core.int value) => $_setSignedInt32(4, value);
  @$pb.TagNumber(5)
  $core.bool hasExpiryDate() => $_has(4);
  @$pb.TagNumber(5)
  void clearExpiryDate() => $_clearField(5);

  @$pb.TagNumber(6)
  $core.int get freeRenewCount => $_getIZ(5);
  @$pb.TagNumber(6)
  set freeRenewCount($core.int value) => $_setSignedInt32(5, value);
  @$pb.TagNumber(6)
  $core.bool hasFreeRenewCount() => $_has(5);
  @$pb.TagNumber(6)
  void clearFreeRenewCount() => $_clearField(6);

  @$pb.TagNumber(7)
  $fixnum.Int64 get renewValue => $_getI64(6);
  @$pb.TagNumber(7)
  set renewValue($fixnum.Int64 value) => $_setInt64(6, value);
  @$pb.TagNumber(7)
  $core.bool hasRenewValue() => $_has(6);
  @$pb.TagNumber(7)
  void clearRenewValue() => $_clearField(7);

  @$pb.TagNumber(8)
  $fixnum.Int64 get renewExtendDay => $_getI64(7);
  @$pb.TagNumber(8)
  set renewExtendDay($fixnum.Int64 value) => $_setInt64(7, value);
  @$pb.TagNumber(8)
  $core.bool hasRenewExtendDay() => $_has(7);
  @$pb.TagNumber(8)
  void clearRenewExtendDay() => $_clearField(8);
}

class AuctionResult extends $pb.GeneratedMessage {
  factory AuctionResult({
    $core.bool? success,
    $0.CommonUser? artist,
    $fixnum.Int64? originalValue,
    $fixnum.Int64? currentValue,
    $fixnum.Int64? expire,
    $0.CommonUser? agent,
  }) {
    final result = create();
    if (success != null) result.success = success;
    if (artist != null) result.artist = artist;
    if (originalValue != null) result.originalValue = originalValue;
    if (currentValue != null) result.currentValue = currentValue;
    if (expire != null) result.expire = expire;
    if (agent != null) result.agent = agent;
    return result;
  }

  AuctionResult._();

  factory AuctionResult.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory AuctionResult.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'AuctionResult',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'auction'),
      createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'success')
    ..aOM<$0.CommonUser>(2, _omitFieldNames ? '' : 'artist',
        subBuilder: $0.CommonUser.create)
    ..aInt64(3, _omitFieldNames ? '' : 'originalValue')
    ..aInt64(4, _omitFieldNames ? '' : 'currentValue')
    ..aInt64(5, _omitFieldNames ? '' : 'expire')
    ..aOM<$0.CommonUser>(6, _omitFieldNames ? '' : 'agent',
        subBuilder: $0.CommonUser.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  AuctionResult clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  AuctionResult copyWith(void Function(AuctionResult) updates) =>
      super.copyWith((message) => updates(message as AuctionResult))
          as AuctionResult;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static AuctionResult create() => AuctionResult._();
  @$core.override
  AuctionResult createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static AuctionResult getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<AuctionResult>(create);
  static AuctionResult? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get success => $_getBF(0);
  @$pb.TagNumber(1)
  set success($core.bool value) => $_setBool(0, value);
  @$pb.TagNumber(1)
  $core.bool hasSuccess() => $_has(0);
  @$pb.TagNumber(1)
  void clearSuccess() => $_clearField(1);

  @$pb.TagNumber(2)
  $0.CommonUser get artist => $_getN(1);
  @$pb.TagNumber(2)
  set artist($0.CommonUser value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasArtist() => $_has(1);
  @$pb.TagNumber(2)
  void clearArtist() => $_clearField(2);
  @$pb.TagNumber(2)
  $0.CommonUser ensureArtist() => $_ensure(1);

  @$pb.TagNumber(3)
  $fixnum.Int64 get originalValue => $_getI64(2);
  @$pb.TagNumber(3)
  set originalValue($fixnum.Int64 value) => $_setInt64(2, value);
  @$pb.TagNumber(3)
  $core.bool hasOriginalValue() => $_has(2);
  @$pb.TagNumber(3)
  void clearOriginalValue() => $_clearField(3);

  @$pb.TagNumber(4)
  $fixnum.Int64 get currentValue => $_getI64(3);
  @$pb.TagNumber(4)
  set currentValue($fixnum.Int64 value) => $_setInt64(3, value);
  @$pb.TagNumber(4)
  $core.bool hasCurrentValue() => $_has(3);
  @$pb.TagNumber(4)
  void clearCurrentValue() => $_clearField(4);

  @$pb.TagNumber(5)
  $fixnum.Int64 get expire => $_getI64(4);
  @$pb.TagNumber(5)
  set expire($fixnum.Int64 value) => $_setInt64(4, value);
  @$pb.TagNumber(5)
  $core.bool hasExpire() => $_has(4);
  @$pb.TagNumber(5)
  void clearExpire() => $_clearField(5);

  @$pb.TagNumber(6)
  $0.CommonUser get agent => $_getN(5);
  @$pb.TagNumber(6)
  set agent($0.CommonUser value) => $_setField(6, value);
  @$pb.TagNumber(6)
  $core.bool hasAgent() => $_has(5);
  @$pb.TagNumber(6)
  void clearAgent() => $_clearField(6);
  @$pb.TagNumber(6)
  $0.CommonUser ensureAgent() => $_ensure(5);
}

class AuctionStartReq extends $pb.GeneratedMessage {
  factory AuctionStartReq({
    $fixnum.Int64? artistId,
    $fixnum.Int64? channelId,
  }) {
    final result = create();
    if (artistId != null) result.artistId = artistId;
    if (channelId != null) result.channelId = channelId;
    return result;
  }

  AuctionStartReq._();

  factory AuctionStartReq.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory AuctionStartReq.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'AuctionStartReq',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'auction'),
      createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'artistId')
    ..aInt64(2, _omitFieldNames ? '' : 'channelId')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  AuctionStartReq clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  AuctionStartReq copyWith(void Function(AuctionStartReq) updates) =>
      super.copyWith((message) => updates(message as AuctionStartReq))
          as AuctionStartReq;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static AuctionStartReq create() => AuctionStartReq._();
  @$core.override
  AuctionStartReq createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static AuctionStartReq getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<AuctionStartReq>(create);
  static AuctionStartReq? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get artistId => $_getI64(0);
  @$pb.TagNumber(1)
  set artistId($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasArtistId() => $_has(0);
  @$pb.TagNumber(1)
  void clearArtistId() => $_clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get channelId => $_getI64(1);
  @$pb.TagNumber(2)
  set channelId($fixnum.Int64 value) => $_setInt64(1, value);
  @$pb.TagNumber(2)
  $core.bool hasChannelId() => $_has(1);
  @$pb.TagNumber(2)
  void clearChannelId() => $_clearField(2);
}

class AuctionStartRsp extends $pb.GeneratedMessage {
  factory AuctionStartRsp({
    $fixnum.Int64? auctionSessionId,
  }) {
    final result = create();
    if (auctionSessionId != null) result.auctionSessionId = auctionSessionId;
    return result;
  }

  AuctionStartRsp._();

  factory AuctionStartRsp.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory AuctionStartRsp.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'AuctionStartRsp',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'auction'),
      createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'auctionSessionId')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  AuctionStartRsp clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  AuctionStartRsp copyWith(void Function(AuctionStartRsp) updates) =>
      super.copyWith((message) => updates(message as AuctionStartRsp))
          as AuctionStartRsp;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static AuctionStartRsp create() => AuctionStartRsp._();
  @$core.override
  AuctionStartRsp createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static AuctionStartRsp getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<AuctionStartRsp>(create);
  static AuctionStartRsp? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get auctionSessionId => $_getI64(0);
  @$pb.TagNumber(1)
  set auctionSessionId($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasAuctionSessionId() => $_has(0);
  @$pb.TagNumber(1)
  void clearAuctionSessionId() => $_clearField(1);
}

class AuctionUpdateReq extends $pb.GeneratedMessage {
  factory AuctionUpdateReq({
    $fixnum.Int64? auctionSessionId,
    Stage? stage,
  }) {
    final result = create();
    if (auctionSessionId != null) result.auctionSessionId = auctionSessionId;
    if (stage != null) result.stage = stage;
    return result;
  }

  AuctionUpdateReq._();

  factory AuctionUpdateReq.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory AuctionUpdateReq.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'AuctionUpdateReq',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'auction'),
      createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'auctionSessionId')
    ..aE<Stage>(2, _omitFieldNames ? '' : 'stage', enumValues: Stage.values)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  AuctionUpdateReq clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  AuctionUpdateReq copyWith(void Function(AuctionUpdateReq) updates) =>
      super.copyWith((message) => updates(message as AuctionUpdateReq))
          as AuctionUpdateReq;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static AuctionUpdateReq create() => AuctionUpdateReq._();
  @$core.override
  AuctionUpdateReq createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static AuctionUpdateReq getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<AuctionUpdateReq>(create);
  static AuctionUpdateReq? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get auctionSessionId => $_getI64(0);
  @$pb.TagNumber(1)
  set auctionSessionId($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasAuctionSessionId() => $_has(0);
  @$pb.TagNumber(1)
  void clearAuctionSessionId() => $_clearField(1);

  @$pb.TagNumber(2)
  Stage get stage => $_getN(1);
  @$pb.TagNumber(2)
  set stage(Stage value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasStage() => $_has(1);
  @$pb.TagNumber(2)
  void clearStage() => $_clearField(2);
}

class AuctionBidInfo extends $pb.GeneratedMessage {
  factory AuctionBidInfo({
    $0.CommonUser? artist,
    $fixnum.Int64? currentValue,
    $fixnum.Int64? lastBid,
    $core.Iterable<$fixnum.Int64>? increaseBid,
    $fixnum.Int64? balance,
  }) {
    final result = create();
    if (artist != null) result.artist = artist;
    if (currentValue != null) result.currentValue = currentValue;
    if (lastBid != null) result.lastBid = lastBid;
    if (increaseBid != null) result.increaseBid.addAll(increaseBid);
    if (balance != null) result.balance = balance;
    return result;
  }

  AuctionBidInfo._();

  factory AuctionBidInfo.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory AuctionBidInfo.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'AuctionBidInfo',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'auction'),
      createEmptyInstance: create)
    ..aOM<$0.CommonUser>(1, _omitFieldNames ? '' : 'artist',
        subBuilder: $0.CommonUser.create)
    ..aInt64(4, _omitFieldNames ? '' : 'currentValue')
    ..aInt64(5, _omitFieldNames ? '' : 'lastBid')
    ..p<$fixnum.Int64>(
        6, _omitFieldNames ? '' : 'increaseBid', $pb.PbFieldType.K6)
    ..aInt64(7, _omitFieldNames ? '' : 'balance')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  AuctionBidInfo clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  AuctionBidInfo copyWith(void Function(AuctionBidInfo) updates) =>
      super.copyWith((message) => updates(message as AuctionBidInfo))
          as AuctionBidInfo;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static AuctionBidInfo create() => AuctionBidInfo._();
  @$core.override
  AuctionBidInfo createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static AuctionBidInfo getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<AuctionBidInfo>(create);
  static AuctionBidInfo? _defaultInstance;

  @$pb.TagNumber(1)
  $0.CommonUser get artist => $_getN(0);
  @$pb.TagNumber(1)
  set artist($0.CommonUser value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasArtist() => $_has(0);
  @$pb.TagNumber(1)
  void clearArtist() => $_clearField(1);
  @$pb.TagNumber(1)
  $0.CommonUser ensureArtist() => $_ensure(0);

  @$pb.TagNumber(4)
  $fixnum.Int64 get currentValue => $_getI64(1);
  @$pb.TagNumber(4)
  set currentValue($fixnum.Int64 value) => $_setInt64(1, value);
  @$pb.TagNumber(4)
  $core.bool hasCurrentValue() => $_has(1);
  @$pb.TagNumber(4)
  void clearCurrentValue() => $_clearField(4);

  @$pb.TagNumber(5)
  $fixnum.Int64 get lastBid => $_getI64(2);
  @$pb.TagNumber(5)
  set lastBid($fixnum.Int64 value) => $_setInt64(2, value);
  @$pb.TagNumber(5)
  $core.bool hasLastBid() => $_has(2);
  @$pb.TagNumber(5)
  void clearLastBid() => $_clearField(5);

  @$pb.TagNumber(6)
  $pb.PbList<$fixnum.Int64> get increaseBid => $_getList(3);

  @$pb.TagNumber(7)
  $fixnum.Int64 get balance => $_getI64(4);
  @$pb.TagNumber(7)
  set balance($fixnum.Int64 value) => $_setInt64(4, value);
  @$pb.TagNumber(7)
  $core.bool hasBalance() => $_has(4);
  @$pb.TagNumber(7)
  void clearBalance() => $_clearField(7);
}

class AuctionBidReq extends $pb.GeneratedMessage {
  factory AuctionBidReq({
    $fixnum.Int64? auctionSessionId,
    $fixnum.Int64? bid,
  }) {
    final result = create();
    if (auctionSessionId != null) result.auctionSessionId = auctionSessionId;
    if (bid != null) result.bid = bid;
    return result;
  }

  AuctionBidReq._();

  factory AuctionBidReq.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory AuctionBidReq.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'AuctionBidReq',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'auction'),
      createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'auctionSessionId')
    ..aInt64(2, _omitFieldNames ? '' : 'bid')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  AuctionBidReq clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  AuctionBidReq copyWith(void Function(AuctionBidReq) updates) =>
      super.copyWith((message) => updates(message as AuctionBidReq))
          as AuctionBidReq;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static AuctionBidReq create() => AuctionBidReq._();
  @$core.override
  AuctionBidReq createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static AuctionBidReq getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<AuctionBidReq>(create);
  static AuctionBidReq? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get auctionSessionId => $_getI64(0);
  @$pb.TagNumber(1)
  set auctionSessionId($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasAuctionSessionId() => $_has(0);
  @$pb.TagNumber(1)
  void clearAuctionSessionId() => $_clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get bid => $_getI64(1);
  @$pb.TagNumber(2)
  set bid($fixnum.Int64 value) => $_setInt64(1, value);
  @$pb.TagNumber(2)
  $core.bool hasBid() => $_has(1);
  @$pb.TagNumber(2)
  void clearBid() => $_clearField(2);
}

class ArtistContractInfo extends $pb.GeneratedMessage {
  factory ArtistContractInfo({
    Artist? signedInfo,
    $core.Iterable<Artist>? artistList,
  }) {
    final result = create();
    if (signedInfo != null) result.signedInfo = signedInfo;
    if (artistList != null) result.artistList.addAll(artistList);
    return result;
  }

  ArtistContractInfo._();

  factory ArtistContractInfo.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ArtistContractInfo.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ArtistContractInfo',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'auction'),
      createEmptyInstance: create)
    ..aOM<Artist>(1, _omitFieldNames ? '' : 'signedInfo',
        subBuilder: Artist.create)
    ..pPM<Artist>(2, _omitFieldNames ? '' : 'artistList',
        subBuilder: Artist.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ArtistContractInfo clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ArtistContractInfo copyWith(void Function(ArtistContractInfo) updates) =>
      super.copyWith((message) => updates(message as ArtistContractInfo))
          as ArtistContractInfo;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ArtistContractInfo create() => ArtistContractInfo._();
  @$core.override
  ArtistContractInfo createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ArtistContractInfo getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ArtistContractInfo>(create);
  static ArtistContractInfo? _defaultInstance;

  @$pb.TagNumber(1)
  Artist get signedInfo => $_getN(0);
  @$pb.TagNumber(1)
  set signedInfo(Artist value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasSignedInfo() => $_has(0);
  @$pb.TagNumber(1)
  void clearSignedInfo() => $_clearField(1);
  @$pb.TagNumber(1)
  Artist ensureSignedInfo() => $_ensure(0);

  @$pb.TagNumber(2)
  $pb.PbList<Artist> get artistList => $_getList(1);
}

/// 先这样定义，避免后续扩展合同时间，续约金额
class ArtistRenewReq extends $pb.GeneratedMessage {
  factory ArtistRenewReq({
    $fixnum.Int64? artistId,
    $fixnum.Int64? renewValue,
  }) {
    final result = create();
    if (artistId != null) result.artistId = artistId;
    if (renewValue != null) result.renewValue = renewValue;
    return result;
  }

  ArtistRenewReq._();

  factory ArtistRenewReq.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ArtistRenewReq.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ArtistRenewReq',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'auction'),
      createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'artistId')
    ..aInt64(2, _omitFieldNames ? '' : 'renewValue')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ArtistRenewReq clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ArtistRenewReq copyWith(void Function(ArtistRenewReq) updates) =>
      super.copyWith((message) => updates(message as ArtistRenewReq))
          as ArtistRenewReq;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ArtistRenewReq create() => ArtistRenewReq._();
  @$core.override
  ArtistRenewReq createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ArtistRenewReq getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ArtistRenewReq>(create);
  static ArtistRenewReq? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get artistId => $_getI64(0);
  @$pb.TagNumber(1)
  set artistId($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasArtistId() => $_has(0);
  @$pb.TagNumber(1)
  void clearArtistId() => $_clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get renewValue => $_getI64(1);
  @$pb.TagNumber(2)
  set renewValue($fixnum.Int64 value) => $_setInt64(1, value);
  @$pb.TagNumber(2)
  $core.bool hasRenewValue() => $_has(1);
  @$pb.TagNumber(2)
  void clearRenewValue() => $_clearField(2);
}

/// 每日契约任务项。任务种类只在服务端枚举 ContractTaskCode 里定义，
/// 客户端按 task_code 区分图标，按 title 取多语言文案，新增任务不需要客户端发版
class ContractTaskItem extends $pb.GeneratedMessage {
  factory ContractTaskItem({
    $core.String? taskCode,
    $core.String? title,
    $core.int? required,
    $core.int? current,
    $core.bool? completed,
  }) {
    final result = create();
    if (taskCode != null) result.taskCode = taskCode;
    if (title != null) result.title = title;
    if (required != null) result.required = required;
    if (current != null) result.current = current;
    if (completed != null) result.completed = completed;
    return result;
  }

  ContractTaskItem._();

  factory ContractTaskItem.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ContractTaskItem.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ContractTaskItem',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'auction'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'taskCode')
    ..aOS(2, _omitFieldNames ? '' : 'title')
    ..aI(3, _omitFieldNames ? '' : 'required')
    ..aI(4, _omitFieldNames ? '' : 'current')
    ..aOB(5, _omitFieldNames ? '' : 'completed')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ContractTaskItem clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ContractTaskItem copyWith(void Function(ContractTaskItem) updates) =>
      super.copyWith((message) => updates(message as ContractTaskItem))
          as ContractTaskItem;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ContractTaskItem create() => ContractTaskItem._();
  @$core.override
  ContractTaskItem createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ContractTaskItem getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ContractTaskItem>(create);
  static ContractTaskItem? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get taskCode => $_getSZ(0);
  @$pb.TagNumber(1)
  set taskCode($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasTaskCode() => $_has(0);
  @$pb.TagNumber(1)
  void clearTaskCode() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get title => $_getSZ(1);
  @$pb.TagNumber(2)
  set title($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasTitle() => $_has(1);
  @$pb.TagNumber(2)
  void clearTitle() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.int get required => $_getIZ(2);
  @$pb.TagNumber(3)
  set required($core.int value) => $_setSignedInt32(2, value);
  @$pb.TagNumber(3)
  $core.bool hasRequired() => $_has(2);
  @$pb.TagNumber(3)
  void clearRequired() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.int get current => $_getIZ(3);
  @$pb.TagNumber(4)
  set current($core.int value) => $_setSignedInt32(3, value);
  @$pb.TagNumber(4)
  $core.bool hasCurrent() => $_has(3);
  @$pb.TagNumber(4)
  void clearCurrent() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.bool get completed => $_getBF(4);
  @$pb.TagNumber(5)
  set completed($core.bool value) => $_setBool(4, value);
  @$pb.TagNumber(5)
  $core.bool hasCompleted() => $_has(4);
  @$pb.TagNumber(5)
  void clearCompleted() => $_clearField(5);
}

/// 艺人页里的一张艺人卡片
class ArtistCard extends $pb.GeneratedMessage {
  factory ArtistCard({
    $0.CommonUser? user,
    $fixnum.Int64? value,
    $fixnum.Int64? contribution,
    $core.int? expiryDate,
    $core.int? freeRenewCount,
    $fixnum.Int64? renewValue,
    $fixnum.Int64? renewExtendDay,
    $core.bool? canRenew,
    $core.bool? contractActivatedToday,
    $core.int? inactiveStreakDays,
    $core.Iterable<ContractTaskItem>? tasks,
  }) {
    final result = create();
    if (user != null) result.user = user;
    if (value != null) result.value = value;
    if (contribution != null) result.contribution = contribution;
    if (expiryDate != null) result.expiryDate = expiryDate;
    if (freeRenewCount != null) result.freeRenewCount = freeRenewCount;
    if (renewValue != null) result.renewValue = renewValue;
    if (renewExtendDay != null) result.renewExtendDay = renewExtendDay;
    if (canRenew != null) result.canRenew = canRenew;
    if (contractActivatedToday != null)
      result.contractActivatedToday = contractActivatedToday;
    if (inactiveStreakDays != null)
      result.inactiveStreakDays = inactiveStreakDays;
    if (tasks != null) result.tasks.addAll(tasks);
    return result;
  }

  ArtistCard._();

  factory ArtistCard.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ArtistCard.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ArtistCard',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'auction'),
      createEmptyInstance: create)
    ..aOM<$0.CommonUser>(1, _omitFieldNames ? '' : 'user',
        subBuilder: $0.CommonUser.create)
    ..aInt64(2, _omitFieldNames ? '' : 'value')
    ..aInt64(3, _omitFieldNames ? '' : 'contribution')
    ..aI(4, _omitFieldNames ? '' : 'expiryDate')
    ..aI(5, _omitFieldNames ? '' : 'freeRenewCount')
    ..aInt64(6, _omitFieldNames ? '' : 'renewValue')
    ..aInt64(7, _omitFieldNames ? '' : 'renewExtendDay')
    ..aOB(8, _omitFieldNames ? '' : 'canRenew')
    ..aOB(9, _omitFieldNames ? '' : 'contractActivatedToday')
    ..aI(10, _omitFieldNames ? '' : 'inactiveStreakDays')
    ..pPM<ContractTaskItem>(11, _omitFieldNames ? '' : 'tasks',
        subBuilder: ContractTaskItem.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ArtistCard clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ArtistCard copyWith(void Function(ArtistCard) updates) =>
      super.copyWith((message) => updates(message as ArtistCard)) as ArtistCard;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ArtistCard create() => ArtistCard._();
  @$core.override
  ArtistCard createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ArtistCard getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ArtistCard>(create);
  static ArtistCard? _defaultInstance;

  @$pb.TagNumber(1)
  $0.CommonUser get user => $_getN(0);
  @$pb.TagNumber(1)
  set user($0.CommonUser value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasUser() => $_has(0);
  @$pb.TagNumber(1)
  void clearUser() => $_clearField(1);
  @$pb.TagNumber(1)
  $0.CommonUser ensureUser() => $_ensure(0);

  @$pb.TagNumber(2)
  $fixnum.Int64 get value => $_getI64(1);
  @$pb.TagNumber(2)
  set value($fixnum.Int64 value) => $_setInt64(1, value);
  @$pb.TagNumber(2)
  $core.bool hasValue() => $_has(1);
  @$pb.TagNumber(2)
  void clearValue() => $_clearField(2);

  @$pb.TagNumber(3)
  $fixnum.Int64 get contribution => $_getI64(2);
  @$pb.TagNumber(3)
  set contribution($fixnum.Int64 value) => $_setInt64(2, value);
  @$pb.TagNumber(3)
  $core.bool hasContribution() => $_has(2);
  @$pb.TagNumber(3)
  void clearContribution() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.int get expiryDate => $_getIZ(3);
  @$pb.TagNumber(4)
  set expiryDate($core.int value) => $_setSignedInt32(3, value);
  @$pb.TagNumber(4)
  $core.bool hasExpiryDate() => $_has(3);
  @$pb.TagNumber(4)
  void clearExpiryDate() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.int get freeRenewCount => $_getIZ(4);
  @$pb.TagNumber(5)
  set freeRenewCount($core.int value) => $_setSignedInt32(4, value);
  @$pb.TagNumber(5)
  $core.bool hasFreeRenewCount() => $_has(4);
  @$pb.TagNumber(5)
  void clearFreeRenewCount() => $_clearField(5);

  @$pb.TagNumber(6)
  $fixnum.Int64 get renewValue => $_getI64(5);
  @$pb.TagNumber(6)
  set renewValue($fixnum.Int64 value) => $_setInt64(5, value);
  @$pb.TagNumber(6)
  $core.bool hasRenewValue() => $_has(5);
  @$pb.TagNumber(6)
  void clearRenewValue() => $_clearField(6);

  @$pb.TagNumber(7)
  $fixnum.Int64 get renewExtendDay => $_getI64(6);
  @$pb.TagNumber(7)
  set renewExtendDay($fixnum.Int64 value) => $_setInt64(6, value);
  @$pb.TagNumber(7)
  $core.bool hasRenewExtendDay() => $_has(6);
  @$pb.TagNumber(7)
  void clearRenewExtendDay() => $_clearField(7);

  @$pb.TagNumber(8)
  $core.bool get canRenew => $_getBF(7);
  @$pb.TagNumber(8)
  set canRenew($core.bool value) => $_setBool(7, value);
  @$pb.TagNumber(8)
  $core.bool hasCanRenew() => $_has(7);
  @$pb.TagNumber(8)
  void clearCanRenew() => $_clearField(8);

  @$pb.TagNumber(9)
  $core.bool get contractActivatedToday => $_getBF(8);
  @$pb.TagNumber(9)
  set contractActivatedToday($core.bool value) => $_setBool(8, value);
  @$pb.TagNumber(9)
  $core.bool hasContractActivatedToday() => $_has(8);
  @$pb.TagNumber(9)
  void clearContractActivatedToday() => $_clearField(9);

  @$pb.TagNumber(10)
  $core.int get inactiveStreakDays => $_getIZ(9);
  @$pb.TagNumber(10)
  set inactiveStreakDays($core.int value) => $_setSignedInt32(9, value);
  @$pb.TagNumber(10)
  $core.bool hasInactiveStreakDays() => $_has(9);
  @$pb.TagNumber(10)
  void clearInactiveStreakDays() => $_clearField(10);

  @$pb.TagNumber(11)
  $pb.PbList<ContractTaskItem> get tasks => $_getList(10);
}

/// 礼物摘要。不能引用 cash.ItemInfo：
/// rtc.proto → auction.proto → cash.proto → commodity.proto → rtc.proto 会成环
class AgentGiftItem extends $pb.GeneratedMessage {
  factory AgentGiftItem({
    $fixnum.Int64? id,
    $core.String? name,
    $core.String? icon,
    $fixnum.Int64? price,
    $core.String? dynamicResource,
  }) {
    final result = create();
    if (id != null) result.id = id;
    if (name != null) result.name = name;
    if (icon != null) result.icon = icon;
    if (price != null) result.price = price;
    if (dynamicResource != null) result.dynamicResource = dynamicResource;
    return result;
  }

  AgentGiftItem._();

  factory AgentGiftItem.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory AgentGiftItem.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'AgentGiftItem',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'auction'),
      createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'id')
    ..aOS(2, _omitFieldNames ? '' : 'name')
    ..aOS(3, _omitFieldNames ? '' : 'icon')
    ..aInt64(4, _omitFieldNames ? '' : 'price')
    ..aOS(5, _omitFieldNames ? '' : 'dynamicResource')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  AgentGiftItem clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  AgentGiftItem copyWith(void Function(AgentGiftItem) updates) =>
      super.copyWith((message) => updates(message as AgentGiftItem))
          as AgentGiftItem;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static AgentGiftItem create() => AgentGiftItem._();
  @$core.override
  AgentGiftItem createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static AgentGiftItem getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<AgentGiftItem>(create);
  static AgentGiftItem? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get id => $_getI64(0);
  @$pb.TagNumber(1)
  set id($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get name => $_getSZ(1);
  @$pb.TagNumber(2)
  set name($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasName() => $_has(1);
  @$pb.TagNumber(2)
  void clearName() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get icon => $_getSZ(2);
  @$pb.TagNumber(3)
  set icon($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasIcon() => $_has(2);
  @$pb.TagNumber(3)
  void clearIcon() => $_clearField(3);

  @$pb.TagNumber(4)
  $fixnum.Int64 get price => $_getI64(3);
  @$pb.TagNumber(4)
  set price($fixnum.Int64 value) => $_setInt64(3, value);
  @$pb.TagNumber(4)
  $core.bool hasPrice() => $_has(3);
  @$pb.TagNumber(4)
  void clearPrice() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.String get dynamicResource => $_getSZ(4);
  @$pb.TagNumber(5)
  set dynamicResource($core.String value) => $_setString(4, value);
  @$pb.TagNumber(5)
  $core.bool hasDynamicResource() => $_has(4);
  @$pb.TagNumber(5)
  void clearDynamicResource() => $_clearField(5);
}

/// 经纪人送给我的一条礼物记录
class AgentGiftRecord extends $pb.GeneratedMessage {
  factory AgentGiftRecord({
    AgentGiftItem? item,
    $core.int? count,
    $fixnum.Int64? coin,
    $fixnum.Int64? createTime,
    $core.int? payCurrency,
  }) {
    final result = create();
    if (item != null) result.item = item;
    if (count != null) result.count = count;
    if (coin != null) result.coin = coin;
    if (createTime != null) result.createTime = createTime;
    if (payCurrency != null) result.payCurrency = payCurrency;
    return result;
  }

  AgentGiftRecord._();

  factory AgentGiftRecord.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory AgentGiftRecord.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'AgentGiftRecord',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'auction'),
      createEmptyInstance: create)
    ..aOM<AgentGiftItem>(1, _omitFieldNames ? '' : 'item',
        subBuilder: AgentGiftItem.create)
    ..aI(2, _omitFieldNames ? '' : 'count')
    ..aInt64(3, _omitFieldNames ? '' : 'coin')
    ..aInt64(4, _omitFieldNames ? '' : 'createTime')
    ..aI(5, _omitFieldNames ? '' : 'payCurrency')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  AgentGiftRecord clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  AgentGiftRecord copyWith(void Function(AgentGiftRecord) updates) =>
      super.copyWith((message) => updates(message as AgentGiftRecord))
          as AgentGiftRecord;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static AgentGiftRecord create() => AgentGiftRecord._();
  @$core.override
  AgentGiftRecord createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static AgentGiftRecord getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<AgentGiftRecord>(create);
  static AgentGiftRecord? _defaultInstance;

  @$pb.TagNumber(1)
  AgentGiftItem get item => $_getN(0);
  @$pb.TagNumber(1)
  set item(AgentGiftItem value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasItem() => $_has(0);
  @$pb.TagNumber(1)
  void clearItem() => $_clearField(1);
  @$pb.TagNumber(1)
  AgentGiftItem ensureItem() => $_ensure(0);

  @$pb.TagNumber(2)
  $core.int get count => $_getIZ(1);
  @$pb.TagNumber(2)
  set count($core.int value) => $_setSignedInt32(1, value);
  @$pb.TagNumber(2)
  $core.bool hasCount() => $_has(1);
  @$pb.TagNumber(2)
  void clearCount() => $_clearField(2);

  @$pb.TagNumber(3)
  $fixnum.Int64 get coin => $_getI64(2);
  @$pb.TagNumber(3)
  set coin($fixnum.Int64 value) => $_setInt64(2, value);
  @$pb.TagNumber(3)
  $core.bool hasCoin() => $_has(2);
  @$pb.TagNumber(3)
  void clearCoin() => $_clearField(3);

  @$pb.TagNumber(4)
  $fixnum.Int64 get createTime => $_getI64(3);
  @$pb.TagNumber(4)
  set createTime($fixnum.Int64 value) => $_setInt64(3, value);
  @$pb.TagNumber(4)
  $core.bool hasCreateTime() => $_has(3);
  @$pb.TagNumber(4)
  void clearCreateTime() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.int get payCurrency => $_getIZ(4);
  @$pb.TagNumber(5)
  set payCurrency($core.int value) => $_setSignedInt32(4, value);
  @$pb.TagNumber(5)
  $core.bool hasPayCurrency() => $_has(4);
  @$pb.TagNumber(5)
  void clearPayCurrency() => $_clearField(5);
}

/// 经纪人页：我作为艺人，看我的经纪人
class AgentInfoRsp extends $pb.GeneratedMessage {
  factory AgentInfoRsp({
    $0.CommonUser? artist,
    $0.CommonUser? agent,
    $fixnum.Int64? value,
    $core.int? expiryDate,
    $core.Iterable<AgentGiftRecord>? giftList,
    $fixnum.Int64? totalCoin,
  }) {
    final result = create();
    if (artist != null) result.artist = artist;
    if (agent != null) result.agent = agent;
    if (value != null) result.value = value;
    if (expiryDate != null) result.expiryDate = expiryDate;
    if (giftList != null) result.giftList.addAll(giftList);
    if (totalCoin != null) result.totalCoin = totalCoin;
    return result;
  }

  AgentInfoRsp._();

  factory AgentInfoRsp.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory AgentInfoRsp.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'AgentInfoRsp',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'auction'),
      createEmptyInstance: create)
    ..aOM<$0.CommonUser>(1, _omitFieldNames ? '' : 'artist',
        subBuilder: $0.CommonUser.create)
    ..aOM<$0.CommonUser>(2, _omitFieldNames ? '' : 'agent',
        subBuilder: $0.CommonUser.create)
    ..aInt64(3, _omitFieldNames ? '' : 'value')
    ..aI(4, _omitFieldNames ? '' : 'expiryDate')
    ..pPM<AgentGiftRecord>(5, _omitFieldNames ? '' : 'giftList',
        subBuilder: AgentGiftRecord.create)
    ..aInt64(6, _omitFieldNames ? '' : 'totalCoin')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  AgentInfoRsp clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  AgentInfoRsp copyWith(void Function(AgentInfoRsp) updates) =>
      super.copyWith((message) => updates(message as AgentInfoRsp))
          as AgentInfoRsp;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static AgentInfoRsp create() => AgentInfoRsp._();
  @$core.override
  AgentInfoRsp createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static AgentInfoRsp getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<AgentInfoRsp>(create);
  static AgentInfoRsp? _defaultInstance;

  @$pb.TagNumber(1)
  $0.CommonUser get artist => $_getN(0);
  @$pb.TagNumber(1)
  set artist($0.CommonUser value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasArtist() => $_has(0);
  @$pb.TagNumber(1)
  void clearArtist() => $_clearField(1);
  @$pb.TagNumber(1)
  $0.CommonUser ensureArtist() => $_ensure(0);

  @$pb.TagNumber(2)
  $0.CommonUser get agent => $_getN(1);
  @$pb.TagNumber(2)
  set agent($0.CommonUser value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasAgent() => $_has(1);
  @$pb.TagNumber(2)
  void clearAgent() => $_clearField(2);
  @$pb.TagNumber(2)
  $0.CommonUser ensureAgent() => $_ensure(1);

  @$pb.TagNumber(3)
  $fixnum.Int64 get value => $_getI64(2);
  @$pb.TagNumber(3)
  set value($fixnum.Int64 value) => $_setInt64(2, value);
  @$pb.TagNumber(3)
  $core.bool hasValue() => $_has(2);
  @$pb.TagNumber(3)
  void clearValue() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.int get expiryDate => $_getIZ(3);
  @$pb.TagNumber(4)
  set expiryDate($core.int value) => $_setSignedInt32(3, value);
  @$pb.TagNumber(4)
  $core.bool hasExpiryDate() => $_has(3);
  @$pb.TagNumber(4)
  void clearExpiryDate() => $_clearField(4);

  @$pb.TagNumber(5)
  $pb.PbList<AgentGiftRecord> get giftList => $_getList(4);

  @$pb.TagNumber(6)
  $fixnum.Int64 get totalCoin => $_getI64(5);
  @$pb.TagNumber(6)
  set totalCoin($fixnum.Int64 value) => $_setInt64(5, value);
  @$pb.TagNumber(6)
  $core.bool hasTotalCoin() => $_has(5);
  @$pb.TagNumber(6)
  void clearTotalCoin() => $_clearField(6);
}

/// 艺人页：我作为经纪人，看我的艺人
class ArtistInfoRsp extends $pb.GeneratedMessage {
  factory ArtistInfoRsp({
    $0.CommonUser? user,
    $core.int? level,
    $core.String? levelName,
    $core.int? artistCount,
    $core.int? artistLimit,
    $core.Iterable<ArtistCard>? artistList,
  }) {
    final result = create();
    if (user != null) result.user = user;
    if (level != null) result.level = level;
    if (levelName != null) result.levelName = levelName;
    if (artistCount != null) result.artistCount = artistCount;
    if (artistLimit != null) result.artistLimit = artistLimit;
    if (artistList != null) result.artistList.addAll(artistList);
    return result;
  }

  ArtistInfoRsp._();

  factory ArtistInfoRsp.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ArtistInfoRsp.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ArtistInfoRsp',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'auction'),
      createEmptyInstance: create)
    ..aOM<$0.CommonUser>(1, _omitFieldNames ? '' : 'user',
        subBuilder: $0.CommonUser.create)
    ..aI(2, _omitFieldNames ? '' : 'level')
    ..aOS(3, _omitFieldNames ? '' : 'levelName')
    ..aI(4, _omitFieldNames ? '' : 'artistCount')
    ..aI(5, _omitFieldNames ? '' : 'artistLimit')
    ..pPM<ArtistCard>(6, _omitFieldNames ? '' : 'artistList',
        subBuilder: ArtistCard.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ArtistInfoRsp clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ArtistInfoRsp copyWith(void Function(ArtistInfoRsp) updates) =>
      super.copyWith((message) => updates(message as ArtistInfoRsp))
          as ArtistInfoRsp;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ArtistInfoRsp create() => ArtistInfoRsp._();
  @$core.override
  ArtistInfoRsp createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ArtistInfoRsp getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ArtistInfoRsp>(create);
  static ArtistInfoRsp? _defaultInstance;

  @$pb.TagNumber(1)
  $0.CommonUser get user => $_getN(0);
  @$pb.TagNumber(1)
  set user($0.CommonUser value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasUser() => $_has(0);
  @$pb.TagNumber(1)
  void clearUser() => $_clearField(1);
  @$pb.TagNumber(1)
  $0.CommonUser ensureUser() => $_ensure(0);

  @$pb.TagNumber(2)
  $core.int get level => $_getIZ(1);
  @$pb.TagNumber(2)
  set level($core.int value) => $_setSignedInt32(1, value);
  @$pb.TagNumber(2)
  $core.bool hasLevel() => $_has(1);
  @$pb.TagNumber(2)
  void clearLevel() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get levelName => $_getSZ(2);
  @$pb.TagNumber(3)
  set levelName($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasLevelName() => $_has(2);
  @$pb.TagNumber(3)
  void clearLevelName() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.int get artistCount => $_getIZ(3);
  @$pb.TagNumber(4)
  set artistCount($core.int value) => $_setSignedInt32(3, value);
  @$pb.TagNumber(4)
  $core.bool hasArtistCount() => $_has(3);
  @$pb.TagNumber(4)
  void clearArtistCount() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.int get artistLimit => $_getIZ(4);
  @$pb.TagNumber(5)
  set artistLimit($core.int value) => $_setSignedInt32(4, value);
  @$pb.TagNumber(5)
  $core.bool hasArtistLimit() => $_has(4);
  @$pb.TagNumber(5)
  void clearArtistLimit() => $_clearField(5);

  @$pb.TagNumber(6)
  $pb.PbList<ArtistCard> get artistList => $_getList(5);
}

const $core.bool _omitFieldNames =
    $core.bool.fromEnvironment('protobuf.omit_field_names');
const $core.bool _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');
