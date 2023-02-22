///
//  Generated code. Do not modify.
//  source: class.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class Class extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'Class', createEmptyInstance: create)
    ..a<$core.int>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'id', $pb.PbFieldType.O3)
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'name')
    ..hasRequiredFields = false
  ;

  Class._() : super();
  factory Class({
    $core.int? id,
    $core.String? name,
  }) {
    final _result = create();
    if (id != null) {
      _result.id = id;
    }
    if (name != null) {
      _result.name = name;
    }
    return _result;
  }
  factory Class.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Class.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Class clone() => Class()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Class copyWith(void Function(Class) updates) => super.copyWith((message) => updates(message as Class)) as Class; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Class create() => Class._();
  Class createEmptyInstance() => create();
  static $pb.PbList<Class> createRepeated() => $pb.PbList<Class>();
  @$core.pragma('dart2js:noInline')
  static Class getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Class>(create);
  static Class? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get id => $_getIZ(0);
  @$pb.TagNumber(1)
  set id($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get name => $_getSZ(1);
  @$pb.TagNumber(2)
  set name($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasName() => $_has(1);
  @$pb.TagNumber(2)
  void clearName() => clearField(2);
}

class Major extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'Major', createEmptyInstance: create)
    ..a<$core.int>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'id', $pb.PbFieldType.O3)
    ..hasRequiredFields = false
  ;

  Major._() : super();
  factory Major({
    $core.int? id,
  }) {
    final _result = create();
    if (id != null) {
      _result.id = id;
    }
    return _result;
  }
  factory Major.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Major.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Major clone() => Major()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Major copyWith(void Function(Major) updates) => super.copyWith((message) => updates(message as Major)) as Major; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Major create() => Major._();
  Major createEmptyInstance() => create();
  static $pb.PbList<Major> createRepeated() => $pb.PbList<Major>();
  @$core.pragma('dart2js:noInline')
  static Major getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Major>(create);
  static Major? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get id => $_getIZ(0);
  @$pb.TagNumber(1)
  set id($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);
}

class Professor extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'Professor', createEmptyInstance: create)
    ..a<$core.int>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'id', $pb.PbFieldType.O3)
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'first')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'last')
    ..hasRequiredFields = false
  ;

  Professor._() : super();
  factory Professor({
    $core.int? id,
    $core.String? first,
    $core.String? last,
  }) {
    final _result = create();
    if (id != null) {
      _result.id = id;
    }
    if (first != null) {
      _result.first = first;
    }
    if (last != null) {
      _result.last = last;
    }
    return _result;
  }
  factory Professor.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Professor.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Professor clone() => Professor()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Professor copyWith(void Function(Professor) updates) => super.copyWith((message) => updates(message as Professor)) as Professor; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Professor create() => Professor._();
  Professor createEmptyInstance() => create();
  static $pb.PbList<Professor> createRepeated() => $pb.PbList<Professor>();
  @$core.pragma('dart2js:noInline')
  static Professor getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Professor>(create);
  static Professor? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get id => $_getIZ(0);
  @$pb.TagNumber(1)
  set id($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get first => $_getSZ(1);
  @$pb.TagNumber(2)
  set first($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasFirst() => $_has(1);
  @$pb.TagNumber(2)
  void clearFirst() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get last => $_getSZ(2);
  @$pb.TagNumber(3)
  set last($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasLast() => $_has(2);
  @$pb.TagNumber(3)
  void clearLast() => clearField(3);
}

class NotificationRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'NotificationRequest', createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'email')
    ..pc<Class>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'classes', $pb.PbFieldType.PM, subBuilder: Class.create)
    ..hasRequiredFields = false
  ;

  NotificationRequest._() : super();
  factory NotificationRequest({
    $core.String? email,
    $core.Iterable<Class>? classes,
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
  $core.List<Class> get classes => $_getList(1);
}

class ScheduleRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'ScheduleRequest', createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'major')
    ..pc<Class>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'previousClasses', $pb.PbFieldType.PM, protoName: 'previousClasses', subBuilder: Class.create)
    ..pc<Class>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'preferredClasses', $pb.PbFieldType.PM, protoName: 'preferredClasses', subBuilder: Class.create)
    ..pc<Class>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'unpreferredClasses', $pb.PbFieldType.PM, protoName: 'unpreferredClasses', subBuilder: Class.create)
    ..pc<Professor>(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'preferredProfs', $pb.PbFieldType.PM, protoName: 'preferredProfs', subBuilder: Professor.create)
    ..pc<Professor>(6, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'unprefferedProfs', $pb.PbFieldType.PM, protoName: 'unprefferedProfs', subBuilder: Professor.create)
    ..hasRequiredFields = false
  ;

  ScheduleRequest._() : super();
  factory ScheduleRequest({
    $core.String? major,
    $core.Iterable<Class>? previousClasses,
    $core.Iterable<Class>? preferredClasses,
    $core.Iterable<Class>? unpreferredClasses,
    $core.Iterable<Professor>? preferredProfs,
    $core.Iterable<Professor>? unprefferedProfs,
  }) {
    final _result = create();
    if (major != null) {
      _result.major = major;
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
  $core.String get major => $_getSZ(0);
  @$pb.TagNumber(1)
  set major($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasMajor() => $_has(0);
  @$pb.TagNumber(1)
  void clearMajor() => clearField(1);

  @$pb.TagNumber(2)
  $core.List<Class> get previousClasses => $_getList(1);

  @$pb.TagNumber(3)
  $core.List<Class> get preferredClasses => $_getList(2);

  @$pb.TagNumber(4)
  $core.List<Class> get unpreferredClasses => $_getList(3);

  @$pb.TagNumber(5)
  $core.List<Professor> get preferredProfs => $_getList(4);

  @$pb.TagNumber(6)
  $core.List<Professor> get unprefferedProfs => $_getList(5);
}

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

class Request extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'Request', createEmptyInstance: create)
    ..aOM<ScheduleRequest>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'sched', subBuilder: ScheduleRequest.create)
    ..aOM<NotificationRequest>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'noti', subBuilder: NotificationRequest.create)
    ..hasRequiredFields = false
  ;

  Request._() : super();
  factory Request({
    ScheduleRequest? sched,
    NotificationRequest? noti,
  }) {
    final _result = create();
    if (sched != null) {
      _result.sched = sched;
    }
    if (noti != null) {
      _result.noti = noti;
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

  @$pb.TagNumber(1)
  ScheduleRequest get sched => $_getN(0);
  @$pb.TagNumber(1)
  set sched(ScheduleRequest v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasSched() => $_has(0);
  @$pb.TagNumber(1)
  void clearSched() => clearField(1);
  @$pb.TagNumber(1)
  ScheduleRequest ensureSched() => $_ensure(0);

  @$pb.TagNumber(2)
  NotificationRequest get noti => $_getN(1);
  @$pb.TagNumber(2)
  set noti(NotificationRequest v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasNoti() => $_has(1);
  @$pb.TagNumber(2)
  void clearNoti() => clearField(2);
  @$pb.TagNumber(2)
  NotificationRequest ensureNoti() => $_ensure(1);
}

