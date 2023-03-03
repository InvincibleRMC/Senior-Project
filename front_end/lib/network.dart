import 'dart:convert';
import 'dart:typed_data';

import 'package:front_end/proto/data.pbserver.dart';
import 'package:tcp_socket_connection/tcp_socket_connection.dart';

import 'package:protobuf/protobuf.dart';

import 'package:front_end/proto/requests.pb.dart';
import 'package:front_end/proto/responses.pb.dart';

class Network {
  final Utf8Decoder _decoder = const Utf8Decoder();
  // TcpSocketConnection? _connection;

  static final Network _instance = Network._internal();
  List<Course>? _classes;
  List<Professor>? _professors;
  List<Major>? _majors;

  // using a factory is important
  // because it promises to return _an_ object of this type
  // but it doesn't promise to make a new one.
  factory Network() {
    return _instance;
  }

  // This named constructor is the "real" constructor
  // It'll be called exactly once, by the static property assignment above
  // it's also private, so it can only be called in this class
  Network._internal() {
    // initialization logic
    // _connection = TcpSocketConnection("localhost", 50001);
    // startConnection();
  }

  void messageReceived(String message) {
    var res = Response();
    res.clear();

    var read = CodedBufferReader(message.codeUnits);
    res.mergeFromCodedBufferReader(read);
    print("Message Recieved");
    print(res);
    switch (res.type) {
      case ResponseType.RES_DEBUG:
        {
          print("DEBUG recieved");
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

    // var req = Request();
    // req.type = RequestType.REQ_DEBUG;
    // req.r5 = DebugRequest();
    // req.r5.msg = "ping";

    // Uint8List out = req.writeToBuffer();
    // _connection?.sendMessage(_decoder.convert(out));
  }

  // void startConnection() async {
  //   _connection!.enableConsolePrint(
  //       true); //use this to see in the console what's happening

  //   if (await _connection!.canConnect(50000, attempts: 100000)) {
  //     //check if it's possible to connect to the endpoint
  //     await _connection!.connect(50000, messageReceived, attempts: 10000000);
  //   }

  //   var req = Request();
  //   req.clear();

  //   req.type = RequestType.REQ_DEBUG;
  //   req.r5 = DebugRequest();
  //   req.r5.msg = "ping";

  //   Uint8List out = req.writeToBuffer();
  //   _connection!.sendMessage(_decoder.convert(out));
  //   _sendProfessorRequest();
  //   _sendCourseRequest();
  // }

  void requestHelper(Request req) async {
    TcpSocketConnection connection = TcpSocketConnection("localhost", 50001);
    // For Debug
    connection.enableConsolePrint(true);

    // 1 sec seems to have been short
    int timeOut = 5;
    int attempts = 10000;
    if (await connection.canConnect(timeOut, attempts: attempts)) {
      await connection.connect(timeOut, messageReceived);
      Uint8List out = req.writeToBuffer();
      connection.sendMessage(_decoder.convert(out));
      print("Sending Request " + req.toString());
    }
  }

  void sendProfessorRequest() {
    var req = Request();
    req.type = RequestType.REQ_PROFESSOR;
    req.r3 = ProfessorRequest();
    requestHelper(req);
  }

  void sendCourseRequest() {
    var req = Request();
    req.type = RequestType.REQ_COURSE;
    req.r4 = CourseRequest();
    requestHelper(req);
  }

  void sendNotificationRequest(String email, List<String> className) {
    var req = Request();
    req.type = RequestType.REQ_NOTIFICATION;
    req.r2 = NotificationRequest(
        email: email,
        classes: List<Course>.generate(
            className.length, (int index) => Course(name: className[index])));
    requestHelper(req);
  }

  // TODO:
  void sendScheduleRequest() {
    var req = Request();
    req.type = RequestType.REQ_SCHEDULE;
    req.r1 = ScheduleRequest();
    requestHelper(req);
  }

  List<String> getCourseNames() {
    // TODO Error handling
    return List<String>.generate(
        _classes!.length, (int index) => _classes![index].name);
  }

  List<String> getProfessorNames() {
    // TODO Error handling
    return List<String>.generate(_professors!.length,
        (int index) => _professors![index].first + _professors![index].last);
  }

  List<String> getMajors() {
    // TODO Implement
    return List<String>.generate(
        _majors!.length, (index) => _majors![index].name);
  }
}
