FROM node:12.12.0-alpine AS builder

WORKDIR /workdir/client

COPY package.json /workdir/client/package.json
COPY package-lock.json /workdir/client/package-lock.json
RUN npm ci

COPY . /workdir/client
RUN npm run build

FROM nginx:alpine

COPY --from=builder /workdir/client/build /usr/share/nginx/html
