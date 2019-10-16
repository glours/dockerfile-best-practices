#!/bin/bash

function start_mongo() {
  # non blocking
  mongod --fork --syslog
}

start_mongo

java -Djava.security.egd=file:/dev/./urandom -jar /app.jar
