FROM debian:buster

RUN apt-get update -y
RUN apt-get install -y openjdk-11-jdk
RUN apt-get install -y nodejs
RUN apt-get install -y wget gnupg \
  && wget -qO - https://www.mongodb.org/static/pgp/server-4.2.asc | apt-key add - \
  && echo "deb http://repo.mongodb.org/apt/debian buster/mongodb-org/testing main" | tee /etc/apt/sources.list.d/mongodb-org-testing.list \
  && apt-get update \
  && apt-get install -y mongodb-org-server
RUN apt-get install -y nginx

VOLUME /tmp
ARG JAR_FILE
COPY ${JAR_FILE} app.jar

COPY docker-entrypoint.sh /docker-entrypoint.sh
RUN chmod +x /docker-entrypoint.sh

CMD ["/bin/bash", "/docker-entrypoint.sh"]
