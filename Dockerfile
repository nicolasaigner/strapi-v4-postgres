FROM node:16.16.0-bullseye-slim

ARG NODE_ENV=development
ENV NODE_ENV $NODE_ENV

ARG DATABASE_HOST=postgres
ENV DATABASE_HOST $DATABASE_HOST

ARG DATABASE_PORT=5432
ENV DATABASE_PORT $DATABASE_PORT

ARG DATABASE_NAME=postgres
ENV DATABASE_NAME $DATABASE_NAME

ARG DATABASE_USERNAME=postgres
ENV DATABASE_USERNAME $DATABASE_USERNAME

ARG DATABASE_PASSWORD=strapi
ENV DATABASE_PASSWORD $DATABASE_PASSWORD

ARG DATABASE_SSL=false
ENV DATABASE_SSL $DATABASE_SSL

WORKDIR /usr/src/app

COPY . .

RUN yarn install

EXPOSE 1337

CMD ["yarn", "develop"]
