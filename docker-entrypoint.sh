#!/bin/bash

function start_server() {
  # non blocking
  java -Djava.security.egd=file:/dev/./urandom -jar /workdir/server/target/bestpractices-0.0.1-SNAPSHOT.jar &
}

function start_nginx() {
  # blocking
  nginx -g "daemon off;"
}

start_server
start_nginx
