#!/bin/python3
"""Module for Backend server handling requests and sending responses"""
from os import path
import sys
import sqlite3
from sqlite3 import Connection, Cursor, Error
from typing import List, Dict
import atexit
import signal
from concurrent.futures import ThreadPoolExecutor
from threading import Lock

import grpc
from proto.service_pb2_grpc import ServiceServicer, add_ServiceServicer_to_server
from proto.data_pb2 import Course, Professor, Major
from proto.responses_pb2 import (CourseList, DebugResponse,MajorResponse,
                                 NotificationResponse, ScheduleResponse, CourseResponse,
                                 ProfessorResponse)


class DatabaseConnection:
    """DatabaseConnection is a connection to a sqlite database with helper functions for locking"""

    def __init__(self, filepath: str):
        """Create DatabaseConnection Object"""
        self.conn: Connection = self._create_connection(filepath)
        self.lock = Lock()
        print(self.get_version())
        atexit.register(self.conn.close)

    def _create_connection(self, db_file: str) -> Connection:
        """created connection to database"""
        if not path.exists(db_file):
            raise FileNotFoundError

        conn = None
        try:
            conn = sqlite3.connect(db_file, check_same_thread=False)
        except Error as error:
            print(error)
            sys.exit()

        return conn

    def get_version(self) -> List[str]:
        """Returns version of sqlite"""
        return self.execute("select sqlite_version();")

    def execute(self, query: str, params=None) -> List[str]:
        """Execute query"""

        # https://www.bogotobogo.com/python/Multithread/python_multithreading_Using_Locks_with_statement_Context_Manager.php
        # With statements are cool
        with self.lock:
            cursor: Cursor = self.conn.cursor()
            if params is None:
                cursor.execute(query)
            else:
                cursor.execute(query, params)

            record = cursor.fetchall()
            cursor.close()
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
        self.conn.cursor().execute("DELETE FROM final_class_list").fetchall()

    def clear_taken_list(self):
        """clears class taken list"""
        self.conn.cursor().execute("DELETE FROM classes_taken").fetchall()

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

    # TODO actually check average credits
    def select_classes(self, credits_total: int = 15):
        """generates a schedule"""
        current_credits = 0
        classes: List[str] = []

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
            # classes.append(rows[1])

            for row in rows:
                print(row)
                classes.append(row[1])
                save = row

            num, sub_cat_num, course_time, course_days = save
            sql1 = """INSERT OR REPLACE INTO final_class_list"""
            sql2 = """(num, sub_cat_num, course_time, course_days) VALUES (?,?,?,?)"""
            cur.execute(sql1+sql2, save)

            cur.execute("SELECT SUM(credits) FROM course crs WHERE crs.num =" + str(num))
            rows = cur.fetchall()

            for row in rows:
                # print(row)
                save2: int = row[0]
                current_credits += save2

        self.clear_taken_list()
        self.clear_class_list()
        return classes


class Service(ServiceServicer):
    """Custom Service Object with response implementations"""
    def __init__(self):
        self.db_conn = DatabaseConnection("CSDS395.db")

    @staticmethod
    def create_course(name: str, ident: int = 0,  semester: str = "") -> Course:
        """Helper to create a Course object."""
        return Course(id=ident, name=name, semester=semester)

    def GetSchedule(self, request, context) -> ScheduleResponse:
        print(f"Received Schedule request: {repr(request)}")

        course_map: Dict[str, CourseList] = {}

        # credits: int = (request.minCredits + request.maxCredits)/2

        course_list: List[str] = []

        for course in request.previousClasses:
            course_list.append(course.name)


        self.db_conn.add_taken_classes(course_list)
        courses_from_database: List[str] = self.db_conn.select_classes()

        print(courses_from_database)

        courses_converted: List[Course] = []
        for course in courses_from_database:
            courses_converted.append(self.create_course(course))

        course_map["fall1"] = CourseList(courses=courses_converted)
        # course_map["spring1"] = CourseList(courses=[self.create_course("bruh211"),
        #                                             self.create_course("yeet221")])
        # course_map["fall2"] = CourseList(courses=[self.create_course("bruh121"),
        #                                           self.create_course("yeet121")])
        # course_map["spring2"] = CourseList(courses=[self.create_course("bruh211"),
        #                                             self.create_course("yeet221")])

        return ScheduleResponse(course_map=course_map)

    def RegisterNotifications(self, request, context) -> NotificationResponse:
        print(f"Received notification registration: {repr(request)}")
        return NotificationResponse(success=True)

    @staticmethod
    def create_prof(first: str, last: str, ident: int = 0) -> Professor:
        """Helper to create a Professor object."""
        return Professor(id=ident,first=first, last=last)

    def GetProfessors(self, request, context) -> ProfessorResponse:
        """Generates ProfessorResponse from ProfessorRequest"""
        print(f"Received professor request: {repr(request)}")
        res = ProfessorResponse()
        prof_list: List[Professor] = []
        for prof in self.db_conn.select_all_profs():
            split_prof = prof.split(",")
            prof_list.append(self.create_prof(split_prof[0], split_prof[1]))
        res.professors.extend(prof_list)
        return res

    def GetCourses(self, request, context) -> CourseResponse:
        print(f"Received course request: {repr(request)}")
        res = CourseResponse()
        course_list: List[Course] = []
        for course in self.db_conn.select_all_courses():
            course_list.append(self.create_course(course))
        res.courses.extend(course_list)
        return res

    @staticmethod
    def create_major(name: str, ident: int = 0) -> Major:
        """Helper to create a Major object."""
        return Major(id=ident, name=name)

    def GetMajors(self, request, context) -> MajorResponse:
        print(f"Received major request: {repr(request)}")
        res = MajorResponse()
        # TODO sql majors
        res.majors.extend([self.create_major("CS"), self.create_major("CE")])
        return res

    def Debug(self, request, context) -> DebugResponse:
        print(f"Received {request.msg}")
        return DebugResponse(msg="pong")


def serve(port: int):
    """Starts grpc server"""
    # this doesn't work apparently
    # server = grpc.server(ProcessPoolExecutor(max_workers=10))
    server = grpc.server(ThreadPoolExecutor(max_workers=10))

    def handler(signum, frame):
        print("Shutting down server...")
        server.stop(True)

    signal.signal(signal.SIGINT, handler)
    print("Adding service handler")
    add_ServiceServicer_to_server(Service(), server)
    print(f"Listening on localhost at port {port}")
    server.add_insecure_port(f"[::]:{port}")
    print("Starting server")
    server.start()
    server.wait_for_termination()


if __name__ == "__main__":
    if len(sys.argv) < 2:
        print("Usage: server <port>")
        sys.exit(1)
    port_num: int = int(sys.argv[1])
    serve(port_num)
