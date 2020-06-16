FROM node:9.5

RUN npm install --quiet --global vue-cli

RUN mkdir /app
WORKDIR /app
