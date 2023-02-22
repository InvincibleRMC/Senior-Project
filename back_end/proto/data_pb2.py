# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: proto/data.proto

import sys
_b=sys.version_info[0]<3 and (lambda x:x) or (lambda x:x.encode('latin1'))
from google.protobuf import descriptor as _descriptor
from google.protobuf import message as _message
from google.protobuf import reflection as _reflection
from google.protobuf import symbol_database as _symbol_database
# @@protoc_insertion_point(imports)

_sym_db = _symbol_database.Default()




DESCRIPTOR = _descriptor.FileDescriptor(
  name='proto/data.proto',
  package='',
  syntax='proto3',
  serialized_options=None,
  serialized_pb=_b('\n\x10proto/data.proto\"\"\n\x06\x43ourse\x12\n\n\x02id\x18\x01 \x01(\r\x12\x0c\n\x04name\x18\x02 \x01(\t\"\x13\n\x05Major\x12\n\n\x02id\x18\x01 \x01(\x05\"4\n\tProfessor\x12\n\n\x02id\x18\x01 \x01(\x05\x12\r\n\x05\x66irst\x18\x02 \x01(\t\x12\x0c\n\x04last\x18\x03 \x01(\tb\x06proto3')
)




_COURSE = _descriptor.Descriptor(
  name='Course',
  full_name='Course',
  filename=None,
  file=DESCRIPTOR,
  containing_type=None,
  fields=[
    _descriptor.FieldDescriptor(
      name='id', full_name='Course.id', index=0,
      number=1, type=13, cpp_type=3, label=1,
      has_default_value=False, default_value=0,
      message_type=None, enum_type=None, containing_type=None,
      is_extension=False, extension_scope=None,
      serialized_options=None, file=DESCRIPTOR),
    _descriptor.FieldDescriptor(
      name='name', full_name='Course.name', index=1,
      number=2, type=9, cpp_type=9, label=1,
      has_default_value=False, default_value=_b("").decode('utf-8'),
      message_type=None, enum_type=None, containing_type=None,
      is_extension=False, extension_scope=None,
      serialized_options=None, file=DESCRIPTOR),
  ],
  extensions=[
  ],
  nested_types=[],
  enum_types=[
  ],
  serialized_options=None,
  is_extendable=False,
  syntax='proto3',
  extension_ranges=[],
  oneofs=[
  ],
  serialized_start=20,
  serialized_end=54,
)


_MAJOR = _descriptor.Descriptor(
  name='Major',
  full_name='Major',
  filename=None,
  file=DESCRIPTOR,
  containing_type=None,
  fields=[
    _descriptor.FieldDescriptor(
      name='id', full_name='Major.id', index=0,
      number=1, type=5, cpp_type=1, label=1,
      has_default_value=False, default_value=0,
      message_type=None, enum_type=None, containing_type=None,
      is_extension=False, extension_scope=None,
      serialized_options=None, file=DESCRIPTOR),
  ],
  extensions=[
  ],
  nested_types=[],
  enum_types=[
  ],
  serialized_options=None,
  is_extendable=False,
  syntax='proto3',
  extension_ranges=[],
  oneofs=[
  ],
  serialized_start=56,
  serialized_end=75,
)


_PROFESSOR = _descriptor.Descriptor(
  name='Professor',
  full_name='Professor',
  filename=None,
  file=DESCRIPTOR,
  containing_type=None,
  fields=[
    _descriptor.FieldDescriptor(
      name='id', full_name='Professor.id', index=0,
      number=1, type=5, cpp_type=1, label=1,
      has_default_value=False, default_value=0,
      message_type=None, enum_type=None, containing_type=None,
      is_extension=False, extension_scope=None,
      serialized_options=None, file=DESCRIPTOR),
    _descriptor.FieldDescriptor(
      name='first', full_name='Professor.first', index=1,
      number=2, type=9, cpp_type=9, label=1,
      has_default_value=False, default_value=_b("").decode('utf-8'),
      message_type=None, enum_type=None, containing_type=None,
      is_extension=False, extension_scope=None,
      serialized_options=None, file=DESCRIPTOR),
    _descriptor.FieldDescriptor(
      name='last', full_name='Professor.last', index=2,
      number=3, type=9, cpp_type=9, label=1,
      has_default_value=False, default_value=_b("").decode('utf-8'),
      message_type=None, enum_type=None, containing_type=None,
      is_extension=False, extension_scope=None,
      serialized_options=None, file=DESCRIPTOR),
  ],
  extensions=[
  ],
  nested_types=[],
  enum_types=[
  ],
  serialized_options=None,
  is_extendable=False,
  syntax='proto3',
  extension_ranges=[],
  oneofs=[
  ],
  serialized_start=77,
  serialized_end=129,
)

DESCRIPTOR.message_types_by_name['Course'] = _COURSE
DESCRIPTOR.message_types_by_name['Major'] = _MAJOR
DESCRIPTOR.message_types_by_name['Professor'] = _PROFESSOR
_sym_db.RegisterFileDescriptor(DESCRIPTOR)

Course = _reflection.GeneratedProtocolMessageType('Course', (_message.Message,), dict(
  DESCRIPTOR = _COURSE,
  __module__ = 'proto.data_pb2'
  # @@protoc_insertion_point(class_scope:Course)
  ))
_sym_db.RegisterMessage(Course)

Major = _reflection.GeneratedProtocolMessageType('Major', (_message.Message,), dict(
  DESCRIPTOR = _MAJOR,
  __module__ = 'proto.data_pb2'
  # @@protoc_insertion_point(class_scope:Major)
  ))
_sym_db.RegisterMessage(Major)

Professor = _reflection.GeneratedProtocolMessageType('Professor', (_message.Message,), dict(
  DESCRIPTOR = _PROFESSOR,
  __module__ = 'proto.data_pb2'
  # @@protoc_insertion_point(class_scope:Professor)
  ))
_sym_db.RegisterMessage(Professor)


# @@protoc_insertion_point(module_scope)
