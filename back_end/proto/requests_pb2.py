# -*- coding: utf-8 -*-
# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: proto/requests.proto
"""Generated protocol buffer code."""
from google.protobuf import descriptor as _descriptor
from google.protobuf import descriptor_pool as _descriptor_pool
from google.protobuf import message as _message
from google.protobuf import reflection as _reflection
from google.protobuf import symbol_database as _symbol_database
# @@protoc_insertion_point(imports)

_sym_db = _symbol_database.Default()


from proto import data_pb2 as proto_dot_data__pb2


DESCRIPTOR = _descriptor_pool.Default().AddSerializedFile(b'\n\x14proto/requests.proto\x1a\x10proto/data.proto\">\n\x13NotificationRequest\x12\r\n\x05\x65mail\x18\x01 \x01(\t\x12\x18\n\x07\x63lasses\x18\x02 \x03(\x0b\x32\x07.Course\"\xd4\x01\n\x0fScheduleRequest\x12\r\n\x05major\x18\x01 \x01(\t\x12 \n\x0fpreviousClasses\x18\x02 \x03(\x0b\x32\x07.Course\x12!\n\x10preferredClasses\x18\x03 \x03(\x0b\x32\x07.Course\x12#\n\x12unpreferredClasses\x18\x04 \x03(\x0b\x32\x07.Course\x12\"\n\x0epreferredProfs\x18\x05 \x03(\x0b\x32\n.Professor\x12$\n\x10unprefferedProfs\x18\x06 \x03(\x0b\x32\n.Professor\"0\n\x10ProfessorRequest\x12\x12\n\x05major\x18\x01 \x01(\tH\x00\x88\x01\x01\x42\x08\n\x06_major\"-\n\rCourseRequest\x12\x12\n\x05major\x18\x01 \x01(\tH\x00\x88\x01\x01\x42\x08\n\x06_major\"\xe6\x01\n\x07Request\x12\"\n\x04type\x18\x01 \x01(\x0e\x32\x14.Request.RequestType\x12\x1e\n\x02r1\x18\x02 \x01(\x0b\x32\x10.ScheduleRequestH\x00\x12\"\n\x02r2\x18\x03 \x01(\x0b\x32\x14.NotificationRequestH\x00\x12\x1f\n\x02r3\x18\x04 \x01(\x0b\x32\x11.ProfessorRequestH\x00\x12\x1c\n\x02r4\x18\x05 \x01(\x0b\x32\x0e.CourseRequestH\x00\"-\n\x0bRequestType\x12\x0c\n\x08SCHEDULE\x10\x00\x12\x10\n\x0cNOTIFICATION\x10\x01\x42\x05\n\x03msgb\x06proto3')



_NOTIFICATIONREQUEST = DESCRIPTOR.message_types_by_name['NotificationRequest']
_SCHEDULEREQUEST = DESCRIPTOR.message_types_by_name['ScheduleRequest']
_PROFESSORREQUEST = DESCRIPTOR.message_types_by_name['ProfessorRequest']
_COURSEREQUEST = DESCRIPTOR.message_types_by_name['CourseRequest']
_REQUEST = DESCRIPTOR.message_types_by_name['Request']
_REQUEST_REQUESTTYPE = _REQUEST.enum_types_by_name['RequestType']
NotificationRequest = _reflection.GeneratedProtocolMessageType('NotificationRequest', (_message.Message,), {
  'DESCRIPTOR' : _NOTIFICATIONREQUEST,
  '__module__' : 'proto.requests_pb2'
  # @@protoc_insertion_point(class_scope:NotificationRequest)
  })
_sym_db.RegisterMessage(NotificationRequest)

ScheduleRequest = _reflection.GeneratedProtocolMessageType('ScheduleRequest', (_message.Message,), {
  'DESCRIPTOR' : _SCHEDULEREQUEST,
  '__module__' : 'proto.requests_pb2'
  # @@protoc_insertion_point(class_scope:ScheduleRequest)
  })
_sym_db.RegisterMessage(ScheduleRequest)

ProfessorRequest = _reflection.GeneratedProtocolMessageType('ProfessorRequest', (_message.Message,), {
  'DESCRIPTOR' : _PROFESSORREQUEST,
  '__module__' : 'proto.requests_pb2'
  # @@protoc_insertion_point(class_scope:ProfessorRequest)
  })
_sym_db.RegisterMessage(ProfessorRequest)

CourseRequest = _reflection.GeneratedProtocolMessageType('CourseRequest', (_message.Message,), {
  'DESCRIPTOR' : _COURSEREQUEST,
  '__module__' : 'proto.requests_pb2'
  # @@protoc_insertion_point(class_scope:CourseRequest)
  })
_sym_db.RegisterMessage(CourseRequest)

Request = _reflection.GeneratedProtocolMessageType('Request', (_message.Message,), {
  'DESCRIPTOR' : _REQUEST,
  '__module__' : 'proto.requests_pb2'
  # @@protoc_insertion_point(class_scope:Request)
  })
_sym_db.RegisterMessage(Request)

if _descriptor._USE_C_DESCRIPTORS == False:

  DESCRIPTOR._options = None
  _NOTIFICATIONREQUEST._serialized_start=42
  _NOTIFICATIONREQUEST._serialized_end=104
  _SCHEDULEREQUEST._serialized_start=107
  _SCHEDULEREQUEST._serialized_end=319
  _PROFESSORREQUEST._serialized_start=321
  _PROFESSORREQUEST._serialized_end=369
  _COURSEREQUEST._serialized_start=371
  _COURSEREQUEST._serialized_end=416
  _REQUEST._serialized_start=419
  _REQUEST._serialized_end=649
  _REQUEST_REQUESTTYPE._serialized_start=597
  _REQUEST_REQUESTTYPE._serialized_end=642
# @@protoc_insertion_point(module_scope)
