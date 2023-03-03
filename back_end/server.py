#!/bin/python3
import socket
import signal
import sys
import time

from sqlite3 import Connection, Cursor
import sqlite3
from typing import List, Tuple

from proto.requests_pb2 import Request, DebugRequest, REQ_DEBUG, REQ_COURSE, REQ_NOTIFICATION, REQ_SCHEDULE, REQ_PROFESSOR
from proto.responses_pb2 import Response, DebugResponse, RES_DEBUG

from proto.requests_pb2 import *
from proto.responses_pb2 import *
from proto.data_pb2 import *

import multiprocessing as mp
from multiprocessing.synchronize import Lock

# TODO: thread pool
# resource: https://superfastpython.com/threadpool-python/#ThreadPool_Example

running: bool = True

class DatabaseConnection:

    def __init__(self, filepath: str):
        try:
            self.connection: Connection = sqlite3.connect(filepath)
        except Exception:
            print("SQLite bad!")
        self.lock = mp.Lock()

    def __del__(self):
        self.connection.close()

    def get_version(self):
        return self.execute("select sqlite_version();")

    def execute(self, query: str):
        self.lock.acquire()
        cursor: Cursor = self.connection.cursor()
        cursor.execute(query)
        record = cursor.fetchall()
        cursor.close()
        self.lock.release()
        return record

class WorkerThread:

    def __init__(self, rx_q: mp.Queue,
                 rx_lock: Lock,
                 db_conn: DatabaseConnection):
        self.rx_q = rx_q
        self.rx_lock = rx_lock

        self.db_conn = db_conn

        self.t_sleep = 0.1

    def run(self):
        while True:
            if not self.rx_lock.acquire(block=False):
                time.sleep(self.t_sleep)
                continue

            if self.rx_q.empty():
                self.rx_lock.release()
                time.sleep(self.t_sleep)
                continue

            (conn, addr, request) = self.rx_q.get_nowait()
            # self.rx_q.task_done()
            self.rx_lock.release()

            request_type = request.type

            # TODO: handle request
            print(f"Request type: {request_type}")

            response = None

            if request_type == REQ_COURSE:
                response = Response(type=RES_COURSES, r3=self.handle_req_course(request.r4))
            elif request_type == REQ_PROFESSOR:
                response = Response(type=RES_PROFS, r2=self.handle_req_prof(request.r3))
            elif request_type == REQ_NOTIFICATION:
                response = Response(type=RES_NOTI, r6=self.handle_req_noti(request.r2))
            elif request_type == REQ_SCHEDULE:
                response = Response(type=RES_SCHEDULE, r1=self.handle_req_schedule(request.r1))
            elif request_type == REQ_DEBUG:
                response = Response(type=RES_DEBUG, r4=DebugResponse(msg="pong"))
            else:
                print("Error: unknown request type")
                continue

            if response is None:
                continue

            # send data
            data: bytes = response.SerializeToString()
            conn.send(data)

            # close socket
            conn.close()
    
    def handle_req_course(self, req: CourseRequest) -> CourseResponse:
        res = CourseResponse()

        def create_course(id: int, name: str, semester: str) -> Course:
            course = Course()
            course.Clear()
            course.id = id
            course.name = name
            course.semester = semester
            return course

        res.courses.extend([create_course(1, "bruh", "spring"), create_course(2, "yeet", "fall")])
        return res

    def handle_req_prof(self, req: ProfessorRequest) -> ProfessorResponse:
        res = ProfessorResponse()

        def create_prof(id: int, first: str, last: str) -> Professor:
            prof = Professor()
            prof.Clear()
            prof.id = id 
            prof.first = first 
            prof.last = last
            return prof

        res.professors.extend([create_prof(1, "Ronald", "Loui"), create_prof(2, "Harold", "Connamacher")])
        return res

    def handle_req_schedule(self, req: ScheduleRequest) -> ScheduleResponse:
        pass

    def handle_req_noti(self, req: NotificationRequest) -> NotificationResponse:
        return NotificationResponse(True)

    def handle_req_major(self, req: MajorRequest) -> MajorResponse:
        
        def create_major(id: int, name: str) -> Major:
            major = Major()
            major.Clear()
            major.id = id
            major.name = name
            return major

        res = MajorResponse()
        res.majors.extend([create_major(1, "CS"), create_major(2, "CE")])
        return res



class Server:

    @staticmethod
    def run_worker(worker: WorkerThread):
        worker.run()

    def __init__(self, server: str, port: int, db_fn: str):
        self.socket = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
        self.socket.bind((server, port))
        self.socket.listen(1)

        # rx and tx queues
        self.rx_queue: mp.Queue[Tuple[socket.socket, Tuple[str, int], Request]] = mp.Queue()
        self.rx_lock = mp.Lock()

        # db connection
        self.db_conn = DatabaseConnection(db_fn)
        print("SQLite version: ", self.db_conn.get_version())

        # worker threads
        self.workers: List[mp.Process] = []
        self.num_workers = 4
        for i in range(self.num_workers):
            worker = WorkerThread(self.rx_queue, self.rx_lock, self.db_conn)
            workerProc = mp.Process(target=Server.run_worker, args=(worker,))
            workerProc.start()
            self.workers.append(workerProc)

    def __del__(self):
        self.socket.close()

    def run(self):
        while running:
            conn, addr = self.socket.accept()
            data = conn.recv(4096)

            print("Connection recieved from ", addr)

            incoming_request = Request()
            incoming_request.Clear()

            if len(data) == 0:
                print("Recieved try connection.")
                continue

            # get message from string
            # TODO: error check

            print(bytes(data))
            incoming_request.ParseFromString(data)

            self.rx_queue.put_nowait((conn, addr, incoming_request))

    def shutdown(self):
        self.shutdown = False
        self.socket.close()


if __name__ == "__main__":

    if len(sys.argv) < 2:
        print("Not enough input arguments. Usage: server <port>")
        exit()

    port = int(sys.argv[1])
    print("Initializing server...")
    db_fn = "TODO"
    server = Server("localhost", port, db_fn)

    def signal_handler(sig, frame):
        server.shutdown()
        sys.exit(0)
    signal.signal(signal.SIGINT, signal_handler)

    print("Running Server...")
    server.run()
    
    del server

    print("Server shutting down...")
    sys.exit(0)
