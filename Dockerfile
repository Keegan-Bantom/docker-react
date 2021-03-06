##Specify as build stage
FROM node:alpine

## Specify work directory
WORKDIR '/app'

## Copy file to work directory
COPY package*.json ./

## Install npm
RUN npm install

## Copy the rest of files to work directory
COPY . .

## Build
RUN npm run build

## Start run section
FROM nginx
EXPOSE 80

## Copy build folder to nginx, look at documentation on docker hub
COPY --from=0 /app/build /usr/share/nginx/html






