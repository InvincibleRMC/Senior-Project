#!/bin/python3

import sys

from concurrent.futures import ThreadPoolExecutor
import grpc 
from proto.service_pb2_grpc import ServiceServicer, add_ServiceServicer_to_server


import sqlite3

from proto.data_pb2 import Course, Professor, Major
from proto.requests_pb2 import (Request, REQ_DEBUG, REQ_COURSE, REQ_NOTIFICATION,
                                REQ_SCHEDULE, REQ_PROFESSOR, REQ_MAJOR, MajorRequest,
                                NotificationRequest, ScheduleRequest, CourseRequest,
                                ProfessorRequest)
from proto.responses_pb2 import (Response, DebugResponse, RES_DEBUG, RES_COURSES, RES_MAJOR,
                                 RES_NOTI, RES_PROFS, RES_SCHEDULE, MajorResponse,
                                 NotificationResponse, ScheduleResponse, CourseResponse,
                                 ProfessorResponse)

class Service(ServiceServicer):

    def __init__(self):
        pass
        # self.db_conn = sqlite3.Connection()
        # self.db_lock = None 

    @staticmethod
    def create_course(ident: int, name: str, semester: str) -> Course:
        """Helper to create a Course object."""
        course = Course()
        course.Clear()
        course.id = ident
        course.name = name
        course.semester = semester
        return course

    def GetSchedule(self, request, context):
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
    
    def RegisterNotifications(self, request, context):
        return NotificationResponse(True)
    

    @staticmethod
    def create_prof(ident: int, first: str, last: str) -> Professor:
        """Helper to create a Professor object."""
        prof = Professor()
        prof.Clear()
        prof.id = ident
        prof.first = first
        prof.last = last
        return prof

    def GetProfessors(self, request, context):
        """Generates ProfessorResponse from ProfessorRequest"""
        res = ProfessorResponse()
        res.professors.extend([self.create_prof(1, "Ronald", "Loui"),
                               self.create_prof(2, "Harold", "Connamacher")])
        return res
        # return super().GetProfessors(request, context)
    
    def GetCourses(self, request, context):
        res = CourseResponse()
        res.courses.extend([self.create_course(1, "bruh", "spring"),
                            self.create_course(2, "yeet", "fall")])
        return res

    @staticmethod    
    def create_major(ident: int, name: str) -> Major:
        """Helper to create a Major object."""
        major = Major()
        major.Clear()
        major.id = ident
        major.name = name
        return major

    def GetMajors(self, request, context):
        res = MajorResponse()
        res.majors.extend([self.create_major(1, "CS"), self.create_major(2, "CE")])
        return res
    
    def Debug(self, request, context):
        print(f"Received {request.msg}")
        return DebugResponse(msg="pong")



def serve(port: int):
    server = grpc.server(ThreadPoolExecutor(max_workers=10))
    add_ServiceServicer_to_server(Service(), server)
    server.add_insecure_port(f"[::]:{port}")
    server.start()
    server.wait_for_termination()


if __name__ == "__main__":
    if len(sys.argv) < 2:
        print("Usage: server <port>")
        exit(1)
    port: int = int(sys.argv[1])
    serve(port)