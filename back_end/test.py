from class_pb2 import Class
from google.protobuf.json_format import MessageToJson, Parse

c = Class()
c.id = 0
c.name = "bruh"

json = MessageToJson(c)
print(str(json))