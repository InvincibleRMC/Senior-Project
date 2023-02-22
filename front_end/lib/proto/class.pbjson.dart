///
//  Generated code. Do not modify.
//  source: class.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,deprecated_member_use_from_same_package,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:core' as $core;
import 'dart:convert' as $convert;
import 'dart:typed_data' as $typed_data;
@$core.Deprecated('Use classDescriptor instead')
const Class$json = const {
  '1': 'Class',
  '2': const [
    const {'1': 'id', '3': 1, '4': 1, '5': 5, '10': 'id'},
    const {'1': 'name', '3': 2, '4': 1, '5': 9, '10': 'name'},
  ],
};

/// Descriptor for `Class`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List classDescriptor = $convert.base64Decode('CgVDbGFzcxIOCgJpZBgBIAEoBVICaWQSEgoEbmFtZRgCIAEoCVIEbmFtZQ==');
@$core.Deprecated('Use majorDescriptor instead')
const Major$json = const {
  '1': 'Major',
  '2': const [
    const {'1': 'id', '3': 1, '4': 1, '5': 5, '10': 'id'},
  ],
};

/// Descriptor for `Major`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List majorDescriptor = $convert.base64Decode('CgVNYWpvchIOCgJpZBgBIAEoBVICaWQ=');
@$core.Deprecated('Use professorDescriptor instead')
const Professor$json = const {
  '1': 'Professor',
  '2': const [
    const {'1': 'id', '3': 1, '4': 1, '5': 5, '10': 'id'},
    const {'1': 'first', '3': 2, '4': 1, '5': 9, '10': 'first'},
    const {'1': 'last', '3': 3, '4': 1, '5': 9, '10': 'last'},
  ],
};

/// Descriptor for `Professor`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List professorDescriptor = $convert.base64Decode('CglQcm9mZXNzb3ISDgoCaWQYASABKAVSAmlkEhQKBWZpcnN0GAIgASgJUgVmaXJzdBISCgRsYXN0GAMgASgJUgRsYXN0');
@$core.Deprecated('Use notificationRequestDescriptor instead')
const NotificationRequest$json = const {
  '1': 'NotificationRequest',
  '2': const [
    const {'1': 'email', '3': 1, '4': 1, '5': 9, '10': 'email'},
    const {'1': 'classes', '3': 2, '4': 3, '5': 11, '6': '.Class', '10': 'classes'},
  ],
};

/// Descriptor for `NotificationRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List notificationRequestDescriptor = $convert.base64Decode('ChNOb3RpZmljYXRpb25SZXF1ZXN0EhQKBWVtYWlsGAEgASgJUgVlbWFpbBIgCgdjbGFzc2VzGAIgAygLMgYuQ2xhc3NSB2NsYXNzZXM=');
@$core.Deprecated('Use scheduleRequestDescriptor instead')
const ScheduleRequest$json = const {
  '1': 'ScheduleRequest',
  '2': const [
    const {'1': 'major', '3': 1, '4': 1, '5': 9, '10': 'major'},
    const {'1': 'previousClasses', '3': 2, '4': 3, '5': 11, '6': '.Class', '10': 'previousClasses'},
    const {'1': 'preferredClasses', '3': 3, '4': 3, '5': 11, '6': '.Class', '10': 'preferredClasses'},
    const {'1': 'unpreferredClasses', '3': 4, '4': 3, '5': 11, '6': '.Class', '10': 'unpreferredClasses'},
    const {'1': 'preferredProfs', '3': 5, '4': 3, '5': 11, '6': '.Professor', '10': 'preferredProfs'},
    const {'1': 'unprefferedProfs', '3': 6, '4': 3, '5': 11, '6': '.Professor', '10': 'unprefferedProfs'},
  ],
};

/// Descriptor for `ScheduleRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List scheduleRequestDescriptor = $convert.base64Decode('Cg9TY2hlZHVsZVJlcXVlc3QSFAoFbWFqb3IYASABKAlSBW1ham9yEjAKD3ByZXZpb3VzQ2xhc3NlcxgCIAMoCzIGLkNsYXNzUg9wcmV2aW91c0NsYXNzZXMSMgoQcHJlZmVycmVkQ2xhc3NlcxgDIAMoCzIGLkNsYXNzUhBwcmVmZXJyZWRDbGFzc2VzEjYKEnVucHJlZmVycmVkQ2xhc3NlcxgEIAMoCzIGLkNsYXNzUhJ1bnByZWZlcnJlZENsYXNzZXMSMgoOcHJlZmVycmVkUHJvZnMYBSADKAsyCi5Qcm9mZXNzb3JSDnByZWZlcnJlZFByb2ZzEjYKEHVucHJlZmZlcmVkUHJvZnMYBiADKAsyCi5Qcm9mZXNzb3JSEHVucHJlZmZlcmVkUHJvZnM=');
@$core.Deprecated('Use scheduleResponseDescriptor instead')
const ScheduleResponse$json = const {
  '1': 'ScheduleResponse',
};

/// Descriptor for `ScheduleResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List scheduleResponseDescriptor = $convert.base64Decode('ChBTY2hlZHVsZVJlc3BvbnNl');
@$core.Deprecated('Use requestDescriptor instead')
const Request$json = const {
  '1': 'Request',
  '2': const [
    const {'1': 'sched', '3': 1, '4': 1, '5': 11, '6': '.ScheduleRequest', '9': 0, '10': 'sched', '17': true},
    const {'1': 'noti', '3': 2, '4': 1, '5': 11, '6': '.NotificationRequest', '9': 1, '10': 'noti', '17': true},
  ],
  '8': const [
    const {'1': '_sched'},
    const {'1': '_noti'},
  ],
};

/// Descriptor for `Request`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List requestDescriptor = $convert.base64Decode('CgdSZXF1ZXN0EisKBXNjaGVkGAEgASgLMhAuU2NoZWR1bGVSZXF1ZXN0SABSBXNjaGVkiAEBEi0KBG5vdGkYAiABKAsyFC5Ob3RpZmljYXRpb25SZXF1ZXN0SAFSBG5vdGmIAQFCCAoGX3NjaGVkQgcKBV9ub3Rp');
