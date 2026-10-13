// This is a generated file - do not edit.
//
// Generated from server_client/home_page/home_page_bean.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_relative_imports

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class ResourceType extends $pb.ProtobufEnum {
  static const ResourceType none =
      ResourceType._(0, _omitEnumNames ? '' : 'none');
  static const ResourceType gif =
      ResourceType._(1, _omitEnumNames ? '' : 'gif');
  static const ResourceType video =
      ResourceType._(2, _omitEnumNames ? '' : 'video');

  static const $core.List<ResourceType> values = <ResourceType>[
    none,
    gif,
    video,
  ];

  static final $core.List<ResourceType?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 2);
  static ResourceType? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const ResourceType._(super.value, super.name);
}

class VideoRate extends $pb.ProtobufEnum {
  static const VideoRate Rate_320 =
      VideoRate._(0, _omitEnumNames ? '' : 'Rate_320');
  static const VideoRate Rate_480 =
      VideoRate._(1, _omitEnumNames ? '' : 'Rate_480');
  static const VideoRate Rate_720 =
      VideoRate._(2, _omitEnumNames ? '' : 'Rate_720');
  static const VideoRate Rate_1080 =
      VideoRate._(3, _omitEnumNames ? '' : 'Rate_1080');

  static const $core.List<VideoRate> values = <VideoRate>[
    Rate_320,
    Rate_480,
    Rate_720,
    Rate_1080,
  ];

  static final $core.List<VideoRate?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 3);
  static VideoRate? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const VideoRate._(super.value, super.name);
}

const $core.bool _omitEnumNames =
    $core.bool.fromEnvironment('protobuf.omit_enum_names');
