///
//  Generated code. Do not modify.
//  source: proto/service.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,deprecated_member_use_from_same_package,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:async' as $async;

import 'package:protobuf/protobuf.dart' as $pb;

import 'dart:core' as $core;
import 'requests.pb.dart' as $1;
import 'responses.pb.dart' as $2;
import 'service.pbjson.dart';

export 'service.pb.dart';

abstract class ServiceBase extends $pb.GeneratedService {
  $async.Future<$2.ScheduleResponse> getSchedule(
      $pb.ServerContext ctx, $1.ScheduleRequest request);
  $async.Future<$2.NotificationResponse> registerNotifications(
      $pb.ServerContext ctx, $1.NotificationRequest request);
  $async.Future<$2.ProfessorResponse> getProfessors(
      $pb.ServerContext ctx, $1.ProfessorRequest request);
  $async.Future<$2.CourseResponse> getCourses(
      $pb.ServerContext ctx, $1.CourseRequest request);
  $async.Future<$2.MajorResponse> getMajors(
      $pb.ServerContext ctx, $1.MajorRequest request);
  $async.Future<$2.DebugResponse> debug(
      $pb.ServerContext ctx, $1.DebugRequest request);

  $pb.GeneratedMessage createRequest($core.String method) {
    switch (method) {
      case 'GetSchedule':
        return $1.ScheduleRequest();
      case 'RegisterNotifications':
        return $1.NotificationRequest();
      case 'GetProfessors':
        return $1.ProfessorRequest();
      case 'GetCourses':
        return $1.CourseRequest();
      case 'GetMajors':
        return $1.MajorRequest();
      case 'Debug':
        return $1.DebugRequest();
      default:
        throw $core.ArgumentError('Unknown method: $method');
    }
  }

  $async.Future<$pb.GeneratedMessage> handleCall($pb.ServerContext ctx,
      $core.String method, $pb.GeneratedMessage request) {
    switch (method) {
      case 'GetSchedule':
        return this.getSchedule(ctx, request as $1.ScheduleRequest);
      case 'RegisterNotifications':
        return this
            .registerNotifications(ctx, request as $1.NotificationRequest);
      case 'GetProfessors':
        return this.getProfessors(ctx, request as $1.ProfessorRequest);
      case 'GetCourses':
        return this.getCourses(ctx, request as $1.CourseRequest);
      case 'GetMajors':
        return this.getMajors(ctx, request as $1.MajorRequest);
      case 'Debug':
        return this.debug(ctx, request as $1.DebugRequest);
      default:
        throw $core.ArgumentError('Unknown method: $method');
    }
  }

  // $core.Map<$core.String, $core.dynamic> get $json => ServiceBase$json;
  // $core.Map<$core.String, $core.dynamic> get $json => ServiceBase$json;
  // $core.Map<$core.String, $core.Map<$core.String, $core.dynamic>>
  //     get $messageJson => ServiceBase$messageJson;
}
