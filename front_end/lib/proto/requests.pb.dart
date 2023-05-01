///
//  Generated code. Do not modify.
//  source: proto/requests.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import 'data.pb.dart' as $2;

export 'data.pb.dart';
class NotificationRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'NotificationRequest', createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'email')
    ..pc<$2.Course>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'classes', $pb.PbFieldType.PM, subBuilder: $2.Course.create)
    ..hasRequiredFields = false
  ;

  NotificationRequest._() : super();
  factory NotificationRequest({
    $core.String? email,
    $core.Iterable<$2.Course>? classes,
  }) {
    final _result = create();
    if (email != null) {
      _result.email = email;
    }
    if (classes != null) {
      _result.classes.addAll(classes);
    }
    return _result;
  }
  factory NotificationRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory NotificationRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  NotificationRequest clone() => NotificationRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  NotificationRequest copyWith(void Function(NotificationRequest) updates) => super.copyWith((message) => updates(message as NotificationRequest)) as NotificationRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static NotificationRequest create() => NotificationRequest._();
  NotificationRequest createEmptyInstance() => create();
  static $pb.PbList<NotificationRequest> createRepeated() => $pb.PbList<NotificationRequest>();
  @$core.pragma('dart2js:noInline')
  static NotificationRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<NotificationRequest>(create);
  static NotificationRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get email => $_getSZ(0);
  @$pb.TagNumber(1)
  set email($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasEmail() => $_has(0);
  @$pb.TagNumber(1)
  void clearEmail() => clearField(1);

  @$pb.TagNumber(2)
  $core.List<$2.Course> get classes => $_getList(1);
}

class ScheduleRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'ScheduleRequest', createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'school')
    ..pPS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'department')
    ..pPS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'semester')
    ..a<$core.int>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'minCredits', $pb.PbFieldType.O3, protoName: 'minCredits')
    ..a<$core.int>(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'maxCredits', $pb.PbFieldType.O3, protoName: 'maxCredits')
    ..pc<$2.Course>(6, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'previousClasses', $pb.PbFieldType.PM, protoName: 'previousClasses', subBuilder: $2.Course.create)
    ..pc<$2.Course>(7, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'preferredClasses', $pb.PbFieldType.PM, protoName: 'preferredClasses', subBuilder: $2.Course.create)
    ..pc<$2.Course>(8, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'unpreferredClasses', $pb.PbFieldType.PM, protoName: 'unpreferredClasses', subBuilder: $2.Course.create)
    ..pc<$2.Professor>(9, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'preferredProfs', $pb.PbFieldType.PM, protoName: 'preferredProfs', subBuilder: $2.Professor.create)
    ..pc<$2.Professor>(10, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'unprefferedProfs', $pb.PbFieldType.PM, protoName: 'unprefferedProfs', subBuilder: $2.Professor.create)
    ..hasRequiredFields = false
  ;

  ScheduleRequest._() : super();
  factory ScheduleRequest({
    $core.String? school,
    $core.Iterable<$core.String>? department,
    $core.Iterable<$core.String>? semester,
    $core.int? minCredits,
    $core.int? maxCredits,
    $core.Iterable<$2.Course>? previousClasses,
    $core.Iterable<$2.Course>? preferredClasses,
    $core.Iterable<$2.Course>? unpreferredClasses,
    $core.Iterable<$2.Professor>? preferredProfs,
    $core.Iterable<$2.Professor>? unprefferedProfs,
  }) {
    final _result = create();
    if (school != null) {
      _result.school = school;
    }
    if (department != null) {
      _result.department.addAll(department);
    }
    if (semester != null) {
      _result.semester.addAll(semester);
    }
    if (minCredits != null) {
      _result.minCredits = minCredits;
    }
    if (maxCredits != null) {
      _result.maxCredits = maxCredits;
    }
    if (previousClasses != null) {
      _result.previousClasses.addAll(previousClasses);
    }
    if (preferredClasses != null) {
      _result.preferredClasses.addAll(preferredClasses);
    }
    if (unpreferredClasses != null) {
      _result.unpreferredClasses.addAll(unpreferredClasses);
    }
    if (preferredProfs != null) {
      _result.preferredProfs.addAll(preferredProfs);
    }
    if (unprefferedProfs != null) {
      _result.unprefferedProfs.addAll(unprefferedProfs);
    }
    return _result;
  }
  factory ScheduleRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ScheduleRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ScheduleRequest clone() => ScheduleRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ScheduleRequest copyWith(void Function(ScheduleRequest) updates) => super.copyWith((message) => updates(message as ScheduleRequest)) as ScheduleRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ScheduleRequest create() => ScheduleRequest._();
  ScheduleRequest createEmptyInstance() => create();
  static $pb.PbList<ScheduleRequest> createRepeated() => $pb.PbList<ScheduleRequest>();
  @$core.pragma('dart2js:noInline')
  static ScheduleRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ScheduleRequest>(create);
  static ScheduleRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get school => $_getSZ(0);
  @$pb.TagNumber(1)
  set school($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasSchool() => $_has(0);
  @$pb.TagNumber(1)
  void clearSchool() => clearField(1);

  @$pb.TagNumber(2)
  $core.List<$core.String> get department => $_getList(1);

  @$pb.TagNumber(3)
  $core.List<$core.String> get semester => $_getList(2);

  @$pb.TagNumber(4)
  $core.int get minCredits => $_getIZ(3);
  @$pb.TagNumber(4)
  set minCredits($core.int v) { $_setSignedInt32(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasMinCredits() => $_has(3);
  @$pb.TagNumber(4)
  void clearMinCredits() => clearField(4);

  @$pb.TagNumber(5)
  $core.int get maxCredits => $_getIZ(4);
  @$pb.TagNumber(5)
  set maxCredits($core.int v) { $_setSignedInt32(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasMaxCredits() => $_has(4);
  @$pb.TagNumber(5)
  void clearMaxCredits() => clearField(5);

  @$pb.TagNumber(6)
  $core.List<$2.Course> get previousClasses => $_getList(5);

  @$pb.TagNumber(7)
  $core.List<$2.Course> get preferredClasses => $_getList(6);

  @$pb.TagNumber(8)
  $core.List<$2.Course> get unpreferredClasses => $_getList(7);

  @$pb.TagNumber(9)
  $core.List<$2.Professor> get preferredProfs => $_getList(8);

  @$pb.TagNumber(10)
  $core.List<$2.Professor> get unprefferedProfs => $_getList(9);
}

class MajorRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'MajorRequest', createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  MajorRequest._() : super();
  factory MajorRequest() => create();
  factory MajorRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory MajorRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  MajorRequest clone() => MajorRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  MajorRequest copyWith(void Function(MajorRequest) updates) => super.copyWith((message) => updates(message as MajorRequest)) as MajorRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static MajorRequest create() => MajorRequest._();
  MajorRequest createEmptyInstance() => create();
  static $pb.PbList<MajorRequest> createRepeated() => $pb.PbList<MajorRequest>();
  @$core.pragma('dart2js:noInline')
  static MajorRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<MajorRequest>(create);
  static MajorRequest? _defaultInstance;
}

class ProfessorRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'ProfessorRequest', createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  ProfessorRequest._() : super();
  factory ProfessorRequest() => create();
  factory ProfessorRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ProfessorRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ProfessorRequest clone() => ProfessorRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ProfessorRequest copyWith(void Function(ProfessorRequest) updates) => super.copyWith((message) => updates(message as ProfessorRequest)) as ProfessorRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ProfessorRequest create() => ProfessorRequest._();
  ProfessorRequest createEmptyInstance() => create();
  static $pb.PbList<ProfessorRequest> createRepeated() => $pb.PbList<ProfessorRequest>();
  @$core.pragma('dart2js:noInline')
  static ProfessorRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ProfessorRequest>(create);
  static ProfessorRequest? _defaultInstance;
}

class CourseRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'CourseRequest', createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  CourseRequest._() : super();
  factory CourseRequest() => create();
  factory CourseRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CourseRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CourseRequest clone() => CourseRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CourseRequest copyWith(void Function(CourseRequest) updates) => super.copyWith((message) => updates(message as CourseRequest)) as CourseRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static CourseRequest create() => CourseRequest._();
  CourseRequest createEmptyInstance() => create();
  static $pb.PbList<CourseRequest> createRepeated() => $pb.PbList<CourseRequest>();
  @$core.pragma('dart2js:noInline')
  static CourseRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CourseRequest>(create);
  static CourseRequest? _defaultInstance;
}

class DebugRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'DebugRequest', createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'msg')
    ..hasRequiredFields = false
  ;

  DebugRequest._() : super();
  factory DebugRequest({
    $core.String? msg,
  }) {
    final _result = create();
    if (msg != null) {
      _result.msg = msg;
    }
    return _result;
  }
  factory DebugRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory DebugRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  DebugRequest clone() => DebugRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  DebugRequest copyWith(void Function(DebugRequest) updates) => super.copyWith((message) => updates(message as DebugRequest)) as DebugRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static DebugRequest create() => DebugRequest._();
  DebugRequest createEmptyInstance() => create();
  static $pb.PbList<DebugRequest> createRepeated() => $pb.PbList<DebugRequest>();
  @$core.pragma('dart2js:noInline')
  static DebugRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<DebugRequest>(create);
  static DebugRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get msg => $_getSZ(0);
  @$pb.TagNumber(1)
  set msg($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasMsg() => $_has(0);
  @$pb.TagNumber(1)
  void clearMsg() => clearField(1);
}

