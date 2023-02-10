import socket
import time
import signal

s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
s.bind(('localhost', 50000))
s.listen(1)

# Kills with Control + C
signal.signal(signal.SIGINT, signal.SIG_DFL)

while 1:
    conn, addr = s.accept()
    data = conn.recv(1024)
    print(data)
    if not data:
        time.sleep(0.01)
    conn.sendall(data)
conn.close()