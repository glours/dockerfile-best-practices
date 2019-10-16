FROM debian:buster

# Install dependencies
RUN apt-get update -y
RUN apt-get install -y openjdk-11-jdk
RUN apt-get install -y nodejs npm
RUN apt-get install -y wget gnupg \
  && wget -qO - https://www.mongodb.org/static/pgp/server-4.2.asc | apt-key add - \
  && echo "deb http://repo.mongodb.org/apt/debian buster/mongodb-org/testing main" | tee /etc/apt/sources.list.d/mongodb-org-testing.list \
  && apt-get update \
  && apt-get install -y mongodb-org-server
RUN apt-get install -y nginx

# Create nginx configuration
COPY proxy/nginx.conf /etc/nginx/sites-available/default

# Create storage folder for mongodb
RUN mkdir -p /data/db

# Install server
VOLUME /tmp
ARG JAR_FILE
COPY ${JAR_FILE} app.jar

# Build client
COPY client /workdir/client
WORKDIR /workdir/client
RUN npm install
RUN npm run build
RUN rm -rf /var/www/html && mv build /var/www/html

# Running script
COPY docker-entrypoint.sh /docker-entrypoint.sh
RUN chmod +x /docker-entrypoint.sh

EXPOSE 80

CMD ["/bin/bash", "/docker-entrypoint.sh"]
