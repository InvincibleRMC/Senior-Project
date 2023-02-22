#!/bin/bash

protoc --python_out=back_end/ --dart_out=front_end/lib/proto proto/requests.proto