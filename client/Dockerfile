FROM node:12.12.0-alpine AS builder

COPY . /workdir/client
WORKDIR /workdir/client
RUN npm install
RUN npm run build

FROM nginx:alpine

COPY --from=builder /workdir/client/build /var/www/html
