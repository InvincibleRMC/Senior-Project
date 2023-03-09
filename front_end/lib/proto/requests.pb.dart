///
//  Generated code. Do not modify.
//  source: proto/requests.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import 'data.pb.dart' as $2;

import 'requests.pbenum.dart';

export 'data.pb.dart';
export 'requests.pbenum.dart';

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
    ..aOM<$2.Major>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'major', subBuilder: $2.Major.create)
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'semester')
    ..a<$core.int>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'minCredits', $pb.PbFieldType.O3, protoName: 'minCredits')
    ..a<$core.int>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'maxCredits', $pb.PbFieldType.O3, protoName: 'maxCredits')
    ..pc<$2.Course>(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'previousClasses', $pb.PbFieldType.PM, protoName: 'previousClasses', subBuilder: $2.Course.create)
    ..pc<$2.Course>(6, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'preferredClasses', $pb.PbFieldType.PM, protoName: 'preferredClasses', subBuilder: $2.Course.create)
    ..pc<$2.Course>(7, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'unpreferredClasses', $pb.PbFieldType.PM, protoName: 'unpreferredClasses', subBuilder: $2.Course.create)
    ..pc<$2.Professor>(8, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'preferredProfs', $pb.PbFieldType.PM, protoName: 'preferredProfs', subBuilder: $2.Professor.create)
    ..pc<$2.Professor>(9, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'unprefferedProfs', $pb.PbFieldType.PM, protoName: 'unprefferedProfs', subBuilder: $2.Professor.create)
    ..hasRequiredFields = false
  ;

  ScheduleRequest._() : super();
  factory ScheduleRequest({
    $2.Major? major,
    $core.String? semester,
    $core.int? minCredits,
    $core.int? maxCredits,
    $core.Iterable<$2.Course>? previousClasses,
    $core.Iterable<$2.Course>? preferredClasses,
    $core.Iterable<$2.Course>? unpreferredClasses,
    $core.Iterable<$2.Professor>? preferredProfs,
    $core.Iterable<$2.Professor>? unprefferedProfs,
  }) {
    final _result = create();
    if (major != null) {
      _result.major = major;
    }
    if (semester != null) {
      _result.semester = semester;
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
  $2.Major get major => $_getN(0);
  @$pb.TagNumber(1)
  set major($2.Major v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasMajor() => $_has(0);
  @$pb.TagNumber(1)
  void clearMajor() => clearField(1);
  @$pb.TagNumber(1)
  $2.Major ensureMajor() => $_ensure(0);

  @$pb.TagNumber(2)
  $core.String get semester => $_getSZ(1);
  @$pb.TagNumber(2)
  set semester($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasSemester() => $_has(1);
  @$pb.TagNumber(2)
  void clearSemester() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get minCredits => $_getIZ(2);
  @$pb.TagNumber(3)
  set minCredits($core.int v) { $_setSignedInt32(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasMinCredits() => $_has(2);
  @$pb.TagNumber(3)
  void clearMinCredits() => clearField(3);

  @$pb.TagNumber(4)
  $core.int get maxCredits => $_getIZ(3);
  @$pb.TagNumber(4)
  set maxCredits($core.int v) { $_setSignedInt32(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasMaxCredits() => $_has(3);
  @$pb.TagNumber(4)
  void clearMaxCredits() => clearField(4);

  @$pb.TagNumber(5)
  $core.List<$2.Course> get previousClasses => $_getList(4);

  @$pb.TagNumber(6)
  $core.List<$2.Course> get preferredClasses => $_getList(5);

  @$pb.TagNumber(7)
  $core.List<$2.Course> get unpreferredClasses => $_getList(6);

  @$pb.TagNumber(8)
  $core.List<$2.Professor> get preferredProfs => $_getList(7);

  @$pb.TagNumber(9)
  $core.List<$2.Professor> get unprefferedProfs => $_getList(8);
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

enum Request_Msg {
  r1, 
  r2, 
  r3, 
  r4, 
  r5, 
  r6, 
  notSet
}

class Request extends $pb.GeneratedMessage {
  static const $core.Map<$core.int, Request_Msg> _Request_MsgByTag = {
    2 : Request_Msg.r1,
    3 : Request_Msg.r2,
    4 : Request_Msg.r3,
    5 : Request_Msg.r4,
    6 : Request_Msg.r5,
    7 : Request_Msg.r6,
    0 : Request_Msg.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'Request', createEmptyInstance: create)
    ..oo(0, [2, 3, 4, 5, 6, 7])
    ..e<RequestType>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'type', $pb.PbFieldType.OE, defaultOrMaker: RequestType.REQ_SCHEDULE, valueOf: RequestType.valueOf, enumValues: RequestType.values)
    ..aOM<ScheduleRequest>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'r1', subBuilder: ScheduleRequest.create)
    ..aOM<NotificationRequest>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'r2', subBuilder: NotificationRequest.create)
    ..aOM<ProfessorRequest>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'r3', subBuilder: ProfessorRequest.create)
    ..aOM<CourseRequest>(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'r4', subBuilder: CourseRequest.create)
    ..aOM<DebugRequest>(6, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'r5', subBuilder: DebugRequest.create)
    ..aOM<MajorRequest>(7, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'r6', subBuilder: MajorRequest.create)
    ..a<$core.int>(8, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'id', $pb.PbFieldType.O3)
    ..hasRequiredFields = false
  ;

  Request._() : super();
  factory Request({
    RequestType? type,
    ScheduleRequest? r1,
    NotificationRequest? r2,
    ProfessorRequest? r3,
    CourseRequest? r4,
    DebugRequest? r5,
    MajorRequest? r6,
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
  factory Request.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Request.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Request clone() => Request()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Request copyWith(void Function(Request) updates) => super.copyWith((message) => updates(message as Request)) as Request; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Request create() => Request._();
  Request createEmptyInstance() => create();
  static $pb.PbList<Request> createRepeated() => $pb.PbList<Request>();
  @$core.pragma('dart2js:noInline')
  static Request getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Request>(create);
  static Request? _defaultInstance;

  Request_Msg whichMsg() => _Request_MsgByTag[$_whichOneof(0)]!;
  void clearMsg() => clearField($_whichOneof(0));

  @$pb.TagNumber(1)
  RequestType get type => $_getN(0);
  @$pb.TagNumber(1)
  set type(RequestType v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasType() => $_has(0);
  @$pb.TagNumber(1)
  void clearType() => clearField(1);

  @$pb.TagNumber(2)
  ScheduleRequest get r1 => $_getN(1);
  @$pb.TagNumber(2)
  set r1(ScheduleRequest v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasR1() => $_has(1);
  @$pb.TagNumber(2)
  void clearR1() => clearField(2);
  @$pb.TagNumber(2)
  ScheduleRequest ensureR1() => $_ensure(1);

  @$pb.TagNumber(3)
  NotificationRequest get r2 => $_getN(2);
  @$pb.TagNumber(3)
  set r2(NotificationRequest v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasR2() => $_has(2);
  @$pb.TagNumber(3)
  void clearR2() => clearField(3);
  @$pb.TagNumber(3)
  NotificationRequest ensureR2() => $_ensure(2);

  @$pb.TagNumber(4)
  ProfessorRequest get r3 => $_getN(3);
  @$pb.TagNumber(4)
  set r3(ProfessorRequest v) { setField(4, v); }
  @$pb.TagNumber(4)
  $core.bool hasR3() => $_has(3);
  @$pb.TagNumber(4)
  void clearR3() => clearField(4);
  @$pb.TagNumber(4)
  ProfessorRequest ensureR3() => $_ensure(3);

  @$pb.TagNumber(5)
  CourseRequest get r4 => $_getN(4);
  @$pb.TagNumber(5)
  set r4(CourseRequest v) { setField(5, v); }
  @$pb.TagNumber(5)
  $core.bool hasR4() => $_has(4);
  @$pb.TagNumber(5)
  void clearR4() => clearField(5);
  @$pb.TagNumber(5)
  CourseRequest ensureR4() => $_ensure(4);

  @$pb.TagNumber(6)
  DebugRequest get r5 => $_getN(5);
  @$pb.TagNumber(6)
  set r5(DebugRequest v) { setField(6, v); }
  @$pb.TagNumber(6)
  $core.bool hasR5() => $_has(5);
  @$pb.TagNumber(6)
  void clearR5() => clearField(6);
  @$pb.TagNumber(6)
  DebugRequest ensureR5() => $_ensure(5);

  @$pb.TagNumber(7)
  MajorRequest get r6 => $_getN(6);
  @$pb.TagNumber(7)
  set r6(MajorRequest v) { setField(7, v); }
  @$pb.TagNumber(7)
  $core.bool hasR6() => $_has(6);
  @$pb.TagNumber(7)
  void clearR6() => clearField(7);
  @$pb.TagNumber(7)
  MajorRequest ensureR6() => $_ensure(6);

  @$pb.TagNumber(8)
  $core.int get id => $_getIZ(7);
  @$pb.TagNumber(8)
  set id($core.int v) { $_setSignedInt32(7, v); }
  @$pb.TagNumber(8)
  $core.bool hasId() => $_has(7);
  @$pb.TagNumber(8)
  void clearId() => clearField(8);
}

