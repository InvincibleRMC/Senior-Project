#!/bin/python3

"""Module for Sever IO and basic Requests and Response"""
import socket
import sys
import time
import math

from sqlite3 import Connection, Cursor
import sqlite3
from typing import List

import multiprocessing as mp
from multiprocessing.synchronize import Lock

from proto.requests_pb2 import (Request, REQ_DEBUG, REQ_COURSE, REQ_NOTIFICATION,
                                REQ_SCHEDULE, REQ_PROFESSOR, REQ_MAJOR, MajorRequest,
                                NotificationRequest, ScheduleRequest, CourseRequest,
                                ProfessorRequest)
from proto.responses_pb2 import (Response, DebugResponse, RES_DEBUG, RES_COURSES, RES_MAJOR,
                                 RES_NOTI, RES_PROFS, RES_SCHEDULE, MajorResponse,
                                 NotificationResponse, ScheduleResponse, CourseResponse,
                                 ProfessorResponse)

from proto.data_pb2 import Course, Professor, Major
# from proto.requests_pb2 import *
# from proto.responses_pb2 import *
# from proto.data_pb2 import *


# TODO: thread pool
# resource: https://superfastpython.com/threadpool-python/#ThreadPool_Example

running: bool = True
max_packet_len: int = 1024 * 8 # 8 kb

class DatabaseConnection:
    """DatabaseConnection is a connection to a sqlite database with helper functions for locking"""
    def __init__(self, filepath: str):
        """Create DatabaseConnection Object"""
        try:
            self.connection: Connection = sqlite3.connect(filepath)
        except sqlite3.Error:
            print("SQLite bad!")
        self.lock = mp.Lock()

    def __del__(self):
        """Delete DataBaseConnection Object"""
        self.connection.close()

    def get_version(self):
        """Returns version of sqlite"""
        return self.execute("select sqlite_version();")

    def execute(self, query: str):
        """Execute query"""
        self.lock.acquire()
        cursor: Cursor = self.connection.cursor()
        cursor.execute(query)
        record = cursor.fetchall()
        cursor.close()
        self.lock.release()
        return record


class WorkerThread:
    """Threads for processing Requests then sending Responses"""
    def __init__(self, rx_q: mp.Queue, rx_lock: Lock, db_conn: DatabaseConnection):
        """Creates WorkerThread Object"""
        self.rx_q = rx_q
        self.rx_lock = rx_lock

        self.db_conn = db_conn

        self.t_sleep = 0.1

    def run(self):
        """Run WorkerThread"""
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
            print(request)
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
            elif request_type == REQ_MAJOR:
                response = Response(type=RES_MAJOR, r5=self.handle_req_major(request.r6))
            else:
                print("Error: unknown request type")
                continue

            response.id = request.id

            # send data
            data: bytes = response.SerializeToString()
            conn.send(data)

            n_bytes = len(data)
            num_packets = int(math.ceil(float(n_bytes) / float(max_packet_len)))
            
            for i in range(num_packets):
                chunk: bytes = bytes([0])
                chunk = chunk.join(data[i * max_packet_len:(i + 1) * max_packet_len])
                conn.send(chunk)

            # close socket
            conn.close()

    def create_course(self, ident: int, name: str, semester: str) -> Course:
        """Helper to create a Course object."""
        course = Course()
        course.Clear()
        course.id = ident
        course.name = name
        course.semester = semester
        return course

    def handle_req_course(self, req: CourseRequest) -> CourseResponse:
        """Generates CourseResponse from CourseRequest"""
        res = CourseResponse()
        res.courses.extend([self.create_course(1, "bruh", "spring"),
                            self.create_course(2, "yeet", "fall")])
        return res

    def handle_req_prof(self, req: ProfessorRequest) -> ProfessorResponse:
        """Generates ProfessorResponse from ProfessorRequest"""
        res = ProfessorResponse()

        def create_prof(ident: int, first: str, last: str) -> Professor:
            """Helper to create a Professor object."""
            prof = Professor()
            prof.Clear()
            prof.id = ident
            prof.first = first
            prof.last = last
            return prof

        res.professors.extend([create_prof(1, "Ronald", "Loui"),
                               create_prof(2, "Harold", "Connamacher")])
        return res

    def handle_req_schedule(self, req: ScheduleRequest) -> ScheduleResponse:
        """Generates ScheduleResponse from ScheduleRequest"""
        res = ScheduleResponse()
        # TODO:
        res.fall1.extend([self.create_course(1, "bruh", "spring"),
                            self.create_course(2, "yeet", "fall")])
        res.spring1.extend([self.create_course(1, "bruh", "spring"),
                            self.create_course(2, "yeet", "fall")])
        res.fall2.extend([self.create_course(1, "bruh", "spring"),
                            self.create_course(2, "yeet", "fall")])
        res.spring2.extend([self.create_course(1, "bruh", "spring"),
                            self.create_course(2, "yeet", "fall")])
        res.fall3.extend([self.create_course(1, "bruh", "spring"),
                            self.create_course(2, "yeet", "fall")])
        res.spring3.extend([self.create_course(1, "bruh", "spring"),
                            self.create_course(2, "yeet", "fall")])
        res.fall4.extend([self.create_course(1, "bruh", "spring"),
                            self.create_course(2, "yeet", "fall")])
        res.spring4.extend([self.create_course(1, "bruh", "spring"),
                            self.create_course(2, "yeet", "fall")])
        return res

    def handle_req_noti(self, req: NotificationRequest) -> NotificationResponse:
        """Generates NotificationResponse from NotificationRequest"""
        return NotificationResponse(True)

    def handle_req_major(self, req: MajorRequest) -> MajorResponse:
        """Generates MajorResponse from MajorRequest"""

        def create_major(ident: int, name: str) -> Major:
            """Helper to create a Major object."""
            major = Major()
            major.Clear()
            major.id = ident
            major.name = name
            return major

        res = MajorResponse()
        res.majors.extend([create_major(1, "CS"), create_major(2, "CE")])
        return res


class Server:  # pylint: disable=too-few-public-methods
    """Server for receives Requests and adding to Queue for workerThreads"""

    def __init__(self, server_ip: str, port: int, db_fn: str):
        """Creates Server Object"""
        self.socket = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
        # From Stackoverflow how to not have to wait for server address
        # https://stackoverflow.com/questions/4465959/python-errno-98-address-already-in-use
        self.socket.setsockopt(socket.SOL_SOCKET, socket.SO_REUSEADDR, 1)
        self.socket.bind((server_ip, port))
        self.socket.listen(1)

        # rx and tx queues
        self.rx_queue: mp.Queue = mp.Queue()
        self.rx_lock = mp.Lock()

        # db connection
        self.db_conn = DatabaseConnection(db_fn)
        print("SQLite version: ", self.db_conn.get_version())

        # worker threads
        self.workers: List[mp.Process] = []
        self.num_workers = 4
        for _ in range(self.num_workers):
            worker = WorkerThread(self.rx_queue, self.rx_lock, self.db_conn)
            worker_proc = mp.Process(target=worker.run)
            worker_proc.start()
            self.workers.append(worker_proc)

    def run(self):
        """Run Server"""
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


def main():
    """Init all"""

    if len(sys.argv) < 2:
        print("Not enough input arguments. Usage: server <port>")
        sys.exit()

    port = int(sys.argv[1])
    print("Initializing server...")
    db_fn = "CSDS395.db"
    server = Server("localhost", port, db_fn)

    print("Running Server...")
    server.run()

    print("Server shutting down...")
    sys.exit(0)


if __name__ == "__main__":
    main()
