# FROM node:14-alpine 
# WORKDIR /app
# COPY . .
# RUN npm ci 
# RUN npm run build
# ENV NODE_ENV production
# EXPOSE 3000
# CMD [ "npx", "serve", "build" ]

FROM node:14-alpine
ENV NODE_ENV production
WORKDIR /app

COPY package.json .
COPY package-lock.json .
RUN npm install
COPY . .
EXPOSE 3000
CMD [ "npm", "start" ]