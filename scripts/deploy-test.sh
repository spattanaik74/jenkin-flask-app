#!/bin/bash

docker stop flask-test || true
docker rm flask-test || true

docker run -d \
  --name flask-test \
  -p 5001:5000 \
  flask-demo:${BUILD_NUMBER}