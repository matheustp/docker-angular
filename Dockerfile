FROM node:alpine as builder

WORKDIR /app

COPY package.json .
RUN npm install
COPY . .

RUN npm run build -- --prod --aot

FROM nginx
EXPOSE 80
COPY --from=builder /app/dist/docker-angular /usr/share/nginx/html
