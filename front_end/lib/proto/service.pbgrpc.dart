///
//  Generated code. Do not modify.
//  source: proto/service.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:async' as $async;

import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'requests.pb.dart' as $0;
import 'responses.pb.dart' as $1;
export 'service.pb.dart';

class ServiceClient extends $grpc.Client {
  static final _$getSchedule =
      $grpc.ClientMethod<$0.ScheduleRequest, $1.ScheduleResponse>(
          '/Service/GetSchedule',
          ($0.ScheduleRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $1.ScheduleResponse.fromBuffer(value));
  static final _$registerNotifications =
      $grpc.ClientMethod<$0.NotificationRequest, $1.NotificationResponse>(
          '/Service/RegisterNotifications',
          ($0.NotificationRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $1.NotificationResponse.fromBuffer(value));
  static final _$getProfessors =
      $grpc.ClientMethod<$0.ProfessorRequest, $1.ProfessorResponse>(
          '/Service/GetProfessors',
          ($0.ProfessorRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $1.ProfessorResponse.fromBuffer(value));
  static final _$getCourses =
      $grpc.ClientMethod<$0.CourseRequest, $1.CourseResponse>(
          '/Service/GetCourses',
          ($0.CourseRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $1.CourseResponse.fromBuffer(value));
  static final _$getMajors =
      $grpc.ClientMethod<$0.MajorRequest, $1.MajorResponse>(
          '/Service/GetMajors',
          ($0.MajorRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $1.MajorResponse.fromBuffer(value));
  static final _$debug = $grpc.ClientMethod<$0.DebugRequest, $1.DebugResponse>(
      '/Service/Debug',
      ($0.DebugRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $1.DebugResponse.fromBuffer(value));

  ServiceClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options, interceptors: interceptors);

  $grpc.ResponseFuture<$1.ScheduleResponse> getSchedule(
      $0.ScheduleRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getSchedule, request, options: options);
  }

  $grpc.ResponseFuture<$1.NotificationResponse> registerNotifications(
      $0.NotificationRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$registerNotifications, request, options: options);
  }

  $grpc.ResponseFuture<$1.ProfessorResponse> getProfessors(
      $0.ProfessorRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getProfessors, request, options: options);
  }

  $grpc.ResponseFuture<$1.CourseResponse> getCourses($0.CourseRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getCourses, request, options: options);
  }

  $grpc.ResponseFuture<$1.MajorResponse> getMajors($0.MajorRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getMajors, request, options: options);
  }

  $grpc.ResponseFuture<$1.DebugResponse> debug($0.DebugRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$debug, request, options: options);
  }
}

abstract class ServiceBase extends $grpc.Service {
  $core.String get $name => 'Service';

  ServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.ScheduleRequest, $1.ScheduleResponse>(
        'GetSchedule',
        getSchedule_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.ScheduleRequest.fromBuffer(value),
        ($1.ScheduleResponse value) => value.writeToBuffer()));
    $addMethod(
        $grpc.ServiceMethod<$0.NotificationRequest, $1.NotificationResponse>(
            'RegisterNotifications',
            registerNotifications_Pre,
            false,
            false,
            ($core.List<$core.int> value) =>
                $0.NotificationRequest.fromBuffer(value),
            ($1.NotificationResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.ProfessorRequest, $1.ProfessorResponse>(
        'GetProfessors',
        getProfessors_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.ProfessorRequest.fromBuffer(value),
        ($1.ProfessorResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.CourseRequest, $1.CourseResponse>(
        'GetCourses',
        getCourses_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.CourseRequest.fromBuffer(value),
        ($1.CourseResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.MajorRequest, $1.MajorResponse>(
        'GetMajors',
        getMajors_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.MajorRequest.fromBuffer(value),
        ($1.MajorResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.DebugRequest, $1.DebugResponse>(
        'Debug',
        debug_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.DebugRequest.fromBuffer(value),
        ($1.DebugResponse value) => value.writeToBuffer()));
  }

  $async.Future<$1.ScheduleResponse> getSchedule_Pre(
      $grpc.ServiceCall call, $async.Future<$0.ScheduleRequest> request) async {
    return getSchedule(call, await request);
  }

  $async.Future<$1.NotificationResponse> registerNotifications_Pre(
      $grpc.ServiceCall call,
      $async.Future<$0.NotificationRequest> request) async {
    return registerNotifications(call, await request);
  }

  $async.Future<$1.ProfessorResponse> getProfessors_Pre($grpc.ServiceCall call,
      $async.Future<$0.ProfessorRequest> request) async {
    return getProfessors(call, await request);
  }

  $async.Future<$1.CourseResponse> getCourses_Pre(
      $grpc.ServiceCall call, $async.Future<$0.CourseRequest> request) async {
    return getCourses(call, await request);
  }

  $async.Future<$1.MajorResponse> getMajors_Pre(
      $grpc.ServiceCall call, $async.Future<$0.MajorRequest> request) async {
    return getMajors(call, await request);
  }

  $async.Future<$1.DebugResponse> debug_Pre(
      $grpc.ServiceCall call, $async.Future<$0.DebugRequest> request) async {
    return debug(call, await request);
  }

  $async.Future<$1.ScheduleResponse> getSchedule(
      $grpc.ServiceCall call, $0.ScheduleRequest request);
  $async.Future<$1.NotificationResponse> registerNotifications(
      $grpc.ServiceCall call, $0.NotificationRequest request);
  $async.Future<$1.ProfessorResponse> getProfessors(
      $grpc.ServiceCall call, $0.ProfessorRequest request);
  $async.Future<$1.CourseResponse> getCourses(
      $grpc.ServiceCall call, $0.CourseRequest request);
  $async.Future<$1.MajorResponse> getMajors(
      $grpc.ServiceCall call, $0.MajorRequest request);
  $async.Future<$1.DebugResponse> debug(
      $grpc.ServiceCall call, $0.DebugRequest request);
}
