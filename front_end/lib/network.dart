import 'dart:convert';
import 'dart:typed_data';

import 'package:front_end/proto/data.pbserver.dart';
import 'package:tcp_socket_connection/tcp_socket_connection.dart';

import 'package:protobuf/protobuf.dart';

import 'package:front_end/proto/requests.pb.dart';
import 'package:front_end/proto/responses.pb.dart';

class Network {
  final Utf8Decoder _decoder = const Utf8Decoder();
  TcpSocketConnection? _connection;

  static final Network _instance = Network._internal();
  List<Course>? classes;
  List<Professor>? professors;
  // List<String>? majors;

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
    _connection = TcpSocketConnection("localhost", 50000);
    // startConnection();
  }

  void messageReceived(String message) {
    var res = Response();
    res.clear();

    var read = CodedBufferReader(message.codeUnits);
    res.mergeFromCodedBufferReader(read);

    switch (res.type) {
      case ResponseType.RES_DEBUG:
        {
          print("DEBUG recieved");
        }
        break;
      case ResponseType.RES_COURSES:
        {
          classes = res.r3.courses;
        }
        break;
      case ResponseType.RES_PROFS:
        {
          professors = res.r2.professors;
        }
        break;
      case ResponseType.RES_SCHEDULE:
        {
          // TODO: schedule object
          // schedule = res.r1.;
        }
        break;
    }

    var req = Request();
    req.type = RequestType.REQ_DEBUG;
    req.r5 = DebugRequest();
    req.r5.msg = "ping";

    Uint8List out = req.writeToBuffer();
    _connection?.sendMessage(_decoder.convert(out));
  }

  void startConnection() async {
    _connection!.enableConsolePrint(
        true); //use this to see in the console what's happening

    if (await _connection!.canConnect(50000, attempts: 100000)) {
      //check if it's possible to connect to the endpoint
      await _connection!.connect(50000, messageReceived, attempts: 10000000);
    }

    var req = Request();
    req.clear();

    req.type = RequestType.REQ_DEBUG;
    req.r5 = DebugRequest();
    req.r5.msg = "ping";

    Uint8List out = req.writeToBuffer();

    _connection!.sendMessage(_decoder.convert(out));
  }

  void requestHelper(Request req) {
    Uint8List out = req.writeToBuffer();
    _connection!.sendMessage(_decoder.convert(out));
  }

  // TODO: waiting for ENUM
  void sendProfessorRequest(String major) {
    var req = Request();

    req.r3 = ProfessorRequest();
    req.r3.major = major;
    requestHelper(req);
  }

  // TODO: waiting for ENUM
  void sendClassRequest() {
    var req = Request();

    requestHelper(req);
  }
}
