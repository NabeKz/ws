FROM nginx:latest

ADD ./server.conf /etc/nginx/conf.d/default.conf

RUN apt-get update && apt-get install -y vim curl

WORKDIR /var/www