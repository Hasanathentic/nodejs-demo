FROM node:latest
ADD ./nodeapp/* /usr/share/app/test
EXPOSE 3000
WORKDIR /usr/share/app/test
