#!/bin/python3
"""Module for Backend server handling requests and sending responses"""
import sys
import signal
from typing import Dict
from concurrent.futures import ThreadPoolExecutor
from threading import Lock

import grpc
from proto.service_pb2_grpc import ServiceServicer, add_ServiceServicer_to_server
from proto.data_pb2 import Course, Professor, Major
from proto.responses_pb2 import (CourseList, DebugResponse,MajorResponse,
                                 NotificationResponse, ScheduleResponse, CourseResponse,
                                 ProfessorResponse)
# import sqlite3


class Service(ServiceServicer):
    """Custom Service Object with response implementations"""
    def __init__(self):
        self.db_lock = Lock()
        # self.db_conn = sqlite3.Connection()
        # self.db_lock = None

    @staticmethod
    def create_course(ident: int, name: str, semester: str) -> Course:
        """Helper to create a Course object."""
        return Course(id=ident, name=name, semester=semester)

    def GetSchedule(self, request, context) -> ScheduleResponse:
        print(f"Received Schedule request: {repr(request)}")

        course_map: Dict[str, CourseList] = {}
        course_map["fall1"] = CourseList(courses=[self.create_course(1, "bruh121","fall"),
                                                  self.create_course(2, "yeet121", "fall")])
        course_map["spring1"] = CourseList(courses=[self.create_course(3, "bruh211","spring"),
                                                    self.create_course(4, "yeet221", "spring")])
        course_map["fall2"] = CourseList(courses=[self.create_course(1, "bruh121","fall"),
                                                  self.create_course(2, "yeet121", "fall")])
        course_map["spring2"] = CourseList(courses=[self.create_course(3, "bruh211","spring"),
                                                    self.create_course(4, "yeet221", "spring")])

        return ScheduleResponse(course_map=course_map)

    def RegisterNotifications(self, request, context) -> NotificationResponse:
        print(f"Received notification registration: {repr(request)}")
        return NotificationResponse(success=True)

    @staticmethod
    def create_prof(ident: int, first: str, last: str) -> Professor:
        """Helper to create a Professor object."""
        return Professor(id=ident,first=first, last=last)

    def GetProfessors(self, request, context) -> ProfessorResponse:
        """Generates ProfessorResponse from ProfessorRequest"""
        print(f"Received professor request: {repr(request)}")
        res = ProfessorResponse()
        res.professors.extend([self.create_prof(1, "Ronald", "Loui"),
                               self.create_prof(2, "Harold", "Connamacher")])
        return res

    def GetCourses(self, request, context) -> CourseResponse:
        print(f"Received course request: {repr(request)}")
        res = CourseResponse()
        res.courses.extend([self.create_course(1, "bruh", "spring"),
                            self.create_course(2, "yeet", "fall")])
        return res

    @staticmethod
    def create_major(ident: int, name: str) -> Major:
        """Helper to create a Major object."""
        return Major(id=ident, name=name)

    def GetMajors(self, request, context) -> MajorResponse:
        print(f"Received major request: {repr(request)}")
        res = MajorResponse()
        res.majors.extend([self.create_major(1, "CS"), self.create_major(2, "CE")])
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
