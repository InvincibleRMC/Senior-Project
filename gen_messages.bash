#!/bin/bash

python3 -m grpc_tools.protoc -I. --python_out=back_end/ --dart_out=grpc:front_end/lib/ --grpc_python_out=back_end/ proto/*.proto