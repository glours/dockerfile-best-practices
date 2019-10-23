#!/bin/bash
docker stop devoxx
docker image prune -a -f
docker pull debian:buster
docker pull mongo:4.0-xenial
docker pull openjdk:11.0.5-slim-buster
docker pull openjdk:11-jre-slim
docker pull node:12.12.0-buster
docker pull node:12.12.0-alpine
docker pull nginx:alpine
git checkout step-7
docker build mongo -t dbp-mongo:1.0.0
docker build client -t dbp-client:1.0.0
docker build server -t dbp-server:1.0.0
docker build proxy -t dbp-proxy:1.0.0
git checkout step-0
docker build . -t devoxx-full
docker run --rm  -d -p 8080:80 --name dbp-full devoxx-full