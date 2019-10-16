#!/bin/bash

function start_server() {
  # blocking
  java -Djava.security.egd=file:/dev/./urandom -jar /app.jar
}

function start_nginx() {
  # non blocking
  nginx
}
