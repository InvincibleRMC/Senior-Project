///
//  Generated code. Do not modify.
//  source: proto/requests.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,deprecated_member_use_from_same_package,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:core' as $core;
import 'dart:convert' as $convert;
import 'dart:typed_data' as $typed_data;
@$core.Deprecated('Use notificationRequestDescriptor instead')
const NotificationRequest$json = const {
  '1': 'NotificationRequest',
  '2': const [
    const {'1': 'email', '3': 1, '4': 1, '5': 9, '10': 'email'},
    const {'1': 'classes', '3': 2, '4': 3, '5': 11, '6': '.Course', '10': 'classes'},
  ],
};

/// Descriptor for `NotificationRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List notificationRequestDescriptor = $convert.base64Decode('ChNOb3RpZmljYXRpb25SZXF1ZXN0EhQKBWVtYWlsGAEgASgJUgVlbWFpbBIhCgdjbGFzc2VzGAIgAygLMgcuQ291cnNlUgdjbGFzc2Vz');
@$core.Deprecated('Use scheduleRequestDescriptor instead')
const ScheduleRequest$json = const {
  '1': 'ScheduleRequest',
  '2': const [
    const {'1': 'major', '3': 1, '4': 1, '5': 9, '10': 'major'},
    const {'1': 'previousClasses', '3': 2, '4': 3, '5': 11, '6': '.Course', '10': 'previousClasses'},
    const {'1': 'preferredClasses', '3': 3, '4': 3, '5': 11, '6': '.Course', '10': 'preferredClasses'},
    const {'1': 'unpreferredClasses', '3': 4, '4': 3, '5': 11, '6': '.Course', '10': 'unpreferredClasses'},
    const {'1': 'preferredProfs', '3': 5, '4': 3, '5': 11, '6': '.Professor', '10': 'preferredProfs'},
    const {'1': 'unprefferedProfs', '3': 6, '4': 3, '5': 11, '6': '.Professor', '10': 'unprefferedProfs'},
  ],
};

/// Descriptor for `ScheduleRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List scheduleRequestDescriptor = $convert.base64Decode('Cg9TY2hlZHVsZVJlcXVlc3QSFAoFbWFqb3IYASABKAlSBW1ham9yEjEKD3ByZXZpb3VzQ2xhc3NlcxgCIAMoCzIHLkNvdXJzZVIPcHJldmlvdXNDbGFzc2VzEjMKEHByZWZlcnJlZENsYXNzZXMYAyADKAsyBy5Db3Vyc2VSEHByZWZlcnJlZENsYXNzZXMSNwoSdW5wcmVmZXJyZWRDbGFzc2VzGAQgAygLMgcuQ291cnNlUhJ1bnByZWZlcnJlZENsYXNzZXMSMgoOcHJlZmVycmVkUHJvZnMYBSADKAsyCi5Qcm9mZXNzb3JSDnByZWZlcnJlZFByb2ZzEjYKEHVucHJlZmZlcmVkUHJvZnMYBiADKAsyCi5Qcm9mZXNzb3JSEHVucHJlZmZlcmVkUHJvZnM=');
@$core.Deprecated('Use professorRequestDescriptor instead')
const ProfessorRequest$json = const {
  '1': 'ProfessorRequest',
  '2': const [
    const {'1': 'major', '3': 1, '4': 1, '5': 9, '9': 0, '10': 'major', '17': true},
  ],
  '8': const [
    const {'1': '_major'},
  ],
};

/// Descriptor for `ProfessorRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List professorRequestDescriptor = $convert.base64Decode('ChBQcm9mZXNzb3JSZXF1ZXN0EhkKBW1ham9yGAEgASgJSABSBW1ham9yiAEBQggKBl9tYWpvcg==');
@$core.Deprecated('Use courseRequestDescriptor instead')
const CourseRequest$json = const {
  '1': 'CourseRequest',
  '2': const [
    const {'1': 'major', '3': 1, '4': 1, '5': 9, '9': 0, '10': 'major', '17': true},
  ],
  '8': const [
    const {'1': '_major'},
  ],
};

/// Descriptor for `CourseRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List courseRequestDescriptor = $convert.base64Decode('Cg1Db3Vyc2VSZXF1ZXN0EhkKBW1ham9yGAEgASgJSABSBW1ham9yiAEBQggKBl9tYWpvcg==');
@$core.Deprecated('Use requestDescriptor instead')
const Request$json = const {
  '1': 'Request',
  '2': const [
    const {'1': 'type', '3': 1, '4': 1, '5': 14, '6': '.Request.RequestType', '10': 'type'},
    const {'1': 'r1', '3': 2, '4': 1, '5': 11, '6': '.ScheduleRequest', '9': 0, '10': 'r1'},
    const {'1': 'r2', '3': 3, '4': 1, '5': 11, '6': '.NotificationRequest', '9': 0, '10': 'r2'},
    const {'1': 'r3', '3': 4, '4': 1, '5': 11, '6': '.ProfessorRequest', '9': 0, '10': 'r3'},
    const {'1': 'r4', '3': 5, '4': 1, '5': 11, '6': '.CourseRequest', '9': 0, '10': 'r4'},
  ],
  '4': const [Request_RequestType$json],
  '8': const [
    const {'1': 'msg'},
  ],
};

@$core.Deprecated('Use requestDescriptor instead')
const Request_RequestType$json = const {
  '1': 'RequestType',
  '2': const [
    const {'1': 'SCHEDULE', '2': 0},
    const {'1': 'NOTIFICATION', '2': 1},
  ],
};

/// Descriptor for `Request`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List requestDescriptor = $convert.base64Decode('CgdSZXF1ZXN0EigKBHR5cGUYASABKA4yFC5SZXF1ZXN0LlJlcXVlc3RUeXBlUgR0eXBlEiIKAnIxGAIgASgLMhAuU2NoZWR1bGVSZXF1ZXN0SABSAnIxEiYKAnIyGAMgASgLMhQuTm90aWZpY2F0aW9uUmVxdWVzdEgAUgJyMhIjCgJyMxgEIAEoCzIRLlByb2Zlc3NvclJlcXVlc3RIAFICcjMSIAoCcjQYBSABKAsyDi5Db3Vyc2VSZXF1ZXN0SABSAnI0Ii0KC1JlcXVlc3RUeXBlEgwKCFNDSEVEVUxFEAASEAoMTk9USUZJQ0FUSU9OEAFCBQoDbXNn');
