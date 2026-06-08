#!/bin/bash

docker stop flask-prod || true
docker rm flask-prod || true

docker run -d \
  --name flask-prod \
  -p 5000:5000 \
  flask-demo:${BUILD_NUMBER}