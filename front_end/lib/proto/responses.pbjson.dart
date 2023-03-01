///
//  Generated code. Do not modify.
//  source: proto/responses.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,deprecated_member_use_from_same_package,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:core' as $core;
import 'dart:convert' as $convert;
import 'dart:typed_data' as $typed_data;
@$core.Deprecated('Use responseTypeDescriptor instead')
const ResponseType$json = const {
  '1': 'ResponseType',
  '2': const [
    const {'1': 'RES_SCHEDULE', '2': 0},
    const {'1': 'RES_PROFS', '2': 1},
    const {'1': 'RES_COURSES', '2': 2},
    const {'1': 'RES_DEBUG', '2': 3},
    const {'1': 'RES_MAJOR', '2': 4},
    const {'1': 'RES_NOTI', '2': 5},
  ],
};

/// Descriptor for `ResponseType`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List responseTypeDescriptor = $convert.base64Decode('CgxSZXNwb25zZVR5cGUSEAoMUkVTX1NDSEVEVUxFEAASDQoJUkVTX1BST0ZTEAESDwoLUkVTX0NPVVJTRVMQAhINCglSRVNfREVCVUcQAxINCglSRVNfTUFKT1IQBBIMCghSRVNfTk9USRAF');
@$core.Deprecated('Use scheduleResponseDescriptor instead')
const ScheduleResponse$json = const {
  '1': 'ScheduleResponse',
};

/// Descriptor for `ScheduleResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List scheduleResponseDescriptor = $convert.base64Decode('ChBTY2hlZHVsZVJlc3BvbnNl');
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
@$core.Deprecated('Use responseDescriptor instead')
const Response$json = const {
  '1': 'Response',
  '2': const [
    const {'1': 'type', '3': 1, '4': 1, '5': 14, '6': '.ResponseType', '10': 'type'},
    const {'1': 'r1', '3': 2, '4': 1, '5': 11, '6': '.ScheduleResponse', '9': 0, '10': 'r1'},
    const {'1': 'r2', '3': 3, '4': 1, '5': 11, '6': '.ProfessorResponse', '9': 0, '10': 'r2'},
    const {'1': 'r3', '3': 4, '4': 1, '5': 11, '6': '.CourseResponse', '9': 0, '10': 'r3'},
    const {'1': 'r4', '3': 5, '4': 1, '5': 11, '6': '.DebugResponse', '9': 0, '10': 'r4'},
    const {'1': 'r5', '3': 6, '4': 1, '5': 11, '6': '.MajorResponse', '9': 0, '10': 'r5'},
    const {'1': 'r6', '3': 7, '4': 1, '5': 11, '6': '.NotificationResponse', '9': 0, '10': 'r6'},
  ],
  '8': const [
    const {'1': 'msg'},
  ],
};

/// Descriptor for `Response`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List responseDescriptor = $convert.base64Decode('CghSZXNwb25zZRIhCgR0eXBlGAEgASgOMg0uUmVzcG9uc2VUeXBlUgR0eXBlEiMKAnIxGAIgASgLMhEuU2NoZWR1bGVSZXNwb25zZUgAUgJyMRIkCgJyMhgDIAEoCzISLlByb2Zlc3NvclJlc3BvbnNlSABSAnIyEiEKAnIzGAQgASgLMg8uQ291cnNlUmVzcG9uc2VIAFICcjMSIAoCcjQYBSABKAsyDi5EZWJ1Z1Jlc3BvbnNlSABSAnI0EiAKAnI1GAYgASgLMg4uTWFqb3JSZXNwb25zZUgAUgJyNRInCgJyNhgHIAEoCzIVLk5vdGlmaWNhdGlvblJlc3BvbnNlSABSAnI2QgUKA21zZw==');
