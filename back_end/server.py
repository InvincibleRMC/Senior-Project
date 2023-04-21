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
        self.clear_data()

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
        """Returns list of all Courses"""

        cur = self.conn.cursor()
        cur.execute("SELECT distinct sub_cat_num_name FROM course")

        rows = cur.fetchall()

        list_of_courses: List[str] = []
        for row in rows:
            list_of_courses.append(row[0])

        return list_of_courses

    def select_all_profs(self) -> List[str]:
        """Returns list of all Profs"""

        cur = self.conn.cursor()
        cur.execute("SELECT lastname_firstname FROM teacher")

        return cur.fetchall()

    def add_taken_classes(self, taken_class_array: List[str]):
        """Adds classes taken"""

        cur = self.conn.cursor()
        for classes in taken_class_array:
            sql2 = '''INSERT OR REPLACE INTO classes_taken(sub_cat_num_name) VALUES (?)'''
            cur.execute(sql2, (classes,))

    def add_wanted_subjects(self, subjects_array: List[str]):
        """Adds wanted subjects"""

        cur = self.conn.cursor()
        for subjects in subjects_array:

            sql = '''INSERT OR REPLACE INTO subjects(sub_cat_name) VALUES (?)'''
            cur.execute(sql, (subjects,))

        cur.execute("""SELECT * FROM subjects""")
        rows = cur.fetchall()
        for row in rows:
            print(row)

    def select_classes(self, credits_total: int = 15):
        """Query tasks by priority

        :param conn: the Connection object
        :param priority:
        :return:
        """

        conn = self.conn
        current_credits = 0
        cur = conn.cursor()

        print(credits_total)

        while current_credits < credits_total - 1:
            cur.execute("""SELECT sub_cat_num_name_type, crs.sub_cat_num_name, course_time, course_days, title, prof_name
                            FROM course crs, course_offered co, teacher tr, course_rating cr
                            WHERE crs.sub_cat_num_name_type = co.course_id
                            AND co.prof_name = tr.lastname_firstname
                            AND crs.sub_cat_num_name NOT IN (SELECT sub_cat_num_name FROM classes_taken ct)
                            AND cat_name IN (SELECT sub_cat_name from subjects s)
                            AND crs.sub_cat_num_name NOT IN (SELECT sub_cat_num_name FROM cannotTake cant)
                            AND crs.sub_cat_num_name NOT IN (SELECT sub_cat_num_name FROM final_class_list ct)
                            AND (co.course_time NOT IN(SELECT course_time FROM final_class_list fcl) AND co.course_days NOT IN(SELECT course_days FROM final_class_list fcl))
                            ORDER BY (0.3*cr.sis)+(0.2*tr.rmp)+(0.3*tr.sis)+(0.2*tr.difficulty) DESC
                            LIMIT 1""")
            save = ('', '', '', '', '', '')
            rows = cur.fetchall()
            classfound = False
            for row in rows:
                print("class selected")
                print(row)
                classfound = True
                save = row

            sub_cat_num_name_type, sub_cat_num_name, _, _, _, _ = save
            if classfound:
                cur.execute("""SELECT COUNT(*)
                            FROM course crs, course_offered co
                            WHERE crs.sub_cat_num_name_type = co.course_id
                            AND (co.course_time NOT IN(SELECT course_time FROM final_class_list fcl) AND co.course_days NOT IN(SELECT course_days FROM final_class_list fcl))
                            AND crs.sub_cat_num_name = '""" + sub_cat_num_name + "'")
                rows = cur.fetchall()
                # this is the finding of rec/lec other than the class picked
                save3 = 0
                for row in rows:
                    print('wtf')
                    print(row[0])
                    save3 = row[0]

                if save3 > 1:
                    cur.execute("""SELECT sub_cat_num_name_type, sub_cat_num_name, course_time, course_days, title, prof_name
                            FROM course crs, course_offered co
                            WHERE (co.course_time NOT IN(SELECT course_time FROM final_class_list fcl) AND co.course_days NOT IN(SELECT course_days FROM final_class_list fcl))
                            AND crs.sub_cat_num_name = '""" + sub_cat_num_name + "' AND crs.sub_cat_num_name_type != '"+ sub_cat_num_name_type+ "' LIMIT 1")
                    save5 = ('', '', '', '', '', '')
                    can_takerec = False
                    rows = cur.fetchall()

                    for row in rows:
                        print("has possible recitations")
                        can_takerec = True
                        save5 = row

                    # sub_cat_num_name_type2, sub_cat_num_name2, course_time2, course_days2, title, prof_name = save5
                    if can_takerec:
                        # check prereqs
                        # new shit here
                        cur.execute("""SELECT prereq
                                FROM course_prereq pr
                                WHERE pr.sub_cat_num_name = '""" + sub_cat_num_name + "'")

                        save6 = ''
                        has_prereq = False
                        rows = cur.fetchall()

                        for row in rows:
                            print(row[0] + " this is the pre req")
                            prereq = row[0]
                            has_prereq = True

                        if has_prereq:
                            prereq = save6
                            length = len(prereq)
                            if length < 9:
                                cur.execute("""SELECT COUNT(*)
                                    FROM classes_taken ct
                                    WHERE ct.sub_cat_num_name = '""" + prereq + "'")
                                taken = 0
                                rows = cur.fetchall()

                                for row in rows:
                                    print(row[0])
                                    taken = row[0]
                                if taken > 0:
                                    sql = '''INSERT OR REPLACE INTO final_class_list(sub_cat_num_name_type, sub_cat_num_name, course_time, course_days, title, prof_name) VALUES (?,?,?,?,?,?)'''
                                    cur.execute(sql, save)
                                    sql = '''INSERT OR REPLACE INTO final_class_list(sub_cat_num_name_type, sub_cat_num_name, course_time, course_days, title, prof_name) VALUES (?,?,?,?,?,?)'''
                                    cur.execute(sql, save5)
                                    print("inserted1 " + str(current_credits))
                                    cur.execute("SELECT SUM(credits) FROM course crs WHERE crs.sub_cat_num_name = '" + sub_cat_num_name + "'")
                                    rows = cur.fetchall()
                                    save2 = 0
                                    for row in rows:
                                        print(row)
                                        save2 = row[0]
                                        current_credits += save2
                                else:
                                    sql = '''INSERT OR REPLACE INTO cannotTake(sub_cat_num_name) VALUES (?)'''
                                    listed = (sub_cat_num_name,)
                                    cur.execute(sql, listed)
                                    print("does not meet prereqs 1")
                            else:
                                prereq1 = ''
                                prereq2 = ''
                                operation = ''
                                operationfound = False
                                for i in range(length):
                                    if (prereq[i] != '|' or prereq[i] != '&') and not operationfound:
                                        prereq1 += prereq1[i]
                                    elif (prereq[i] != '|' or prereq[i] != '&') and operationfound:
                                        prereq2 += prereq2[i]
                                    elif prereq[i] == '|':
                                        operation = 'or'
                                        operationfound = True
                                    else:
                                        operation = 'and'
                                        operationfound = True
                                if operation == 'or':
                                    cur.execute("""SELECT COUNT(*)
                                    FROM classes_taken ct
                                    WHERE ct.sub_cat_num_name = '""" + prereq1 + "' OR ct.sub_cat_num_name = '"+ prereq1 + "'")
                                    taken = 0
                                    rows = cur.fetchall()

                                    for row in rows:
                                        print(row)
                                        taken = row[0]
                                    if taken > 0:
                                        sql = '''INSERT OR REPLACE INTO final_class_list(sub_cat_num_name_type, sub_cat_num_name, course_time, course_days, title, prof_name) VALUES (?,?,?,?,?,?)'''
                                        cur.execute(sql, save)
                                        sql = '''INSERT OR REPLACE INTO final_class_list(sub_cat_num_name_type, sub_cat_num_name, course_time, course_days, title, prof_name) VALUES (?,?,?,?,?,?)'''
                                        cur.execute(sql, save5)
                                        print("inserted2 " + str(current_credits))
                                        cur.execute("SELECT SUM(credits) FROM course crs WHERE crs.sub_cat_num_name = '" + sub_cat_num_name + "'")
                                        rows = cur.fetchall()
                                        save2 = 0
                                        for row in rows:
                                            print(row)
                                            save2 = row[0]
                                            current_credits += save2
                                    else:
                                        sql = '''INSERT OR REPLACE INTO cannotTake(sub_cat_num_name) VALUES (?)'''
                                        listed = (sub_cat_num_name,)
                                        cur.execute(sql, listed)
                                        print("does not meet prereqs 2")
                                else:
                                    cur.execute("""SELECT COUNT(*)
                                    FROM classes_taken ct
                                    WHERE ct.sub_cat_num_name = '""" + prereq1 + "' AND ct.sub_cat_num_name = '"+ prereq1 + "'")
                                    taken = 0
                                    rows = cur.fetchall()

                                    for row in rows:
                                        print(row)
                                        taken = row[0]
                                    if taken > 0:
                                        sql = '''INSERT OR REPLACE INTO final_class_list(sub_cat_num_name_type, sub_cat_num_name, course_time, course_days, title, prof_name) VALUES (?,?,?,?,?,?)'''
                                        cur.execute(sql, save)
                                        sql = '''INSERT OR REPLACE INTO final_class_list(sub_cat_num_name_type, sub_cat_num_name, course_time, course_days, title, prof_name) VALUES (?,?,?,?,?,?)'''
                                        cur.execute(sql, save5)
                                        print("inserted3 " + str(current_credits))
                                        cur.execute("SELECT SUM(credits) FROM course crs WHERE crs.sub_cat_num_name = '" + sub_cat_num_name + "'")
                                        rows = cur.fetchall()
                                        save2 = 0
                                        for row in rows:
                                            print(row)
                                            save2 = row[0]
                                            current_credits += save2
                                    else:
                                        sql = '''INSERT OR REPLACE INTO cannotTake(sub_cat_num_name) VALUES (?)'''
                                        listed = (sub_cat_num_name,)
                                        cur.execute(sql, listed)
                                        print("does not meet prereqs 3")
                        else:
                            sql = '''INSERT OR REPLACE INTO final_class_list(sub_cat_num_name_type, sub_cat_num_name, course_time, course_days, title, prof_name) VALUES (?,?,?,?,?,?)'''
                            cur.execute(sql, save)
                            sql = '''INSERT OR REPLACE INTO final_class_list(sub_cat_num_name_type, sub_cat_num_name, course_time, course_days, title, prof_name) VALUES (?,?,?,?,?,?)'''
                            cur.execute(sql, save5)
                            print("inserted4 " + str(current_credits))
                            cur.execute("SELECT SUM(credits) FROM course crs WHERE crs.sub_cat_num_name = '" + sub_cat_num_name + "'")
                            rows = cur.fetchall()
                            save2 = 0
                            for row in rows:
                                print(row)
                                save2 = row[0]
                                current_credits += save2
                    else:
                        # create add to not able to take list?
                        sql = '''INSERT OR REPLACE INTO cannotTake(sub_cat_num_name) VALUES (?)'''
                        listed = (sub_cat_num_name,)
                        cur.execute(sql, listed)
                        print("time conflict")

                else:
                    print("no recitations")
                # check pre reqs

                    cur.execute("""SELECT prereq
                            FROM course_prereq pr
                            WHERE pr.sub_cat_num_name = '""" + sub_cat_num_name + "'")

                    save6 = ''
                    has_prereq = False
                    rows = cur.fetchall()

                    for row in rows:
                        print(row)
                        prereq = row[0]
                        has_prereq = True

                    if has_prereq:
                        prereq = save6
                        length = len(prereq)
                        if length < 9:
                            cur.execute("""SELECT COUNT(*)
                                FROM classes_taken ct
                                WHERE ct.sub_cat_num_name = '""" + prereq + "'")
                            taken = 0
                            rows = cur.fetchall()

                            for row in rows:
                                print(row)
                                taken = row[0]
                            if taken > 0:
                                sql = '''INSERT OR REPLACE INTO final_class_list(sub_cat_num_name_type, sub_cat_num_name, course_time, course_days, title, prof_name) VALUES (?,?,?,?,?,?)'''
                                cur.execute(sql, save)
                                print("inserted5 " + str(current_credits))
                                cur.execute("SELECT SUM(credits) FROM course crs WHERE crs.sub_cat_num_name = '" + sub_cat_num_name + "'")
                                rows = cur.fetchall()
                                save2 = 0
                                for row in rows:
                                    print(row)
                                    save2 = row[0]
                                    current_credits += save2
                            else:
                                sql = '''INSERT OR REPLACE INTO cannotTake(sub_cat_num_name) VALUES (?)'''
                                listed = (sub_cat_num_name,)
                                cur.execute(sql,listed)
                                print("does not meet prereqs 4")
                        else:
                            prereq1 = ''
                            prereq2 = ''
                            operation = ''
                            operationfound = False
                            for i in range(length):
                                if (prereq[i] != '|' or prereq[i] != '&') and not operationfound:
                                    prereq1 += prereq1[i]
                                elif (prereq[i] != '|' or prereq[i] != '&') and operationfound:
                                    prereq2 += prereq2[i]
                                elif prereq[i] == '|':
                                    operation = 'or'
                                    operationfound = True
                                else:
                                    operation = 'and'
                                    operationfound = True
                            if operation == 'or':
                                cur.execute("""SELECT COUNT(*)
                                FROM classes_taken ct
                                WHERE ct.sub_cat_num_name = '""" + prereq1 + "' OR ct.sub_cat_num_name = '"+ prereq1 + "'")
                                taken = 0
                                rows = cur.fetchall()

                                for row in rows:
                                    print(row)
                                    taken = row[0]
                                if taken > 0:
                                    sql = '''INSERT OR REPLACE INTO final_class_list(sub_cat_num_name_type, sub_cat_num_name, course_time, course_days, title, prof_name) VALUES (?,?,?,?,?,?)'''
                                    cur.execute(sql, save)
                                    print("inserted6 " + str(current_credits))
                                    cur.execute("SELECT SUM(credits) FROM course crs WHERE crs.sub_cat_num_name = '" + sub_cat_num_name + "'")
                                    rows = cur.fetchall()
                                    save2 = 0
                                    for row in rows:
                                        print(row)
                                        save2 = row[0]
                                        current_credits += save2
                                else:
                                    sql = '''INSERT OR REPLACE INTO cannotTake(sub_cat_num_name) VALUES (?)'''
                                    listed = (sub_cat_num_name,)
                                    cur.execute(sql, listed)
                                    print("does not meet prereqs 5")
                            else:
                                cur.execute("""SELECT COUNT(*)
                                FROM classes_taken ct
                                WHERE ct.sub_cat_num_name = '""" + prereq1 + "' AND ct.sub_cat_num_name = '"+ prereq1 + "'")
                                taken = 0
                                rows = cur.fetchall()

                                for row in rows:
                                    print(row)
                                    taken = row[0]
                                if taken > 0:
                                    sql = '''INSERT OR REPLACE INTO final_class_list(sub_cat_num_name_type, sub_cat_num_name, course_time, course_days, title, prof_name) VALUES (?,?,?,?,?,?)'''
                                    cur.execute(sql, save)
                                    print("inserted7 " + str(current_credits))
                                    cur.execute("SELECT SUM(credits) FROM course crs WHERE crs.sub_cat_num_name = '" + sub_cat_num_name + "'")
                                    rows = cur.fetchall()
                                    save2 = 0
                                    for row in rows:
                                        print(row)
                                        save2 = row[0]
                                        current_credits += save2
                                else:
                                    sql = '''INSERT OR REPLACE INTO cannotTake(sub_cat_num_name) VALUES (?)'''
                                    listed = (sub_cat_num_name,)
                                    cur.execute(sql, listed)
                                    print("does not meet prereqs 6")
                    else:
                        sql = '''INSERT OR REPLACE INTO final_class_list(sub_cat_num_name_type, sub_cat_num_name, course_time, course_days, title, prof_name) VALUES (?,?,?,?,?,?)'''
                        cur.execute(sql, save)
                        print("inserted8 " + str(current_credits))
                        print(sub_cat_num_name)
                        cur.execute("SELECT SUM(credits) FROM course crs WHERE crs.sub_cat_num_name = '" + sub_cat_num_name + "'")
                        rows2 = cur.fetchall()
                        save2 = 0
                        for row in rows2:
                            print(row)
                            save2 = row[0]
                            print(save2)
                            current_credits += save2
            else:
                current_credits = 100

    def clear_data(self):
        """Clears all data added by schedule generation."""
        cur = self.conn.cursor()
        cur.execute('''DELETE FROM subjects''')
        cur.execute('''DELETE FROM classes_taken''')
        cur.execute('''DELETE FROM cannotTake''')
        cur.execute('''DELETE FROM final_class_list''')

    def get_classes(self) -> List[str]:
        """Returns class schedule."""
        cur = self.conn.cursor()
        cur.execute("""SELECT * FROM final_class_list""")
        return cur.fetchall()


class Service(ServiceServicer):
    """Custom Service Object with response implementations"""
    def __init__(self):
        self.db_conn = DatabaseConnection("CSDS395.db")

    @staticmethod
    def create_course(name: str, ident: int = 0,  semester: str = "") -> Course:
        """Helper to create a Course object."""
        return Course(id=ident, name=name, semester=semester)

    def GetSchedule(self, request, context) -> ScheduleResponse:

        semester_options = ["Fall1", "Spring1", "Fall2", "Spring2", "Fall3",
                            "Spring3", "Fall4", "Spring4"]

        if request.semester == "Spring4":
            next_sem = "Spring4"
        else:
            next_sem = semester_options[semester_options.index(request.semester) + 1]

        print(f"Received Schedule request: {repr(request)}")

        course_map: Dict[str, CourseList] = {}

        num_credits: int = max((request.minCredits + request.maxCredits)/2, 12)

        course_list: List[str] = []

        for course in request.previousClasses:
            course_list.append(course.name)

        # Added taken classes
        self.db_conn.add_taken_classes(course_list)
        print("Added previous courses")

        # add subjects
        self.db_conn.add_wanted_subjects([request.department])
        print("Added wanted subjects")

        # Run algorithm
        self.db_conn.select_classes(num_credits)
        print("Ran algorithm")

        courses_from_database: List[str] = self.db_conn.get_classes()

        print(courses_from_database)

        courses_converted: List[Course] = []
        for course in courses_from_database:
            courses_converted.append(self.create_course(course[0], semester=course[5]))

        print("Converted")

        course_map[next_sem] = CourseList(courses=courses_converted)

        # print(course_map)
        # course_map["spring1"] = CourseList(courses=[self.create_course("bruh211"),
        #                                             self.create_course("yeet221")])
        # course_map["fall2"] = CourseList(courses=[self.create_course("bruh121"),
        #                                           self.create_course("yeet121")])
        # course_map["spring2"] = CourseList(courses=[self.create_course("bruh211"),
        #                                             self.create_course("yeet221")])

        self.db_conn.clear_data()
        print("Cleared")

        return ScheduleResponse(course_map=course_map)

    def RegisterNotifications(self, request, context) -> NotificationResponse:
        print(f"Received notification registration: {repr(request)}")
        return NotificationResponse(success=True)

    @staticmethod
    def create_prof(first: str, last: str, ident: int = 0) -> Professor:
        """Helper to create a Professor object."""
        return Professor(id=ident, first=first, last=last)

    def GetProfessors(self, request, context) -> ProfessorResponse:
        """Generates ProfessorResponse from ProfessorRequest"""
        print(f"Received professor request: {repr(request)}")
        res = ProfessorResponse()
        prof_list: List[Professor] = []

        for prof in self.db_conn.select_all_profs():

            element = prof[0]

            splitted = element.split(",")

            prof_list.append(self.create_prof(splitted[1], splitted[0]))

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
