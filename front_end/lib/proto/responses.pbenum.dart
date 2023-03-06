///
//  Generated code. Do not modify.
//  source: proto/responses.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

// ignore_for_file: UNDEFINED_SHOWN_NAME
import 'dart:core' as $core;
import 'package:protobuf/protobuf.dart' as $pb;

class ResponseType extends $pb.ProtobufEnum {
  static const ResponseType RES_SCHEDULE = ResponseType._(0, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'RES_SCHEDULE');
  static const ResponseType RES_PROFS = ResponseType._(1, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'RES_PROFS');
  static const ResponseType RES_COURSES = ResponseType._(2, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'RES_COURSES');
  static const ResponseType RES_DEBUG = ResponseType._(3, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'RES_DEBUG');
  static const ResponseType RES_MAJOR = ResponseType._(4, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'RES_MAJOR');
  static const ResponseType RES_NOTI = ResponseType._(5, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'RES_NOTI');

  static const $core.List<ResponseType> values = <ResponseType> [
    RES_SCHEDULE,
    RES_PROFS,
    RES_COURSES,
    RES_DEBUG,
    RES_MAJOR,
    RES_NOTI,
  ];

  static final $core.Map<$core.int, ResponseType> _byValue = $pb.ProtobufEnum.initByValue(values);
  static ResponseType? valueOf($core.int value) => _byValue[value];

  const ResponseType._($core.int v, $core.String n) : super(v, n);
}

