FROM node:22-slim

WORKDIR /app

COPY client/package*.json ./
RUN npm install --global npm@11.8.0 \
    && npm ci

COPY client/ ./

CMD ["npm", "run", "dev"]
