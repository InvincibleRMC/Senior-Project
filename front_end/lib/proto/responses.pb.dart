///
//  Generated code. Do not modify.
//  source: proto/responses.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import 'data.pb.dart' as $2;

class CourseList extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'CourseList', createEmptyInstance: create)
    ..pc<$2.Course>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'courses', $pb.PbFieldType.PM, subBuilder: $2.Course.create)
    ..hasRequiredFields = false
  ;

  CourseList._() : super();
  factory CourseList({
    $core.Iterable<$2.Course>? courses,
  }) {
    final _result = create();
    if (courses != null) {
      _result.courses.addAll(courses);
    }
    return _result;
  }
  factory CourseList.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CourseList.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CourseList clone() => CourseList()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CourseList copyWith(void Function(CourseList) updates) => super.copyWith((message) => updates(message as CourseList)) as CourseList; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static CourseList create() => CourseList._();
  CourseList createEmptyInstance() => create();
  static $pb.PbList<CourseList> createRepeated() => $pb.PbList<CourseList>();
  @$core.pragma('dart2js:noInline')
  static CourseList getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CourseList>(create);
  static CourseList? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$2.Course> get courses => $_getList(0);
}

class ScheduleResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'ScheduleResponse', createEmptyInstance: create)
    ..m<$core.String, CourseList>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'courseMap', entryClassName: 'ScheduleResponse.CourseMapEntry', keyFieldType: $pb.PbFieldType.OS, valueFieldType: $pb.PbFieldType.OM, valueCreator: CourseList.create)
    ..hasRequiredFields = false
  ;

  ScheduleResponse._() : super();
  factory ScheduleResponse({
    $core.Map<$core.String, CourseList>? courseMap,
  }) {
    final _result = create();
    if (courseMap != null) {
      _result.courseMap.addAll(courseMap);
    }
    return _result;
  }
  factory ScheduleResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ScheduleResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ScheduleResponse clone() => ScheduleResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ScheduleResponse copyWith(void Function(ScheduleResponse) updates) => super.copyWith((message) => updates(message as ScheduleResponse)) as ScheduleResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ScheduleResponse create() => ScheduleResponse._();
  ScheduleResponse createEmptyInstance() => create();
  static $pb.PbList<ScheduleResponse> createRepeated() => $pb.PbList<ScheduleResponse>();
  @$core.pragma('dart2js:noInline')
  static ScheduleResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ScheduleResponse>(create);
  static ScheduleResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.Map<$core.String, CourseList> get courseMap => $_getMap(0);
}

class ProfessorResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'ProfessorResponse', createEmptyInstance: create)
    ..pc<$2.Professor>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'professors', $pb.PbFieldType.PM, subBuilder: $2.Professor.create)
    ..hasRequiredFields = false
  ;

  ProfessorResponse._() : super();
  factory ProfessorResponse({
    $core.Iterable<$2.Professor>? professors,
  }) {
    final _result = create();
    if (professors != null) {
      _result.professors.addAll(professors);
    }
    return _result;
  }
  factory ProfessorResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ProfessorResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ProfessorResponse clone() => ProfessorResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ProfessorResponse copyWith(void Function(ProfessorResponse) updates) => super.copyWith((message) => updates(message as ProfessorResponse)) as ProfessorResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ProfessorResponse create() => ProfessorResponse._();
  ProfessorResponse createEmptyInstance() => create();
  static $pb.PbList<ProfessorResponse> createRepeated() => $pb.PbList<ProfessorResponse>();
  @$core.pragma('dart2js:noInline')
  static ProfessorResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ProfessorResponse>(create);
  static ProfessorResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$2.Professor> get professors => $_getList(0);
}

class CourseResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'CourseResponse', createEmptyInstance: create)
    ..pc<$2.Course>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'courses', $pb.PbFieldType.PM, subBuilder: $2.Course.create)
    ..hasRequiredFields = false
  ;

  CourseResponse._() : super();
  factory CourseResponse({
    $core.Iterable<$2.Course>? courses,
  }) {
    final _result = create();
    if (courses != null) {
      _result.courses.addAll(courses);
    }
    return _result;
  }
  factory CourseResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CourseResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CourseResponse clone() => CourseResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CourseResponse copyWith(void Function(CourseResponse) updates) => super.copyWith((message) => updates(message as CourseResponse)) as CourseResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static CourseResponse create() => CourseResponse._();
  CourseResponse createEmptyInstance() => create();
  static $pb.PbList<CourseResponse> createRepeated() => $pb.PbList<CourseResponse>();
  @$core.pragma('dart2js:noInline')
  static CourseResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CourseResponse>(create);
  static CourseResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$2.Course> get courses => $_getList(0);
}

class DebugResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'DebugResponse', createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'msg')
    ..hasRequiredFields = false
  ;

  DebugResponse._() : super();
  factory DebugResponse({
    $core.String? msg,
  }) {
    final _result = create();
    if (msg != null) {
      _result.msg = msg;
    }
    return _result;
  }
  factory DebugResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory DebugResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  DebugResponse clone() => DebugResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  DebugResponse copyWith(void Function(DebugResponse) updates) => super.copyWith((message) => updates(message as DebugResponse)) as DebugResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static DebugResponse create() => DebugResponse._();
  DebugResponse createEmptyInstance() => create();
  static $pb.PbList<DebugResponse> createRepeated() => $pb.PbList<DebugResponse>();
  @$core.pragma('dart2js:noInline')
  static DebugResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<DebugResponse>(create);
  static DebugResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get msg => $_getSZ(0);
  @$pb.TagNumber(1)
  set msg($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasMsg() => $_has(0);
  @$pb.TagNumber(1)
  void clearMsg() => clearField(1);
}

class MajorResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'MajorResponse', createEmptyInstance: create)
    ..pc<$2.Major>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'majors', $pb.PbFieldType.PM, subBuilder: $2.Major.create)
    ..hasRequiredFields = false
  ;

  MajorResponse._() : super();
  factory MajorResponse({
    $core.Iterable<$2.Major>? majors,
  }) {
    final _result = create();
    if (majors != null) {
      _result.majors.addAll(majors);
    }
    return _result;
  }
  factory MajorResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory MajorResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  MajorResponse clone() => MajorResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  MajorResponse copyWith(void Function(MajorResponse) updates) => super.copyWith((message) => updates(message as MajorResponse)) as MajorResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static MajorResponse create() => MajorResponse._();
  MajorResponse createEmptyInstance() => create();
  static $pb.PbList<MajorResponse> createRepeated() => $pb.PbList<MajorResponse>();
  @$core.pragma('dart2js:noInline')
  static MajorResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<MajorResponse>(create);
  static MajorResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$2.Major> get majors => $_getList(0);
}

class NotificationResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'NotificationResponse', createEmptyInstance: create)
    ..aOB(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'success')
    ..hasRequiredFields = false
  ;

  NotificationResponse._() : super();
  factory NotificationResponse({
    $core.bool? success,
  }) {
    final _result = create();
    if (success != null) {
      _result.success = success;
    }
    return _result;
  }
  factory NotificationResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory NotificationResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  NotificationResponse clone() => NotificationResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  NotificationResponse copyWith(void Function(NotificationResponse) updates) => super.copyWith((message) => updates(message as NotificationResponse)) as NotificationResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static NotificationResponse create() => NotificationResponse._();
  NotificationResponse createEmptyInstance() => create();
  static $pb.PbList<NotificationResponse> createRepeated() => $pb.PbList<NotificationResponse>();
  @$core.pragma('dart2js:noInline')
  static NotificationResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<NotificationResponse>(create);
  static NotificationResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get success => $_getBF(0);
  @$pb.TagNumber(1)
  set success($core.bool v) { $_setBool(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasSuccess() => $_has(0);
  @$pb.TagNumber(1)
  void clearSuccess() => clearField(1);
}

