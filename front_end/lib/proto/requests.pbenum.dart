///
//  Generated code. Do not modify.
//  source: proto/requests.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

// ignore_for_file: UNDEFINED_SHOWN_NAME
import 'dart:core' as $core;
import 'package:protobuf/protobuf.dart' as $pb;

class RequestType extends $pb.ProtobufEnum {
  static const RequestType REQ_SCHEDULE = RequestType._(0, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'REQ_SCHEDULE');
  static const RequestType REQ_NOTIFICATION = RequestType._(1, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'REQ_NOTIFICATION');
  static const RequestType REQ_DEBUG = RequestType._(2, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'REQ_DEBUG');

  static const $core.List<RequestType> values = <RequestType> [
    REQ_SCHEDULE,
    REQ_NOTIFICATION,
    REQ_DEBUG,
  ];

  static final $core.Map<$core.int, RequestType> _byValue = $pb.ProtobufEnum.initByValue(values);
  static RequestType? valueOf($core.int value) => _byValue[value];

  const RequestType._($core.int v, $core.String n) : super(v, n);
}

