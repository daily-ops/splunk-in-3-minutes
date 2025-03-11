#!/bin/bash

docker rm -f web{1..5}
docker rm -f splunk
docker network rm splunknet
docker image rm log_generator
docker image rm splunk/splunk:9.4.1
