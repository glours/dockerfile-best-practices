FROM ubuntu:bionic

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update -y
RUN apt-get install -y openjdk-11-jdk
RUN apt-get install -y wget gnupg
RUN wget -qO - https://deb.nodesource.com/gpgkey/nodesource.gpg.key | apt-key add - \
  && echo "deb https://deb.nodesource.com/node_14.x bionic main" | tee /etc/apt/sources.list.d/nodesource.list \
  && apt-get update \
  && apt-get install -y nodejs
RUN wget -qO - https://www.mongodb.org/static/pgp/server-4.2.asc | apt-key add - \
  && echo "deb http://repo.mongodb.org/apt/ubuntu bionic/mongodb-org/4.2 multiverse" | tee /etc/apt/sources.list.d/mongodb-org.list \
  && apt-get update \
  && apt-get install -y mongodb-org-server
RUN apt-get install -y nginx

COPY docker-entrypoint.sh /docker-entrypoint.sh
RUN chmod +x /docker-entrypoint.sh

CMD ["/bin/bash", "/docker-entrypoint.sh"]
