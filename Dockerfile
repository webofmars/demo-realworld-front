FROM node:14 as builder

COPY . /app
WORKDIR /app

RUN npm install

RUN npm run build

# final image
FROM nginx

COPY --from=builder /app/build/ /usr/share/nginx/html/
COPY ./nginx.conf /etc/nginx/conf.d/default.conf
