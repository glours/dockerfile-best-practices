#!/bin/bash

function start_server() {
  # non blocking
  java -Djava.security.egd=file:/dev/./urandom -jar /app.jar &
}

function start_nginx() {
  # blocking
  nginx -g "daemon off;"
}

start_server
start_nginx
