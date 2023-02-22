///
//  Generated code. Do not modify.
//  source: proto/requests.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

// ignore_for_file: UNDEFINED_SHOWN_NAME
import 'dart:core' as $core;
import 'package:protobuf/protobuf.dart' as $pb;

class Request_RequestType extends $pb.ProtobufEnum {
  static const Request_RequestType SCHEDULE = Request_RequestType._(0, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'SCHEDULE');
  static const Request_RequestType NOTIFICATION = Request_RequestType._(1, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'NOTIFICATION');

  static const $core.List<Request_RequestType> values = <Request_RequestType> [
    SCHEDULE,
    NOTIFICATION,
  ];

  static final $core.Map<$core.int, Request_RequestType> _byValue = $pb.ProtobufEnum.initByValue(values);
  static Request_RequestType? valueOf($core.int value) => _byValue[value];

  const Request_RequestType._($core.int v, $core.String n) : super(v, n);
}

