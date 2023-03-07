import 'dart:async';
import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:front_end/proto/data.pbserver.dart';
import 'package:tcp_socket_connection/tcp_socket_connection.dart';
import 'package:protobuf/protobuf.dart';

import 'package:front_end/proto/requests.pb.dart';
import 'package:front_end/proto/responses.pb.dart';

class Network {
  static const int _port = 50000;
  static const Utf8Decoder _decoder = Utf8Decoder();
  // TcpSocketConnection? _connection;

  static final Network _instance = Network._internal();
  static List<Course> _classes = List.empty();
  static List<Professor> _professors = List.empty();
  static List<Major> _majors = List.empty();
  int id = 1;

  // Set to prevent Duplicates
  static Set<Request> requests = {};

  // using a factory is important
  // because it promises to return _an_ object of this type
  // but it doesn't promise to make a new one.
  factory Network() {
    Timer.periodic(const Duration(seconds: 5), (timer) {
      for (var req in requests) {
        requestHelper(req);
      }
    });
    return _instance;
  }

  // This named constructor is the "real" constructor
  // It'll be called exactly once, by the static property assignment above
  // it's also private, so it can only be called in this class
  Network._internal();

  static void messageReceived(String message) {
    var res = Response();
    res.clear();

    var read = CodedBufferReader(message.codeUnits);
    res.mergeFromCodedBufferReader(read);
    print("Message Received");
    print(res);
    switch (res.type) {
      case ResponseType.RES_DEBUG:
        {
          print("DEBUG Received");
        }
        break;
      case ResponseType.RES_COURSES:
        {
          _classes = res.r3.courses;
        }
        break;
      case ResponseType.RES_PROFS:
        {
          _professors = res.r2.professors;
        }
        break;
      case ResponseType.RES_MAJOR:
        {
          _majors = res.r5.majors;
        }
        break;
      case ResponseType.RES_SCHEDULE:
        {
          // TODO: schedule object
          // schedule = res.r1.;
        }
        break;
      case ResponseType.RES_NOTI:
        {
          // TODO notifiy sender?
        }
        break;
    }
    requests.removeWhere((Request req) => req.id == res.id);
  }

  static void requestHelper(Request req) async {
    TcpSocketConnection connection = TcpSocketConnection("localhost", _port);
    // For Debug
    connection.enableConsolePrint(true);

    requests.add(req);
    // 1 sec seems to have been short
    int timeOut = 3;
    int attempts = 1000;
    if (await connection.canConnect(timeOut, attempts: attempts)) {
      await connection.connect(timeOut, messageReceived);
      Uint8List out = req.writeToBuffer();
      connection.sendMessage(_decoder.convert(out));
      print("Sending Request ${req.toString()}");
    }
  }

  void sendMajorRequest() {
    var req = Request();
    req.type = RequestType.REQ_MAJOR;
    req.r6 = MajorRequest();
    req.id = id++;
    requestHelper(req);
  }

  void sendProfessorRequest() {
    var req = Request();
    req.type = RequestType.REQ_PROFESSOR;
    req.r3 = ProfessorRequest();
    req.id = id++;
    requestHelper(req);
  }

  void sendCourseRequest() {
    var req = Request();
    req.type = RequestType.REQ_COURSE;
    req.r4 = CourseRequest();
    req.id = id++;
    requestHelper(req);
  }

  void sendNotificationRequest(String email, List<String> className) {
    var req = Request();
    req.type = RequestType.REQ_NOTIFICATION;
    req.r2 = NotificationRequest(
        email: email,
        classes: List<Course>.generate(
            className.length, (int index) => Course(name: className[index])));
    req.id = id++;
    requestHelper(req);
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
      List<String>? unpreferredProfessors) {
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

    var req = Request();
    req.type = RequestType.REQ_SCHEDULE;
    req.r1 = ScheduleRequest(
        major: Major(name: major),
        semester: semester,
        minCredits: minCredit,
        maxCredits: maxCredit,
        previousClasses: previousCourse,
        preferredClasses: preferredCourse,
        unpreferredClasses: unpreferredCourse,
        preferredProfs: preferredProfs,
        unprefferedProfs: unpreferredProfs);
    req.id = id++;
    requestHelper(req);
  }

  List<String> getCourseNames() {
    // TODO Error handling
    return List<String>.generate(
        _classes.length, (int index) => _classes[index].name);
  }

  List<String> getProfessorNames() {
    // TODO Error handling
    return List<String>.generate(
        _professors.length,
        (int index) =>
            '${_professors[index].first} ${_professors[index].last}');
  }

  List<String> getMajors() {
    // TODO Implement
    return List<String>.generate(
        _majors.length, (index) => _majors[index].name);
  }

  @visibleForTesting
  void setMajors() {
    _majors = [Major(name: "CS BS")];
  }
}
