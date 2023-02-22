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
    const {'1': 'RES_COURSES', '2': 0},
    const {'1': 'RES_PROFS', '2': 1},
    const {'1': 'RES_SCHEDULE', '2': 2},
    const {'1': 'RES_DEBUG', '2': 3},
  ],
};

/// Descriptor for `ResponseType`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List responseTypeDescriptor = $convert.base64Decode('CgxSZXNwb25zZVR5cGUSDwoLUkVTX0NPVVJTRVMQABINCglSRVNfUFJPRlMQARIQCgxSRVNfU0NIRURVTEUQAhINCglSRVNfREVCVUcQAw==');
@$core.Deprecated('Use scheduleResponseDescriptor instead')
const ScheduleResponse$json = const {
  '1': 'ScheduleResponse',
};

/// Descriptor for `ScheduleResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List scheduleResponseDescriptor = $convert.base64Decode('ChBTY2hlZHVsZVJlc3BvbnNl');
@$core.Deprecated('Use professorListResponseDescriptor instead')
const ProfessorListResponse$json = const {
  '1': 'ProfessorListResponse',
  '2': const [
    const {'1': 'professors', '3': 1, '4': 3, '5': 11, '6': '.Professor', '10': 'professors'},
  ],
};

/// Descriptor for `ProfessorListResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List professorListResponseDescriptor = $convert.base64Decode('ChVQcm9mZXNzb3JMaXN0UmVzcG9uc2USKgoKcHJvZmVzc29ycxgBIAMoCzIKLlByb2Zlc3NvclIKcHJvZmVzc29ycw==');
@$core.Deprecated('Use courseListResponseDescriptor instead')
const CourseListResponse$json = const {
  '1': 'CourseListResponse',
  '2': const [
    const {'1': 'major', '3': 1, '4': 1, '5': 9, '9': 0, '10': 'major', '17': true},
    const {'1': 'courses', '3': 2, '4': 3, '5': 11, '6': '.Course', '10': 'courses'},
  ],
  '8': const [
    const {'1': '_major'},
  ],
};

/// Descriptor for `CourseListResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List courseListResponseDescriptor = $convert.base64Decode('ChJDb3Vyc2VMaXN0UmVzcG9uc2USGQoFbWFqb3IYASABKAlIAFIFbWFqb3KIAQESIQoHY291cnNlcxgCIAMoCzIHLkNvdXJzZVIHY291cnNlc0IICgZfbWFqb3I=');
@$core.Deprecated('Use debugResponseDescriptor instead')
const DebugResponse$json = const {
  '1': 'DebugResponse',
  '2': const [
    const {'1': 'msg', '3': 1, '4': 1, '5': 9, '10': 'msg'},
  ],
};

/// Descriptor for `DebugResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List debugResponseDescriptor = $convert.base64Decode('Cg1EZWJ1Z1Jlc3BvbnNlEhAKA21zZxgBIAEoCVIDbXNn');
@$core.Deprecated('Use responseDescriptor instead')
const Response$json = const {
  '1': 'Response',
  '2': const [
    const {'1': 'type', '3': 1, '4': 1, '5': 14, '6': '.ResponseType', '10': 'type'},
    const {'1': 'r1', '3': 2, '4': 1, '5': 11, '6': '.ScheduleResponse', '9': 0, '10': 'r1'},
    const {'1': 'r2', '3': 3, '4': 1, '5': 11, '6': '.ProfessorListResponse', '9': 0, '10': 'r2'},
    const {'1': 'r3', '3': 4, '4': 1, '5': 11, '6': '.CourseListResponse', '9': 0, '10': 'r3'},
    const {'1': 'r4', '3': 5, '4': 1, '5': 11, '6': '.DebugResponse', '9': 0, '10': 'r4'},
  ],
  '8': const [
    const {'1': 'msg'},
  ],
};

/// Descriptor for `Response`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List responseDescriptor = $convert.base64Decode('CghSZXNwb25zZRIhCgR0eXBlGAEgASgOMg0uUmVzcG9uc2VUeXBlUgR0eXBlEiMKAnIxGAIgASgLMhEuU2NoZWR1bGVSZXNwb25zZUgAUgJyMRIoCgJyMhgDIAEoCzIWLlByb2Zlc3Nvckxpc3RSZXNwb25zZUgAUgJyMhIlCgJyMxgEIAEoCzITLkNvdXJzZUxpc3RSZXNwb25zZUgAUgJyMxIgCgJyNBgFIAEoCzIOLkRlYnVnUmVzcG9uc2VIAFICcjRCBQoDbXNn');
