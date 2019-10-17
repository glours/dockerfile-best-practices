FROM node:12.12.0-buster

# Install dependencies
RUN apt-get update -y \
  && apt-get install --no-install-recommends -y nginx \
  && rm -rf /var/lib/apt/lists/*

# Build client
COPY . /workdir/client
WORKDIR /workdir/client
RUN npm install
RUN npm run build
RUN rm -rf /var/www/html && mv build /var/www/html

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
