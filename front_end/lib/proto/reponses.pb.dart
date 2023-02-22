///
//  Generated code. Do not modify.
//  source: proto/reponses.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import 'data.pb.dart' as $0;

import 'reponses.pbenum.dart';

export 'reponses.pbenum.dart';

class ScheduleResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'ScheduleResponse', createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  ScheduleResponse._() : super();
  factory ScheduleResponse() => create();
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
}

class ProfessorListResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'ProfessorListResponse', createEmptyInstance: create)
    ..pc<$0.Professor>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'professors', $pb.PbFieldType.PM, subBuilder: $0.Professor.create)
    ..hasRequiredFields = false
  ;

  ProfessorListResponse._() : super();
  factory ProfessorListResponse({
    $core.Iterable<$0.Professor>? professors,
  }) {
    final _result = create();
    if (professors != null) {
      _result.professors.addAll(professors);
    }
    return _result;
  }
  factory ProfessorListResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ProfessorListResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ProfessorListResponse clone() => ProfessorListResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ProfessorListResponse copyWith(void Function(ProfessorListResponse) updates) => super.copyWith((message) => updates(message as ProfessorListResponse)) as ProfessorListResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ProfessorListResponse create() => ProfessorListResponse._();
  ProfessorListResponse createEmptyInstance() => create();
  static $pb.PbList<ProfessorListResponse> createRepeated() => $pb.PbList<ProfessorListResponse>();
  @$core.pragma('dart2js:noInline')
  static ProfessorListResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ProfessorListResponse>(create);
  static ProfessorListResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$0.Professor> get professors => $_getList(0);
}

class CourseListResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'CourseListResponse', createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'major')
    ..pc<$0.Course>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'courses', $pb.PbFieldType.PM, subBuilder: $0.Course.create)
    ..hasRequiredFields = false
  ;

  CourseListResponse._() : super();
  factory CourseListResponse({
    $core.String? major,
    $core.Iterable<$0.Course>? courses,
  }) {
    final _result = create();
    if (major != null) {
      _result.major = major;
    }
    if (courses != null) {
      _result.courses.addAll(courses);
    }
    return _result;
  }
  factory CourseListResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CourseListResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CourseListResponse clone() => CourseListResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CourseListResponse copyWith(void Function(CourseListResponse) updates) => super.copyWith((message) => updates(message as CourseListResponse)) as CourseListResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static CourseListResponse create() => CourseListResponse._();
  CourseListResponse createEmptyInstance() => create();
  static $pb.PbList<CourseListResponse> createRepeated() => $pb.PbList<CourseListResponse>();
  @$core.pragma('dart2js:noInline')
  static CourseListResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CourseListResponse>(create);
  static CourseListResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get major => $_getSZ(0);
  @$pb.TagNumber(1)
  set major($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasMajor() => $_has(0);
  @$pb.TagNumber(1)
  void clearMajor() => clearField(1);

  @$pb.TagNumber(2)
  $core.List<$0.Course> get courses => $_getList(1);
}

enum Response_Msg {
  r1, 
  r2, 
  r3, 
  notSet
}

class Response extends $pb.GeneratedMessage {
  static const $core.Map<$core.int, Response_Msg> _Response_MsgByTag = {
    2 : Response_Msg.r1,
    3 : Response_Msg.r2,
    4 : Response_Msg.r3,
    0 : Response_Msg.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'Response', createEmptyInstance: create)
    ..oo(0, [2, 3, 4])
    ..e<Response_ResponseType>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'type', $pb.PbFieldType.OE, defaultOrMaker: Response_ResponseType.CourseList, valueOf: Response_ResponseType.valueOf, enumValues: Response_ResponseType.values)
    ..aOM<ScheduleResponse>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'r1', subBuilder: ScheduleResponse.create)
    ..aOM<ProfessorListResponse>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'r2', subBuilder: ProfessorListResponse.create)
    ..aOM<CourseListResponse>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'r3', subBuilder: CourseListResponse.create)
    ..hasRequiredFields = false
  ;

  Response._() : super();
  factory Response({
    Response_ResponseType? type,
    ScheduleResponse? r1,
    ProfessorListResponse? r2,
    CourseListResponse? r3,
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
  Response_ResponseType get type => $_getN(0);
  @$pb.TagNumber(1)
  set type(Response_ResponseType v) { setField(1, v); }
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
  ProfessorListResponse get r2 => $_getN(2);
  @$pb.TagNumber(3)
  set r2(ProfessorListResponse v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasR2() => $_has(2);
  @$pb.TagNumber(3)
  void clearR2() => clearField(3);
  @$pb.TagNumber(3)
  ProfessorListResponse ensureR2() => $_ensure(2);

  @$pb.TagNumber(4)
  CourseListResponse get r3 => $_getN(3);
  @$pb.TagNumber(4)
  set r3(CourseListResponse v) { setField(4, v); }
  @$pb.TagNumber(4)
  $core.bool hasR3() => $_has(3);
  @$pb.TagNumber(4)
  void clearR3() => clearField(4);
  @$pb.TagNumber(4)
  CourseListResponse ensureR3() => $_ensure(3);
}

