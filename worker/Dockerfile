# 90% the same as .dev copy, except the start command
FROM node:alpine
WORKDIR '/app'
COPY ./package.json ./
RUN npm install
COPY ./ ./

CMD ["npm", "run", "start"]