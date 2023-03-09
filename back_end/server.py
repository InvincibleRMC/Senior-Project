#!/bin/python3

"""Module for Sever IO and basic Requests and Response"""
import socket
import sys
import time
import sqlite3
from sqlite3 import Connection, Cursor
from sqlite3 import Error
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
import atexit

# TODO: thread pool
# resource: https://superfastpython.com/threadpool-python/#ThreadPool_Example

running: bool = True


class DatabaseConnection:
    """DatabaseConnection is a connection to a sqlite database with helper functions for locking"""

    def __init__(self, filepath: str):
        """Create DatabaseConnection Object"""
        self.conn: Connection = self.create_connection(filepath)
        self.lock = mp.Lock()
        atexit.register(self.conn.close)

    def create_connection(self, db_file: str) -> Connection:
        """created connection to database"""
        conn = None
        try:
            conn = sqlite3.connect(db_file)
        except Error as error:
            print(error)
            sys.exit()

        return conn

    def get_version(self):
        """Returns version of sqlite"""
        return self.execute("select sqlite_version();")

    def execute(self, query: str):
        """Execute query"""
        self.lock.acquire()
        cursor: Cursor = self.conn.cursor()
        cursor.execute(query)
        record = cursor.fetchall()
        cursor.close()
        self.lock.release()
        return record

    def select_all_courses(self) -> List[str]:
        """selects all courses"""

        rows = self.execute("SELECT sub_cat_num FROM course")
        list_of_courses: List[str] = []
        for row in rows:
            list_of_courses.append(row[0])

        return list_of_courses

    def select_all_profs(self) -> List[str]:
        """selects all profs"""

        rows = self.execute("SELECT firstname,lastname FROM instructor")
        list_of_profs: List[str] = []
        for row in rows:
            list_of_profs.append(row[1] + ", " + row[0])

        return list_of_profs

    def clear_class_list(self):
        """clears generated class list"""
        self.execute("DELETE FROM final_class_list")

    def clear_taken_list(self):
        """clears class taken list"""
        self.execute("DELETE FROM classes_taken")

    def add_taken_classes(self, taken_class_array: List[str]):
        """adds classes taken to class list"""
        cur = self.conn.cursor()
        sql = """SELECT num, sub_cat_num
                       FROM course crs
                       WHERE crs.sub_cat_num = ?"""
        for classes in taken_class_array:
            cur.execute(sql, (classes,))
            sql2 = '''INSERT OR REPLACE INTO classes_taken(num, sub_cat_num) VALUES (?,?)'''

            rows = cur.fetchall()
            for row in rows:
                cur.execute(sql2, row)

    def select_classes(self, credits_total: int):
        """generates a schedule"""
        current_credits = 0
        while current_credits < credits_total - 1:
            cur = self.conn.cursor()
            cur.execute("""SELECT num, sub_cat_num, course_time, course_days
                            FROM course crs, course_offered co, teacher_ratings tr
                            WHERE crs.num = co.course_id
                            AND co.prof_id = tr.instructor_id
                            AND crs.num NOT IN (SELECT num FROM classes_taken ct)
                            AND crs.sub_cat_num NOT IN (SELECT sub_cat_num FROM final_class_list ct)
                            AND (co.course_time NOT IN(SELECT course_time FROM final_class_list fcl) AND co.course_days NOT IN(SELECT course_days FROM final_class_list fcl))
                            ORDER BY tr.rmp
                            DESC LIMIT 1""")
            save = (0, '', '', '')
            rows = cur.fetchall()

            for row in rows:
                print(row)
                save = row

            num, sub_cat_num, course_time, course_days = save
            sql1 = """INSERT OR REPLACE INTO final_class_list"""
            sql2 = """(num, sub_cat_num, course_time, course_days) VALUES (?,?,?,?)"""
            cur.execute(sql1+sql2, save)

            cur.execute("SELECT SUM(credits) FROM course crs WHERE crs.num =" + str(num))
            rows = cur.fetchall()
            save2 = 0
            for row in rows:
                print(row)
                save2 = row[0]
                current_credits += save2


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

            # close socket
            conn.close()

    def create_course(self, name: str, ident: int = 0, semester: str = "") -> Course:
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
        course_list: List[Course] = []
        for class_name in self.db_conn.select_all_courses():
            course_list.append(self.create_course(class_name))

        res.courses.extend(course_list)
        return res

    def create_prof(self, name: str, ident: int = 0) -> Professor:
        """Helper to create a Professor object."""
        prof = Professor()

        name_list = name.split(",")
        prof.Clear()
        prof.id = ident
        prof.first = name_list[0]
        prof.last = name_list[1]
        return prof

    def handle_req_prof(self, req: ProfessorRequest) -> ProfessorResponse:
        """Generates ProfessorResponse from ProfessorRequest"""
        res = ProfessorResponse()
        prof_list: List[Professor] = []
        for prof in self.db_conn.select_all_profs():
            prof_list.append(self.create_prof(prof))

        res.professors.extend(prof_list)
        return res

    def handle_req_schedule(self, req: ScheduleRequest) -> ScheduleResponse:
        """Generates ScheduleResponse from ScheduleRequest"""
        res = ScheduleResponse()
        # TODO:
        res.fall1.extend([self.create_course("bruh"),
                          self.create_course("yeet")])
        res.spring1.extend([self.create_course("bruh"),
                            self.create_course("yeet")])
        res.fall2.extend([self.create_course("bruh"),
                          self.create_course("yeet")])
        res.spring2.extend([self.create_course("bruh"),
                            self.create_course("yeet")])
        res.fall3.extend([self.create_course("bruh", ),
                          self.create_course("yeet")])
        res.spring3.extend([self.create_course("bruh"),
                            self.create_course("yeet")])
        res.fall4.extend([self.create_course("bruh"),
                          self.create_course("yeet")])
        res.spring4.extend([self.create_course("bruh"),
                            self.create_course("yeet")])
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
