import 'dart:async' as flutter_async;

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:front_end/proto/service.pbgrpc.dart';
import 'package:grpc/grpc_or_grpcweb.dart';

import 'package:front_end/proto/requests.pb.dart';
import 'package:front_end/proto/responses.pb.dart';

import 'package:grpc/grpc.dart' as grpc;

class Network {
  static const String _host = "localhost";
  static const int _port = 50000;

  static final Network _instance = Network._internal();

  factory Network() {
    return _instance;
  }

  GrpcOrGrpcWebClientChannel? _channel;
  ServiceClient? _client;
  flutter_async.StreamSubscription<grpc.ConnectionState>?
      _connectionStatusStream;

  flutter_async.StreamSubscription<grpc.ConnectionState>?
      get connectionStatusStream => _connectionStatusStream;

  Network._internal();

  void connect() {
    _channel = GrpcOrGrpcWebClientChannel.toSeparatePorts(
        host: _host,
        grpcPort: _port,
        grpcTransportSecure: false,
        grpcWebPort: 8080,
        grpcWebTransportSecure: false);

    _client = ServiceClient(_channel!);

    // monitor connection
    _connectionStatusStream =
        _channel!.onConnectionStateChanged.listen((grpc.ConnectionState event) {
      print("Connection state: $event");
    });
  }

  void dispose() async {
    await _channel?.shutdown();
  }

  List<Course> _courses = List.empty();
  List<Professor> _professors = List.empty();
  List<Major> _majors = List.empty();
  ScheduleResponse _schedule = ScheduleResponse();

  void sendMajorRequest() async {
    var res = await _client?.getMajors(MajorRequest());
    _majors = res?.majors ?? _majors;
  }

  void sendProfessorRequest() async {
    var res = await _client?.getProfessors(ProfessorRequest());
    _professors = res?.professors ?? _professors;
  }

  void sendCourseRequest() async {
    var res = await _client?.getCourses(CourseRequest());
    _courses = res?.courses ?? _courses;
  }

  void sendNotificationRequest(String email, List<String> className) async {
    var req = NotificationRequest(
        email: email,
        classes: List<Course>.generate(
            className.length, (int index) => Course(name: className[index])));
    await _client?.registerNotifications(req);
    // TODO: Check result?
    // return res;
  }

  // TODO:
  void sendScheduleRequest(
      String school,
      String department,
      String semester,
      int? minCredit,
      int? maxCredit,
      List<String>? previousClasses,
      List<String>? preferredClasses,
      List<String>? unpreferredClasses,
      List<String>? preferredProfessors,
      List<String>? unpreferredProfessors) async {
    List<Course>? previousCourse;
    List<Course>? preferredCourse;
    List<Course>? unpreferredCourse;
    List<Professor>? preferredProfs;
    List<Professor>? unpreferredProfs;

    if (previousClasses != null) {
      previousCourse = List<Course>.generate(previousClasses.length,
          (int index) => Course(name: previousClasses[index]));
    }

    if (preferredClasses != null) {
      preferredCourse = List<Course>.generate(preferredClasses.length,
          (int index) => Course(name: preferredClasses[index]));
    }

    if (unpreferredClasses != null) {
      unpreferredCourse = List<Course>.generate(unpreferredClasses.length,
          (int index) => Course(name: unpreferredClasses[index]));
    }

    if (preferredProfessors != null) {
      preferredProfs = List<Professor>.generate(
          preferredProfessors.length,
          (int index) => Professor(
              first: preferredProfessors[index].split(' ')[0],
              last: preferredProfessors[index].split(' ')[1]));
    }

    if (unpreferredProfessors != null) {
      unpreferredProfs = List<Professor>.generate(
          unpreferredProfessors.length,
          (int index) => Professor(
              first: unpreferredProfessors[index].split(' ')[0],
              last: unpreferredProfessors[index].split(' ')[1]));
    }

    var req = ScheduleRequest(
        school: school,
        department: department,
        semester: semester,
        minCredits: minCredit,
        maxCredits: maxCredit,
        previousClasses: previousCourse,
        preferredClasses: preferredCourse,
        unpreferredClasses: unpreferredCourse,
        preferredProfs: preferredProfs,
        unprefferedProfs: unpreferredProfs);

    var res = await _client?.getSchedule(req);
    _schedule = res ?? _schedule;
  }

  List<String> getCourseNames() {
    // TODO Error handling
    return courseToString(_courses);
  }

  List<String> getProfessorNames() {
    // TODO Error handling
    return List<String>.generate(
        _professors.length,
        (int index) =>
            '${_professors[index].first} ${_professors[index].last}');
  }

  List<String> getMajors() {
    return List<String>.generate(
        _majors.length, (index) => _majors[index].name);
  }

  List<String> courseToString(List<Course> courseList) {
    return List<String>.generate(
        courseList.length, (int index) => courseList[index].name);
  }

  Map<String, List<String>> getSchedule() {
    Map<String, List<String>> schedule = <String, List<String>>{};
    for (final entry in _schedule.courseMap.entries) {
      schedule[entry.key] = courseToString(entry.value.courses);
    }
    return schedule;
  }

  @visibleForTesting
  void setMajors() {
    _majors = [Major(name: "CS BS")];
  }

  @visibleForTesting
  void setCourses() {
    _courses = [Course(name: "CSDS 132")];
  }

  void clearSchedule() {
    _schedule = ScheduleResponse();
  }
}
