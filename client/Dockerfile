# STEP 1: build the prod artifact
# NOTE: we are not using "FROM node:alpine as tagname" to tag this step b/c that messes up
# in AWS EB and Travis. Therefore, STEP 1 is by default "0", and STEP 2 is "1", etc when it
# comes to referencing different sections
FROM node:alpine
WORKDIR '/app'
COPY ./package.json ./
RUN npm install
COPY ./ ./
RUN npm run build

FROM nginx
# we want this one to listen on 3000
EXPOSE 3000
# copy nginx config
COPY ./nginx/default.conf /etc/nginx/conf.d/default.conf
# copy build artifact from previous stage
COPY --from=0 /app/build /usr/share/nginx/html