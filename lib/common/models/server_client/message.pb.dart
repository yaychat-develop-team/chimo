// This is a generated file - do not edit.
//
// Generated from server_client/message.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_relative_imports

import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;
import 'package:protobuf/well_known_types/google/protobuf/any.pb.dart' as $0;

import 'activity_share.pb.dart' as $4;
import 'cash.pb.dart' as $6;
import 'common/car.pbenum.dart' as $7;
import 'fleet/hang_out.pb.dart' as $3;
import 'message.pbenum.dart';
import 'rtc.pb.dart' as $5;
import 'user.pb.dart' as $1;
import 'user_realtion.pb.dart' as $2;

export 'package:protobuf/protobuf.dart' show GeneratedMessageGenericExtensions;

export 'message.pbenum.dart';

///
///  语音房消息统一结构
class Message extends $pb.GeneratedMessage {
  factory Message({
    $fixnum.Int64? id,
    $fixnum.Int64? time,
    MessageTypeEnum? type,
    MessageData? data,
  }) {
    final result = create();
    if (id != null) result.id = id;
    if (time != null) result.time = time;
    if (type != null) result.type = type;
    if (data != null) result.data = data;
    return result;
  }

  Message._();

  factory Message.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory Message.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'Message',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'message'),
      createEmptyInstance: create)
    ..a<$fixnum.Int64>(1, _omitFieldNames ? '' : 'id', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$fixnum.Int64>(2, _omitFieldNames ? '' : 'time', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..aE<MessageTypeEnum>(3, _omitFieldNames ? '' : 'type',
        enumValues: MessageTypeEnum.values)
    ..aOM<MessageData>(4, _omitFieldNames ? '' : 'data',
        subBuilder: MessageData.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Message clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Message copyWith(void Function(Message) updates) =>
      super.copyWith((message) => updates(message as Message)) as Message;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Message create() => Message._();
  @$core.override
  Message createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static Message getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Message>(create);
  static Message? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get id => $_getI64(0);
  @$pb.TagNumber(1)
  set id($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => $_clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get time => $_getI64(1);
  @$pb.TagNumber(2)
  set time($fixnum.Int64 value) => $_setInt64(1, value);
  @$pb.TagNumber(2)
  $core.bool hasTime() => $_has(1);
  @$pb.TagNumber(2)
  void clearTime() => $_clearField(2);

  @$pb.TagNumber(3)
  MessageTypeEnum get type => $_getN(2);
  @$pb.TagNumber(3)
  set type(MessageTypeEnum value) => $_setField(3, value);
  @$pb.TagNumber(3)
  $core.bool hasType() => $_has(2);
  @$pb.TagNumber(3)
  void clearType() => $_clearField(3);

  @$pb.TagNumber(4)
  MessageData get data => $_getN(3);
  @$pb.TagNumber(4)
  set data(MessageData value) => $_setField(4, value);
  @$pb.TagNumber(4)
  $core.bool hasData() => $_has(3);
  @$pb.TagNumber(4)
  void clearData() => $_clearField(4);
  @$pb.TagNumber(4)
  MessageData ensureData() => $_ensure(3);
}

/// *
///  消息数据
class MessageData extends $pb.GeneratedMessage {
  factory MessageData({
    $fixnum.Int64? seq,
    Scene? scene,
    $fixnum.Int64? reqId,
    $0.Any? content,
  }) {
    final result = create();
    if (seq != null) result.seq = seq;
    if (scene != null) result.scene = scene;
    if (reqId != null) result.reqId = reqId;
    if (content != null) result.content = content;
    return result;
  }

  MessageData._();

  factory MessageData.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory MessageData.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'MessageData',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'message'),
      createEmptyInstance: create)
    ..a<$fixnum.Int64>(1, _omitFieldNames ? '' : 'seq', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..aE<Scene>(2, _omitFieldNames ? '' : 'scene', enumValues: Scene.values)
    ..a<$fixnum.Int64>(3, _omitFieldNames ? '' : 'reqId', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..aOM<$0.Any>(4, _omitFieldNames ? '' : 'content',
        subBuilder: $0.Any.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  MessageData clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  MessageData copyWith(void Function(MessageData) updates) =>
      super.copyWith((message) => updates(message as MessageData))
          as MessageData;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static MessageData create() => MessageData._();
  @$core.override
  MessageData createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static MessageData getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<MessageData>(create);
  static MessageData? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get seq => $_getI64(0);
  @$pb.TagNumber(1)
  set seq($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasSeq() => $_has(0);
  @$pb.TagNumber(1)
  void clearSeq() => $_clearField(1);

  @$pb.TagNumber(2)
  Scene get scene => $_getN(1);
  @$pb.TagNumber(2)
  set scene(Scene value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasScene() => $_has(1);
  @$pb.TagNumber(2)
  void clearScene() => $_clearField(2);

  @$pb.TagNumber(3)
  $fixnum.Int64 get reqId => $_getI64(2);
  @$pb.TagNumber(3)
  set reqId($fixnum.Int64 value) => $_setInt64(2, value);
  @$pb.TagNumber(3)
  $core.bool hasReqId() => $_has(2);
  @$pb.TagNumber(3)
  void clearReqId() => $_clearField(3);

  @$pb.TagNumber(4)
  $0.Any get content => $_getN(3);
  @$pb.TagNumber(4)
  set content($0.Any value) => $_setField(4, value);
  @$pb.TagNumber(4)
  $core.bool hasContent() => $_has(3);
  @$pb.TagNumber(4)
  void clearContent() => $_clearField(4);
  @$pb.TagNumber(4)
  $0.Any ensureContent() => $_ensure(3);
}

/// *
///  请求类型消息内容
class ReqContent extends $pb.GeneratedMessage {
  factory ReqContent({
    $core.String? action,
    $core.Iterable<$core.MapEntry<$core.String, $core.String>>? body,
  }) {
    final result = create();
    if (action != null) result.action = action;
    if (body != null) result.body.addEntries(body);
    return result;
  }

  ReqContent._();

  factory ReqContent.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ReqContent.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ReqContent',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'message'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'action')
    ..m<$core.String, $core.String>(2, _omitFieldNames ? '' : 'body',
        entryClassName: 'ReqContent.BodyEntry',
        keyFieldType: $pb.PbFieldType.OS,
        valueFieldType: $pb.PbFieldType.OS,
        packageName: const $pb.PackageName('message'))
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ReqContent clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ReqContent copyWith(void Function(ReqContent) updates) =>
      super.copyWith((message) => updates(message as ReqContent)) as ReqContent;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ReqContent create() => ReqContent._();
  @$core.override
  ReqContent createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ReqContent getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ReqContent>(create);
  static ReqContent? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get action => $_getSZ(0);
  @$pb.TagNumber(1)
  set action($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasAction() => $_has(0);
  @$pb.TagNumber(1)
  void clearAction() => $_clearField(1);

  @$pb.TagNumber(2)
  $pb.PbMap<$core.String, $core.String> get body => $_getMap(1);
}

/// *
///  普通类型聊天消息内容
class ChatContent extends $pb.GeneratedMessage {
  factory ChatContent({
    $1.SimpleUser? sender,
    $core.Iterable<ShowItem>? showItem,
    BoxItem? boxItem,
    Message? quoteMsg,
    BubbleItem? bubbleItem,
    GiftMsgShow? giftMsgShow,
    $2.RelationBadge? relationBadge,
  }) {
    final result = create();
    if (sender != null) result.sender = sender;
    if (showItem != null) result.showItem.addAll(showItem);
    if (boxItem != null) result.boxItem = boxItem;
    if (quoteMsg != null) result.quoteMsg = quoteMsg;
    if (bubbleItem != null) result.bubbleItem = bubbleItem;
    if (giftMsgShow != null) result.giftMsgShow = giftMsgShow;
    if (relationBadge != null) result.relationBadge = relationBadge;
    return result;
  }

  ChatContent._();

  factory ChatContent.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ChatContent.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ChatContent',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'message'),
      createEmptyInstance: create)
    ..aOM<$1.SimpleUser>(1, _omitFieldNames ? '' : 'sender',
        subBuilder: $1.SimpleUser.create)
    ..pPM<ShowItem>(2, _omitFieldNames ? '' : 'showItem',
        subBuilder: ShowItem.create)
    ..aOM<BoxItem>(3, _omitFieldNames ? '' : 'boxItem',
        subBuilder: BoxItem.create)
    ..aOM<Message>(5, _omitFieldNames ? '' : 'quoteMsg',
        subBuilder: Message.create)
    ..aOM<BubbleItem>(6, _omitFieldNames ? '' : 'bubbleItem',
        subBuilder: BubbleItem.create)
    ..aOM<GiftMsgShow>(7, _omitFieldNames ? '' : 'giftMsgShow',
        subBuilder: GiftMsgShow.create)
    ..aOM<$2.RelationBadge>(8, _omitFieldNames ? '' : 'relationBadge',
        subBuilder: $2.RelationBadge.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ChatContent clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ChatContent copyWith(void Function(ChatContent) updates) =>
      super.copyWith((message) => updates(message as ChatContent))
          as ChatContent;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ChatContent create() => ChatContent._();
  @$core.override
  ChatContent createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ChatContent getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ChatContent>(create);
  static ChatContent? _defaultInstance;

  @$pb.TagNumber(1)
  $1.SimpleUser get sender => $_getN(0);
  @$pb.TagNumber(1)
  set sender($1.SimpleUser value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasSender() => $_has(0);
  @$pb.TagNumber(1)
  void clearSender() => $_clearField(1);
  @$pb.TagNumber(1)
  $1.SimpleUser ensureSender() => $_ensure(0);

  @$pb.TagNumber(2)
  $pb.PbList<ShowItem> get showItem => $_getList(1);

  @$pb.TagNumber(3)
  BoxItem get boxItem => $_getN(2);
  @$pb.TagNumber(3)
  set boxItem(BoxItem value) => $_setField(3, value);
  @$pb.TagNumber(3)
  $core.bool hasBoxItem() => $_has(2);
  @$pb.TagNumber(3)
  void clearBoxItem() => $_clearField(3);
  @$pb.TagNumber(3)
  BoxItem ensureBoxItem() => $_ensure(2);

  @$pb.TagNumber(5)
  Message get quoteMsg => $_getN(3);
  @$pb.TagNumber(5)
  set quoteMsg(Message value) => $_setField(5, value);
  @$pb.TagNumber(5)
  $core.bool hasQuoteMsg() => $_has(3);
  @$pb.TagNumber(5)
  void clearQuoteMsg() => $_clearField(5);
  @$pb.TagNumber(5)
  Message ensureQuoteMsg() => $_ensure(3);

  @$pb.TagNumber(6)
  BubbleItem get bubbleItem => $_getN(4);
  @$pb.TagNumber(6)
  set bubbleItem(BubbleItem value) => $_setField(6, value);
  @$pb.TagNumber(6)
  $core.bool hasBubbleItem() => $_has(4);
  @$pb.TagNumber(6)
  void clearBubbleItem() => $_clearField(6);
  @$pb.TagNumber(6)
  BubbleItem ensureBubbleItem() => $_ensure(4);

  @$pb.TagNumber(7)
  GiftMsgShow get giftMsgShow => $_getN(5);
  @$pb.TagNumber(7)
  set giftMsgShow(GiftMsgShow value) => $_setField(7, value);
  @$pb.TagNumber(7)
  $core.bool hasGiftMsgShow() => $_has(5);
  @$pb.TagNumber(7)
  void clearGiftMsgShow() => $_clearField(7);
  @$pb.TagNumber(7)
  GiftMsgShow ensureGiftMsgShow() => $_ensure(5);

  @$pb.TagNumber(8)
  $2.RelationBadge get relationBadge => $_getN(6);
  @$pb.TagNumber(8)
  set relationBadge($2.RelationBadge value) => $_setField(8, value);
  @$pb.TagNumber(8)
  $core.bool hasRelationBadge() => $_has(6);
  @$pb.TagNumber(8)
  void clearRelationBadge() => $_clearField(8);
  @$pb.TagNumber(8)
  $2.RelationBadge ensureRelationBadge() => $_ensure(6);
}

class CommonChatContent extends $pb.GeneratedMessage {
  factory CommonChatContent({
    $1.SimpleUser? sender,
    ChatStyle? style,
    QuestionAndAnswer? questionAndAnswer,
    $2.RelationBadge? relationBadge,
    $3.PetChatMsgInfo? petChatMsgInfo,
    $4.ActivityShareCardContent? activityShareCard,
  }) {
    final result = create();
    if (sender != null) result.sender = sender;
    if (style != null) result.style = style;
    if (questionAndAnswer != null) result.questionAndAnswer = questionAndAnswer;
    if (relationBadge != null) result.relationBadge = relationBadge;
    if (petChatMsgInfo != null) result.petChatMsgInfo = petChatMsgInfo;
    if (activityShareCard != null) result.activityShareCard = activityShareCard;
    return result;
  }

  CommonChatContent._();

  factory CommonChatContent.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory CommonChatContent.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'CommonChatContent',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'message'),
      createEmptyInstance: create)
    ..aOM<$1.SimpleUser>(1, _omitFieldNames ? '' : 'sender',
        subBuilder: $1.SimpleUser.create)
    ..aE<ChatStyle>(2, _omitFieldNames ? '' : 'style',
        enumValues: ChatStyle.values)
    ..aOM<QuestionAndAnswer>(3, _omitFieldNames ? '' : 'questionAndAnswer',
        subBuilder: QuestionAndAnswer.create)
    ..aOM<$2.RelationBadge>(4, _omitFieldNames ? '' : 'relationBadge',
        subBuilder: $2.RelationBadge.create)
    ..aOM<$3.PetChatMsgInfo>(5, _omitFieldNames ? '' : 'petChatMsgInfo',
        subBuilder: $3.PetChatMsgInfo.create)
    ..aOM<$4.ActivityShareCardContent>(
        6, _omitFieldNames ? '' : 'activityShareCard',
        subBuilder: $4.ActivityShareCardContent.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CommonChatContent clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CommonChatContent copyWith(void Function(CommonChatContent) updates) =>
      super.copyWith((message) => updates(message as CommonChatContent))
          as CommonChatContent;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CommonChatContent create() => CommonChatContent._();
  @$core.override
  CommonChatContent createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static CommonChatContent getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<CommonChatContent>(create);
  static CommonChatContent? _defaultInstance;

  @$pb.TagNumber(1)
  $1.SimpleUser get sender => $_getN(0);
  @$pb.TagNumber(1)
  set sender($1.SimpleUser value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasSender() => $_has(0);
  @$pb.TagNumber(1)
  void clearSender() => $_clearField(1);
  @$pb.TagNumber(1)
  $1.SimpleUser ensureSender() => $_ensure(0);

  @$pb.TagNumber(2)
  ChatStyle get style => $_getN(1);
  @$pb.TagNumber(2)
  set style(ChatStyle value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasStyle() => $_has(1);
  @$pb.TagNumber(2)
  void clearStyle() => $_clearField(2);

  @$pb.TagNumber(3)
  QuestionAndAnswer get questionAndAnswer => $_getN(2);
  @$pb.TagNumber(3)
  set questionAndAnswer(QuestionAndAnswer value) => $_setField(3, value);
  @$pb.TagNumber(3)
  $core.bool hasQuestionAndAnswer() => $_has(2);
  @$pb.TagNumber(3)
  void clearQuestionAndAnswer() => $_clearField(3);
  @$pb.TagNumber(3)
  QuestionAndAnswer ensureQuestionAndAnswer() => $_ensure(2);

  @$pb.TagNumber(4)
  $2.RelationBadge get relationBadge => $_getN(3);
  @$pb.TagNumber(4)
  set relationBadge($2.RelationBadge value) => $_setField(4, value);
  @$pb.TagNumber(4)
  $core.bool hasRelationBadge() => $_has(3);
  @$pb.TagNumber(4)
  void clearRelationBadge() => $_clearField(4);
  @$pb.TagNumber(4)
  $2.RelationBadge ensureRelationBadge() => $_ensure(3);

  @$pb.TagNumber(5)
  $3.PetChatMsgInfo get petChatMsgInfo => $_getN(4);
  @$pb.TagNumber(5)
  set petChatMsgInfo($3.PetChatMsgInfo value) => $_setField(5, value);
  @$pb.TagNumber(5)
  $core.bool hasPetChatMsgInfo() => $_has(4);
  @$pb.TagNumber(5)
  void clearPetChatMsgInfo() => $_clearField(5);
  @$pb.TagNumber(5)
  $3.PetChatMsgInfo ensurePetChatMsgInfo() => $_ensure(4);

  @$pb.TagNumber(6)
  $4.ActivityShareCardContent get activityShareCard => $_getN(5);
  @$pb.TagNumber(6)
  set activityShareCard($4.ActivityShareCardContent value) =>
      $_setField(6, value);
  @$pb.TagNumber(6)
  $core.bool hasActivityShareCard() => $_has(5);
  @$pb.TagNumber(6)
  void clearActivityShareCard() => $_clearField(6);
  @$pb.TagNumber(6)
  $4.ActivityShareCardContent ensureActivityShareCard() => $_ensure(5);
}

class QuestionAndAnswer extends $pb.GeneratedMessage {
  factory QuestionAndAnswer({
    $core.String? question,
    $core.String? answer,
  }) {
    final result = create();
    if (question != null) result.question = question;
    if (answer != null) result.answer = answer;
    return result;
  }

  QuestionAndAnswer._();

  factory QuestionAndAnswer.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory QuestionAndAnswer.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'QuestionAndAnswer',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'message'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'question')
    ..aOS(2, _omitFieldNames ? '' : 'answer')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  QuestionAndAnswer clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  QuestionAndAnswer copyWith(void Function(QuestionAndAnswer) updates) =>
      super.copyWith((message) => updates(message as QuestionAndAnswer))
          as QuestionAndAnswer;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static QuestionAndAnswer create() => QuestionAndAnswer._();
  @$core.override
  QuestionAndAnswer createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static QuestionAndAnswer getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<QuestionAndAnswer>(create);
  static QuestionAndAnswer? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get question => $_getSZ(0);
  @$pb.TagNumber(1)
  set question($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasQuestion() => $_has(0);
  @$pb.TagNumber(1)
  void clearQuestion() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get answer => $_getSZ(1);
  @$pb.TagNumber(2)
  set answer($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasAnswer() => $_has(1);
  @$pb.TagNumber(2)
  void clearAnswer() => $_clearField(2);
}

class BubbleItem extends $pb.GeneratedMessage {
  factory BubbleItem({
    $core.String? url,
    $core.String? colors,
  }) {
    final result = create();
    if (url != null) result.url = url;
    if (colors != null) result.colors = colors;
    return result;
  }

  BubbleItem._();

  factory BubbleItem.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory BubbleItem.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'BubbleItem',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'message'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'url')
    ..aOS(2, _omitFieldNames ? '' : 'colors')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  BubbleItem clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  BubbleItem copyWith(void Function(BubbleItem) updates) =>
      super.copyWith((message) => updates(message as BubbleItem)) as BubbleItem;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static BubbleItem create() => BubbleItem._();
  @$core.override
  BubbleItem createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static BubbleItem getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<BubbleItem>(create);
  static BubbleItem? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get url => $_getSZ(0);
  @$pb.TagNumber(1)
  set url($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasUrl() => $_has(0);
  @$pb.TagNumber(1)
  void clearUrl() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get colors => $_getSZ(1);
  @$pb.TagNumber(2)
  set colors($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasColors() => $_has(1);
  @$pb.TagNumber(2)
  void clearColors() => $_clearField(2);
}

class BoxItem extends $pb.GeneratedMessage {
  factory BoxItem({
    $core.int? id,
    $core.String? icon,
    $core.String? name,
    $core.String? background,
  }) {
    final result = create();
    if (id != null) result.id = id;
    if (icon != null) result.icon = icon;
    if (name != null) result.name = name;
    if (background != null) result.background = background;
    return result;
  }

  BoxItem._();

  factory BoxItem.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory BoxItem.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'BoxItem',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'message'),
      createEmptyInstance: create)
    ..aI(1, _omitFieldNames ? '' : 'id')
    ..aOS(2, _omitFieldNames ? '' : 'icon')
    ..aOS(3, _omitFieldNames ? '' : 'name')
    ..aOS(4, _omitFieldNames ? '' : 'background')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  BoxItem clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  BoxItem copyWith(void Function(BoxItem) updates) =>
      super.copyWith((message) => updates(message as BoxItem)) as BoxItem;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static BoxItem create() => BoxItem._();
  @$core.override
  BoxItem createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static BoxItem getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<BoxItem>(create);
  static BoxItem? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get id => $_getIZ(0);
  @$pb.TagNumber(1)
  set id($core.int value) => $_setSignedInt32(0, value);
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get icon => $_getSZ(1);
  @$pb.TagNumber(2)
  set icon($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasIcon() => $_has(1);
  @$pb.TagNumber(2)
  void clearIcon() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get name => $_getSZ(2);
  @$pb.TagNumber(3)
  set name($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasName() => $_has(2);
  @$pb.TagNumber(3)
  void clearName() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.String get background => $_getSZ(3);
  @$pb.TagNumber(4)
  set background($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasBackground() => $_has(3);
  @$pb.TagNumber(4)
  void clearBackground() => $_clearField(4);
}

/// *
///  聊天消息展示项
class ShowItem extends $pb.GeneratedMessage {
  factory ShowItem({
    ItemStyle? style,
    $core.String? text,
    $core.String? url,
    $core.String? color,
    $core.int? size,
    $core.String? extra,
    $core.int? weight,
  }) {
    final result = create();
    if (style != null) result.style = style;
    if (text != null) result.text = text;
    if (url != null) result.url = url;
    if (color != null) result.color = color;
    if (size != null) result.size = size;
    if (extra != null) result.extra = extra;
    if (weight != null) result.weight = weight;
    return result;
  }

  ShowItem._();

  factory ShowItem.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ShowItem.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ShowItem',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'message'),
      createEmptyInstance: create)
    ..aE<ItemStyle>(1, _omitFieldNames ? '' : 'style',
        enumValues: ItemStyle.values)
    ..aOS(2, _omitFieldNames ? '' : 'text')
    ..aOS(3, _omitFieldNames ? '' : 'url')
    ..aOS(4, _omitFieldNames ? '' : 'color')
    ..aI(5, _omitFieldNames ? '' : 'size', fieldType: $pb.PbFieldType.OU3)
    ..aOS(6, _omitFieldNames ? '' : 'extra')
    ..aI(7, _omitFieldNames ? '' : 'weight')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ShowItem clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ShowItem copyWith(void Function(ShowItem) updates) =>
      super.copyWith((message) => updates(message as ShowItem)) as ShowItem;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ShowItem create() => ShowItem._();
  @$core.override
  ShowItem createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ShowItem getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ShowItem>(create);
  static ShowItem? _defaultInstance;

  @$pb.TagNumber(1)
  ItemStyle get style => $_getN(0);
  @$pb.TagNumber(1)
  set style(ItemStyle value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasStyle() => $_has(0);
  @$pb.TagNumber(1)
  void clearStyle() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get text => $_getSZ(1);
  @$pb.TagNumber(2)
  set text($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasText() => $_has(1);
  @$pb.TagNumber(2)
  void clearText() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get url => $_getSZ(2);
  @$pb.TagNumber(3)
  set url($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasUrl() => $_has(2);
  @$pb.TagNumber(3)
  void clearUrl() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.String get color => $_getSZ(3);
  @$pb.TagNumber(4)
  set color($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasColor() => $_has(3);
  @$pb.TagNumber(4)
  void clearColor() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.int get size => $_getIZ(4);
  @$pb.TagNumber(5)
  set size($core.int value) => $_setUnsignedInt32(4, value);
  @$pb.TagNumber(5)
  $core.bool hasSize() => $_has(4);
  @$pb.TagNumber(5)
  void clearSize() => $_clearField(5);

  @$pb.TagNumber(6)
  $core.String get extra => $_getSZ(5);
  @$pb.TagNumber(6)
  set extra($core.String value) => $_setString(5, value);
  @$pb.TagNumber(6)
  $core.bool hasExtra() => $_has(5);
  @$pb.TagNumber(6)
  void clearExtra() => $_clearField(6);

  @$pb.TagNumber(7)
  $core.int get weight => $_getIZ(6);
  @$pb.TagNumber(7)
  set weight($core.int value) => $_setSignedInt32(6, value);
  @$pb.TagNumber(7)
  $core.bool hasWeight() => $_has(6);
  @$pb.TagNumber(7)
  void clearWeight() => $_clearField(7);
}

/// /公屏礼物消息
class GiftMsgShow extends $pb.GeneratedMessage {
  factory GiftMsgShow({
    $core.String? nickName,
    $fixnum.Int64? uid,
    $core.String? giftName,
    $core.String? giftIcon,
    $core.int? count,
  }) {
    final result = create();
    if (nickName != null) result.nickName = nickName;
    if (uid != null) result.uid = uid;
    if (giftName != null) result.giftName = giftName;
    if (giftIcon != null) result.giftIcon = giftIcon;
    if (count != null) result.count = count;
    return result;
  }

  GiftMsgShow._();

  factory GiftMsgShow.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GiftMsgShow.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GiftMsgShow',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'message'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'nickName')
    ..aInt64(2, _omitFieldNames ? '' : 'uid')
    ..aOS(3, _omitFieldNames ? '' : 'giftName')
    ..aOS(4, _omitFieldNames ? '' : 'giftIcon')
    ..aI(5, _omitFieldNames ? '' : 'count')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GiftMsgShow clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GiftMsgShow copyWith(void Function(GiftMsgShow) updates) =>
      super.copyWith((message) => updates(message as GiftMsgShow))
          as GiftMsgShow;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GiftMsgShow create() => GiftMsgShow._();
  @$core.override
  GiftMsgShow createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static GiftMsgShow getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GiftMsgShow>(create);
  static GiftMsgShow? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get nickName => $_getSZ(0);
  @$pb.TagNumber(1)
  set nickName($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasNickName() => $_has(0);
  @$pb.TagNumber(1)
  void clearNickName() => $_clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get uid => $_getI64(1);
  @$pb.TagNumber(2)
  set uid($fixnum.Int64 value) => $_setInt64(1, value);
  @$pb.TagNumber(2)
  $core.bool hasUid() => $_has(1);
  @$pb.TagNumber(2)
  void clearUid() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get giftName => $_getSZ(2);
  @$pb.TagNumber(3)
  set giftName($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasGiftName() => $_has(2);
  @$pb.TagNumber(3)
  void clearGiftName() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.String get giftIcon => $_getSZ(3);
  @$pb.TagNumber(4)
  set giftIcon($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasGiftIcon() => $_has(3);
  @$pb.TagNumber(4)
  void clearGiftIcon() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.int get count => $_getIZ(4);
  @$pb.TagNumber(5)
  set count($core.int value) => $_setSignedInt32(4, value);
  @$pb.TagNumber(5)
  $core.bool hasCount() => $_has(4);
  @$pb.TagNumber(5)
  void clearCount() => $_clearField(5);
}

/// *
///  卡片样式聊天消息内容
class CardChatContent extends $pb.GeneratedMessage {
  factory CardChatContent({
    $1.SimpleUser? sender,
    $core.String? title,
    $core.String? content,
    $core.String? label,
    $core.int? count,
    $core.Iterable<$core.String>? cover,
    $core.String? url,
    Message? quoteMsg,
    $2.RelationBadge? relationBadge,
  }) {
    final result = create();
    if (sender != null) result.sender = sender;
    if (title != null) result.title = title;
    if (content != null) result.content = content;
    if (label != null) result.label = label;
    if (count != null) result.count = count;
    if (cover != null) result.cover.addAll(cover);
    if (url != null) result.url = url;
    if (quoteMsg != null) result.quoteMsg = quoteMsg;
    if (relationBadge != null) result.relationBadge = relationBadge;
    return result;
  }

  CardChatContent._();

  factory CardChatContent.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory CardChatContent.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'CardChatContent',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'message'),
      createEmptyInstance: create)
    ..aOM<$1.SimpleUser>(1, _omitFieldNames ? '' : 'sender',
        subBuilder: $1.SimpleUser.create)
    ..aOS(2, _omitFieldNames ? '' : 'title')
    ..aOS(3, _omitFieldNames ? '' : 'content')
    ..aOS(4, _omitFieldNames ? '' : 'label')
    ..aI(5, _omitFieldNames ? '' : 'count', fieldType: $pb.PbFieldType.OU3)
    ..pPS(6, _omitFieldNames ? '' : 'cover')
    ..aOS(7, _omitFieldNames ? '' : 'url')
    ..aOM<Message>(8, _omitFieldNames ? '' : 'quoteMsg',
        subBuilder: Message.create)
    ..aOM<$2.RelationBadge>(9, _omitFieldNames ? '' : 'relationBadge',
        subBuilder: $2.RelationBadge.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CardChatContent clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CardChatContent copyWith(void Function(CardChatContent) updates) =>
      super.copyWith((message) => updates(message as CardChatContent))
          as CardChatContent;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CardChatContent create() => CardChatContent._();
  @$core.override
  CardChatContent createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static CardChatContent getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<CardChatContent>(create);
  static CardChatContent? _defaultInstance;

  @$pb.TagNumber(1)
  $1.SimpleUser get sender => $_getN(0);
  @$pb.TagNumber(1)
  set sender($1.SimpleUser value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasSender() => $_has(0);
  @$pb.TagNumber(1)
  void clearSender() => $_clearField(1);
  @$pb.TagNumber(1)
  $1.SimpleUser ensureSender() => $_ensure(0);

  @$pb.TagNumber(2)
  $core.String get title => $_getSZ(1);
  @$pb.TagNumber(2)
  set title($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasTitle() => $_has(1);
  @$pb.TagNumber(2)
  void clearTitle() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get content => $_getSZ(2);
  @$pb.TagNumber(3)
  set content($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasContent() => $_has(2);
  @$pb.TagNumber(3)
  void clearContent() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.String get label => $_getSZ(3);
  @$pb.TagNumber(4)
  set label($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasLabel() => $_has(3);
  @$pb.TagNumber(4)
  void clearLabel() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.int get count => $_getIZ(4);
  @$pb.TagNumber(5)
  set count($core.int value) => $_setUnsignedInt32(4, value);
  @$pb.TagNumber(5)
  $core.bool hasCount() => $_has(4);
  @$pb.TagNumber(5)
  void clearCount() => $_clearField(5);

  @$pb.TagNumber(6)
  $pb.PbList<$core.String> get cover => $_getList(5);

  @$pb.TagNumber(7)
  $core.String get url => $_getSZ(6);
  @$pb.TagNumber(7)
  set url($core.String value) => $_setString(6, value);
  @$pb.TagNumber(7)
  $core.bool hasUrl() => $_has(6);
  @$pb.TagNumber(7)
  void clearUrl() => $_clearField(7);

  @$pb.TagNumber(8)
  Message get quoteMsg => $_getN(7);
  @$pb.TagNumber(8)
  set quoteMsg(Message value) => $_setField(8, value);
  @$pb.TagNumber(8)
  $core.bool hasQuoteMsg() => $_has(7);
  @$pb.TagNumber(8)
  void clearQuoteMsg() => $_clearField(8);
  @$pb.TagNumber(8)
  Message ensureQuoteMsg() => $_ensure(7);

  @$pb.TagNumber(9)
  $2.RelationBadge get relationBadge => $_getN(8);
  @$pb.TagNumber(9)
  set relationBadge($2.RelationBadge value) => $_setField(9, value);
  @$pb.TagNumber(9)
  $core.bool hasRelationBadge() => $_has(8);
  @$pb.TagNumber(9)
  void clearRelationBadge() => $_clearField(9);
  @$pb.TagNumber(9)
  $2.RelationBadge ensureRelationBadge() => $_ensure(8);
}

/// *
///  礼物消息
class RoomSendGift extends $pb.GeneratedMessage {
  factory RoomSendGift({
    $fixnum.Int64? channel,
    $5.SimpleChannelUser? send,
    $5.SimpleChannelUser? receiver,
    $6.ItemInfo? item,
    $core.int? itemCount,
    $core.Iterable<$5.SimpleChannelUser>? receivers,
    BoxItem? boxItem,
    $core.bool? showPrice,
    $core.Iterable<$core.String>? images,
    $core.Iterable<$core.String>? texts,
  }) {
    final result = create();
    if (channel != null) result.channel = channel;
    if (send != null) result.send = send;
    if (receiver != null) result.receiver = receiver;
    if (item != null) result.item = item;
    if (itemCount != null) result.itemCount = itemCount;
    if (receivers != null) result.receivers.addAll(receivers);
    if (boxItem != null) result.boxItem = boxItem;
    if (showPrice != null) result.showPrice = showPrice;
    if (images != null) result.images.addAll(images);
    if (texts != null) result.texts.addAll(texts);
    return result;
  }

  RoomSendGift._();

  factory RoomSendGift.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory RoomSendGift.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'RoomSendGift',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'message'),
      createEmptyInstance: create)
    ..a<$fixnum.Int64>(1, _omitFieldNames ? '' : 'channel', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..aOM<$5.SimpleChannelUser>(2, _omitFieldNames ? '' : 'send',
        subBuilder: $5.SimpleChannelUser.create)
    ..aOM<$5.SimpleChannelUser>(3, _omitFieldNames ? '' : 'receiver',
        subBuilder: $5.SimpleChannelUser.create)
    ..aOM<$6.ItemInfo>(4, _omitFieldNames ? '' : 'item',
        subBuilder: $6.ItemInfo.create)
    ..aI(5, _omitFieldNames ? '' : 'itemCount', fieldType: $pb.PbFieldType.OU3)
    ..pPM<$5.SimpleChannelUser>(6, _omitFieldNames ? '' : 'receivers',
        subBuilder: $5.SimpleChannelUser.create)
    ..aOM<BoxItem>(7, _omitFieldNames ? '' : 'boxItem',
        subBuilder: BoxItem.create)
    ..aOB(8, _omitFieldNames ? '' : 'showPrice')
    ..pPS(9, _omitFieldNames ? '' : 'images')
    ..pPS(10, _omitFieldNames ? '' : 'texts')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RoomSendGift clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RoomSendGift copyWith(void Function(RoomSendGift) updates) =>
      super.copyWith((message) => updates(message as RoomSendGift))
          as RoomSendGift;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RoomSendGift create() => RoomSendGift._();
  @$core.override
  RoomSendGift createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static RoomSendGift getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RoomSendGift>(create);
  static RoomSendGift? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get channel => $_getI64(0);
  @$pb.TagNumber(1)
  set channel($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasChannel() => $_has(0);
  @$pb.TagNumber(1)
  void clearChannel() => $_clearField(1);

  @$pb.TagNumber(2)
  $5.SimpleChannelUser get send => $_getN(1);
  @$pb.TagNumber(2)
  set send($5.SimpleChannelUser value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasSend() => $_has(1);
  @$pb.TagNumber(2)
  void clearSend() => $_clearField(2);
  @$pb.TagNumber(2)
  $5.SimpleChannelUser ensureSend() => $_ensure(1);

  @$pb.TagNumber(3)
  $5.SimpleChannelUser get receiver => $_getN(2);
  @$pb.TagNumber(3)
  set receiver($5.SimpleChannelUser value) => $_setField(3, value);
  @$pb.TagNumber(3)
  $core.bool hasReceiver() => $_has(2);
  @$pb.TagNumber(3)
  void clearReceiver() => $_clearField(3);
  @$pb.TagNumber(3)
  $5.SimpleChannelUser ensureReceiver() => $_ensure(2);

  @$pb.TagNumber(4)
  $6.ItemInfo get item => $_getN(3);
  @$pb.TagNumber(4)
  set item($6.ItemInfo value) => $_setField(4, value);
  @$pb.TagNumber(4)
  $core.bool hasItem() => $_has(3);
  @$pb.TagNumber(4)
  void clearItem() => $_clearField(4);
  @$pb.TagNumber(4)
  $6.ItemInfo ensureItem() => $_ensure(3);

  @$pb.TagNumber(5)
  $core.int get itemCount => $_getIZ(4);
  @$pb.TagNumber(5)
  set itemCount($core.int value) => $_setUnsignedInt32(4, value);
  @$pb.TagNumber(5)
  $core.bool hasItemCount() => $_has(4);
  @$pb.TagNumber(5)
  void clearItemCount() => $_clearField(5);

  @$pb.TagNumber(6)
  $pb.PbList<$5.SimpleChannelUser> get receivers => $_getList(5);

  @$pb.TagNumber(7)
  BoxItem get boxItem => $_getN(6);
  @$pb.TagNumber(7)
  set boxItem(BoxItem value) => $_setField(7, value);
  @$pb.TagNumber(7)
  $core.bool hasBoxItem() => $_has(6);
  @$pb.TagNumber(7)
  void clearBoxItem() => $_clearField(7);
  @$pb.TagNumber(7)
  BoxItem ensureBoxItem() => $_ensure(6);

  @$pb.TagNumber(8)
  $core.bool get showPrice => $_getBF(7);
  @$pb.TagNumber(8)
  set showPrice($core.bool value) => $_setBool(7, value);
  @$pb.TagNumber(8)
  $core.bool hasShowPrice() => $_has(7);
  @$pb.TagNumber(8)
  void clearShowPrice() => $_clearField(8);

  @$pb.TagNumber(9)
  $pb.PbList<$core.String> get images => $_getList(8);

  @$pb.TagNumber(10)
  $pb.PbList<$core.String> get texts => $_getList(9);
}

/// *
///  麦位变动消息
class RoomMicChange extends $pb.GeneratedMessage {
  factory RoomMicChange({
    $fixnum.Int64? channel,
    $core.Iterable<$5.SimpleChannelUserSlot>? broadcaster,
    $5.MicLayoutEnum? micLayout,
    $core.String? layoutName,
    $core.bool? showRoomOwner,
  }) {
    final result = create();
    if (channel != null) result.channel = channel;
    if (broadcaster != null) result.broadcaster.addAll(broadcaster);
    if (micLayout != null) result.micLayout = micLayout;
    if (layoutName != null) result.layoutName = layoutName;
    if (showRoomOwner != null) result.showRoomOwner = showRoomOwner;
    return result;
  }

  RoomMicChange._();

  factory RoomMicChange.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory RoomMicChange.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'RoomMicChange',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'message'),
      createEmptyInstance: create)
    ..a<$fixnum.Int64>(1, _omitFieldNames ? '' : 'channel', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..pPM<$5.SimpleChannelUserSlot>(2, _omitFieldNames ? '' : 'broadcaster',
        subBuilder: $5.SimpleChannelUserSlot.create)
    ..aE<$5.MicLayoutEnum>(3, _omitFieldNames ? '' : 'micLayout',
        enumValues: $5.MicLayoutEnum.values)
    ..aOS(4, _omitFieldNames ? '' : 'layoutName')
    ..aOB(5, _omitFieldNames ? '' : 'showRoomOwner')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RoomMicChange clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RoomMicChange copyWith(void Function(RoomMicChange) updates) =>
      super.copyWith((message) => updates(message as RoomMicChange))
          as RoomMicChange;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RoomMicChange create() => RoomMicChange._();
  @$core.override
  RoomMicChange createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static RoomMicChange getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RoomMicChange>(create);
  static RoomMicChange? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get channel => $_getI64(0);
  @$pb.TagNumber(1)
  set channel($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasChannel() => $_has(0);
  @$pb.TagNumber(1)
  void clearChannel() => $_clearField(1);

  @$pb.TagNumber(2)
  $pb.PbList<$5.SimpleChannelUserSlot> get broadcaster => $_getList(1);

  @$pb.TagNumber(3)
  $5.MicLayoutEnum get micLayout => $_getN(2);
  @$pb.TagNumber(3)
  set micLayout($5.MicLayoutEnum value) => $_setField(3, value);
  @$pb.TagNumber(3)
  $core.bool hasMicLayout() => $_has(2);
  @$pb.TagNumber(3)
  void clearMicLayout() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.String get layoutName => $_getSZ(3);
  @$pb.TagNumber(4)
  set layoutName($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasLayoutName() => $_has(3);
  @$pb.TagNumber(4)
  void clearLayoutName() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.bool get showRoomOwner => $_getBF(4);
  @$pb.TagNumber(5)
  set showRoomOwner($core.bool value) => $_setBool(4, value);
  @$pb.TagNumber(5)
  $core.bool hasShowRoomOwner() => $_has(4);
  @$pb.TagNumber(5)
  void clearShowRoomOwner() => $_clearField(5);
}

/// *
///  房间元数据变更消息
class RoomMetaDataChange extends $pb.GeneratedMessage {
  factory RoomMetaDataChange({
    $fixnum.Int64? channel,
    $core.String? title,
    $core.String? theme,
    $core.bool? isPrivacy,
    $5.RoomType? type,
    $5.ChannelLabel? label,
    $5.RoomStatusEnum? status,
    $core.String? notice,
    $core.String? backgroundUrl,
    $core.bool? freePub,
    $core.bool? giftValueCountSwitch,
    $core.bool? hasPassword,
    $fixnum.Int64? auditionUid,
    $5.MicLayoutEnum? micLayout,
    $core.String? layoutName,
    $core.String? labelDesc,
    $core.bool? freePublicChat,
    $core.int? countDownTimestamp,
  }) {
    final result = create();
    if (channel != null) result.channel = channel;
    if (title != null) result.title = title;
    if (theme != null) result.theme = theme;
    if (isPrivacy != null) result.isPrivacy = isPrivacy;
    if (type != null) result.type = type;
    if (label != null) result.label = label;
    if (status != null) result.status = status;
    if (notice != null) result.notice = notice;
    if (backgroundUrl != null) result.backgroundUrl = backgroundUrl;
    if (freePub != null) result.freePub = freePub;
    if (giftValueCountSwitch != null)
      result.giftValueCountSwitch = giftValueCountSwitch;
    if (hasPassword != null) result.hasPassword = hasPassword;
    if (auditionUid != null) result.auditionUid = auditionUid;
    if (micLayout != null) result.micLayout = micLayout;
    if (layoutName != null) result.layoutName = layoutName;
    if (labelDesc != null) result.labelDesc = labelDesc;
    if (freePublicChat != null) result.freePublicChat = freePublicChat;
    if (countDownTimestamp != null)
      result.countDownTimestamp = countDownTimestamp;
    return result;
  }

  RoomMetaDataChange._();

  factory RoomMetaDataChange.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory RoomMetaDataChange.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'RoomMetaDataChange',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'message'),
      createEmptyInstance: create)
    ..a<$fixnum.Int64>(1, _omitFieldNames ? '' : 'channel', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..aOS(2, _omitFieldNames ? '' : 'title')
    ..aOS(3, _omitFieldNames ? '' : 'theme')
    ..aOB(4, _omitFieldNames ? '' : 'isPrivacy')
    ..aE<$5.RoomType>(5, _omitFieldNames ? '' : 'type',
        enumValues: $5.RoomType.values)
    ..aE<$5.ChannelLabel>(6, _omitFieldNames ? '' : 'label',
        enumValues: $5.ChannelLabel.values)
    ..aE<$5.RoomStatusEnum>(7, _omitFieldNames ? '' : 'status',
        enumValues: $5.RoomStatusEnum.values)
    ..aOS(8, _omitFieldNames ? '' : 'notice')
    ..aOS(9, _omitFieldNames ? '' : 'backgroundUrl')
    ..aOB(10, _omitFieldNames ? '' : 'freePub')
    ..aOB(11, _omitFieldNames ? '' : 'giftValueCountSwitch')
    ..aOB(12, _omitFieldNames ? '' : 'hasPassword')
    ..a<$fixnum.Int64>(
        13, _omitFieldNames ? '' : 'auditionUid', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..aE<$5.MicLayoutEnum>(14, _omitFieldNames ? '' : 'micLayout',
        enumValues: $5.MicLayoutEnum.values)
    ..aOS(15, _omitFieldNames ? '' : 'layoutName')
    ..aOS(16, _omitFieldNames ? '' : 'labelDesc')
    ..aOB(17, _omitFieldNames ? '' : 'freePublicChat')
    ..aI(18, _omitFieldNames ? '' : 'countDownTimestamp',
        fieldType: $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RoomMetaDataChange clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RoomMetaDataChange copyWith(void Function(RoomMetaDataChange) updates) =>
      super.copyWith((message) => updates(message as RoomMetaDataChange))
          as RoomMetaDataChange;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RoomMetaDataChange create() => RoomMetaDataChange._();
  @$core.override
  RoomMetaDataChange createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static RoomMetaDataChange getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RoomMetaDataChange>(create);
  static RoomMetaDataChange? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get channel => $_getI64(0);
  @$pb.TagNumber(1)
  set channel($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasChannel() => $_has(0);
  @$pb.TagNumber(1)
  void clearChannel() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get title => $_getSZ(1);
  @$pb.TagNumber(2)
  set title($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasTitle() => $_has(1);
  @$pb.TagNumber(2)
  void clearTitle() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get theme => $_getSZ(2);
  @$pb.TagNumber(3)
  set theme($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasTheme() => $_has(2);
  @$pb.TagNumber(3)
  void clearTheme() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.bool get isPrivacy => $_getBF(3);
  @$pb.TagNumber(4)
  set isPrivacy($core.bool value) => $_setBool(3, value);
  @$pb.TagNumber(4)
  $core.bool hasIsPrivacy() => $_has(3);
  @$pb.TagNumber(4)
  void clearIsPrivacy() => $_clearField(4);

  @$pb.TagNumber(5)
  $5.RoomType get type => $_getN(4);
  @$pb.TagNumber(5)
  set type($5.RoomType value) => $_setField(5, value);
  @$pb.TagNumber(5)
  $core.bool hasType() => $_has(4);
  @$pb.TagNumber(5)
  void clearType() => $_clearField(5);

  @$pb.TagNumber(6)
  $5.ChannelLabel get label => $_getN(5);
  @$pb.TagNumber(6)
  set label($5.ChannelLabel value) => $_setField(6, value);
  @$pb.TagNumber(6)
  $core.bool hasLabel() => $_has(5);
  @$pb.TagNumber(6)
  void clearLabel() => $_clearField(6);

  @$pb.TagNumber(7)
  $5.RoomStatusEnum get status => $_getN(6);
  @$pb.TagNumber(7)
  set status($5.RoomStatusEnum value) => $_setField(7, value);
  @$pb.TagNumber(7)
  $core.bool hasStatus() => $_has(6);
  @$pb.TagNumber(7)
  void clearStatus() => $_clearField(7);

  @$pb.TagNumber(8)
  $core.String get notice => $_getSZ(7);
  @$pb.TagNumber(8)
  set notice($core.String value) => $_setString(7, value);
  @$pb.TagNumber(8)
  $core.bool hasNotice() => $_has(7);
  @$pb.TagNumber(8)
  void clearNotice() => $_clearField(8);

  @$pb.TagNumber(9)
  $core.String get backgroundUrl => $_getSZ(8);
  @$pb.TagNumber(9)
  set backgroundUrl($core.String value) => $_setString(8, value);
  @$pb.TagNumber(9)
  $core.bool hasBackgroundUrl() => $_has(8);
  @$pb.TagNumber(9)
  void clearBackgroundUrl() => $_clearField(9);

  @$pb.TagNumber(10)
  $core.bool get freePub => $_getBF(9);
  @$pb.TagNumber(10)
  set freePub($core.bool value) => $_setBool(9, value);
  @$pb.TagNumber(10)
  $core.bool hasFreePub() => $_has(9);
  @$pb.TagNumber(10)
  void clearFreePub() => $_clearField(10);

  @$pb.TagNumber(11)
  $core.bool get giftValueCountSwitch => $_getBF(10);
  @$pb.TagNumber(11)
  set giftValueCountSwitch($core.bool value) => $_setBool(10, value);
  @$pb.TagNumber(11)
  $core.bool hasGiftValueCountSwitch() => $_has(10);
  @$pb.TagNumber(11)
  void clearGiftValueCountSwitch() => $_clearField(11);

  @$pb.TagNumber(12)
  $core.bool get hasPassword => $_getBF(11);
  @$pb.TagNumber(12)
  set hasPassword($core.bool value) => $_setBool(11, value);
  @$pb.TagNumber(12)
  $core.bool hasHasPassword() => $_has(11);
  @$pb.TagNumber(12)
  void clearHasPassword() => $_clearField(12);

  @$pb.TagNumber(13)
  $fixnum.Int64 get auditionUid => $_getI64(12);
  @$pb.TagNumber(13)
  set auditionUid($fixnum.Int64 value) => $_setInt64(12, value);
  @$pb.TagNumber(13)
  $core.bool hasAuditionUid() => $_has(12);
  @$pb.TagNumber(13)
  void clearAuditionUid() => $_clearField(13);

  @$pb.TagNumber(14)
  $5.MicLayoutEnum get micLayout => $_getN(13);
  @$pb.TagNumber(14)
  set micLayout($5.MicLayoutEnum value) => $_setField(14, value);
  @$pb.TagNumber(14)
  $core.bool hasMicLayout() => $_has(13);
  @$pb.TagNumber(14)
  void clearMicLayout() => $_clearField(14);

  @$pb.TagNumber(15)
  $core.String get layoutName => $_getSZ(14);
  @$pb.TagNumber(15)
  set layoutName($core.String value) => $_setString(14, value);
  @$pb.TagNumber(15)
  $core.bool hasLayoutName() => $_has(14);
  @$pb.TagNumber(15)
  void clearLayoutName() => $_clearField(15);

  @$pb.TagNumber(16)
  $core.String get labelDesc => $_getSZ(15);
  @$pb.TagNumber(16)
  set labelDesc($core.String value) => $_setString(15, value);
  @$pb.TagNumber(16)
  $core.bool hasLabelDesc() => $_has(15);
  @$pb.TagNumber(16)
  void clearLabelDesc() => $_clearField(16);

  @$pb.TagNumber(17)
  $core.bool get freePublicChat => $_getBF(16);
  @$pb.TagNumber(17)
  set freePublicChat($core.bool value) => $_setBool(16, value);
  @$pb.TagNumber(17)
  $core.bool hasFreePublicChat() => $_has(16);
  @$pb.TagNumber(17)
  void clearFreePublicChat() => $_clearField(17);

  @$pb.TagNumber(18)
  $core.int get countDownTimestamp => $_getIZ(17);
  @$pb.TagNumber(18)
  set countDownTimestamp($core.int value) => $_setUnsignedInt32(17, value);
  @$pb.TagNumber(18)
  $core.bool hasCountDownTimestamp() => $_has(17);
  @$pb.TagNumber(18)
  void clearCountDownTimestamp() => $_clearField(18);
}

/// *
///  房间实时打赏榜消息
class RoomRealTimeRankChange extends $pb.GeneratedMessage {
  factory RoomRealTimeRankChange({
    $fixnum.Int64? channel,
    $core.Iterable<$5.SimpleChannelUser>? rank,
  }) {
    final result = create();
    if (channel != null) result.channel = channel;
    if (rank != null) result.rank.addAll(rank);
    return result;
  }

  RoomRealTimeRankChange._();

  factory RoomRealTimeRankChange.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory RoomRealTimeRankChange.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'RoomRealTimeRankChange',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'message'),
      createEmptyInstance: create)
    ..a<$fixnum.Int64>(1, _omitFieldNames ? '' : 'channel', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..pPM<$5.SimpleChannelUser>(2, _omitFieldNames ? '' : 'rank',
        subBuilder: $5.SimpleChannelUser.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RoomRealTimeRankChange clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RoomRealTimeRankChange copyWith(
          void Function(RoomRealTimeRankChange) updates) =>
      super.copyWith((message) => updates(message as RoomRealTimeRankChange))
          as RoomRealTimeRankChange;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RoomRealTimeRankChange create() => RoomRealTimeRankChange._();
  @$core.override
  RoomRealTimeRankChange createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static RoomRealTimeRankChange getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RoomRealTimeRankChange>(create);
  static RoomRealTimeRankChange? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get channel => $_getI64(0);
  @$pb.TagNumber(1)
  set channel($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasChannel() => $_has(0);
  @$pb.TagNumber(1)
  void clearChannel() => $_clearField(1);

  @$pb.TagNumber(2)
  $pb.PbList<$5.SimpleChannelUser> get rank => $_getList(1);
}

/// *
///  房间热度值变动消息
class RoomGiftValueChange extends $pb.GeneratedMessage {
  factory RoomGiftValueChange({
    $fixnum.Int64? channel,
    $fixnum.Int64? hotValue,
  }) {
    final result = create();
    if (channel != null) result.channel = channel;
    if (hotValue != null) result.hotValue = hotValue;
    return result;
  }

  RoomGiftValueChange._();

  factory RoomGiftValueChange.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory RoomGiftValueChange.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'RoomGiftValueChange',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'message'),
      createEmptyInstance: create)
    ..a<$fixnum.Int64>(1, _omitFieldNames ? '' : 'channel', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$fixnum.Int64>(
        2, _omitFieldNames ? '' : 'hotValue', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RoomGiftValueChange clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RoomGiftValueChange copyWith(void Function(RoomGiftValueChange) updates) =>
      super.copyWith((message) => updates(message as RoomGiftValueChange))
          as RoomGiftValueChange;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RoomGiftValueChange create() => RoomGiftValueChange._();
  @$core.override
  RoomGiftValueChange createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static RoomGiftValueChange getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RoomGiftValueChange>(create);
  static RoomGiftValueChange? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get channel => $_getI64(0);
  @$pb.TagNumber(1)
  set channel($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasChannel() => $_has(0);
  @$pb.TagNumber(1)
  void clearChannel() => $_clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get hotValue => $_getI64(1);
  @$pb.TagNumber(2)
  set hotValue($fixnum.Int64 value) => $_setInt64(1, value);
  @$pb.TagNumber(2)
  $core.bool hasHotValue() => $_has(1);
  @$pb.TagNumber(2)
  void clearHotValue() => $_clearField(2);
}

/// *
///  房间排麦队列变更消息
class RoomMicQueueChange extends $pb.GeneratedMessage {
  factory RoomMicQueueChange({
    $fixnum.Int64? channel,
    $core.Iterable<$5.SimpleChannelUserSlot>? waitQueue,
    $core.Iterable<$5.SimpleChannelUserSlot>? carOwnerMicQueue,
  }) {
    final result = create();
    if (channel != null) result.channel = channel;
    if (waitQueue != null) result.waitQueue.addAll(waitQueue);
    if (carOwnerMicQueue != null)
      result.carOwnerMicQueue.addAll(carOwnerMicQueue);
    return result;
  }

  RoomMicQueueChange._();

  factory RoomMicQueueChange.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory RoomMicQueueChange.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'RoomMicQueueChange',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'message'),
      createEmptyInstance: create)
    ..a<$fixnum.Int64>(1, _omitFieldNames ? '' : 'channel', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..pPM<$5.SimpleChannelUserSlot>(2, _omitFieldNames ? '' : 'waitQueue',
        subBuilder: $5.SimpleChannelUserSlot.create)
    ..pPM<$5.SimpleChannelUserSlot>(
        3, _omitFieldNames ? '' : 'carOwnerMicQueue',
        subBuilder: $5.SimpleChannelUserSlot.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RoomMicQueueChange clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RoomMicQueueChange copyWith(void Function(RoomMicQueueChange) updates) =>
      super.copyWith((message) => updates(message as RoomMicQueueChange))
          as RoomMicQueueChange;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RoomMicQueueChange create() => RoomMicQueueChange._();
  @$core.override
  RoomMicQueueChange createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static RoomMicQueueChange getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RoomMicQueueChange>(create);
  static RoomMicQueueChange? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get channel => $_getI64(0);
  @$pb.TagNumber(1)
  set channel($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasChannel() => $_has(0);
  @$pb.TagNumber(1)
  void clearChannel() => $_clearField(1);

  @$pb.TagNumber(2)
  $pb.PbList<$5.SimpleChannelUserSlot> get waitQueue => $_getList(1);

  @$pb.TagNumber(3)
  $pb.PbList<$5.SimpleChannelUserSlot> get carOwnerMicQueue => $_getList(2);
}

/// *
///  房间停车场变更消息
class RoomVipParkChange extends $pb.GeneratedMessage {
  factory RoomVipParkChange({
    $fixnum.Int64? channel,
    $core.Iterable<$5.SimpleChannelUser>? vipPark,
  }) {
    final result = create();
    if (channel != null) result.channel = channel;
    if (vipPark != null) result.vipPark.addAll(vipPark);
    return result;
  }

  RoomVipParkChange._();

  factory RoomVipParkChange.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory RoomVipParkChange.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'RoomVipParkChange',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'message'),
      createEmptyInstance: create)
    ..a<$fixnum.Int64>(1, _omitFieldNames ? '' : 'channel', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..pPM<$5.SimpleChannelUser>(2, _omitFieldNames ? '' : 'vipPark',
        subBuilder: $5.SimpleChannelUser.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RoomVipParkChange clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RoomVipParkChange copyWith(void Function(RoomVipParkChange) updates) =>
      super.copyWith((message) => updates(message as RoomVipParkChange))
          as RoomVipParkChange;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RoomVipParkChange create() => RoomVipParkChange._();
  @$core.override
  RoomVipParkChange createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static RoomVipParkChange getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RoomVipParkChange>(create);
  static RoomVipParkChange? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get channel => $_getI64(0);
  @$pb.TagNumber(1)
  set channel($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasChannel() => $_has(0);
  @$pb.TagNumber(1)
  void clearChannel() => $_clearField(1);

  @$pb.TagNumber(2)
  $pb.PbList<$5.SimpleChannelUser> get vipPark => $_getList(1);
}

/// *
///  房间角色变更消息
class RoomRoleChange extends $pb.GeneratedMessage {
  factory RoomRoleChange({
    $fixnum.Int64? channel,
    $fixnum.Int64? userId,
    $5.RtcUserRole? role,
  }) {
    final result = create();
    if (channel != null) result.channel = channel;
    if (userId != null) result.userId = userId;
    if (role != null) result.role = role;
    return result;
  }

  RoomRoleChange._();

  factory RoomRoleChange.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory RoomRoleChange.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'RoomRoleChange',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'message'),
      createEmptyInstance: create)
    ..a<$fixnum.Int64>(1, _omitFieldNames ? '' : 'channel', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$fixnum.Int64>(2, _omitFieldNames ? '' : 'userId', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..aE<$5.RtcUserRole>(3, _omitFieldNames ? '' : 'role',
        enumValues: $5.RtcUserRole.values)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RoomRoleChange clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RoomRoleChange copyWith(void Function(RoomRoleChange) updates) =>
      super.copyWith((message) => updates(message as RoomRoleChange))
          as RoomRoleChange;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RoomRoleChange create() => RoomRoleChange._();
  @$core.override
  RoomRoleChange createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static RoomRoleChange getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RoomRoleChange>(create);
  static RoomRoleChange? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get channel => $_getI64(0);
  @$pb.TagNumber(1)
  set channel($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasChannel() => $_has(0);
  @$pb.TagNumber(1)
  void clearChannel() => $_clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get userId => $_getI64(1);
  @$pb.TagNumber(2)
  set userId($fixnum.Int64 value) => $_setInt64(1, value);
  @$pb.TagNumber(2)
  $core.bool hasUserId() => $_has(1);
  @$pb.TagNumber(2)
  void clearUserId() => $_clearField(2);

  @$pb.TagNumber(3)
  $5.RtcUserRole get role => $_getN(2);
  @$pb.TagNumber(3)
  set role($5.RtcUserRole value) => $_setField(3, value);
  @$pb.TagNumber(3)
  $core.bool hasRole() => $_has(2);
  @$pb.TagNumber(3)
  void clearRole() => $_clearField(3);
}

/// *
///  房间节目变更消息
class RoomProgramChange extends $pb.GeneratedMessage {
  factory RoomProgramChange({
    $fixnum.Int64? channel,
    $core.String? startTime,
    $core.int? startTimeSeconds,
    $core.String? topic,
    $fixnum.Int64? programId,
    $core.String? desc,
    $core.String? date,
  }) {
    final result = create();
    if (channel != null) result.channel = channel;
    if (startTime != null) result.startTime = startTime;
    if (startTimeSeconds != null) result.startTimeSeconds = startTimeSeconds;
    if (topic != null) result.topic = topic;
    if (programId != null) result.programId = programId;
    if (desc != null) result.desc = desc;
    if (date != null) result.date = date;
    return result;
  }

  RoomProgramChange._();

  factory RoomProgramChange.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory RoomProgramChange.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'RoomProgramChange',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'message'),
      createEmptyInstance: create)
    ..a<$fixnum.Int64>(1, _omitFieldNames ? '' : 'channel', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..aOS(2, _omitFieldNames ? '' : 'startTime')
    ..aI(3, _omitFieldNames ? '' : 'startTimeSeconds',
        fieldType: $pb.PbFieldType.OU3)
    ..aOS(4, _omitFieldNames ? '' : 'topic')
    ..a<$fixnum.Int64>(
        5, _omitFieldNames ? '' : 'programId', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..aOS(6, _omitFieldNames ? '' : 'desc')
    ..aOS(7, _omitFieldNames ? '' : 'date')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RoomProgramChange clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RoomProgramChange copyWith(void Function(RoomProgramChange) updates) =>
      super.copyWith((message) => updates(message as RoomProgramChange))
          as RoomProgramChange;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RoomProgramChange create() => RoomProgramChange._();
  @$core.override
  RoomProgramChange createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static RoomProgramChange getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RoomProgramChange>(create);
  static RoomProgramChange? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get channel => $_getI64(0);
  @$pb.TagNumber(1)
  set channel($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasChannel() => $_has(0);
  @$pb.TagNumber(1)
  void clearChannel() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get startTime => $_getSZ(1);
  @$pb.TagNumber(2)
  set startTime($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasStartTime() => $_has(1);
  @$pb.TagNumber(2)
  void clearStartTime() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.int get startTimeSeconds => $_getIZ(2);
  @$pb.TagNumber(3)
  set startTimeSeconds($core.int value) => $_setUnsignedInt32(2, value);
  @$pb.TagNumber(3)
  $core.bool hasStartTimeSeconds() => $_has(2);
  @$pb.TagNumber(3)
  void clearStartTimeSeconds() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.String get topic => $_getSZ(3);
  @$pb.TagNumber(4)
  set topic($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasTopic() => $_has(3);
  @$pb.TagNumber(4)
  void clearTopic() => $_clearField(4);

  @$pb.TagNumber(5)
  $fixnum.Int64 get programId => $_getI64(4);
  @$pb.TagNumber(5)
  set programId($fixnum.Int64 value) => $_setInt64(4, value);
  @$pb.TagNumber(5)
  $core.bool hasProgramId() => $_has(4);
  @$pb.TagNumber(5)
  void clearProgramId() => $_clearField(5);

  @$pb.TagNumber(6)
  $core.String get desc => $_getSZ(5);
  @$pb.TagNumber(6)
  set desc($core.String value) => $_setString(5, value);
  @$pb.TagNumber(6)
  $core.bool hasDesc() => $_has(5);
  @$pb.TagNumber(6)
  void clearDesc() => $_clearField(6);

  @$pb.TagNumber(7)
  $core.String get date => $_getSZ(6);
  @$pb.TagNumber(7)
  set date($core.String value) => $_setString(6, value);
  @$pb.TagNumber(7)
  $core.bool hasDate() => $_has(6);
  @$pb.TagNumber(7)
  void clearDate() => $_clearField(7);
}

/// *
///  房间飘屏消息
class RoomFlyingScreen extends $pb.GeneratedMessage {
  factory RoomFlyingScreen({
    $fixnum.Int64? channel,
    FlyingScreenType? type,
    $1.SimpleUser? trigger,
    $core.String? icon,
    $core.Iterable<$core.String>? receivers,
    $7.CarLevel? carLevel,
    $core.String? carName,
    $core.String? effectUrl,
    BoxItem? boxItem,
    $core.Iterable<CommonFlyingItem>? flyingItems,
    WorldMegaphoneScreenItem? megaphoneItem,
    CrateFlyingScreenItem? crateItem,
  }) {
    final result = create();
    if (channel != null) result.channel = channel;
    if (type != null) result.type = type;
    if (trigger != null) result.trigger = trigger;
    if (icon != null) result.icon = icon;
    if (receivers != null) result.receivers.addAll(receivers);
    if (carLevel != null) result.carLevel = carLevel;
    if (carName != null) result.carName = carName;
    if (effectUrl != null) result.effectUrl = effectUrl;
    if (boxItem != null) result.boxItem = boxItem;
    if (flyingItems != null) result.flyingItems.addAll(flyingItems);
    if (megaphoneItem != null) result.megaphoneItem = megaphoneItem;
    if (crateItem != null) result.crateItem = crateItem;
    return result;
  }

  RoomFlyingScreen._();

  factory RoomFlyingScreen.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory RoomFlyingScreen.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'RoomFlyingScreen',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'message'),
      createEmptyInstance: create)
    ..a<$fixnum.Int64>(1, _omitFieldNames ? '' : 'channel', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..aE<FlyingScreenType>(2, _omitFieldNames ? '' : 'type',
        enumValues: FlyingScreenType.values)
    ..aOM<$1.SimpleUser>(3, _omitFieldNames ? '' : 'trigger',
        subBuilder: $1.SimpleUser.create)
    ..aOS(4, _omitFieldNames ? '' : 'icon')
    ..pPS(5, _omitFieldNames ? '' : 'receivers')
    ..aE<$7.CarLevel>(6, _omitFieldNames ? '' : 'carLevel',
        enumValues: $7.CarLevel.values)
    ..aOS(7, _omitFieldNames ? '' : 'carName')
    ..aOS(8, _omitFieldNames ? '' : 'effectUrl')
    ..aOM<BoxItem>(9, _omitFieldNames ? '' : 'boxItem',
        subBuilder: BoxItem.create)
    ..pPM<CommonFlyingItem>(10, _omitFieldNames ? '' : 'flyingItems',
        subBuilder: CommonFlyingItem.create)
    ..aOM<WorldMegaphoneScreenItem>(11, _omitFieldNames ? '' : 'megaphoneItem',
        subBuilder: WorldMegaphoneScreenItem.create)
    ..aOM<CrateFlyingScreenItem>(12, _omitFieldNames ? '' : 'crateItem',
        subBuilder: CrateFlyingScreenItem.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RoomFlyingScreen clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RoomFlyingScreen copyWith(void Function(RoomFlyingScreen) updates) =>
      super.copyWith((message) => updates(message as RoomFlyingScreen))
          as RoomFlyingScreen;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RoomFlyingScreen create() => RoomFlyingScreen._();
  @$core.override
  RoomFlyingScreen createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static RoomFlyingScreen getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RoomFlyingScreen>(create);
  static RoomFlyingScreen? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get channel => $_getI64(0);
  @$pb.TagNumber(1)
  set channel($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasChannel() => $_has(0);
  @$pb.TagNumber(1)
  void clearChannel() => $_clearField(1);

  @$pb.TagNumber(2)
  FlyingScreenType get type => $_getN(1);
  @$pb.TagNumber(2)
  set type(FlyingScreenType value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasType() => $_has(1);
  @$pb.TagNumber(2)
  void clearType() => $_clearField(2);

  @$pb.TagNumber(3)
  $1.SimpleUser get trigger => $_getN(2);
  @$pb.TagNumber(3)
  set trigger($1.SimpleUser value) => $_setField(3, value);
  @$pb.TagNumber(3)
  $core.bool hasTrigger() => $_has(2);
  @$pb.TagNumber(3)
  void clearTrigger() => $_clearField(3);
  @$pb.TagNumber(3)
  $1.SimpleUser ensureTrigger() => $_ensure(2);

  @$pb.TagNumber(4)
  $core.String get icon => $_getSZ(3);
  @$pb.TagNumber(4)
  set icon($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasIcon() => $_has(3);
  @$pb.TagNumber(4)
  void clearIcon() => $_clearField(4);

  @$pb.TagNumber(5)
  $pb.PbList<$core.String> get receivers => $_getList(4);

  @$pb.TagNumber(6)
  $7.CarLevel get carLevel => $_getN(5);
  @$pb.TagNumber(6)
  set carLevel($7.CarLevel value) => $_setField(6, value);
  @$pb.TagNumber(6)
  $core.bool hasCarLevel() => $_has(5);
  @$pb.TagNumber(6)
  void clearCarLevel() => $_clearField(6);

  @$pb.TagNumber(7)
  $core.String get carName => $_getSZ(6);
  @$pb.TagNumber(7)
  set carName($core.String value) => $_setString(6, value);
  @$pb.TagNumber(7)
  $core.bool hasCarName() => $_has(6);
  @$pb.TagNumber(7)
  void clearCarName() => $_clearField(7);

  @$pb.TagNumber(8)
  $core.String get effectUrl => $_getSZ(7);
  @$pb.TagNumber(8)
  set effectUrl($core.String value) => $_setString(7, value);
  @$pb.TagNumber(8)
  $core.bool hasEffectUrl() => $_has(7);
  @$pb.TagNumber(8)
  void clearEffectUrl() => $_clearField(8);

  @$pb.TagNumber(9)
  BoxItem get boxItem => $_getN(8);
  @$pb.TagNumber(9)
  set boxItem(BoxItem value) => $_setField(9, value);
  @$pb.TagNumber(9)
  $core.bool hasBoxItem() => $_has(8);
  @$pb.TagNumber(9)
  void clearBoxItem() => $_clearField(9);
  @$pb.TagNumber(9)
  BoxItem ensureBoxItem() => $_ensure(8);

  @$pb.TagNumber(10)
  $pb.PbList<CommonFlyingItem> get flyingItems => $_getList(9);

  @$pb.TagNumber(11)
  WorldMegaphoneScreenItem get megaphoneItem => $_getN(10);
  @$pb.TagNumber(11)
  set megaphoneItem(WorldMegaphoneScreenItem value) => $_setField(11, value);
  @$pb.TagNumber(11)
  $core.bool hasMegaphoneItem() => $_has(10);
  @$pb.TagNumber(11)
  void clearMegaphoneItem() => $_clearField(11);
  @$pb.TagNumber(11)
  WorldMegaphoneScreenItem ensureMegaphoneItem() => $_ensure(10);

  @$pb.TagNumber(12)
  CrateFlyingScreenItem get crateItem => $_getN(11);
  @$pb.TagNumber(12)
  set crateItem(CrateFlyingScreenItem value) => $_setField(12, value);
  @$pb.TagNumber(12)
  $core.bool hasCrateItem() => $_has(11);
  @$pb.TagNumber(12)
  void clearCrateItem() => $_clearField(12);
  @$pb.TagNumber(12)
  CrateFlyingScreenItem ensureCrateItem() => $_ensure(11);
}

class CommonFlyingItem extends $pb.GeneratedMessage {
  factory CommonFlyingItem({
    $core.String? icon,
    $core.int? nums,
    $core.String? bg,
  }) {
    final result = create();
    if (icon != null) result.icon = icon;
    if (nums != null) result.nums = nums;
    if (bg != null) result.bg = bg;
    return result;
  }

  CommonFlyingItem._();

  factory CommonFlyingItem.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory CommonFlyingItem.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'CommonFlyingItem',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'message'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'icon')
    ..aI(2, _omitFieldNames ? '' : 'nums', fieldType: $pb.PbFieldType.OU3)
    ..aOS(3, _omitFieldNames ? '' : 'bg')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CommonFlyingItem clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CommonFlyingItem copyWith(void Function(CommonFlyingItem) updates) =>
      super.copyWith((message) => updates(message as CommonFlyingItem))
          as CommonFlyingItem;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CommonFlyingItem create() => CommonFlyingItem._();
  @$core.override
  CommonFlyingItem createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static CommonFlyingItem getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<CommonFlyingItem>(create);
  static CommonFlyingItem? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get icon => $_getSZ(0);
  @$pb.TagNumber(1)
  set icon($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasIcon() => $_has(0);
  @$pb.TagNumber(1)
  void clearIcon() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.int get nums => $_getIZ(1);
  @$pb.TagNumber(2)
  set nums($core.int value) => $_setUnsignedInt32(1, value);
  @$pb.TagNumber(2)
  $core.bool hasNums() => $_has(1);
  @$pb.TagNumber(2)
  void clearNums() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get bg => $_getSZ(2);
  @$pb.TagNumber(3)
  set bg($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasBg() => $_has(2);
  @$pb.TagNumber(3)
  void clearBg() => $_clearField(3);
}

/// 用户发布喇叭消息服飘屏消息体
class WorldMegaphoneScreenItem extends $pb.GeneratedMessage {
  factory WorldMegaphoneScreenItem({
    $fixnum.Int64? senderId,
    $core.String? senderNickname,
    $core.String? senderAvatar,
    $core.String? senderGender,
    $core.String? content,
    $core.String? jumpLink,
    $core.int? styleType,
  }) {
    final result = create();
    if (senderId != null) result.senderId = senderId;
    if (senderNickname != null) result.senderNickname = senderNickname;
    if (senderAvatar != null) result.senderAvatar = senderAvatar;
    if (senderGender != null) result.senderGender = senderGender;
    if (content != null) result.content = content;
    if (jumpLink != null) result.jumpLink = jumpLink;
    if (styleType != null) result.styleType = styleType;
    return result;
  }

  WorldMegaphoneScreenItem._();

  factory WorldMegaphoneScreenItem.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory WorldMegaphoneScreenItem.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'WorldMegaphoneScreenItem',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'message'),
      createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'senderId')
    ..aOS(2, _omitFieldNames ? '' : 'senderNickname')
    ..aOS(3, _omitFieldNames ? '' : 'senderAvatar')
    ..aOS(4, _omitFieldNames ? '' : 'senderGender')
    ..aOS(5, _omitFieldNames ? '' : 'content')
    ..aOS(6, _omitFieldNames ? '' : 'jumpLink')
    ..aI(7, _omitFieldNames ? '' : 'styleType')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  WorldMegaphoneScreenItem clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  WorldMegaphoneScreenItem copyWith(
          void Function(WorldMegaphoneScreenItem) updates) =>
      super.copyWith((message) => updates(message as WorldMegaphoneScreenItem))
          as WorldMegaphoneScreenItem;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static WorldMegaphoneScreenItem create() => WorldMegaphoneScreenItem._();
  @$core.override
  WorldMegaphoneScreenItem createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static WorldMegaphoneScreenItem getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<WorldMegaphoneScreenItem>(create);
  static WorldMegaphoneScreenItem? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get senderId => $_getI64(0);
  @$pb.TagNumber(1)
  set senderId($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasSenderId() => $_has(0);
  @$pb.TagNumber(1)
  void clearSenderId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get senderNickname => $_getSZ(1);
  @$pb.TagNumber(2)
  set senderNickname($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasSenderNickname() => $_has(1);
  @$pb.TagNumber(2)
  void clearSenderNickname() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get senderAvatar => $_getSZ(2);
  @$pb.TagNumber(3)
  set senderAvatar($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasSenderAvatar() => $_has(2);
  @$pb.TagNumber(3)
  void clearSenderAvatar() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.String get senderGender => $_getSZ(3);
  @$pb.TagNumber(4)
  set senderGender($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasSenderGender() => $_has(3);
  @$pb.TagNumber(4)
  void clearSenderGender() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.String get content => $_getSZ(4);
  @$pb.TagNumber(5)
  set content($core.String value) => $_setString(4, value);
  @$pb.TagNumber(5)
  $core.bool hasContent() => $_has(4);
  @$pb.TagNumber(5)
  void clearContent() => $_clearField(5);

  @$pb.TagNumber(6)
  $core.String get jumpLink => $_getSZ(5);
  @$pb.TagNumber(6)
  set jumpLink($core.String value) => $_setString(5, value);
  @$pb.TagNumber(6)
  $core.bool hasJumpLink() => $_has(5);
  @$pb.TagNumber(6)
  void clearJumpLink() => $_clearField(6);

  @$pb.TagNumber(7)
  $core.int get styleType => $_getIZ(6);
  @$pb.TagNumber(7)
  set styleType($core.int value) => $_setSignedInt32(6, value);
  @$pb.TagNumber(7)
  $core.bool hasStyleType() => $_has(6);
  @$pb.TagNumber(7)
  void clearStyleType() => $_clearField(7);
}

/// 概率盲盒飘屏消息体
class CrateFlyingScreenItem extends $pb.GeneratedMessage {
  factory CrateFlyingScreenItem({
    $core.String? giftName,
    $core.String? crateType,
  }) {
    final result = create();
    if (giftName != null) result.giftName = giftName;
    if (crateType != null) result.crateType = crateType;
    return result;
  }

  CrateFlyingScreenItem._();

  factory CrateFlyingScreenItem.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory CrateFlyingScreenItem.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'CrateFlyingScreenItem',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'message'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'giftName')
    ..aOS(2, _omitFieldNames ? '' : 'crateType')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CrateFlyingScreenItem clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CrateFlyingScreenItem copyWith(
          void Function(CrateFlyingScreenItem) updates) =>
      super.copyWith((message) => updates(message as CrateFlyingScreenItem))
          as CrateFlyingScreenItem;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CrateFlyingScreenItem create() => CrateFlyingScreenItem._();
  @$core.override
  CrateFlyingScreenItem createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static CrateFlyingScreenItem getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<CrateFlyingScreenItem>(create);
  static CrateFlyingScreenItem? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get giftName => $_getSZ(0);
  @$pb.TagNumber(1)
  set giftName($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasGiftName() => $_has(0);
  @$pb.TagNumber(1)
  void clearGiftName() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get crateType => $_getSZ(1);
  @$pb.TagNumber(2)
  set crateType($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasCrateType() => $_has(1);
  @$pb.TagNumber(2)
  void clearCrateType() => $_clearField(2);
}

/// *
///  房间管理消息
class RoomManage extends $pb.GeneratedMessage {
  factory RoomManage({
    $fixnum.Int64? channel,
    $5.ManagerOperation? operation,
    $fixnum.Int64? managerId,
    $fixnum.Int64? userId,
    $core.String? text,
  }) {
    final result = create();
    if (channel != null) result.channel = channel;
    if (operation != null) result.operation = operation;
    if (managerId != null) result.managerId = managerId;
    if (userId != null) result.userId = userId;
    if (text != null) result.text = text;
    return result;
  }

  RoomManage._();

  factory RoomManage.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory RoomManage.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'RoomManage',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'message'),
      createEmptyInstance: create)
    ..a<$fixnum.Int64>(1, _omitFieldNames ? '' : 'channel', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..aE<$5.ManagerOperation>(2, _omitFieldNames ? '' : 'operation',
        enumValues: $5.ManagerOperation.values)
    ..a<$fixnum.Int64>(
        3, _omitFieldNames ? '' : 'managerId', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$fixnum.Int64>(4, _omitFieldNames ? '' : 'userId', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..aOS(5, _omitFieldNames ? '' : 'text')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RoomManage clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RoomManage copyWith(void Function(RoomManage) updates) =>
      super.copyWith((message) => updates(message as RoomManage)) as RoomManage;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RoomManage create() => RoomManage._();
  @$core.override
  RoomManage createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static RoomManage getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RoomManage>(create);
  static RoomManage? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get channel => $_getI64(0);
  @$pb.TagNumber(1)
  set channel($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasChannel() => $_has(0);
  @$pb.TagNumber(1)
  void clearChannel() => $_clearField(1);

  @$pb.TagNumber(2)
  $5.ManagerOperation get operation => $_getN(1);
  @$pb.TagNumber(2)
  set operation($5.ManagerOperation value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasOperation() => $_has(1);
  @$pb.TagNumber(2)
  void clearOperation() => $_clearField(2);

  @$pb.TagNumber(3)
  $fixnum.Int64 get managerId => $_getI64(2);
  @$pb.TagNumber(3)
  set managerId($fixnum.Int64 value) => $_setInt64(2, value);
  @$pb.TagNumber(3)
  $core.bool hasManagerId() => $_has(2);
  @$pb.TagNumber(3)
  void clearManagerId() => $_clearField(3);

  @$pb.TagNumber(4)
  $fixnum.Int64 get userId => $_getI64(3);
  @$pb.TagNumber(4)
  set userId($fixnum.Int64 value) => $_setInt64(3, value);
  @$pb.TagNumber(4)
  $core.bool hasUserId() => $_has(3);
  @$pb.TagNumber(4)
  void clearUserId() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.String get text => $_getSZ(4);
  @$pb.TagNumber(5)
  set text($core.String value) => $_setString(4, value);
  @$pb.TagNumber(5)
  $core.bool hasText() => $_has(4);
  @$pb.TagNumber(5)
  void clearText() => $_clearField(5);
}

/// *
///  进房消息
class RoomUserJoin extends $pb.GeneratedMessage {
  factory RoomUserJoin({
    $fixnum.Int64? channel,
    $5.SimpleChannelUser? user,
    $core.int? count,
    $5.JoinSource? joinSource,
    $5.SimpleChannelUser? anotherUser,
    RoomEffect? effect,
  }) {
    final result = create();
    if (channel != null) result.channel = channel;
    if (user != null) result.user = user;
    if (count != null) result.count = count;
    if (joinSource != null) result.joinSource = joinSource;
    if (anotherUser != null) result.anotherUser = anotherUser;
    if (effect != null) result.effect = effect;
    return result;
  }

  RoomUserJoin._();

  factory RoomUserJoin.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory RoomUserJoin.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'RoomUserJoin',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'message'),
      createEmptyInstance: create)
    ..a<$fixnum.Int64>(1, _omitFieldNames ? '' : 'channel', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..aOM<$5.SimpleChannelUser>(2, _omitFieldNames ? '' : 'user',
        subBuilder: $5.SimpleChannelUser.create)
    ..aI(3, _omitFieldNames ? '' : 'count', fieldType: $pb.PbFieldType.OU3)
    ..aE<$5.JoinSource>(4, _omitFieldNames ? '' : 'joinSource',
        enumValues: $5.JoinSource.values)
    ..aOM<$5.SimpleChannelUser>(5, _omitFieldNames ? '' : 'anotherUser',
        subBuilder: $5.SimpleChannelUser.create)
    ..aOM<RoomEffect>(6, _omitFieldNames ? '' : 'effect',
        subBuilder: RoomEffect.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RoomUserJoin clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RoomUserJoin copyWith(void Function(RoomUserJoin) updates) =>
      super.copyWith((message) => updates(message as RoomUserJoin))
          as RoomUserJoin;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RoomUserJoin create() => RoomUserJoin._();
  @$core.override
  RoomUserJoin createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static RoomUserJoin getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RoomUserJoin>(create);
  static RoomUserJoin? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get channel => $_getI64(0);
  @$pb.TagNumber(1)
  set channel($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasChannel() => $_has(0);
  @$pb.TagNumber(1)
  void clearChannel() => $_clearField(1);

  @$pb.TagNumber(2)
  $5.SimpleChannelUser get user => $_getN(1);
  @$pb.TagNumber(2)
  set user($5.SimpleChannelUser value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasUser() => $_has(1);
  @$pb.TagNumber(2)
  void clearUser() => $_clearField(2);
  @$pb.TagNumber(2)
  $5.SimpleChannelUser ensureUser() => $_ensure(1);

  @$pb.TagNumber(3)
  $core.int get count => $_getIZ(2);
  @$pb.TagNumber(3)
  set count($core.int value) => $_setUnsignedInt32(2, value);
  @$pb.TagNumber(3)
  $core.bool hasCount() => $_has(2);
  @$pb.TagNumber(3)
  void clearCount() => $_clearField(3);

  @$pb.TagNumber(4)
  $5.JoinSource get joinSource => $_getN(3);
  @$pb.TagNumber(4)
  set joinSource($5.JoinSource value) => $_setField(4, value);
  @$pb.TagNumber(4)
  $core.bool hasJoinSource() => $_has(3);
  @$pb.TagNumber(4)
  void clearJoinSource() => $_clearField(4);

  @$pb.TagNumber(5)
  $5.SimpleChannelUser get anotherUser => $_getN(4);
  @$pb.TagNumber(5)
  set anotherUser($5.SimpleChannelUser value) => $_setField(5, value);
  @$pb.TagNumber(5)
  $core.bool hasAnotherUser() => $_has(4);
  @$pb.TagNumber(5)
  void clearAnotherUser() => $_clearField(5);
  @$pb.TagNumber(5)
  $5.SimpleChannelUser ensureAnotherUser() => $_ensure(4);

  @$pb.TagNumber(6)
  RoomEffect get effect => $_getN(5);
  @$pb.TagNumber(6)
  set effect(RoomEffect value) => $_setField(6, value);
  @$pb.TagNumber(6)
  $core.bool hasEffect() => $_has(5);
  @$pb.TagNumber(6)
  void clearEffect() => $_clearField(6);
  @$pb.TagNumber(6)
  RoomEffect ensureEffect() => $_ensure(5);
}

class RoomMicLink extends $pb.GeneratedMessage {
  factory RoomMicLink({
    $core.String? mainResourceUrl,
    $core.int? myMicPosition,
    $fixnum.Int64? myUid,
    $core.int? anotherMicPosition,
    $fixnum.Int64? anotherUid,
    $core.int? playCount,
  }) {
    final result = create();
    if (mainResourceUrl != null) result.mainResourceUrl = mainResourceUrl;
    if (myMicPosition != null) result.myMicPosition = myMicPosition;
    if (myUid != null) result.myUid = myUid;
    if (anotherMicPosition != null)
      result.anotherMicPosition = anotherMicPosition;
    if (anotherUid != null) result.anotherUid = anotherUid;
    if (playCount != null) result.playCount = playCount;
    return result;
  }

  RoomMicLink._();

  factory RoomMicLink.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory RoomMicLink.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'RoomMicLink',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'message'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'mainResourceUrl')
    ..aI(2, _omitFieldNames ? '' : 'myMicPosition',
        fieldType: $pb.PbFieldType.OU3)
    ..a<$fixnum.Int64>(3, _omitFieldNames ? '' : 'myUid', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..aI(4, _omitFieldNames ? '' : 'anotherMicPosition',
        fieldType: $pb.PbFieldType.OU3)
    ..a<$fixnum.Int64>(
        5, _omitFieldNames ? '' : 'anotherUid', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..aI(6, _omitFieldNames ? '' : 'playCount', fieldType: $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RoomMicLink clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RoomMicLink copyWith(void Function(RoomMicLink) updates) =>
      super.copyWith((message) => updates(message as RoomMicLink))
          as RoomMicLink;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RoomMicLink create() => RoomMicLink._();
  @$core.override
  RoomMicLink createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static RoomMicLink getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RoomMicLink>(create);
  static RoomMicLink? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get mainResourceUrl => $_getSZ(0);
  @$pb.TagNumber(1)
  set mainResourceUrl($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasMainResourceUrl() => $_has(0);
  @$pb.TagNumber(1)
  void clearMainResourceUrl() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.int get myMicPosition => $_getIZ(1);
  @$pb.TagNumber(2)
  set myMicPosition($core.int value) => $_setUnsignedInt32(1, value);
  @$pb.TagNumber(2)
  $core.bool hasMyMicPosition() => $_has(1);
  @$pb.TagNumber(2)
  void clearMyMicPosition() => $_clearField(2);

  @$pb.TagNumber(3)
  $fixnum.Int64 get myUid => $_getI64(2);
  @$pb.TagNumber(3)
  set myUid($fixnum.Int64 value) => $_setInt64(2, value);
  @$pb.TagNumber(3)
  $core.bool hasMyUid() => $_has(2);
  @$pb.TagNumber(3)
  void clearMyUid() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.int get anotherMicPosition => $_getIZ(3);
  @$pb.TagNumber(4)
  set anotherMicPosition($core.int value) => $_setUnsignedInt32(3, value);
  @$pb.TagNumber(4)
  $core.bool hasAnotherMicPosition() => $_has(3);
  @$pb.TagNumber(4)
  void clearAnotherMicPosition() => $_clearField(4);

  @$pb.TagNumber(5)
  $fixnum.Int64 get anotherUid => $_getI64(4);
  @$pb.TagNumber(5)
  set anotherUid($fixnum.Int64 value) => $_setInt64(4, value);
  @$pb.TagNumber(5)
  $core.bool hasAnotherUid() => $_has(4);
  @$pb.TagNumber(5)
  void clearAnotherUid() => $_clearField(5);

  @$pb.TagNumber(6)
  $core.int get playCount => $_getIZ(5);
  @$pb.TagNumber(6)
  set playCount($core.int value) => $_setUnsignedInt32(5, value);
  @$pb.TagNumber(6)
  $core.bool hasPlayCount() => $_has(5);
  @$pb.TagNumber(6)
  void clearPlayCount() => $_clearField(6);
}

/// *
///  麦下列表变动消息
class RoomOffMicChange extends $pb.GeneratedMessage {
  factory RoomOffMicChange({
    $core.Iterable<$5.OffMicUser>? offMicUser,
  }) {
    final result = create();
    if (offMicUser != null) result.offMicUser.addAll(offMicUser);
    return result;
  }

  RoomOffMicChange._();

  factory RoomOffMicChange.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory RoomOffMicChange.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'RoomOffMicChange',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'message'),
      createEmptyInstance: create)
    ..pPM<$5.OffMicUser>(1, _omitFieldNames ? '' : 'offMicUser',
        subBuilder: $5.OffMicUser.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RoomOffMicChange clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RoomOffMicChange copyWith(void Function(RoomOffMicChange) updates) =>
      super.copyWith((message) => updates(message as RoomOffMicChange))
          as RoomOffMicChange;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RoomOffMicChange create() => RoomOffMicChange._();
  @$core.override
  RoomOffMicChange createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static RoomOffMicChange getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RoomOffMicChange>(create);
  static RoomOffMicChange? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<$5.OffMicUser> get offMicUser => $_getList(0);
}

/// *
///  麦上表情
class RoomMicShowImg extends $pb.GeneratedMessage {
  factory RoomMicShowImg({
    $fixnum.Int64? uid,
    $core.int? type,
    $core.String? imgUrl,
    $core.int? randomResult,
    $core.String? offMicImgUrl,
  }) {
    final result = create();
    if (uid != null) result.uid = uid;
    if (type != null) result.type = type;
    if (imgUrl != null) result.imgUrl = imgUrl;
    if (randomResult != null) result.randomResult = randomResult;
    if (offMicImgUrl != null) result.offMicImgUrl = offMicImgUrl;
    return result;
  }

  RoomMicShowImg._();

  factory RoomMicShowImg.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory RoomMicShowImg.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'RoomMicShowImg',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'message'),
      createEmptyInstance: create)
    ..a<$fixnum.Int64>(1, _omitFieldNames ? '' : 'uid', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..aI(2, _omitFieldNames ? '' : 'type', fieldType: $pb.PbFieldType.OU3)
    ..aOS(3, _omitFieldNames ? '' : 'imgUrl')
    ..aI(4, _omitFieldNames ? '' : 'randomResult',
        fieldType: $pb.PbFieldType.OU3)
    ..aOS(5, _omitFieldNames ? '' : 'offMicImgUrl')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RoomMicShowImg clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RoomMicShowImg copyWith(void Function(RoomMicShowImg) updates) =>
      super.copyWith((message) => updates(message as RoomMicShowImg))
          as RoomMicShowImg;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RoomMicShowImg create() => RoomMicShowImg._();
  @$core.override
  RoomMicShowImg createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static RoomMicShowImg getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RoomMicShowImg>(create);
  static RoomMicShowImg? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get uid => $_getI64(0);
  @$pb.TagNumber(1)
  set uid($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasUid() => $_has(0);
  @$pb.TagNumber(1)
  void clearUid() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.int get type => $_getIZ(1);
  @$pb.TagNumber(2)
  set type($core.int value) => $_setUnsignedInt32(1, value);
  @$pb.TagNumber(2)
  $core.bool hasType() => $_has(1);
  @$pb.TagNumber(2)
  void clearType() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get imgUrl => $_getSZ(2);
  @$pb.TagNumber(3)
  set imgUrl($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasImgUrl() => $_has(2);
  @$pb.TagNumber(3)
  void clearImgUrl() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.int get randomResult => $_getIZ(3);
  @$pb.TagNumber(4)
  set randomResult($core.int value) => $_setUnsignedInt32(3, value);
  @$pb.TagNumber(4)
  $core.bool hasRandomResult() => $_has(3);
  @$pb.TagNumber(4)
  void clearRandomResult() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.String get offMicImgUrl => $_getSZ(4);
  @$pb.TagNumber(5)
  set offMicImgUrl($core.String value) => $_setString(4, value);
  @$pb.TagNumber(5)
  $core.bool hasOffMicImgUrl() => $_has(4);
  @$pb.TagNumber(5)
  void clearOffMicImgUrl() => $_clearField(5);
}

/// *
///  房间sud游戏状态变化
class RoomSudGameChange extends $pb.GeneratedMessage {
  factory RoomSudGameChange() => create();

  RoomSudGameChange._();

  factory RoomSudGameChange.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory RoomSudGameChange.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'RoomSudGameChange',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'message'),
      createEmptyInstance: create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RoomSudGameChange clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RoomSudGameChange copyWith(void Function(RoomSudGameChange) updates) =>
      super.copyWith((message) => updates(message as RoomSudGameChange))
          as RoomSudGameChange;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RoomSudGameChange create() => RoomSudGameChange._();
  @$core.override
  RoomSudGameChange createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static RoomSudGameChange getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RoomSudGameChange>(create);
  static RoomSudGameChange? _defaultInstance;
}

/// *
///  房间全屏特效
class RoomEffect extends $pb.GeneratedMessage {
  factory RoomEffect({
    $core.String? url,
    $core.Iterable<$core.String>? imgList,
    $core.Iterable<$core.String>? textList,
  }) {
    final result = create();
    if (url != null) result.url = url;
    if (imgList != null) result.imgList.addAll(imgList);
    if (textList != null) result.textList.addAll(textList);
    return result;
  }

  RoomEffect._();

  factory RoomEffect.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory RoomEffect.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'RoomEffect',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'message'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'url')
    ..pPS(2, _omitFieldNames ? '' : 'imgList', protoName: 'imgList')
    ..pPS(3, _omitFieldNames ? '' : 'textList', protoName: 'textList')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RoomEffect clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RoomEffect copyWith(void Function(RoomEffect) updates) =>
      super.copyWith((message) => updates(message as RoomEffect)) as RoomEffect;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RoomEffect create() => RoomEffect._();
  @$core.override
  RoomEffect createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static RoomEffect getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RoomEffect>(create);
  static RoomEffect? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get url => $_getSZ(0);
  @$pb.TagNumber(1)
  set url($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasUrl() => $_has(0);
  @$pb.TagNumber(1)
  void clearUrl() => $_clearField(1);

  @$pb.TagNumber(2)
  $pb.PbList<$core.String> get imgList => $_getList(1);

  @$pb.TagNumber(3)
  $pb.PbList<$core.String> get textList => $_getList(2);
}

/// *
///  房间全屏特效
class BoxGiftEffect extends $pb.GeneratedMessage {
  factory BoxGiftEffect({
    $core.String? url,
    $core.Iterable<$core.String>? imgList,
    $core.Iterable<$core.String>? textList,
    $core.Iterable<$core.String>? colorList,
    $core.Iterable<BoxRewardItem>? rewardItems,
  }) {
    final result = create();
    if (url != null) result.url = url;
    if (imgList != null) result.imgList.addAll(imgList);
    if (textList != null) result.textList.addAll(textList);
    if (colorList != null) result.colorList.addAll(colorList);
    if (rewardItems != null) result.rewardItems.addAll(rewardItems);
    return result;
  }

  BoxGiftEffect._();

  factory BoxGiftEffect.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory BoxGiftEffect.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'BoxGiftEffect',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'message'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'url')
    ..pPS(2, _omitFieldNames ? '' : 'imgList', protoName: 'imgList')
    ..pPS(3, _omitFieldNames ? '' : 'textList', protoName: 'textList')
    ..pPS(4, _omitFieldNames ? '' : 'colorList', protoName: 'colorList')
    ..pPM<BoxRewardItem>(5, _omitFieldNames ? '' : 'rewardItems',
        subBuilder: BoxRewardItem.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  BoxGiftEffect clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  BoxGiftEffect copyWith(void Function(BoxGiftEffect) updates) =>
      super.copyWith((message) => updates(message as BoxGiftEffect))
          as BoxGiftEffect;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static BoxGiftEffect create() => BoxGiftEffect._();
  @$core.override
  BoxGiftEffect createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static BoxGiftEffect getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<BoxGiftEffect>(create);
  static BoxGiftEffect? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get url => $_getSZ(0);
  @$pb.TagNumber(1)
  set url($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasUrl() => $_has(0);
  @$pb.TagNumber(1)
  void clearUrl() => $_clearField(1);

  @$pb.TagNumber(2)
  $pb.PbList<$core.String> get imgList => $_getList(1);

  @$pb.TagNumber(3)
  $pb.PbList<$core.String> get textList => $_getList(2);

  @$pb.TagNumber(4)
  $pb.PbList<$core.String> get colorList => $_getList(3);

  @$pb.TagNumber(5)
  $pb.PbList<BoxRewardItem> get rewardItems => $_getList(4);
}

class BoxRewardItem extends $pb.GeneratedMessage {
  factory BoxRewardItem({
    $fixnum.Int64? id,
    $core.int? count,
    $core.String? icon,
    $core.String? name,
    $fixnum.Int64? price,
    $core.int? type,
  }) {
    final result = create();
    if (id != null) result.id = id;
    if (count != null) result.count = count;
    if (icon != null) result.icon = icon;
    if (name != null) result.name = name;
    if (price != null) result.price = price;
    if (type != null) result.type = type;
    return result;
  }

  BoxRewardItem._();

  factory BoxRewardItem.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory BoxRewardItem.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'BoxRewardItem',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'message'),
      createEmptyInstance: create)
    ..a<$fixnum.Int64>(1, _omitFieldNames ? '' : 'id', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..aI(2, _omitFieldNames ? '' : 'count', fieldType: $pb.PbFieldType.OU3)
    ..aOS(3, _omitFieldNames ? '' : 'icon')
    ..aOS(4, _omitFieldNames ? '' : 'name')
    ..a<$fixnum.Int64>(5, _omitFieldNames ? '' : 'price', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..aI(6, _omitFieldNames ? '' : 'type', fieldType: $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  BoxRewardItem clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  BoxRewardItem copyWith(void Function(BoxRewardItem) updates) =>
      super.copyWith((message) => updates(message as BoxRewardItem))
          as BoxRewardItem;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static BoxRewardItem create() => BoxRewardItem._();
  @$core.override
  BoxRewardItem createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static BoxRewardItem getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<BoxRewardItem>(create);
  static BoxRewardItem? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get id => $_getI64(0);
  @$pb.TagNumber(1)
  set id($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.int get count => $_getIZ(1);
  @$pb.TagNumber(2)
  set count($core.int value) => $_setUnsignedInt32(1, value);
  @$pb.TagNumber(2)
  $core.bool hasCount() => $_has(1);
  @$pb.TagNumber(2)
  void clearCount() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get icon => $_getSZ(2);
  @$pb.TagNumber(3)
  set icon($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasIcon() => $_has(2);
  @$pb.TagNumber(3)
  void clearIcon() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.String get name => $_getSZ(3);
  @$pb.TagNumber(4)
  set name($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasName() => $_has(3);
  @$pb.TagNumber(4)
  void clearName() => $_clearField(4);

  @$pb.TagNumber(5)
  $fixnum.Int64 get price => $_getI64(4);
  @$pb.TagNumber(5)
  set price($fixnum.Int64 value) => $_setInt64(4, value);
  @$pb.TagNumber(5)
  $core.bool hasPrice() => $_has(4);
  @$pb.TagNumber(5)
  void clearPrice() => $_clearField(5);

  @$pb.TagNumber(6)
  $core.int get type => $_getIZ(5);
  @$pb.TagNumber(6)
  set type($core.int value) => $_setUnsignedInt32(5, value);
  @$pb.TagNumber(6)
  $core.bool hasType() => $_has(5);
  @$pb.TagNumber(6)
  void clearType() => $_clearField(6);
}

/// *
///  默认的空消息
class EmptyMsg extends $pb.GeneratedMessage {
  factory EmptyMsg() => create();

  EmptyMsg._();

  factory EmptyMsg.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory EmptyMsg.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'EmptyMsg',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'message'),
      createEmptyInstance: create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  EmptyMsg clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  EmptyMsg copyWith(void Function(EmptyMsg) updates) =>
      super.copyWith((message) => updates(message as EmptyMsg)) as EmptyMsg;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static EmptyMsg create() => EmptyMsg._();
  @$core.override
  EmptyMsg createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static EmptyMsg getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<EmptyMsg>(create);
  static EmptyMsg? _defaultInstance;
}

class UserInfoItem extends $pb.GeneratedMessage {
  factory UserInfoItem({
    $fixnum.Int64? uid,
    $core.String? name,
    $core.String? icon,
  }) {
    final result = create();
    if (uid != null) result.uid = uid;
    if (name != null) result.name = name;
    if (icon != null) result.icon = icon;
    return result;
  }

  UserInfoItem._();

  factory UserInfoItem.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory UserInfoItem.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'UserInfoItem',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'message'),
      createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'uid')
    ..aOS(2, _omitFieldNames ? '' : 'name')
    ..aOS(3, _omitFieldNames ? '' : 'icon')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UserInfoItem clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UserInfoItem copyWith(void Function(UserInfoItem) updates) =>
      super.copyWith((message) => updates(message as UserInfoItem))
          as UserInfoItem;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UserInfoItem create() => UserInfoItem._();
  @$core.override
  UserInfoItem createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static UserInfoItem getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<UserInfoItem>(create);
  static UserInfoItem? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get uid => $_getI64(0);
  @$pb.TagNumber(1)
  set uid($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasUid() => $_has(0);
  @$pb.TagNumber(1)
  void clearUid() => $_clearField(1);

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
}

class RoomInvite extends $pb.GeneratedMessage {
  factory RoomInvite({
    $fixnum.Int64? rid,
    $core.String? title,
    $core.String? desc,
    $core.String? tag,
    $fixnum.Int64? onMics,
    $core.Iterable<$core.String>? tagColors,
    $core.String? tagIcon,
    $core.String? roomIcon,
    $5.GameInfo? gameInfo,
    $fixnum.Int64? fromUid,
    $fixnum.Int64? toUid,
    UserInfoItem? fromUserInfo,
    UserInfoItem? toUserInfo,
  }) {
    final result = create();
    if (rid != null) result.rid = rid;
    if (title != null) result.title = title;
    if (desc != null) result.desc = desc;
    if (tag != null) result.tag = tag;
    if (onMics != null) result.onMics = onMics;
    if (tagColors != null) result.tagColors.addAll(tagColors);
    if (tagIcon != null) result.tagIcon = tagIcon;
    if (roomIcon != null) result.roomIcon = roomIcon;
    if (gameInfo != null) result.gameInfo = gameInfo;
    if (fromUid != null) result.fromUid = fromUid;
    if (toUid != null) result.toUid = toUid;
    if (fromUserInfo != null) result.fromUserInfo = fromUserInfo;
    if (toUserInfo != null) result.toUserInfo = toUserInfo;
    return result;
  }

  RoomInvite._();

  factory RoomInvite.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory RoomInvite.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'RoomInvite',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'message'),
      createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'rid')
    ..aOS(2, _omitFieldNames ? '' : 'title')
    ..aOS(3, _omitFieldNames ? '' : 'desc')
    ..aOS(4, _omitFieldNames ? '' : 'tag')
    ..aInt64(5, _omitFieldNames ? '' : 'onMics')
    ..pPS(6, _omitFieldNames ? '' : 'tagColors')
    ..aOS(7, _omitFieldNames ? '' : 'tagIcon')
    ..aOS(8, _omitFieldNames ? '' : 'roomIcon')
    ..aOM<$5.GameInfo>(9, _omitFieldNames ? '' : 'gameInfo',
        subBuilder: $5.GameInfo.create)
    ..aInt64(10, _omitFieldNames ? '' : 'fromUid')
    ..aInt64(11, _omitFieldNames ? '' : 'toUid')
    ..aOM<UserInfoItem>(12, _omitFieldNames ? '' : 'fromUserInfo',
        subBuilder: UserInfoItem.create)
    ..aOM<UserInfoItem>(13, _omitFieldNames ? '' : 'toUserInfo',
        subBuilder: UserInfoItem.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RoomInvite clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RoomInvite copyWith(void Function(RoomInvite) updates) =>
      super.copyWith((message) => updates(message as RoomInvite)) as RoomInvite;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RoomInvite create() => RoomInvite._();
  @$core.override
  RoomInvite createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static RoomInvite getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RoomInvite>(create);
  static RoomInvite? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get rid => $_getI64(0);
  @$pb.TagNumber(1)
  set rid($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasRid() => $_has(0);
  @$pb.TagNumber(1)
  void clearRid() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get title => $_getSZ(1);
  @$pb.TagNumber(2)
  set title($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasTitle() => $_has(1);
  @$pb.TagNumber(2)
  void clearTitle() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get desc => $_getSZ(2);
  @$pb.TagNumber(3)
  set desc($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasDesc() => $_has(2);
  @$pb.TagNumber(3)
  void clearDesc() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.String get tag => $_getSZ(3);
  @$pb.TagNumber(4)
  set tag($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasTag() => $_has(3);
  @$pb.TagNumber(4)
  void clearTag() => $_clearField(4);

  @$pb.TagNumber(5)
  $fixnum.Int64 get onMics => $_getI64(4);
  @$pb.TagNumber(5)
  set onMics($fixnum.Int64 value) => $_setInt64(4, value);
  @$pb.TagNumber(5)
  $core.bool hasOnMics() => $_has(4);
  @$pb.TagNumber(5)
  void clearOnMics() => $_clearField(5);

  @$pb.TagNumber(6)
  $pb.PbList<$core.String> get tagColors => $_getList(5);

  @$pb.TagNumber(7)
  $core.String get tagIcon => $_getSZ(6);
  @$pb.TagNumber(7)
  set tagIcon($core.String value) => $_setString(6, value);
  @$pb.TagNumber(7)
  $core.bool hasTagIcon() => $_has(6);
  @$pb.TagNumber(7)
  void clearTagIcon() => $_clearField(7);

  @$pb.TagNumber(8)
  $core.String get roomIcon => $_getSZ(7);
  @$pb.TagNumber(8)
  set roomIcon($core.String value) => $_setString(7, value);
  @$pb.TagNumber(8)
  $core.bool hasRoomIcon() => $_has(7);
  @$pb.TagNumber(8)
  void clearRoomIcon() => $_clearField(8);

  @$pb.TagNumber(9)
  $5.GameInfo get gameInfo => $_getN(8);
  @$pb.TagNumber(9)
  set gameInfo($5.GameInfo value) => $_setField(9, value);
  @$pb.TagNumber(9)
  $core.bool hasGameInfo() => $_has(8);
  @$pb.TagNumber(9)
  void clearGameInfo() => $_clearField(9);
  @$pb.TagNumber(9)
  $5.GameInfo ensureGameInfo() => $_ensure(8);

  @$pb.TagNumber(10)
  $fixnum.Int64 get fromUid => $_getI64(9);
  @$pb.TagNumber(10)
  set fromUid($fixnum.Int64 value) => $_setInt64(9, value);
  @$pb.TagNumber(10)
  $core.bool hasFromUid() => $_has(9);
  @$pb.TagNumber(10)
  void clearFromUid() => $_clearField(10);

  @$pb.TagNumber(11)
  $fixnum.Int64 get toUid => $_getI64(10);
  @$pb.TagNumber(11)
  set toUid($fixnum.Int64 value) => $_setInt64(10, value);
  @$pb.TagNumber(11)
  $core.bool hasToUid() => $_has(10);
  @$pb.TagNumber(11)
  void clearToUid() => $_clearField(11);

  @$pb.TagNumber(12)
  UserInfoItem get fromUserInfo => $_getN(11);
  @$pb.TagNumber(12)
  set fromUserInfo(UserInfoItem value) => $_setField(12, value);
  @$pb.TagNumber(12)
  $core.bool hasFromUserInfo() => $_has(11);
  @$pb.TagNumber(12)
  void clearFromUserInfo() => $_clearField(12);
  @$pb.TagNumber(12)
  UserInfoItem ensureFromUserInfo() => $_ensure(11);

  @$pb.TagNumber(13)
  UserInfoItem get toUserInfo => $_getN(12);
  @$pb.TagNumber(13)
  set toUserInfo(UserInfoItem value) => $_setField(13, value);
  @$pb.TagNumber(13)
  $core.bool hasToUserInfo() => $_has(12);
  @$pb.TagNumber(13)
  void clearToUserInfo() => $_clearField(13);
  @$pb.TagNumber(13)
  UserInfoItem ensureToUserInfo() => $_ensure(12);
}

/// *
///  房间飘屏权益卡 cmd 消息体 (Scene=ROOM_FLOAT_MSG)
class RoomFloatMsgCmd extends $pb.GeneratedMessage {
  factory RoomFloatMsgCmd({
    $fixnum.Int64? channel,
    $5.SimpleChannelUser? sender,
    $core.String? content,
  }) {
    final result = create();
    if (channel != null) result.channel = channel;
    if (sender != null) result.sender = sender;
    if (content != null) result.content = content;
    return result;
  }

  RoomFloatMsgCmd._();

  factory RoomFloatMsgCmd.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory RoomFloatMsgCmd.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'RoomFloatMsgCmd',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'message'),
      createEmptyInstance: create)
    ..a<$fixnum.Int64>(1, _omitFieldNames ? '' : 'channel', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..aOM<$5.SimpleChannelUser>(2, _omitFieldNames ? '' : 'sender',
        subBuilder: $5.SimpleChannelUser.create)
    ..aOS(3, _omitFieldNames ? '' : 'content')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RoomFloatMsgCmd clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RoomFloatMsgCmd copyWith(void Function(RoomFloatMsgCmd) updates) =>
      super.copyWith((message) => updates(message as RoomFloatMsgCmd))
          as RoomFloatMsgCmd;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RoomFloatMsgCmd create() => RoomFloatMsgCmd._();
  @$core.override
  RoomFloatMsgCmd createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static RoomFloatMsgCmd getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RoomFloatMsgCmd>(create);
  static RoomFloatMsgCmd? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get channel => $_getI64(0);
  @$pb.TagNumber(1)
  set channel($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasChannel() => $_has(0);
  @$pb.TagNumber(1)
  void clearChannel() => $_clearField(1);

  @$pb.TagNumber(2)
  $5.SimpleChannelUser get sender => $_getN(1);
  @$pb.TagNumber(2)
  set sender($5.SimpleChannelUser value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasSender() => $_has(1);
  @$pb.TagNumber(2)
  void clearSender() => $_clearField(2);
  @$pb.TagNumber(2)
  $5.SimpleChannelUser ensureSender() => $_ensure(1);

  @$pb.TagNumber(3)
  $core.String get content => $_getSZ(2);
  @$pb.TagNumber(3)
  set content($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasContent() => $_has(2);
  @$pb.TagNumber(3)
  void clearContent() => $_clearField(3);
}

/// *
///  用户冠名房间
class UserNamedRoomMsgCmd extends $pb.GeneratedMessage {
  factory UserNamedRoomMsgCmd({
    $fixnum.Int64? channel,
    $fixnum.Int64? uid,
    $core.String? uname,
    $core.String? uavatar,
    RoomEffect? effect,
  }) {
    final result = create();
    if (channel != null) result.channel = channel;
    if (uid != null) result.uid = uid;
    if (uname != null) result.uname = uname;
    if (uavatar != null) result.uavatar = uavatar;
    if (effect != null) result.effect = effect;
    return result;
  }

  UserNamedRoomMsgCmd._();

  factory UserNamedRoomMsgCmd.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory UserNamedRoomMsgCmd.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'UserNamedRoomMsgCmd',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'message'),
      createEmptyInstance: create)
    ..a<$fixnum.Int64>(1, _omitFieldNames ? '' : 'channel', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$fixnum.Int64>(2, _omitFieldNames ? '' : 'uid', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..aOS(3, _omitFieldNames ? '' : 'uname')
    ..aOS(4, _omitFieldNames ? '' : 'uavatar')
    ..aOM<RoomEffect>(5, _omitFieldNames ? '' : 'effect',
        subBuilder: RoomEffect.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UserNamedRoomMsgCmd clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UserNamedRoomMsgCmd copyWith(void Function(UserNamedRoomMsgCmd) updates) =>
      super.copyWith((message) => updates(message as UserNamedRoomMsgCmd))
          as UserNamedRoomMsgCmd;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UserNamedRoomMsgCmd create() => UserNamedRoomMsgCmd._();
  @$core.override
  UserNamedRoomMsgCmd createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static UserNamedRoomMsgCmd getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<UserNamedRoomMsgCmd>(create);
  static UserNamedRoomMsgCmd? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get channel => $_getI64(0);
  @$pb.TagNumber(1)
  set channel($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasChannel() => $_has(0);
  @$pb.TagNumber(1)
  void clearChannel() => $_clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get uid => $_getI64(1);
  @$pb.TagNumber(2)
  set uid($fixnum.Int64 value) => $_setInt64(1, value);
  @$pb.TagNumber(2)
  $core.bool hasUid() => $_has(1);
  @$pb.TagNumber(2)
  void clearUid() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get uname => $_getSZ(2);
  @$pb.TagNumber(3)
  set uname($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasUname() => $_has(2);
  @$pb.TagNumber(3)
  void clearUname() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.String get uavatar => $_getSZ(3);
  @$pb.TagNumber(4)
  set uavatar($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasUavatar() => $_has(3);
  @$pb.TagNumber(4)
  void clearUavatar() => $_clearField(4);

  @$pb.TagNumber(5)
  RoomEffect get effect => $_getN(4);
  @$pb.TagNumber(5)
  set effect(RoomEffect value) => $_setField(5, value);
  @$pb.TagNumber(5)
  $core.bool hasEffect() => $_has(4);
  @$pb.TagNumber(5)
  void clearEffect() => $_clearField(5);
  @$pb.TagNumber(5)
  RoomEffect ensureEffect() => $_ensure(4);
}

const $core.bool _omitFieldNames =
    $core.bool.fromEnvironment('protobuf.omit_field_names');
const $core.bool _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');
