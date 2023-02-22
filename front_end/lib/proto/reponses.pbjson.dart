///
//  Generated code. Do not modify.
//  source: proto/reponses.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,deprecated_member_use_from_same_package,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:core' as $core;
import 'dart:convert' as $convert;
import 'dart:typed_data' as $typed_data;
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
@$core.Deprecated('Use responseDescriptor instead')
const Response$json = const {
  '1': 'Response',
  '2': const [
    const {'1': 'type', '3': 1, '4': 1, '5': 14, '6': '.Response.ResponseType', '10': 'type'},
    const {'1': 'r1', '3': 2, '4': 1, '5': 11, '6': '.ScheduleResponse', '9': 0, '10': 'r1'},
    const {'1': 'r2', '3': 3, '4': 1, '5': 11, '6': '.ProfessorListResponse', '9': 0, '10': 'r2'},
    const {'1': 'r3', '3': 4, '4': 1, '5': 11, '6': '.CourseListResponse', '9': 0, '10': 'r3'},
  ],
  '4': const [Response_ResponseType$json],
  '8': const [
    const {'1': 'msg'},
  ],
};

@$core.Deprecated('Use responseDescriptor instead')
const Response_ResponseType$json = const {
  '1': 'ResponseType',
  '2': const [
    const {'1': 'CourseList', '2': 0},
    const {'1': 'ProfessorList', '2': 1},
    const {'1': 'Schedule', '2': 2},
  ],
};

/// Descriptor for `Response`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List responseDescriptor = $convert.base64Decode('CghSZXNwb25zZRIqCgR0eXBlGAEgASgOMhYuUmVzcG9uc2UuUmVzcG9uc2VUeXBlUgR0eXBlEiMKAnIxGAIgASgLMhEuU2NoZWR1bGVSZXNwb25zZUgAUgJyMRIoCgJyMhgDIAEoCzIWLlByb2Zlc3Nvckxpc3RSZXNwb25zZUgAUgJyMhIlCgJyMxgEIAEoCzITLkNvdXJzZUxpc3RSZXNwb25zZUgAUgJyMyI/CgxSZXNwb25zZVR5cGUSDgoKQ291cnNlTGlzdBAAEhEKDVByb2Zlc3Nvckxpc3QQARIMCghTY2hlZHVsZRACQgUKA21zZw==');
