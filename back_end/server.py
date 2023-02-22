import socket
import time
import signal 

from class_pb2 import Class

s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
s.bind(('localhost', 50000))
s.listen(1)

# Kills with Control + C
signal.signal(signal.SIGINT, signal.SIG_DFL)

while True:

    c = Class()
    c.id = 0
    c.name = "bruh"

    json: bytes = Class.SerializeToString(c)
    print(json.decode())
    conn, addr = s.accept()
    data = conn.recv(1024)
    print(data)

    conn.sendall(json)
