#!/bin/python3
import socket
import signal
import sys
import time

import sqlite3

from proto.requests_pb2 import Request, DebugRequest, REQ_DEBUG, REQ_COURSE, REQ_NOTIFICATION, REQ_SCHEDULE, REQ_PROFESSOR
from proto.responses_pb2 import Response, DebugResponse, RES_DEBUG

from proto.requests_pb2 import *
from proto.responses_pb2 import *
from proto.data_pb2 import *

import multiprocessing as mp

# TODO: thread pool
# resource: https://superfastpython.com/threadpool-python/#ThreadPool_Example


class DatabaseConnection:

    def __init__(self, filepath: str):
        self.connection = sqlite3.connect(filepath)
        self.lock = mp.Lock()

    def __del__(self):
        self.connection.close()

    def get_version(self):
        return self.execute("select sqlite_version();")

    def execute(self, query):
        self.lock.acquire()
        cursor = self.connection.cursor()
        cursor.execute(query)
        record = cursor.fetchall()
        cursor.close() 
        self.lock.release()
        return record

class WorkerThread:

    def __init__(self, rx_q, tx_q, rx_lock, tx_lock, db_conn):
        self.rx_q = rx_q
        self.rx_lock = rx_lock 

        self.tx_q = tx_q 
        self.tx_lock = tx_lock

        self.db_conn = db_conn

        self.t_sleep = 0.1

    def run(self):
        while True:
            if not self.rx_lock.aquire(block=False):
                time.sleep(self.t_sleep)
                continue
            
            if self.rx_q.empty():
                self.rx_lock.release()
                time.sleep(self.t_sleep)
                continue

            (conn, addr, request) = self.rx_q.get_nowait()
            self.rx_lock.release()

            # TODO: process request 

            # TODO: query database

            # TODO: enqueue response

class Server:

    @staticmethod
    def run_worker(worker: WorkerThread):
        worker.run()

    def __init__(self, server, port, db_fn: str):
        self.socket = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
        self.socket.bind((server, port))
        self.socket.listen(1) 

        # rx and tx queues
        self.rx_queue = mp.Queue()
        self.rx_lock = mp.Lock()

        self.tx_queue = mp.Queue()
        self.tx_lock = mp.Lock()

        # db connection
        self.db_conn = DatabaseConnection(db_fn)
        print("SQLite version: ", self.db_conn.get_version())

        # worker threads 
        self.workers = []
        self.num_workers = 4
        for i in range(self.num_workers):
            worker = WorkerThread(self.rx_queue, self.tx_queue, self.rx_lock, self.tx_lock, self.db_conn)
            workerProc = mp.Process(target=Server.run_worker, args=(worker,))
            workerProc.start()
            self.workers.append(workerProc)

    def handle_req_course(self, req: CourseRequest) -> CourseResponse:
        pass 

    def handle_req_prof(self, req: ProfessorRequest) -> ProfessorResponse:
        pass

    def handle_req_schedule(self, req: ScheduleRequest) -> ScheduleResponse:
        pass 

    def handle_req_noti(self, req: NotificationRequest) -> NotificationResponse:
        return NotificationResponse(True)

    def handle_req_major(self, req: MajorRequest) -> MajorResponse:
        pass


    def run(self):
        while True:
            conn, addr = self.socket.accept()
            data = conn.recv(4096)

            print("Connection recieved from ", addr)

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
            print(f"Request type: {request_type}")

            if request_type == REQ_COURSE:
                pass
            elif request_type == REQ_PROFESSOR:
                pass 
            elif request_type == REQ_NOTIFICATION:
                pass 
            elif request_type == REQ_SCHEDULE:
                pass
            elif request_type == REQ_DEBUG:

                outgoing.type = RES_DEBUG
                outgoing.r4.msg = "pong"
            else:
                print("Error: unknown request type") 
                continue

            # respond
            print(str(incoming_request))

            data: bytes = outgoing.SerializeToString()

            conn.send(data)
            conn.close()


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
