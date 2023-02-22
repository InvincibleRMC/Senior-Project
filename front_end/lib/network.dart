import 'package:tcp_socket_connection/tcp_socket_connection.dart';

import 'package:protobuf/protobuf.dart';

import 'package:front_end/proto/requests.pb.dart';
import 'package:front_end/proto/responses.pb.dart';

class Network {
  TcpSocketConnection? _connection;

  static final Network _instance = Network._internal();

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
    // print(message);

    var res = Response();
    res.clear();

    var read = CodedBufferReader(message.codeUnits);
    res.mergeFromCodedBufferReader(read);

    print(res.toDebugString());
    print(res.r4.msg);

    var req = Request();
    req.type = RequestType.REQ_DEBUG;
    req.r5 = DebugRequest();
    req.r5.msg = "ping";

    _connection?.sendMessage(req.toString());
  }

  void startConnection() async {
    _connection?.enableConsolePrint(
        true); //use this to see in the console what's happening

    if (_connection != null) {
      if (await _connection!.canConnect(50000, attempts: 100000)) {
        //check if it's possible to connect to the endpoint
        await _connection?.connect(50000, messageReceived, attempts: 10000000);
      }

      var req = Request();
      req.clear();

      req.type = RequestType.REQ_DEBUG;
      req.r5 = DebugRequest();
      req.r5.msg = "ping";

      _connection!.sendMessage(req.toString());
    }
  }
}
