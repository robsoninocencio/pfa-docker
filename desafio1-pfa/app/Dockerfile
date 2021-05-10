FROM node:15-alpine

WORKDIR /usr/src/app

COPY . .

EXPOSE 3000

RUN npm init -y

RUN npm i express
RUN npm i mysql

RUN npm install

RUN apk add --no-cache openssl

ENV DOCKERIZE_VERSION v0.6.1
RUN wget https://github.com/jwilder/dockerize/releases/download/$DOCKERIZE_VERSION/dockerize-alpine-linux-amd64-$DOCKERIZE_VERSION.tar.gz \
    && tar -C /usr/local/bin -xzvf dockerize-alpine-linux-amd64-$DOCKERIZE_VERSION.tar.gz \
    && rm dockerize-alpine-linux-amd64-$DOCKERIZE_VERSION.tar.gz

CMD ["dockerize","-wait","tcp://pfa-mysql-d1:3306","-timeout","120s","node","index.js"]

# docker build -t robsoni/pfa-app-d1 .
# docker push robsoni/pfa-app-d1
