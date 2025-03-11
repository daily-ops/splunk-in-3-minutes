#!/bin/bash

docker build -t log_generator .

docker network create --driver bridge splunknet

docker rm -f splunk

docker pull splunk/splunk:9.4.1

docker run --network splunknet -p 8000:8000 -e "SPLUNK_PASSWORD=Splunk123#" -d -e "SPLUNK_START_ARGS=--accept-license" -it --name splunk --hostname splunk splunk/splunk:9.4.1

sleep 5

until [ "`docker inspect -f {{.State.Health.Status}} splunk`"=="healthy" ]; do
    sleep 0.1;
done;

echo "Splunk is now available at http://localhost:8000"

HOSTPREFIX=web
PASSWORD=Splunk123

docker rm -f web{1..5}

for i in {1..5}; do

  HOSTNAME="${HOSTPREFIX}${i}"

  echo "Run node ${HOSTNAME}"
  docker run -h $HOSTNAME --name $HOSTNAME -d --network splunknet log_generator
  echo "Start forwarder"
  docker exec -it $HOSTNAME bash -c "/app/splunkforwarder/bin/splunk start --accept-license --answer-yes --no-prompt --seed-passwd ${PASSWORD}"
  echo "Login"
  docker exec -it $HOSTNAME bash -c "/app/splunkforwarder/bin/splunk login -auth admin:$PASSWORD"
  sleep 1
  echo "Add forwarder"
  docker exec -it $HOSTNAME bash -c "/app/splunkforwarder/bin/splunk add forward-server splunk:9997 --answer-yes"
  sleep 1
  echo "Add monitor"
  docker exec -it $HOSTNAME bash -c "/app/splunkforwarder/bin/splunk add monitor /var/log"

done
