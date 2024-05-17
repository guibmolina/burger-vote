FROM node:20 as build-stage
WORKDIR /app
COPY package*.json ./
RUN yarn  install
COPY ./ .
RUN yarn build

FROM nginx as production-stage
EXPOSE 3000
RUN mkdir /app
COPY nginx.conf /etc/nginx/conf.d/default.conf
COPY --from=build-stage /app/dist /app
