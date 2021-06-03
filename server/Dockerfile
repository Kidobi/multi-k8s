# mostly copied from dev copy, except start command

# this server connects to redis/postgres and does most of the actual work
FROM node:14.14.0-alpine
WORKDIR '/app'
COPY ./package.json ./
RUN npm install
COPY ./ ./

CMD ["npm", "run", "start"]