///
//  Generated code. Do not modify.
//  source: proto/reponses.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

// ignore_for_file: UNDEFINED_SHOWN_NAME
import 'dart:core' as $core;
import 'package:protobuf/protobuf.dart' as $pb;

class Response_ResponseType extends $pb.ProtobufEnum {
  static const Response_ResponseType CourseList = Response_ResponseType._(0, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'CourseList');
  static const Response_ResponseType ProfessorList = Response_ResponseType._(1, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'ProfessorList');
  static const Response_ResponseType Schedule = Response_ResponseType._(2, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'Schedule');

  static const $core.List<Response_ResponseType> values = <Response_ResponseType> [
    CourseList,
    ProfessorList,
    Schedule,
  ];

  static final $core.Map<$core.int, Response_ResponseType> _byValue = $pb.ProtobufEnum.initByValue(values);
  static Response_ResponseType? valueOf($core.int value) => _byValue[value];

  const Response_ResponseType._($core.int v, $core.String n) : super(v, n);
}

