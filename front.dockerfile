FROM node:20-slim

RUN npm install --quiet --global @vue/cli

RUN mkdir /app
WORKDIR /app
