# -*- coding: utf-8 -*-
# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: proto/requests.proto
"""Generated protocol buffer code."""
from google.protobuf.internal import builder as _builder
from google.protobuf import descriptor as _descriptor
from google.protobuf import descriptor_pool as _descriptor_pool
from google.protobuf import symbol_database as _symbol_database
# @@protoc_insertion_point(imports)

_sym_db = _symbol_database.Default()


from proto import data_pb2 as proto_dot_data__pb2

from proto.data_pb2 import *

DESCRIPTOR = _descriptor_pool.Default().AddSerializedFile(b'\n\x14proto/requests.proto\x1a\x10proto/data.proto\">\n\x13NotificationRequest\x12\r\n\x05\x65mail\x18\x01 \x01(\t\x12\x18\n\x07\x63lasses\x18\x02 \x03(\x0b\x32\x07.Course\"\x96\x02\n\x0fScheduleRequest\x12\x15\n\x05major\x18\x01 \x01(\x0b\x32\x06.Major\x12\x10\n\x08semester\x18\x02 \x01(\t\x12\x12\n\nminCredits\x18\x03 \x01(\x05\x12\x12\n\nmaxCredits\x18\x04 \x01(\x05\x12 \n\x0fpreviousClasses\x18\x05 \x03(\x0b\x32\x07.Course\x12!\n\x10preferredClasses\x18\x06 \x03(\x0b\x32\x07.Course\x12#\n\x12unpreferredClasses\x18\x07 \x03(\x0b\x32\x07.Course\x12\"\n\x0epreferredProfs\x18\x08 \x03(\x0b\x32\n.Professor\x12$\n\x10unprefferedProfs\x18\t \x03(\x0b\x32\n.Professor\"\x0e\n\x0cMajorRequest\"\x12\n\x10ProfessorRequest\"\x0f\n\rCourseRequest\"\x1b\n\x0c\x44\x65\x62ugRequest\x12\x0b\n\x03msg\x18\x01 \x01(\tP\x00\x62\x06proto3')

_builder.BuildMessageAndEnumDescriptors(DESCRIPTOR, globals())
_builder.BuildTopDescriptorsAndMessages(DESCRIPTOR, 'proto.requests_pb2', globals())
if _descriptor._USE_C_DESCRIPTORS == False:

  DESCRIPTOR._options = None
  _NOTIFICATIONREQUEST._serialized_start=42
  _NOTIFICATIONREQUEST._serialized_end=104
  _SCHEDULEREQUEST._serialized_start=107
  _SCHEDULEREQUEST._serialized_end=385
  _MAJORREQUEST._serialized_start=387
  _MAJORREQUEST._serialized_end=401
  _PROFESSORREQUEST._serialized_start=403
  _PROFESSORREQUEST._serialized_end=421
  _COURSEREQUEST._serialized_start=423
  _COURSEREQUEST._serialized_end=438
  _DEBUGREQUEST._serialized_start=440
  _DEBUGREQUEST._serialized_end=467
# @@protoc_insertion_point(module_scope)
