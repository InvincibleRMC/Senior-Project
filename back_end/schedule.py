#!/bin/python3

from proto.data_pb2 import *

from typing import List, Union

from dataclasses import dataclass

@dataclass
class DAGNode:
    key: str
    parent: Union[DAGNode, None]
    children: Union[List[DAGNode], None]

class DAG:
     
    def __init__(self):
        self.root = None

def caclulate_schedule(major_dag, course_dag, majors: List[Major], desired_profs: List[Professor], undesired_profs: List[Professor], desired_courses: List[Course],
                       undesired_courses: List[Course], taken_courses: List[Course], min_credits_per_semester: int, max_credits_per_semester: int):
    pass