FROM node:22-slim

WORKDIR /app

COPY client/package*.json ./
RUN npm ci

COPY client/ ./

CMD ["npm", "run", "dev"]
