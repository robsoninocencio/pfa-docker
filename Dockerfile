FROM node:15.14.0-alpine3.10
RUN apk add bash
WORKDIR /usr/src/app
CMD [ "tail", "-f", "/dev/null" ]

# docker build -t robsoni/pfa-node .

# docker run --name pfa-node-container -d -v $(pwd):/usr/src/app robsoni/pfa-node
# docker exec -it pfa-node-container bash
# npm init
# npm i express

# docker run --name pfa-node-container -d -p 3000:3000 -v $(pwd):/usr/src/app robsoni/pfa-node
# docker exec pfa-node-container node index.js

# docker network create pfa
# docker run --name nodecontainer --rm --network=pfa -d -v $(pwd):/usr/src/app robsoni/pfa-node node index.js
# docker run --name nginx-proxy-reverso --rm --network=pfa -d -p 8080:80 robsoni/pfa-nginx
