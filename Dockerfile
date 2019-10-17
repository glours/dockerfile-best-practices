FROM ubuntu:bionic

ENV DEBIAN_FRONTEND=noninteractive

# Install dependencies
RUN apt-get install -y wget gnupg
RUN wget -qO - https://deb.nodesource.com/gpgkey/nodesource.gpg.key | apt-key add - \
  && echo "deb https://deb.nodesource.com/node_14.x bionic main" | tee /etc/apt/sources.list.d/nodesource.list \
  && apt-get update \
  && apt-get install -y nodejs
RUN apt-get update -y \
  && apt-get install --no-install-recommends -y \
    openjdk-11-jdk \
    nginx \
  && rm -rf /var/lib/apt/lists/*

# Create nginx configuration
COPY proxy/nginx.conf /etc/nginx/sites-available/default

# Install server
COPY server /workdir/server
WORKDIR /workdir/server
RUN ./mvnw package

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
