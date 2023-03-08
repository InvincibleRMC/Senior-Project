///
//  Generated code. Do not modify.
//  source: proto/responses.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import 'data.pb.dart' as $0;

import 'responses.pbenum.dart';

export 'responses.pbenum.dart';

class ScheduleResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'ScheduleResponse', createEmptyInstance: create)
    ..pc<$0.Course>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'fall1', $pb.PbFieldType.PM, subBuilder: $0.Course.create)
    ..pc<$0.Course>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'spring1', $pb.PbFieldType.PM, subBuilder: $0.Course.create)
    ..pc<$0.Course>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'fall2', $pb.PbFieldType.PM, subBuilder: $0.Course.create)
    ..pc<$0.Course>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'spring2', $pb.PbFieldType.PM, subBuilder: $0.Course.create)
    ..pc<$0.Course>(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'fall3', $pb.PbFieldType.PM, subBuilder: $0.Course.create)
    ..pc<$0.Course>(6, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'spring3', $pb.PbFieldType.PM, subBuilder: $0.Course.create)
    ..pc<$0.Course>(7, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'fall4', $pb.PbFieldType.PM, subBuilder: $0.Course.create)
    ..pc<$0.Course>(8, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'spring4', $pb.PbFieldType.PM, subBuilder: $0.Course.create)
    ..hasRequiredFields = false
  ;

  ScheduleResponse._() : super();
  factory ScheduleResponse({
    $core.Iterable<$0.Course>? fall1,
    $core.Iterable<$0.Course>? spring1,
    $core.Iterable<$0.Course>? fall2,
    $core.Iterable<$0.Course>? spring2,
    $core.Iterable<$0.Course>? fall3,
    $core.Iterable<$0.Course>? spring3,
    $core.Iterable<$0.Course>? fall4,
    $core.Iterable<$0.Course>? spring4,
  }) {
    final _result = create();
    if (fall1 != null) {
      _result.fall1.addAll(fall1);
    }
    if (spring1 != null) {
      _result.spring1.addAll(spring1);
    }
    if (fall2 != null) {
      _result.fall2.addAll(fall2);
    }
    if (spring2 != null) {
      _result.spring2.addAll(spring2);
    }
    if (fall3 != null) {
      _result.fall3.addAll(fall3);
    }
    if (spring3 != null) {
      _result.spring3.addAll(spring3);
    }
    if (fall4 != null) {
      _result.fall4.addAll(fall4);
    }
    if (spring4 != null) {
      _result.spring4.addAll(spring4);
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
  $core.List<$0.Course> get fall1 => $_getList(0);

  @$pb.TagNumber(2)
  $core.List<$0.Course> get spring1 => $_getList(1);

  @$pb.TagNumber(3)
  $core.List<$0.Course> get fall2 => $_getList(2);

  @$pb.TagNumber(4)
  $core.List<$0.Course> get spring2 => $_getList(3);

  @$pb.TagNumber(5)
  $core.List<$0.Course> get fall3 => $_getList(4);

  @$pb.TagNumber(6)
  $core.List<$0.Course> get spring3 => $_getList(5);

  @$pb.TagNumber(7)
  $core.List<$0.Course> get fall4 => $_getList(6);

  @$pb.TagNumber(8)
  $core.List<$0.Course> get spring4 => $_getList(7);
}

class ProfessorResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'ProfessorResponse', createEmptyInstance: create)
    ..pc<$0.Professor>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'professors', $pb.PbFieldType.PM, subBuilder: $0.Professor.create)
    ..hasRequiredFields = false
  ;

  ProfessorResponse._() : super();
  factory ProfessorResponse({
    $core.Iterable<$0.Professor>? professors,
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
  $core.List<$0.Professor> get professors => $_getList(0);
}

class CourseResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'CourseResponse', createEmptyInstance: create)
    ..pc<$0.Course>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'courses', $pb.PbFieldType.PM, subBuilder: $0.Course.create)
    ..hasRequiredFields = false
  ;

  CourseResponse._() : super();
  factory CourseResponse({
    $core.Iterable<$0.Course>? courses,
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
  $core.List<$0.Course> get courses => $_getList(0);
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
    ..pc<$0.Major>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'majors', $pb.PbFieldType.PM, subBuilder: $0.Major.create)
    ..hasRequiredFields = false
  ;

  MajorResponse._() : super();
  factory MajorResponse({
    $core.Iterable<$0.Major>? majors,
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
  $core.List<$0.Major> get majors => $_getList(0);
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

enum Response_Msg {
  r1, 
  r2, 
  r3, 
  r4, 
  r5, 
  r6, 
  notSet
}

class Response extends $pb.GeneratedMessage {
  static const $core.Map<$core.int, Response_Msg> _Response_MsgByTag = {
    2 : Response_Msg.r1,
    3 : Response_Msg.r2,
    4 : Response_Msg.r3,
    5 : Response_Msg.r4,
    6 : Response_Msg.r5,
    7 : Response_Msg.r6,
    0 : Response_Msg.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'Response', createEmptyInstance: create)
    ..oo(0, [2, 3, 4, 5, 6, 7])
    ..e<ResponseType>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'type', $pb.PbFieldType.OE, defaultOrMaker: ResponseType.RES_SCHEDULE, valueOf: ResponseType.valueOf, enumValues: ResponseType.values)
    ..aOM<ScheduleResponse>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'r1', subBuilder: ScheduleResponse.create)
    ..aOM<ProfessorResponse>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'r2', subBuilder: ProfessorResponse.create)
    ..aOM<CourseResponse>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'r3', subBuilder: CourseResponse.create)
    ..aOM<DebugResponse>(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'r4', subBuilder: DebugResponse.create)
    ..aOM<MajorResponse>(6, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'r5', subBuilder: MajorResponse.create)
    ..aOM<NotificationResponse>(7, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'r6', subBuilder: NotificationResponse.create)
    ..a<$core.int>(8, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'id', $pb.PbFieldType.O3)
    ..hasRequiredFields = false
  ;

  Response._() : super();
  factory Response({
    ResponseType? type,
    ScheduleResponse? r1,
    ProfessorResponse? r2,
    CourseResponse? r3,
    DebugResponse? r4,
    MajorResponse? r5,
    NotificationResponse? r6,
    $core.int? id,
  }) {
    final _result = create();
    if (type != null) {
      _result.type = type;
    }
    if (r1 != null) {
      _result.r1 = r1;
    }
    if (r2 != null) {
      _result.r2 = r2;
    }
    if (r3 != null) {
      _result.r3 = r3;
    }
    if (r4 != null) {
      _result.r4 = r4;
    }
    if (r5 != null) {
      _result.r5 = r5;
    }
    if (r6 != null) {
      _result.r6 = r6;
    }
    if (id != null) {
      _result.id = id;
    }
    return _result;
  }
  factory Response.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Response.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Response clone() => Response()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Response copyWith(void Function(Response) updates) => super.copyWith((message) => updates(message as Response)) as Response; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Response create() => Response._();
  Response createEmptyInstance() => create();
  static $pb.PbList<Response> createRepeated() => $pb.PbList<Response>();
  @$core.pragma('dart2js:noInline')
  static Response getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Response>(create);
  static Response? _defaultInstance;

  Response_Msg whichMsg() => _Response_MsgByTag[$_whichOneof(0)]!;
  void clearMsg() => clearField($_whichOneof(0));

  @$pb.TagNumber(1)
  ResponseType get type => $_getN(0);
  @$pb.TagNumber(1)
  set type(ResponseType v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasType() => $_has(0);
  @$pb.TagNumber(1)
  void clearType() => clearField(1);

  @$pb.TagNumber(2)
  ScheduleResponse get r1 => $_getN(1);
  @$pb.TagNumber(2)
  set r1(ScheduleResponse v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasR1() => $_has(1);
  @$pb.TagNumber(2)
  void clearR1() => clearField(2);
  @$pb.TagNumber(2)
  ScheduleResponse ensureR1() => $_ensure(1);

  @$pb.TagNumber(3)
  ProfessorResponse get r2 => $_getN(2);
  @$pb.TagNumber(3)
  set r2(ProfessorResponse v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasR2() => $_has(2);
  @$pb.TagNumber(3)
  void clearR2() => clearField(3);
  @$pb.TagNumber(3)
  ProfessorResponse ensureR2() => $_ensure(2);

  @$pb.TagNumber(4)
  CourseResponse get r3 => $_getN(3);
  @$pb.TagNumber(4)
  set r3(CourseResponse v) { setField(4, v); }
  @$pb.TagNumber(4)
  $core.bool hasR3() => $_has(3);
  @$pb.TagNumber(4)
  void clearR3() => clearField(4);
  @$pb.TagNumber(4)
  CourseResponse ensureR3() => $_ensure(3);

  @$pb.TagNumber(5)
  DebugResponse get r4 => $_getN(4);
  @$pb.TagNumber(5)
  set r4(DebugResponse v) { setField(5, v); }
  @$pb.TagNumber(5)
  $core.bool hasR4() => $_has(4);
  @$pb.TagNumber(5)
  void clearR4() => clearField(5);
  @$pb.TagNumber(5)
  DebugResponse ensureR4() => $_ensure(4);

  @$pb.TagNumber(6)
  MajorResponse get r5 => $_getN(5);
  @$pb.TagNumber(6)
  set r5(MajorResponse v) { setField(6, v); }
  @$pb.TagNumber(6)
  $core.bool hasR5() => $_has(5);
  @$pb.TagNumber(6)
  void clearR5() => clearField(6);
  @$pb.TagNumber(6)
  MajorResponse ensureR5() => $_ensure(5);

  @$pb.TagNumber(7)
  NotificationResponse get r6 => $_getN(6);
  @$pb.TagNumber(7)
  set r6(NotificationResponse v) { setField(7, v); }
  @$pb.TagNumber(7)
  $core.bool hasR6() => $_has(6);
  @$pb.TagNumber(7)
  void clearR6() => clearField(7);
  @$pb.TagNumber(7)
  NotificationResponse ensureR6() => $_ensure(6);

  @$pb.TagNumber(8)
  $core.int get id => $_getIZ(7);
  @$pb.TagNumber(8)
  set id($core.int v) { $_setSignedInt32(7, v); }
  @$pb.TagNumber(8)
  $core.bool hasId() => $_has(7);
  @$pb.TagNumber(8)
  void clearId() => clearField(8);
}

