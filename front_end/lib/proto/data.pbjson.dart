///
//  Generated code. Do not modify.
//  source: proto/data.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,deprecated_member_use_from_same_package,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:core' as $core;
import 'dart:convert' as $convert;
import 'dart:typed_data' as $typed_data;
@$core.Deprecated('Use courseDescriptor instead')
const Course$json = const {
  '1': 'Course',
  '2': const [
    const {'1': 'id', '3': 1, '4': 1, '5': 13, '10': 'id'},
    const {'1': 'name', '3': 2, '4': 1, '5': 9, '10': 'name'},
    const {'1': 'semester', '3': 3, '4': 1, '5': 9, '10': 'semester'},
  ],
};

/// Descriptor for `Course`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List courseDescriptor = $convert.base64Decode('CgZDb3Vyc2USDgoCaWQYASABKA1SAmlkEhIKBG5hbWUYAiABKAlSBG5hbWUSGgoIc2VtZXN0ZXIYAyABKAlSCHNlbWVzdGVy');
@$core.Deprecated('Use courseListDescriptor instead')
const CourseList$json = const {
  '1': 'CourseList',
  '2': const [
    const {'1': 'courses', '3': 1, '4': 3, '5': 11, '6': '.Course', '10': 'courses'},
  ],
};

/// Descriptor for `CourseList`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List courseListDescriptor = $convert.base64Decode('CgpDb3Vyc2VMaXN0EiEKB2NvdXJzZXMYASADKAsyBy5Db3Vyc2VSB2NvdXJzZXM=');
@$core.Deprecated('Use majorDescriptor instead')
const Major$json = const {
  '1': 'Major',
  '2': const [
    const {'1': 'id', '3': 1, '4': 1, '5': 5, '10': 'id'},
    const {'1': 'name', '3': 2, '4': 1, '5': 9, '10': 'name'},
  ],
};

/// Descriptor for `Major`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List majorDescriptor = $convert.base64Decode('CgVNYWpvchIOCgJpZBgBIAEoBVICaWQSEgoEbmFtZRgCIAEoCVIEbmFtZQ==');
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
