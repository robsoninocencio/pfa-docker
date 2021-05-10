#!/bin/bash

# docker build -t robsoni/pfa-mysql-d1 .
# docker push robsoni/pfa-mysql-d1
docker pull robsoni/pfa-mysql-d1

# docker build -t robsoni/pfa-app-d1 .
# docker push robsoni/pfa-app-d1
docker pull robsoni/pfa-app-d1

# docker build -t robsoni/pfa-ngix-d1 .
# docker push robsoni/pfa-ngix-d1
docker pull robsoni/pfa-ngix-d1

docker network create pfa-network

docker rm $(docker ps -aq) -f
docker run -d --rm --network=pfa-network --name pfa-mysql-d1 robsoni/pfa-mysql-d1
docker run -d --rm --network=pfa-network --name pfa-app-d1 robsoni/pfa-app-d1
docker run -d --rm --network=pfa-network --name nginx-proxy-reverso -p 8080:80 robsoni/pfa-ngix-d1

# docker run -d --rm --network pfa-network --name teste -p 3000:3000 robsoni/pfa-app-d1

docker ps
