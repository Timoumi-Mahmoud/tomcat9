#!/bin/bash

set -e

ENVIRONMENT=$1

usage() {
    echo "Usage: $0 <ENVIRONMENT: DEV|PROD>"
    exit 1
}

if [ $# -ne 1 ]; then
    usage
fi

docker build -t tomcat-deploy:v3 -f Dockerfile .

docker run --rm -it \
  --privileged=true \
  -v "$(pwd)":/data \
  tomcat-deploy:v3 \
  bash -c "/data/tomcat_test.sh ${ENVIRONMENT}"


