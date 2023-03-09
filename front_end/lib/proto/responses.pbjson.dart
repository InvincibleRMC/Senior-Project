///
//  Generated code. Do not modify.
//  source: proto/responses.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,deprecated_member_use_from_same_package,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:core' as $core;
import 'dart:convert' as $convert;
import 'dart:typed_data' as $typed_data;
@$core.Deprecated('Use courseListDescriptor instead')
const CourseList$json = const {
  '1': 'CourseList',
  '2': const [
    const {'1': 'courses', '3': 1, '4': 3, '5': 11, '6': '.Course', '10': 'courses'},
  ],
};

/// Descriptor for `CourseList`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List courseListDescriptor = $convert.base64Decode('CgpDb3Vyc2VMaXN0EiEKB2NvdXJzZXMYASADKAsyBy5Db3Vyc2VSB2NvdXJzZXM=');
@$core.Deprecated('Use scheduleResponseDescriptor instead')
const ScheduleResponse$json = const {
  '1': 'ScheduleResponse',
  '2': const [
    const {'1': 'course_map', '3': 1, '4': 3, '5': 11, '6': '.ScheduleResponse.CourseMapEntry', '10': 'courseMap'},
  ],
  '3': const [ScheduleResponse_CourseMapEntry$json],
};

@$core.Deprecated('Use scheduleResponseDescriptor instead')
const ScheduleResponse_CourseMapEntry$json = const {
  '1': 'CourseMapEntry',
  '2': const [
    const {'1': 'key', '3': 1, '4': 1, '5': 9, '10': 'key'},
    const {'1': 'value', '3': 2, '4': 1, '5': 11, '6': '.CourseList', '10': 'value'},
  ],
  '7': const {'7': true},
};

/// Descriptor for `ScheduleResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List scheduleResponseDescriptor = $convert.base64Decode('ChBTY2hlZHVsZVJlc3BvbnNlEj8KCmNvdXJzZV9tYXAYASADKAsyIC5TY2hlZHVsZVJlc3BvbnNlLkNvdXJzZU1hcEVudHJ5Ugljb3Vyc2VNYXAaSQoOQ291cnNlTWFwRW50cnkSEAoDa2V5GAEgASgJUgNrZXkSIQoFdmFsdWUYAiABKAsyCy5Db3Vyc2VMaXN0UgV2YWx1ZToCOAE=');
@$core.Deprecated('Use professorResponseDescriptor instead')
const ProfessorResponse$json = const {
  '1': 'ProfessorResponse',
  '2': const [
    const {'1': 'professors', '3': 1, '4': 3, '5': 11, '6': '.Professor', '10': 'professors'},
  ],
};

/// Descriptor for `ProfessorResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List professorResponseDescriptor = $convert.base64Decode('ChFQcm9mZXNzb3JSZXNwb25zZRIqCgpwcm9mZXNzb3JzGAEgAygLMgouUHJvZmVzc29yUgpwcm9mZXNzb3Jz');
@$core.Deprecated('Use courseResponseDescriptor instead')
const CourseResponse$json = const {
  '1': 'CourseResponse',
  '2': const [
    const {'1': 'courses', '3': 1, '4': 3, '5': 11, '6': '.Course', '10': 'courses'},
  ],
};

/// Descriptor for `CourseResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List courseResponseDescriptor = $convert.base64Decode('Cg5Db3Vyc2VSZXNwb25zZRIhCgdjb3Vyc2VzGAEgAygLMgcuQ291cnNlUgdjb3Vyc2Vz');
@$core.Deprecated('Use debugResponseDescriptor instead')
const DebugResponse$json = const {
  '1': 'DebugResponse',
  '2': const [
    const {'1': 'msg', '3': 1, '4': 1, '5': 9, '10': 'msg'},
  ],
};

/// Descriptor for `DebugResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List debugResponseDescriptor = $convert.base64Decode('Cg1EZWJ1Z1Jlc3BvbnNlEhAKA21zZxgBIAEoCVIDbXNn');
@$core.Deprecated('Use majorResponseDescriptor instead')
const MajorResponse$json = const {
  '1': 'MajorResponse',
  '2': const [
    const {'1': 'majors', '3': 1, '4': 3, '5': 11, '6': '.Major', '10': 'majors'},
  ],
};

/// Descriptor for `MajorResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List majorResponseDescriptor = $convert.base64Decode('Cg1NYWpvclJlc3BvbnNlEh4KBm1ham9ycxgBIAMoCzIGLk1ham9yUgZtYWpvcnM=');
@$core.Deprecated('Use notificationResponseDescriptor instead')
const NotificationResponse$json = const {
  '1': 'NotificationResponse',
  '2': const [
    const {'1': 'success', '3': 1, '4': 1, '5': 8, '10': 'success'},
  ],
};

/// Descriptor for `NotificationResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List notificationResponseDescriptor = $convert.base64Decode('ChROb3RpZmljYXRpb25SZXNwb25zZRIYCgdzdWNjZXNzGAEgASgIUgdzdWNjZXNz');
