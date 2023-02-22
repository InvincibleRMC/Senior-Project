#!/bin/python3
import socket
import signal
import sys
from proto.requests_pb2 import Request, DebugRequest, REQ_DEBUG
from proto.responses_pb2 import Response, DebugResponse, RES_DEBUG

# TODO: thread pool
# resource: https://superfastpython.com/threadpool-python/#ThreadPool_Example


class Server:

    def __init__(self, server, port):
        self.socket = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
        self.socket.bind((server, port))
        self.socket.listen(1)

    def run(self):
        while True:
            conn, addr = self.socket.accept()
            data = conn.recv(4096)

            incoming_request = Request()
            incoming_request.Clear()

            outgoing = Response()
            outgoing.Clear()

            print(data.decode())

            # get message from string
            # TODO: error check
            incoming_request.ParseFromString(data)

            request_type = incoming_request.type

            # TODO: handle request

            # respond

            print(str(incoming_request))
            # print(incoming_request.msg.r5.msg
            outgoing.type = RES_DEBUG
            outgoing.r4.msg = "pong"

            # outgoing.r4.msg = "Pong"

            data: bytes = outgoing.SerializeToString()

            conn.send(data)


if __name__ == "__main__":
    signal.signal(signal.SIGINT, signal.SIG_DFL)

    if len(sys.argv) < 2:
        print("Not enough input arguments. Usage: server <port>")
        exit()

    port = int(sys.argv[1])
    print("Initializing server...")
    server = Server("localhost", port)

    print("Running Server...")
    server.run()

    print("Server shutting down...")
