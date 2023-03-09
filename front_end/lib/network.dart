import 'dart:async';
import 'dart:convert';
import 'dart:typed_data';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:front_end/proto/data.pbserver.dart';
import 'package:front_end/proto/service.pbgrpc.dart';
import 'package:grpc/grpc_or_grpcweb.dart';
import 'package:tcp_socket_connection/tcp_socket_connection.dart';
import 'package:protobuf/protobuf.dart';

import 'package:front_end/proto/requests.pb.dart';
import 'package:front_end/proto/responses.pb.dart';

import 'package:grpc/grpc.dart';

import 'package:front_end/proto/service.pb.dart';
import 'package:front_end/proto/service.pbserver.dart';

class Network {
  static const int _port = 50000;

  static final Network _instance = Network._internal();

  factory Network() {
    return _instance;
  }

  ClientChannel? _channel;
  ServiceClient? _client;

  Network._internal();

  void connect() {
    var channel = GrpcOrGrpcWebClientChannel.grpc(
      "localhost",
      port: _port,
      options: const ChannelOptions(credentials: ChannelCredentials.insecure()),
    );
    _channel = channel;
    _client = ServiceClient(channel);
  }

  void dispose() async {
    await _channel!.shutdown();
  }

  List<Course> _courses = List.empty();
  List<Professor> _professors = List.empty();
  List<Major> _majors = List.empty();
  ScheduleResponse _schedule = ScheduleResponse();

  void sendMajorRequest() async {
    var req = MajorRequest();
    var res = await _client!.getMajors(req);

    _majors = res.majors;
  }

  void sendProfessorRequest() async {
    var res = await _client!.getProfessors(ProfessorRequest());
    _professors = res.professors;
  }

  void sendCourseRequest() async {
    var res = await _client!.getCourses(CourseRequest());
    _courses = res.courses;
  }

  void sendNotificationRequest(String email, List<String> className) async {
    var req = NotificationRequest(
        email: email,
        classes: List<Course>.generate(
            className.length, (int index) => Course(name: className[index])));
    var res = await _client!.registerNotifications(req);
    // TODO: Check result?
    // return res;
  }

  // TODO:
  void sendScheduleRequest(
      String major,
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
        major: Major(name: major),
        semester: semester,
        minCredits: minCredit,
        maxCredits: maxCredit,
        previousClasses: previousCourse,
        preferredClasses: preferredCourse,
        unpreferredClasses: unpreferredCourse,
        preferredProfs: preferredProfs,
        unprefferedProfs: unpreferredProfs);

    var res = await _client!.getSchedule(req);
    _schedule = res;
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
        _courses.length, (int index) => _courses[index].name);
  }

  List<List<String>> getSchedule() {
    List<List<String>> schedule =
        List<List<String>>.filled(8, List<String>.empty());

    schedule[0] = courseToString(_schedule.fall1);
    schedule[1] = courseToString(_schedule.spring1);
    schedule[2] = courseToString(_schedule.fall2);
    schedule[3] = courseToString(_schedule.spring2);
    schedule[4] = courseToString(_schedule.fall3);
    schedule[5] = courseToString(_schedule.spring3);
    schedule[6] = courseToString(_schedule.fall4);
    schedule[7] = courseToString(_schedule.spring4);

    return schedule;
  }

  @visibleForTesting
  void setMajors() {
    _majors = [Major(name: "CS BS")];
  }
}
