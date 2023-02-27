FROM node:latest
ADD ./nodeapp/* /usr/share/app/test/
EXPOSE 8080
WORKDIR /usr/share/app/test
