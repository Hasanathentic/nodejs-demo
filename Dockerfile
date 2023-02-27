FROM node:latest
ADD ./NODEAPP/* /usr/share/app/test
EXPOSE 3000
WORKDIR /usr/share/app/test
