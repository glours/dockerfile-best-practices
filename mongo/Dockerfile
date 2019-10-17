FROM debian:buster

# Install dependencies
RUN apt-get update -y
RUN apt-get install -y wget gnupg \
  && wget -qO - https://www.mongodb.org/static/pgp/server-4.2.asc | apt-key add - \
  && echo "deb http://repo.mongodb.org/apt/debian buster/mongodb-org/testing main" | tee /etc/apt/sources.list.d/mongodb-org-testing.list \
  && apt-get update \
  && apt-get install -y mongodb-org-server

# Create storage folder for mongodb
RUN mkdir -p /data/db

CMD [ "mongod", "--fork", "--syslog" ]
