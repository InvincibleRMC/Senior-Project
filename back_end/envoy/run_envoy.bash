#!/bin/bash
#
docker build . -t  myenvoy
docker run -d -p 8080:8080 -p 9901:9901 --name envoy --network=host myenvoy

