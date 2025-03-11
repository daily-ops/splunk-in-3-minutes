#!/bin/bash

docker rm -f web{1..5}
docker rm -f splunk
docker network rm splunknet
