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
    const {'1': 'major', '3': 1, '4': 1, '5': 11, '6': '.Major', '10': 'major'},
    const {'1': 'semester', '3': 2, '4': 1, '5': 9, '10': 'semester'},
    const {'1': 'minCredits', '3': 3, '4': 1, '5': 5, '10': 'minCredits'},
    const {'1': 'maxCredits', '3': 4, '4': 1, '5': 5, '10': 'maxCredits'},
    const {'1': 'previousClasses', '3': 5, '4': 3, '5': 11, '6': '.Course', '10': 'previousClasses'},
    const {'1': 'preferredClasses', '3': 6, '4': 3, '5': 11, '6': '.Course', '10': 'preferredClasses'},
    const {'1': 'unpreferredClasses', '3': 7, '4': 3, '5': 11, '6': '.Course', '10': 'unpreferredClasses'},
    const {'1': 'preferredProfs', '3': 8, '4': 3, '5': 11, '6': '.Professor', '10': 'preferredProfs'},
    const {'1': 'unprefferedProfs', '3': 9, '4': 3, '5': 11, '6': '.Professor', '10': 'unprefferedProfs'},
  ],
};

/// Descriptor for `ScheduleRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List scheduleRequestDescriptor = $convert.base64Decode('Cg9TY2hlZHVsZVJlcXVlc3QSHAoFbWFqb3IYASABKAsyBi5NYWpvclIFbWFqb3ISGgoIc2VtZXN0ZXIYAiABKAlSCHNlbWVzdGVyEh4KCm1pbkNyZWRpdHMYAyABKAVSCm1pbkNyZWRpdHMSHgoKbWF4Q3JlZGl0cxgEIAEoBVIKbWF4Q3JlZGl0cxIxCg9wcmV2aW91c0NsYXNzZXMYBSADKAsyBy5Db3Vyc2VSD3ByZXZpb3VzQ2xhc3NlcxIzChBwcmVmZXJyZWRDbGFzc2VzGAYgAygLMgcuQ291cnNlUhBwcmVmZXJyZWRDbGFzc2VzEjcKEnVucHJlZmVycmVkQ2xhc3NlcxgHIAMoCzIHLkNvdXJzZVISdW5wcmVmZXJyZWRDbGFzc2VzEjIKDnByZWZlcnJlZFByb2ZzGAggAygLMgouUHJvZmVzc29yUg5wcmVmZXJyZWRQcm9mcxI2ChB1bnByZWZmZXJlZFByb2ZzGAkgAygLMgouUHJvZmVzc29yUhB1bnByZWZmZXJlZFByb2Zz');
@$core.Deprecated('Use majorRequestDescriptor instead')
const MajorRequest$json = const {
  '1': 'MajorRequest',
};

/// Descriptor for `MajorRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List majorRequestDescriptor = $convert.base64Decode('CgxNYWpvclJlcXVlc3Q=');
@$core.Deprecated('Use professorRequestDescriptor instead')
const ProfessorRequest$json = const {
  '1': 'ProfessorRequest',
};

/// Descriptor for `ProfessorRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List professorRequestDescriptor = $convert.base64Decode('ChBQcm9mZXNzb3JSZXF1ZXN0');
@$core.Deprecated('Use courseRequestDescriptor instead')
const CourseRequest$json = const {
  '1': 'CourseRequest',
};

/// Descriptor for `CourseRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List courseRequestDescriptor = $convert.base64Decode('Cg1Db3Vyc2VSZXF1ZXN0');
@$core.Deprecated('Use debugRequestDescriptor instead')
const DebugRequest$json = const {
  '1': 'DebugRequest',
  '2': const [
    const {'1': 'msg', '3': 1, '4': 1, '5': 9, '10': 'msg'},
  ],
};

/// Descriptor for `DebugRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List debugRequestDescriptor = $convert.base64Decode('CgxEZWJ1Z1JlcXVlc3QSEAoDbXNnGAEgASgJUgNtc2c=');
