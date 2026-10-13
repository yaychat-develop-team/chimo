// This is a generated file - do not edit.
//
// Generated from server_client/common/util.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_relative_imports

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

/// 文件种类
class FileItem extends $pb.ProtobufEnum {
  static const FileItem FileItem_UNKNOWN =
      FileItem._(0, _omitEnumNames ? '' : 'FileItem_UNKNOWN');
  static const FileItem USER_PHOTO =
      FileItem._(101, _omitEnumNames ? '' : 'USER_PHOTO');
  static const FileItem USER_VOICE =
      FileItem._(102, _omitEnumNames ? '' : 'USER_VOICE');
  static const FileItem USER_VIDEO =
      FileItem._(103, _omitEnumNames ? '' : 'USER_VIDEO');
  static const FileItem CAR_RES =
      FileItem._(201, _omitEnumNames ? '' : 'CAR_RES');

  static const $core.List<FileItem> values = <FileItem>[
    FileItem_UNKNOWN,
    USER_PHOTO,
    USER_VOICE,
    USER_VIDEO,
    CAR_RES,
  ];

  static final $core.Map<$core.int, FileItem> _byValue =
      $pb.ProtobufEnum.initByValue(values);
  static FileItem? valueOf($core.int value) => _byValue[value];

  const FileItem._(super.value, super.name);
}

const $core.bool _omitEnumNames =
    $core.bool.fromEnvironment('protobuf.omit_enum_names');
