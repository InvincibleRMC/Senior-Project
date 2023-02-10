import 'package:tcp_socket_connection/tcp_socket_connection.dart';

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
    print(message);
    _connection?.sendMessage("yeet");
  }

  void startConnection() async {
    _connection?.enableConsolePrint(
        true); //use this to see in the console what's happening

    if (_connection != null) {
      if (await _connection!.canConnect(5000, attempts: 100000)) {
        //check if it's possible to connect to the endpoint
        await _connection?.connect(5000, messageReceived, attempts: 10000000);
      }

      _connection!.sendMessage("yeet1");
    }
  }
}
